local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.State.For);
local v4 = require(l_Parent_0.State.Value);
local v5 = require(l_Parent_0.State.Computed);
local _ = require(l_Parent_0.State.For.ForTypes);
local v7 = require(l_Parent_0.Logging.parseError);
local v8 = require(l_Parent_0.Memory.doCleanup);
local v14 = {
    __index = {
        roamKeys = false, 
        roamValues = false, 
        invalidateInputKey = function(v9) --[[ Line: 33 ]] --[[ Name: invalidateInputKey ]]
            v9._inputKeyState:set(v9.inputKey);
        end, 
        invalidateInputValue = function(v10) --[[ Line: 36 ]] --[[ Name: invalidateInputValue ]]
            v10._inputValueState:set(v10.inputValue);
        end, 
        useOutputPair = function(v11, v12) --[[ Line: 39 ]] --[[ Name: useOutputPair ]]
            local v13 = v12(v11._outputPairState);
            return v13.key, v13.value;
        end
    }
};
local function v27(v15, v16, v17, v18) --[[ Line: 46 ]] --[[ Name: SubObject ]]
    -- upvalues: v4 (copy), v5 (copy), v7 (copy), v2 (copy), v8 (copy), v14 (copy)
    local v19 = {
        maybeScope = v15, 
        inputKey = v16, 
        inputValue = v17, 
        _inputKeyState = v4(v15, v16), 
        _inputValueState = v4(v15, v17), 
        _processor = v18
    };
    v19._outputPairState = v5(v15, function(v20, v21) --[[ Line: 59 ]]
        -- upvalues: v19 (copy), v7 (ref), v2 (ref), v8 (ref)
        local v22 = v20(v19._inputKeyState);
        local v23 = v20(v19._inputValueState);
        local v24, v25, v26 = xpcall(v19._processor, v7, v20, v21, v22, v23);
        if v24 then
            return {
                key = v25, 
                value = v26
            };
        else
            v25.context = ("while processing key %* and value %*"):format(tostring(v23), (tostring(v23)));
            v2.logErrorNonFatal("callbackError", v25);
            v8(v21);
            table.clear(v21);
            return {
                key = nil, 
                value = nil
            };
        end;
    end);
    return (setmetatable(v19, v14));
end;
return function(v28, v29, v30) --[[ Line: 77 ]] --[[ Name: ForPairs ]]
    -- upvalues: v3 (copy), v27 (copy)
    return v3(v28, v29, function(v31, v32, v33) --[[ Line: 85 ]]
        -- upvalues: v27 (ref), v30 (copy)
        return (v27(v31, v32, v33, v30));
    end);
end;