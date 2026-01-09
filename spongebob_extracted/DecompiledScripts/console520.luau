local l_console_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console;
local l_consoleWithStackDev_0 = require(script.Parent:WaitForChild("consoleWithStackDev"));
if _G.__DEV__ then
    return (setmetatable({
        warn = l_consoleWithStackDev_0.warn, 
        error = l_consoleWithStackDev_0.error
    }, {
        __index = l_console_0
    }));
else
    return l_console_0;
end;