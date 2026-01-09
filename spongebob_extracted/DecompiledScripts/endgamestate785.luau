local v0 = require(script.Parent.Parent.Shared.Util);
local _ = game:GetService("Players");
local v2 = {
    "Victory", 
    "Defeat"
};
local v8 = {
    Transform = function(v3) --[[ Line: 10 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v2 (copy)
        return v0.MakeFuzzyFinder(v2)(v3);
    end, 
    Validate = function(v4) --[[ Line: 16 ]] --[[ Name: Validate ]]
        return #v4 > 0, "No state with that name could be found.";
    end, 
    Autocomplete = function(v5) --[[ Line: 20 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v5);
    end, 
    Parse = function(v6) --[[ Line: 24 ]] --[[ Name: Parse ]]
        return v6[1];
    end, 
    Default = function(v7) --[[ Line: 28 ]] --[[ Name: Default ]]
        return v7;
    end
};
return function(v9) --[[ Line: 33 ]]
    -- upvalues: v8 (copy)
    v9:RegisterType(script.Name, v8);
end;