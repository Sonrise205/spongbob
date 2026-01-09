local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Instances.applyInstanceProps);
return function(v3) --[[ Line: 12 ]] --[[ Name: Hydrate ]]
    -- upvalues: v2 (copy)
    return function(v4) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v3 (copy)
        v2(v4, v3);
        return v3;
    end;
end;