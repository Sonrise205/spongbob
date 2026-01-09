local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.checkLifetime);
local v4 = require(l_Parent_0.State.castToState);
local v5 = {};
return function(v6) --[[ Line: 21 ]] --[[ Name: AttributeOut ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v3 (copy)
    local v7 = v5[v6];
    if v7 == nil then
        v7 = {
            type = "SpecialKey", 
            kind = "AttributeOut", 
            stage = "observer", 
            apply = function(_, v9, v10, v11) --[[ Line: 30 ]] --[[ Name: apply ]]
                -- upvalues: v6 (copy), v4 (ref), v2 (ref), v3 (ref)
                local l_v11_AttributeChangedSignal_0 = v11:GetAttributeChangedSignal(v6);
                if not v4(v10) then
                    v2.logError("invalidAttributeOutType");
                end;
                if v10.kind ~= "Value" then
                    v2.logError("invalidAttributeOutType");
                end;
                v3.bOutlivesA(v9, v11, v10.scope, v10.oldestChore, v3.formatters.attributeOutputsTo, v6);
                v10:set(v11:GetAttribute(v6));
                table.insert(v9, l_v11_AttributeChangedSignal_0:Connect(function() --[[ Line: 53 ]]
                    -- upvalues: v10 (copy), v11 (copy), v6 (ref)
                    v10:set(v11:GetAttribute(v6));
                end));
            end
        };
        v5[v6] = v7;
    end;
    return v7;
end;