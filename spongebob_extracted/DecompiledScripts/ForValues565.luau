local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.State.For);
local v4 = require(l_Parent_0.State.Value);
local v5 = require(l_Parent_0.State.Computed);
local _ = require(l_Parent_0.State.For.ForTypes);
local v7 = require(l_Parent_0.Logging.parseError);
local v8 = require(l_Parent_0.Memory.doCleanup);
local v13 = {
    __index = {
        roamKeys = true, 
        roamValues = false, 
        invalidateInputKey = function(_) --[[ Line: 33 ]] --[[ Name: invalidateInputKey ]]

        end, 
        invalidateInputValue = function(v10) --[[ Line: 36 ]] --[[ Name: invalidateInputValue ]]
            v10._inputValueState:set(v10.inputValue);
        end, 
        useOutputPair = function(v11, v12) --[[ Line: 39 ]] --[[ Name: useOutputPair ]]
            return v11.inputKey, v12(v11._outputValueState);
        end
    }
};
local function v24(v14, v15, v16, v17) --[[ Line: 45 ]] --[[ Name: SubObject ]]
    -- upvalues: v4 (copy), v5 (copy), v7 (copy), v2 (copy), v8 (copy), v13 (copy)
    local v18 = {
        maybeScope = v14, 
        inputKey = v15, 
        inputValue = v16, 
        _inputValueState = v4(v14, v16), 
        _processor = v17
    };
    v18._outputValueState = v5(v14, function(v19, v20) --[[ Line: 57 ]]
        -- upvalues: v18 (copy), v7 (ref), v2 (ref), v8 (ref)
        local v21 = v19(v18._inputValueState);
        local v22, v23 = xpcall(v18._processor, v7, v19, v20, v21);
        if v22 then
            return v23;
        else
            v23.context = ("while processing value %*"):format((tostring(v21)));
            v2.logErrorNonFatal("callbackError", v23);
            v8(v20);
            table.clear(v20);
            return nil;
        end;
    end);
    return (setmetatable(v18, v13));
end;
return function(v25, v26, v27, v28) --[[ Line: 74 ]] --[[ Name: ForValues ]]
    -- upvalues: v2 (copy), v3 (copy), v24 (copy)
    if typeof(v26) == "function" then
        v2.logError("scopeMissing", nil, "ForValues", "myScope:ForValues(inputTable, function(scope, use, value) ... end)");
    elseif v28 ~= nil then
        v2.logWarn("destructorRedundant", "ForValues");
    end;
    return v3(v25, v26, function(v29, v30, v31) --[[ Line: 88 ]]
        -- upvalues: v24 (ref), v27 (copy)
        return (v24(v29, v30, v31, v27));
    end);
end;