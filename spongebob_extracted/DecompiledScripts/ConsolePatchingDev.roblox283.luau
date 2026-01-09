local l_console_0 = require(script.Parent:WaitForChild("console"));
local v1 = 0;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local function v9() --[[ Line: 31 ]]

end;
return {
    disabledLog = v9, 
    disableLogs = function() --[[ Line: 40 ]]
        -- upvalues: v1 (ref), v2 (ref), l_console_0 (copy), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (copy)
        if _G.__DEV__ then
            if v1 == 0 then
                v2 = l_console_0.log;
                v3 = l_console_0.info;
                v4 = l_console_0.warn;
                v5 = l_console_0.error;
                v6 = l_console_0.group;
                v7 = l_console_0.groupCollapsed;
                v8 = l_console_0.groupEnd;
                l_console_0.info = v9;
                l_console_0.log = v9;
                l_console_0.warn = v9;
                l_console_0.error = v9;
                l_console_0.group = v9;
                l_console_0.groupCollapsed = v9;
                l_console_0.groupEnd = v9;
            end;
            v1 = v1 + 1;
        end;
    end, 
    reenableLogs = function() --[[ Line: 64 ]]
        -- upvalues: v1 (ref), l_console_0 (copy), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref)
        if _G.__DEV__ then
            v1 = v1 - 1;
            if v1 == 0 then
                l_console_0.log = v2;
                l_console_0.info = v3;
                l_console_0.warn = v4;
                l_console_0.error = v5;
                l_console_0.group = v6;
                l_console_0.groupCollapsed = v7;
                l_console_0.groupEnd = v8;
            end;
            if v1 < 0 then
                l_console_0.error("disabledDepth fell below zero. This is a bug in React. Please file an issue.");
            end;
        end;
    end
};