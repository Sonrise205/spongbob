local v0 = require(script.Parent.Parent.Shared.Util);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.TraitsData);
local v3 = {
    "None"
};
for v4, _ in v2:GetTraits() do
    table.insert(v3, v4);
end;
local v11 = {
    Transform = function(v6) --[[ Line: 12 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v3 (copy)
        return v0.MakeFuzzyFinder(v3)(v6);
    end, 
    Validate = function(v7) --[[ Line: 18 ]] --[[ Name: Validate ]]
        return #v7 > 0, "No option with that name could be found.";
    end, 
    Autocomplete = function(v8) --[[ Line: 22 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v8);
    end, 
    Parse = function(v9) --[[ Line: 26 ]] --[[ Name: Parse ]]
        return v9[1];
    end, 
    Default = function(v10) --[[ Line: 30 ]] --[[ Name: Default ]]
        return v10;
    end
};
return function(v12) --[[ Line: 35 ]]
    -- upvalues: v11 (copy)
    v12:RegisterType(script.Name, v11);
end;