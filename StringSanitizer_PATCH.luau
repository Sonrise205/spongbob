--[[
    StringSanitizer Module - Prevents Unicode/ASCII Injection Attacks
    
    USAGE:
    local StringSanitizer = require(path.to.StringSanitizer)
    
    -- Validate a string (returns true/false, error message)
    local isValid, reason = StringSanitizer.IsValid(userInput, 100)
    
    -- Sanitize a string (removes bad characters, returns clean string)
    local cleanString = StringSanitizer.Sanitize(userInput, 100)
    
    -- Deep validate a table (for remote arguments)
    local isValid, reason = StringSanitizer.ValidateTable(args, 500)
]]

local StringSanitizer = {}

-- Configuration
local CONFIG = {
    DEFAULT_MAX_STRING_LENGTH = 1000,
    DEFAULT_MAX_KEY_LENGTH = 50,
    LOG_VIOLATIONS = true,
    STRICT_MODE = true,  -- If true, rejects more edge cases
}

-- Surrogate pair range (U+D800 to U+DFFF) - invalid in UTF-8
local SURROGATE_MIN = 0xD800
local SURROGATE_MAX = 0xDFFF

-- Private Use Area (may cause issues)
local PUA_RANGES = {
    {0xE000, 0xF8FF},      -- Basic PUA
    {0xF0000, 0xFFFFD},    -- Supplementary PUA-A
    {0x100000, 0x10FFFD},  -- Supplementary PUA-B
}

--[[
    Checks if a string is valid and safe for DataStore storage
    
    @param str: The string to validate
    @param maxLength: Maximum allowed length (default 1000)
    @return boolean: Whether the string is valid
    @return string|nil: Error reason if invalid
]]
function StringSanitizer.IsValid(str, maxLength)
    maxLength = maxLength or CONFIG.DEFAULT_MAX_STRING_LENGTH
    
    -- Type check
    if type(str) ~= "string" then
        return false, "NOT_STRING"
    end
    
    -- Empty check (may be valid depending on context)
    if #str == 0 then
        return true  -- Empty strings are technically valid
    end
    
    -- Byte length check (before UTF-8 processing)
    if #str > maxLength then
        return false, "TOO_LONG"
    end
    
    -- UTF-8 validity check
    local utfLen = utf8.len(str)
    if utfLen == nil then
        return false, "INVALID_UTF8"
    end
    
    -- NULL byte check (U+0000)
    -- Valid UTF-8 but BREAKS DataStore serialization!
    if string.find(str, "\0", 1, true) then
        return false, "NULL_BYTE"
    end
    
    -- Control character check (U+0001 to U+001F, except common ones)
    -- Allows: \t (0x09), \n (0x0A), \r (0x0D)
    -- Blocks: All other control chars
    local controlPattern = "[\1-\8\11\12\14-\31]"
    if string.match(str, controlPattern) then
        return false, "CONTROL_CHAR"
    end
    
    -- DEL character (U+007F)
    if string.find(str, "\127", 1, true) then
        return false, "DEL_CHAR"
    end
    
    -- Check for problematic Unicode code points
    local success, err = pcall(function()
        for position, codepoint in utf8.codes(str) do
            -- Surrogate code points (should never appear in valid UTF-8)
            if codepoint >= SURROGATE_MIN and codepoint <= SURROGATE_MAX then
                error("SURROGATE_CODEPOINT")
            end
            
            -- Byte Order Mark at non-start position
            if codepoint == 0xFEFF and position > 1 then
                error("MISPLACED_BOM")
            end
            
            -- Replacement character (indicates prior corruption)
            if CONFIG.STRICT_MODE and codepoint == 0xFFFD then
                error("REPLACEMENT_CHAR")
            end
            
            -- Private Use Area (optional strict check)
            if CONFIG.STRICT_MODE then
                for _, range in ipairs(PUA_RANGES) do
                    if codepoint >= range[1] and codepoint <= range[2] then
                        error("PRIVATE_USE_CHAR")
                    end
                end
            end
            
            -- Non-characters (U+FDD0 to U+FDEF, U+FFFE, U+FFFF)
            if (codepoint >= 0xFDD0 and codepoint <= 0xFDEF) or
               (codepoint == 0xFFFE or codepoint == 0xFFFF) then
                error("NONCHARACTER")
            end
        end
    end)
    
    if not success then
        return false, err
    end
    
    return true
