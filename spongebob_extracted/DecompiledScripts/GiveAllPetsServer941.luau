local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local l_Pets_0 = l_ReplicatedStorage_0.Models.Pets;
local v4 = {
    ["*RootFriendly"] = true
};
local v5 = {};
v1.OnStart():andThen(function() --[[ Line: 14 ]]
    -- upvalues: v2 (ref), v1 (copy), l_Pets_0 (copy), v4 (copy), v5 (copy)
    v2 = v1.GetService("PetService");
    local v6 = tonumber(v1.GetService("VersionService"):GetVersion());
    for _, v8 in l_Pets_0:GetChildren() do
        if v8:IsA("Model") then
            local l_v8_Attribute_0 = v8:GetAttribute("ReleaseVersion");
            if not l_v8_Attribute_0 or v6 >= l_v8_Attribute_0 then
                local l_Name_0 = v8.Name;
                if not v4[l_Name_0] then
                    table.insert(v5, {
                        name = l_Name_0, 
                        extraData = {}
                    });
                end;
            end;
        end;
    end;
end);
return function(_, v12) --[[ Line: 43 ]]
    -- upvalues: v2 (ref), v5 (copy)
    v2:CreatePets(v12, v5, false);
    return (("Gave all units to %*"):format(v12));
end;