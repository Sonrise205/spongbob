local v0 = require(script.Parent.Parent.Shared.Util);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v3 = require(l_ReplicatedStorage_0.RelicsData);
local v4 = v2.Extend({
    "None"
}, v2.Keys(v3));
local v10 = {
    Transform = function(v5) --[[ Line: 12 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v4 (ref)
        return v0.MakeFuzzyFinder(v4)(v5);
    end, 
    Validate = function(v6) --[[ Line: 18 ]] --[[ Name: Validate ]]
        return #v6 > 0, "No option with that name could be found.";
    end, 
    Autocomplete = function(v7) --[[ Line: 22 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v7);
    end, 
    Parse = function(v8) --[[ Line: 26 ]] --[[ Name: Parse ]]
        return v8[1];
    end, 
    Default = function(v9) --[[ Line: 30 ]] --[[ Name: Default ]]
        return v9;
    end
};
return function(v11) --[[ Line: 35 ]]
    -- upvalues: v10 (copy)
    v11:RegisterType(script.Name, v10);
end;