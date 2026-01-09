local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.checkLifetime);
local v4 = require(l_Parent_0.State.castToState);
local v5 = {};
return function(v6) --[[ Line: 21 ]] --[[ Name: Out ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v7 = v5[v6];
    if v7 == nil then
        v7 = {
            type = "SpecialKey", 
            kind = "Out", 
            stage = "observer", 
            apply = function(_, v9, v10, v11) --[[ Line: 30 ]] --[[ Name: apply ]]
                -- upvalues: v6 (copy), v2 (ref), v4 (ref), v3 (ref)
                local l_status_0, l_result_0 = pcall(v11.GetPropertyChangedSignal, v11, v6);
                if not l_status_0 then
                    v2.logError("invalidOutProperty", nil, v11.ClassName, v6);
                end;
                if not v4(v10) then
                    v2.logError("invalidOutType");
                end;
                if v10.kind ~= "Value" then
                    v2.logError("invalidOutType");
                end;
                v3.bOutlivesA(v9, v11, v10.scope, v10.oldestChore, v3.formatters.propertyOutputsTo, v6);
                v10:set(v11[v6]);
                table.insert(v9, l_result_0:Connect(function() --[[ Line: 58 ]]
                    -- upvalues: v10 (copy), v11 (copy), v6 (ref)
                    v10:set(v11[v6]);
                end));
            end
        };
        v5[v6] = v7;
    end;
    return v7;
end;