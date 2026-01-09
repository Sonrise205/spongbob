local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = {};
return function(v4) --[[ Line: 17 ]] --[[ Name: AttributeChange ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3[v4];
    if v5 == nil then
        v5 = {
            type = "SpecialKey", 
            kind = "AttributeChange", 
            stage = "observer", 
            apply = function(_, v7, v8, v9) --[[ Line: 26 ]] --[[ Name: apply ]]
                -- upvalues: v2 (ref), v4 (copy)
                if typeof(v8) ~= "function" then
                    v2.logError("invalidAttributeChangeHandler", nil, v4);
                end;
                table.insert(v7, v9:GetAttributeChangedSignal(v4):Connect(function() --[[ Line: 37 ]]
                    -- upvalues: v8 (copy), v9 (copy), v4 (ref)
                    v8(v9:GetAttribute(v4));
                end));
            end
        };
        v3[v4] = v5;
    end;
    return v5;
end;