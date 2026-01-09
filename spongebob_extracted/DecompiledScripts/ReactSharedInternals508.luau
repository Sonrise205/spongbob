local l_console_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console;
local function _(v1) --[[ Line: 26 ]] --[[ Name: onlyInTestError ]]
    -- upvalues: l_console_0 (copy)
    return function() --[[ Line: 27 ]]
        -- upvalues: l_console_0 (ref), v1 (copy)
        l_console_0.error(v1 .. " is only available in tests, not in production");
    end;
end;
local l_ReactCurrentDispatcher_0 = require(script:WaitForChild("ReactCurrentDispatcher"));
local l_ReactCurrentBatchConfig_0 = require(script:WaitForChild("ReactCurrentBatchConfig"));
local l_ReactCurrentOwner_0 = require(script:WaitForChild("ReactCurrentOwner"));
local l_ReactDebugCurrentFrame_0 = require(script:WaitForChild("ReactDebugCurrentFrame"));
local l_IsSomeRendererActing_0 = require(script:WaitForChild("IsSomeRendererActing"));
return {
    ReactCurrentDispatcher = l_ReactCurrentDispatcher_0, 
    ReactCurrentBatchConfig = l_ReactCurrentBatchConfig_0, 
    ReactCurrentOwner = l_ReactCurrentOwner_0, 
    IsSomeRendererActing = l_IsSomeRendererActing_0, 
    ReactDebugCurrentFrame = if _G.__DEV__ then l_ReactDebugCurrentFrame_0 else {
        setExtraStackFrame = function(_) --[[ Line: 50 ]] --[[ Name: setExtraStackFrame ]]

        end
    }
};