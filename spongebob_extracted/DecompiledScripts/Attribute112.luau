local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Memory.checkLifetime);
local v3 = require(l_Parent_0.Graph.Observer);
local v4 = require(l_Parent_0.State.castToState);
local v5 = require(l_Parent_0.State.peek);
local v6 = {};
return function(v7) --[[ Line: 23 ]] --[[ Name: Attribute ]]
    -- upvalues: v6 (copy), v4 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v8 = v6[v7];
    if v8 == nil then
        v8 = {
            type = "SpecialKey", 
            kind = "Attribute", 
            stage = "self", 
            apply = function(_, v10, v11, v12) --[[ Line: 32 ]] --[[ Name: apply ]]
                -- upvalues: v4 (ref), v2 (ref), v7 (copy), v3 (ref), v5 (ref)
                if v4(v11) then
                    v2.bOutlivesA(v10, v12, v11.scope, v11.oldestTask, v2.formatters.boundAttribute, v7);
                    v3(v10, v11):onBind(function() --[[ Line: 45 ]]
                        -- upvalues: v12 (copy), v7 (ref), v5 (ref), v11 (copy)
                        v12:SetAttribute(v7, v5(v11));
                    end);
                    return;
                else
                    v12:SetAttribute(v7, v11);
                    return;
                end;
            end
        };
        v6[v7] = v8;
    end;
    return v8;
end;