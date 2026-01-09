local v0 = require(script.Parent.Parent.Shared.Util);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = {};
local v3 = {
    ["*RootFriendly"] = true, 
    PioneerRock = true
};
for _, v5 in l_ReplicatedStorage_0.Models.Friendlies:GetChildren() do
    if v5:IsA("Model") then
        local l_Name_0 = v5.Name;
        if not v3[l_Name_0] then
            table.insert(v2, l_Name_0);
        end;
    end;
end;
local v12 = {
    Transform = function(v7) --[[ Line: 26 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v2 (copy)
        return v0.MakeFuzzyFinder(v2)(v7);
    end, 
    Validate = function(v8) --[[ Line: 32 ]] --[[ Name: Validate ]]
        return #v8 > 0, "No state with that name could be found.";
    end, 
    Autocomplete = function(v9) --[[ Line: 36 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v9);
    end, 
    Parse = function(v10) --[[ Line: 40 ]] --[[ Name: Parse ]]
        return v10[1];
    end, 
    Default = function(v11) --[[ Line: 44 ]] --[[ Name: Default ]]
        return v11;
    end
};
return function(v13) --[[ Line: 49 ]]
    -- upvalues: v12 (copy)
    v13:RegisterType(script.Name, v12);
end;