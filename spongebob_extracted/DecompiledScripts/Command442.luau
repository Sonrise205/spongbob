local v0 = require(script.Parent.Parent.Shared.Util);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v6 = {
        Transform = function(v2) --[[ Line: 5 ]] --[[ Name: Transform ]]
            -- upvalues: v0 (ref), v1 (copy)
            return v0.MakeFuzzyFinder(v1:GetCommandNames())(v2);
        end, 
        Validate = function(v3) --[[ Line: 11 ]] --[[ Name: Validate ]]
            return #v3 > 0, "No command with that name could be found.";
        end, 
        Autocomplete = function(v4) --[[ Line: 15 ]] --[[ Name: Autocomplete ]]
            return v4;
        end, 
        Parse = function(v5) --[[ Line: 19 ]] --[[ Name: Parse ]]
            return v5[1];
        end
    };
    v1:RegisterType("command", v6);
    v1:RegisterType("commands", v0.MakeListableType(v6));
end;