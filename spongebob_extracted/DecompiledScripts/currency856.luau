local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent.Parent.Shared.Util);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v3 = {};
table.insert(v3, "Gold");
for v4, v5 in v2.Currency do
    if not v5.inactive then
        table.insert(v3, v4);
    end;
end;
local v11 = {
    Transform = function(v6) --[[ Line: 18 ]] --[[ Name: Transform ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.MakeFuzzyFinder(v3)(v6);
    end, 
    Validate = function(v7) --[[ Line: 24 ]] --[[ Name: Validate ]]
        return #v7 > 0, "No currency with that name could be found.";
    end, 
    Autocomplete = function(v8) --[[ Line: 28 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v1 (copy)
        return v1.GetNames(v8);
    end, 
    Parse = function(v9) --[[ Line: 32 ]] --[[ Name: Parse ]]
        return v9[1];
    end, 
    Default = function(v10) --[[ Line: 36 ]] --[[ Name: Default ]]
        return v10;
    end
};
return function(v12) --[[ Line: 41 ]]
    -- upvalues: v11 (copy)
    v12:RegisterType(script.Name, v11);
end;