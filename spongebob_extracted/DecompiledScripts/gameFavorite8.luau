local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent.Parent.Shared.Util);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v3 = {
    "SurviveBikiniBottom", 
    "GrandTheftTD"
};
local v9 = {
    Transform = function(v4) --[[ Line: 11 ]] --[[ Name: Transform ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.MakeFuzzyFinder(v3)(v4);
    end, 
    Validate = function(v5) --[[ Line: 17 ]] --[[ Name: Validate ]]
        return #v5 > 0, "No currency with that name could be found.";
    end, 
    Autocomplete = function(v6) --[[ Line: 21 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v1 (copy)
        return v1.GetNames(v6);
    end, 
    Parse = function(v7) --[[ Line: 25 ]] --[[ Name: Parse ]]
        return v7[1];
    end, 
    Default = function(v8) --[[ Line: 29 ]] --[[ Name: Default ]]
        return v8;
    end
};
return function(v10) --[[ Line: 34 ]]
    -- upvalues: v9 (copy)
    v10:RegisterType(script.Name, v9);
end;