end

--[[
    Sanitizes a string by removing problematic characters
    
    @param str: The string to sanitize
    @param maxLength: Maximum allowed length (default 1000)
    @return string: The sanitized string (may be empty)
]]
function StringSanitizer.Sanitize(str, maxLength)
    maxLength = maxLength or CONFIG.DEFAULT_MAX_STRING_LENGTH
    
    -- Handle non-strings
    if type(str) ~= "string" then
        return ""
    end
    
    -- Empty string is valid
    if #str == 0 then
        return ""
    end
    
    -- Check if UTF-8 is valid first
    if utf8.len(str) == nil then
        -- Try to salvage valid parts
        local result = {}
        local i = 1
        while i <= #str do
            local byte = string.byte(str, i)
            local charLen = 1
            
            -- Determine character length from first byte
            if byte < 128 then
                charLen = 1
            elseif byte < 224 then
                charLen = 2
            elseif byte < 240 then
                charLen = 3
            else
                charLen = 4
            end
            
            -- Try to validate this character
            local char = string.sub(str, i, i + charLen - 1)
            if utf8.len(char) then
                table.insert(result, char)
            end
            -- Skip invalid bytes
            i = i + charLen
        end
        str = table.concat(result)
    end
    
    -- Remove NULL bytes
    str = string.gsub(str, "\0", "")
    
    -- Remove control characters (keep tab, newline, carriage return)
    str = string.gsub(str, "[\1-\8\11\12\14-\31\127]", "")
    
    -- Remove BOM if at start
    if string.sub(str, 1, 3) == "\xEF\xBB\xBF" then
        str = string.sub(str, 4)
    end
    
    -- Filter out problematic Unicode characters
    local cleaned = {}
    local success = pcall(function()
        for _, codepoint in utf8.codes(str) do
            local include = true
            
            -- Skip surrogates
            if codepoint >= SURROGATE_MIN and codepoint <= SURROGATE_MAX then
                include = false
            end
            
            -- Skip non-characters
            if (codepoint >= 0xFDD0 and codepoint <= 0xFDEF) or
               (codepoint == 0xFFFE or codepoint == 0xFFFF) then
                include = false
            end
            
            -- Skip replacement character
            if codepoint == 0xFFFD then
                include = false
            end
            
            if include then
                table.insert(cleaned, utf8.char(codepoint))
            end
        end
    end)
    
    if success then
        str = table.concat(cleaned)
    else
        str = ""  -- Fall back to empty on error
    end
    
    -- Truncate to max length (byte-safe truncation)
    if #str > maxLength then
        -- Find the last valid UTF-8 character boundary
        local truncated = string.sub(str, 1, maxLength)
        -- Make sure we didn't cut in the middle of a multibyte character
        while utf8.len(truncated) == nil and #truncated > 0 do
            truncated = string.sub(truncated, 1, -2)
        end
        str = truncated
    end
    
    return str
end

--[[
    Validates all strings in a table (recursive)
    Useful for validating entire remote arguments
    
    @param tbl: The table to validate
    @param maxStringLength: Max length for any string value
    @param maxDepth: Maximum recursion depth (default 10)
    @return boolean: Whether all strings are valid
    @return string|nil: Error description if invalid
]]
function StringSanitizer.ValidateTable(tbl, maxStringLength, maxDepth)
    maxStringLength = maxStringLength or CONFIG.DEFAULT_MAX_STRING_LENGTH
    maxDepth = maxDepth or 10
    
    if maxDepth <= 0 then
        return false, "MAX_DEPTH_EXCEEDED"
    end
    
    if type(tbl) ~= "table" then
        return false, "NOT_A_TABLE"
    end
    
    for key, value in pairs(tbl) do
        -- Validate key if it's a string
        if type(key) == "string" then
            local isValid, reason = StringSanitizer.IsValid(key, CONFIG.DEFAULT_MAX_KEY_LENGTH)
            if not isValid then
                return false, "INVALID_KEY:" .. tostring(reason)
            end
        end
        
        -- Validate value
        if type(value) == "string" then
            local isValid, reason = StringSanitizer.IsValid(value, maxStringLength)
            if not isValid then
                return false, "INVALID_VALUE:" .. tostring(key) .. ":" .. tostring(reason)
            end
        elseif type(value) == "table" then
            local isValid, reason = StringSanitizer.ValidateTable(value, maxStringLength, maxDepth - 1)
            if not isValid then
                return false, "NESTED:" .. tostring(key) .. ":" .. tostring(reason)
            end
        end
    end
    
    return true
