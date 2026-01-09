local v0 = require(script.Parent.Parent.Shared.Util);
local v1 = {
    "None", 
    "Shiny", 
    "Wumbo", 
    "ShinyWumbo"
};
local v7 = {
    Transform = function(v2) --[[ Line: 11 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v1 (copy)
        return v0.MakeFuzzyFinder(v1)(v2);
    end, 
    Validate = function(v3) --[[ Line: 17 ]] --[[ Name: Validate ]]
        return #v3 > 0, "No option with that name could be found.";
    end, 
    Autocomplete = function(v4) --[[ Line: 21 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v4);
    end, 
    Parse = function(v5) --[[ Line: 25 ]] --[[ Name: Parse ]]
        return v5[1];
    end, 
    Default = function(v6) --[[ Line: 29 ]] --[[ Name: Default ]]
        return v6;
    end
};
return function(v8) --[[ Line: 34 ]]
    -- upvalues: v7 (copy)
    v8:RegisterType(script.Name, v7);
end;