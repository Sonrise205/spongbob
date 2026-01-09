local v0 = require(script.Parent.Parent:WaitForChild("luau-polyfill"));
local l_Error_0 = v0.Error;
local l_inspect_0 = v0.util.inspect;
return {
    describeError = function(v3) --[[ Line: 33 ]] --[[ Name: describeError ]]
        -- upvalues: v0 (copy)
        if typeof(v3) == "string" then
            local _, v5 = string.find(v3, ":[%d]+: ");
            local v6 = if v5 then string.sub(v3, v5 + 1) else v3;
            local v7 = v0.Error.new(v6);
            v7.stack = debug.traceback(nil, 2);
            return v7;
        else
            return v3;
        end;
    end, 
    errorToString = function(v8) --[[ Line: 53 ]] --[[ Name: errorToString ]]
        -- upvalues: l_inspect_0 (copy)
        local _ = nil;
        if typeof(v8) == "table" then
            if v8.message and v8.stack then
                return "\n------ Error caught by React ------\n" .. v8.message .. "\n------ Error caught by React ------\n" .. tostring(v8.stack);
            else
                return (l_inspect_0(v8));
            end;
        else
            return (l_inspect_0(v8));
        end;
    end, 
    parseReactError = function(v10) --[[ Line: 79 ]] --[[ Name: parseReactError ]]
        -- upvalues: l_Error_0 (copy)
        local v11 = string.split(v10, "\n------ Error caught by React ------\n");
        if #v11 == 3 then
            local v12, v13, v14 = table.unpack(v11);
            local v15 = l_Error_0.new(v13);
            v15.stack = v14;
            return v15, v12;
        else
            local v16 = l_Error_0.new(v10);
            v16.stack = nil;
            return v16, "";
        end;
    end, 
    __ERROR_DIVIDER = "\n------ Error caught by React ------\n"
};