end

--[[
    Creates an inbound middleware function for NetWire/Knit
    Automatically validates all remote arguments
    
    @param options: Configuration table
    @return function: Middleware function
]]
function StringSanitizer.CreateMiddleware(options)
    options = options or {}
    local maxStringLength = options.maxStringLength or CONFIG.DEFAULT_MAX_STRING_LENGTH
    local logViolations = options.logViolations ~= false
    
    return function(player, args)
        for i, arg in ipairs(args) do
            if type(arg) == "string" then
                local isValid, reason = StringSanitizer.IsValid(arg, maxStringLength)
                if not isValid then
                    if logViolations then
                        warn(string.format(
                            "[StringSanitizer] Player %s (ID: %d) sent invalid string arg #%d: %s",
                            player.Name, player.UserId, i, reason
                        ))
                    end
                    return false
                end
            elseif type(arg) == "table" then
                local isValid, reason = StringSanitizer.ValidateTable(arg, maxStringLength)
                if not isValid then
                    if logViolations then
                        warn(string.format(
                            "[StringSanitizer] Player %s (ID: %d) sent invalid table arg #%d: %s",
                            player.Name, player.UserId, i, reason
                        ))
                    end
                    return false
                end
            end
        end
        return true
    end
end

--[[
    Test utility - generates problematic test strings
    Use this to verify your validation is working
]]
function StringSanitizer.GetTestCases()
    return {
        {name = "Valid ASCII", value = "Hello World", shouldPass = true},
        {name = "Valid Unicode", value = "こんにちは", shouldPass = true},
        {name = "Valid Emoji", value = "Hello 👋 World", shouldPass = true},
        {name = "NULL byte", value = "test\0value", shouldPass = false},
        {name = "Control char SOH", value = "test\1value", shouldPass = false},
        {name = "Control char BEL", value = "test\7value", shouldPass = false},
        {name = "Tab (allowed)", value = "test\tvalue", shouldPass = true},
        {name = "Newline (allowed)", value = "test\nvalue", shouldPass = true},
        {name = "DEL char", value = "test\127value", shouldPass = false},
        {name = "Empty string", value = "", shouldPass = true},
        {name = "Only whitespace", value = "   ", shouldPass = true},
        {name = "UTF-8 BOM at start", value = "\xEF\xBB\xBFHello", shouldPass = true},
        -- Note: These require raw byte manipulation to create properly
        -- {name = "Invalid UTF-8", value = string.char(0xFF, 0xFE), shouldPass = false},
        -- {name = "Overlong NULL", value = string.char(0xC0, 0x80), shouldPass = false},
    }
end

--[[
    Run self-test to verify the module works correctly
]]
function StringSanitizer.SelfTest()
    local passed = 0
    local failed = 0
    
    print("[StringSanitizer] Running self-test...")
    
    for _, testCase in ipairs(StringSanitizer.GetTestCases()) do
        local isValid = StringSanitizer.IsValid(testCase.value, 1000)
        local success = (isValid == testCase.shouldPass)
        
        if success then
            passed = passed + 1
        else
            failed = failed + 1
            warn(string.format(
                "[FAIL] %s: expected %s, got %s",
                testCase.name,
                tostring(testCase.shouldPass),
                tostring(isValid)
            ))
        end
    end
    
    print(string.format(
        "[StringSanitizer] Self-test complete: %d passed, %d failed",
        passed, failed
    ))
    
    return failed == 0
end

return StringSanitizer
