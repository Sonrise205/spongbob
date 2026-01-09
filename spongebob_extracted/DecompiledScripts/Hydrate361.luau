local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Instances.applyInstanceProps);
return function(v3, v4) --[[ Line: 15 ]] --[[ Name: Hydrate ]]
    -- upvalues: v2 (copy)
    return function(v5) --[[ Line: 19 ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (ref)
        table.insert(v3, v4);
        v2(v3, v5, v4);
        return v4;
    end;
end;