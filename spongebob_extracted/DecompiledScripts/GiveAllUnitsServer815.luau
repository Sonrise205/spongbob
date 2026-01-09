local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = nil;
local v5 = require(l_ReplicatedFirst_0.PlaceIds);
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
local v7 = {
    ["*RootFriendly"] = true
};
local v8 = {};
v3.OnStart():andThen(function() --[[ Line: 18 ]]
    -- upvalues: v4 (ref), v3 (copy), l_Friendlies_0 (copy), v5 (copy), l_RunService_0 (copy), v7 (copy), v8 (copy)
    v4 = v3.GetService("UnitService");
    local v9 = tonumber(v3.GetService("VersionService"):GetVersion());
    for _, v11 in l_Friendlies_0:GetChildren() do
        if v11:IsA("Model") and not v11:HasTag("SpawnUnit") then
            if v5:IsReleaseBranch() and not l_RunService_0:IsStudio() then
                local l_v11_Attribute_0 = v11:GetAttribute("ReleaseVersion");
                if l_v11_Attribute_0 and v9 < l_v11_Attribute_0 then
                    continue;
                end;
            end;
            local l_Name_0 = v11.Name;
            if not v7[l_Name_0] then
                table.insert(v8, {
                    UnitName = l_Name_0, 
                    ExtraData = {}
                });
            end;
        end;
    end;
end);
return function(_, v15, _) --[[ Line: 55 ]]
    -- upvalues: v4 (ref), v8 (copy)
    v4:Create(v15, v8, false);
    return (("Gave all units to %*"):format(v15));
end;