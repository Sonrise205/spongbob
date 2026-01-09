local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent.Parent.Shared.Util);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v3 = {};
for _, v5 in v2.EasterShard do
    table.insert(v3, v5.displayName or v5.DisplayName);
end;
table.insert(v3, "All");
local v11 = {
    Transform = function(v6) --[[ Line: 15 ]] --[[ Name: Transform ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.MakeFuzzyFinder(v3)(v6);
    end, 
    Validate = function(v7) --[[ Line: 21 ]] --[[ Name: Validate ]]
        return #v7 > 0, "No currency with that name could be found.";
    end, 
    Autocomplete = function(v8) --[[ Line: 25 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v1 (copy)
        return v1.GetNames(v8);
    end, 
    Parse = function(v9) --[[ Line: 29 ]] --[[ Name: Parse ]]
        return v9[1];
    end, 
    Default = function(v10) --[[ Line: 33 ]] --[[ Name: Default ]]
        return v10;
    end
};
return function(v12) --[[ Line: 38 ]]
    -- upvalues: v11 (copy)
    v12:RegisterType(script.Name, v11);
end;