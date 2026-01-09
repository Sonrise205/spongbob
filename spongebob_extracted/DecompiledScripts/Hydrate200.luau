local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Instances.applyInstanceProps);
return function(v4, v5) --[[ Line: 16 ]] --[[ Name: Hydrate ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v5 == nil then
        v2.logError("scopeMissing", nil, "instances using Hydrate", "myScope:Hydrate (instance) { ... }");
    end;
    return function(v6) --[[ Line: 23 ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (ref)
        table.insert(v4, v5);
        v3(v4, v6, v5);
        return v5;
    end;
end;