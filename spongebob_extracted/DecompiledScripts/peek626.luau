local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.State.castToState);
local v3 = require(l_Parent_0.Graph.evaluate);
return function(v4) --[[ Line: 19 ]] --[[ Name: peek ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = v2(v4);
    if v5 ~= nil then
        v3(v5, false);
        return v5._EXTREMELY_DANGEROUS_usedAsValue;
    else
        return v4;
    end;
end;