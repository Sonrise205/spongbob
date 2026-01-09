local v0 = require(script.Parent.Parent.Shared.Util);
local l_Players_0 = game:GetService("Players");
local v7 = {
    Transform = function(v2) --[[ Line: 5 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), l_Players_0 (copy)
        return v0.MakeFuzzyFinder(l_Players_0:GetPlayers())(v2);
    end, 
    Validate = function(v3) --[[ Line: 11 ]] --[[ Name: Validate ]]
        return #v3 > 0, "No player with that name could be found.";
    end, 
    Autocomplete = function(v4) --[[ Line: 15 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v4);
    end, 
    Parse = function(v5) --[[ Line: 19 ]] --[[ Name: Parse ]]
        return v5[1];
    end, 
    Default = function(v6) --[[ Line: 23 ]] --[[ Name: Default ]]
        return v6.Name;
    end, 
    ArgumentOperatorAliases = {
        me = ".", 
        all = "*", 
        others = "**", 
        random = "?"
    }
};
return function(v8) --[[ Line: 35 ]]
    -- upvalues: v7 (copy), v0 (copy)
    v8:RegisterType("player", v7);
    v8:RegisterType("players", v0.MakeListableType(v7, {
        Prefixes = "% teamPlayers"
    }));
end;