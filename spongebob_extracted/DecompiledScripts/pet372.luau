local v0 = require(script.Parent.Parent.Shared.Util);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = {};
for _, v4 in l_ReplicatedStorage_0.Models.Pets:GetChildren() do
    if v4:IsA("Model") then
        table.insert(v2, v4.Name);
    end;
end;
local v10 = {
    Transform = function(v5) --[[ Line: 17 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v2 (copy)
        return v0.MakeFuzzyFinder(v2)(v5);
    end, 
    Validate = function(v6) --[[ Line: 23 ]] --[[ Name: Validate ]]
        return #v6 > 0, "No state with that name could be found.";
    end, 
    Autocomplete = function(v7) --[[ Line: 27 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v7);
    end, 
    Parse = function(v8) --[[ Line: 31 ]] --[[ Name: Parse ]]
        return v8[1];
    end, 
    Default = function(v9) --[[ Line: 35 ]] --[[ Name: Default ]]
        return v9;
    end
};
return function(v11) --[[ Line: 40 ]]
    -- upvalues: v10 (copy)
    v11:RegisterType(script.Name, v10);
end;