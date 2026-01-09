local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.doCleanup);
local v4 = require(l_Parent_0.State.For);
local v5 = require(l_Parent_0.State.Value);
local v6 = require(l_Parent_0.State.Computed);
local _ = require(l_Parent_0.State.For.ForTypes);
local v8 = require(l_Parent_0.Logging.parseError);
local v13 = {
    __index = {
        roamKeys = false, 
        roamValues = true, 
        invalidateInputKey = function(v9) --[[ Line: 33 ]] --[[ Name: invalidateInputKey ]]
            v9._inputKeyState:set(v9.inputKey);
        end, 
        invalidateInputValue = function(_) --[[ Line: 36 ]] --[[ Name: invalidateInputValue ]]

        end, 
        useOutputPair = function(v11, v12) --[[ Line: 39 ]] --[[ Name: useOutputPair ]]
            return v12(v11._outputKeyState), v11.inputValue;
        end
    }
};
local function v24(v14, v15, v16, v17) --[[ Line: 45 ]] --[[ Name: SubObject ]]
    -- upvalues: v5 (copy), v6 (copy), v8 (copy), v2 (copy), v3 (copy), v13 (copy)
    local v18 = {
        maybeScope = v14, 
        inputKey = v15, 
        inputValue = v16, 
        _inputKeyState = v5(v14, v15), 
        _processor = v17
    };
    v18._outputKeyState = v6(v14, function(v19, v20) --[[ Line: 57 ]]
        -- upvalues: v18 (copy), v8 (ref), v2 (ref), v3 (ref)
        local v21 = v19(v18._inputKeyState);
        local v22, v23 = xpcall(v18._processor, v8, v19, v20, v21);
        if v22 then
            return v23;
        else
            v23.context = ("while processing key %*"):format((tostring(v21)));
            v2.logErrorNonFatal("callbackError", v23);
            v3(v20);
            table.clear(v20);
            return nil;
        end;
    end);
    return (setmetatable(v18, v13));
end;
return function(v25, v26, v27) --[[ Line: 74 ]] --[[ Name: ForKeys ]]
    -- upvalues: v4 (copy), v24 (copy)
    return v4(v25, v26, function(v28, v29, v30) --[[ Line: 82 ]]
        -- upvalues: v24 (ref), v27 (copy)
        return (v24(v28, v29, v30, v27));
    end);
end;