local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent.Parent.Shared.Util);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v3 = {};
for v4, v5 in v2.Chests do
    if v5._rngType then
        table.insert(v3, v4);
    end;
end;
local v11 = {
    Transform = function(v6) --[[ Line: 26 ]] --[[ Name: Transform ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.MakeFuzzyFinder(v3)(v6);
    end, 
    Validate = function(v7) --[[ Line: 32 ]] --[[ Name: Validate ]]
        return #v7 > 0, "No treasure chest with that name could be found.";
    end, 
    Autocomplete = function(v8) --[[ Line: 36 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v1 (copy)
        return v1.GetNames(v8);
    end, 
    Parse = function(v9) --[[ Line: 40 ]] --[[ Name: Parse ]]
        return v9[1];
    end, 
    Default = function(v10) --[[ Line: 44 ]] --[[ Name: Default ]]
        return v10;
    end
};
return function(v12) --[[ Line: 49 ]]
    -- upvalues: v11 (copy)
    v12:RegisterType(script.Name, v11);
end;