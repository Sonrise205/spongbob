local l_Teams_0 = game:GetService("Teams");
local v1 = require(script.Parent.Parent.Shared.Util);
local v6 = {
    Transform = function(v2) --[[ Line: 5 ]] --[[ Name: Transform ]]
        -- upvalues: v1 (copy), l_Teams_0 (copy)
        return v1.MakeFuzzyFinder(l_Teams_0:GetTeams())(v2);
    end, 
    Validate = function(v3) --[[ Line: 11 ]] --[[ Name: Validate ]]
        return #v3 > 0, "No team with that name could be found.";
    end, 
    Autocomplete = function(v4) --[[ Line: 15 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v1 (copy)
        return v1.GetNames(v4);
    end, 
    Parse = function(v5) --[[ Line: 19 ]] --[[ Name: Parse ]]
        return v5[1];
    end
};
local v8 = {
    Listable = true, 
    Transform = v6.Transform, 
    Validate = v6.Validate, 
    Autocomplete = v6.Autocomplete, 
    Parse = function(v7) --[[ Line: 30 ]] --[[ Name: Parse ]]
        return v7[1]:GetPlayers();
    end
};
local v10 = {
    Transform = v6.Transform, 
    Validate = v6.Validate, 
    Autocomplete = v6.Autocomplete, 
    Parse = function(v9) --[[ Line: 40 ]] --[[ Name: Parse ]]
        return v9[1].TeamColor;
    end
};
return function(v11) --[[ Line: 45 ]]
    -- upvalues: v6 (copy), v1 (copy), v8 (copy), v10 (copy)
    v11:RegisterType("team", v6);
    v11:RegisterType("teams", v1.MakeListableType(v6));
    v11:RegisterType("teamPlayers", v8);
    v11:RegisterType("teamColor", v10);
    v11:RegisterType("teamColors", v1.MakeListableType(v10));
end;