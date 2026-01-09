local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local v1 = {};
v1.__index = v1;
v1.__tostring = function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return getmetatable(v1).__tostring(v2);
end;
local function _(v3) --[[ Line: 18 ]] --[[ Name: __createError ]]
    -- upvalues: v1 (copy)
    local v4 = setmetatable({
        name = "Error", 
        message = v3 or ""
    }, v1);
    v1.__captureStackTrace(v4, 4);
    return v4;
end;
v1.new = function(v6) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v7 = setmetatable({
        name = "Error", 
        message = v6 or ""
    }, v1);
    v1.__captureStackTrace(v7, 4);
    return v7;
end;
v1.captureStackTrace = function(v8, v9) --[[ Line: 31 ]] --[[ Name: captureStackTrace ]]
    -- upvalues: v1 (copy)
    v1.__captureStackTrace(v8, 3, v9);
end;
v1.__captureStackTrace = function(v10, v11, v12) --[[ Line: 35 ]] --[[ Name: __captureStackTrace ]]
    -- upvalues: v1 (copy)
    if typeof(v12) == "function" then
        local v13 = debug.traceback(nil, v11);
        local v14 = debug.info(v12, "n");
        local v15 = debug.info(v12, "s");
        local v16 = string.gsub(v15, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. v14;
        local v17 = string.find(v13, v16);
        local v18 = nil;
        if v17 ~= nil then
            local v19, v20 = string.find(v13, "\n", v17 + 1);
            v17 = v19;
            v18 = v20;
        end;
        if v18 ~= nil then
            v13 = string.sub(v13, v18 + 1);
        end;
        v10.__stack = v13;
    else
        v10.__stack = debug.traceback(nil, v11);
    end;
    v1.__recalculateStacktrace(v10);
end;
v1.__recalculateStacktrace = function(v21) --[[ Line: 59 ]] --[[ Name: __recalculateStacktrace ]]
    local l_message_0 = v21.message;
    v21.stack = ((v21.name or "Error") .. if l_message_0 ~= nil and l_message_0 ~= "" then ": " .. l_message_0 else "") .. "\n" .. if v21.__stack then v21.__stack else "";
end;
return (setmetatable(v1, {
    __call = function(_, ...) --[[ Line: 71 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy)
        local v24 = setmetatable({
            name = "Error", 
            message = ... or ""
        }, v1);
        v1.__captureStackTrace(v24, 4);
        return v24;
    end, 
    __tostring = function(v25) --[[ Line: 74 ]] --[[ Name: __tostring ]]
        if v25.name ~= nil then
            if v25.message and v25.message ~= "" then
                return string.format("%s: %s", tostring(v25.name), (tostring(v25.message)));
            else
                return (tostring(v25.name));
            end;
        else
            return (tostring("Error"));
        end;
    end
}));