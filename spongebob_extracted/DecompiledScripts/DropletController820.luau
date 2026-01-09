local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.DropletManager);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Droplets.SecretTreasureChestDroplet);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Droplets.ExoticTreasureChestDroplet);
local v6 = v1.CreateController({
    Name = script.Name
});
v6.KnitInit = function(_) --[[ Line: 15 ]] --[[ Name: KnitInit ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    v3.Client:RegisterResourceType("SecretTreasureChest", v4);
    v3.Client:RegisterResourceType("ExoticTreasureChest", v5);
end;
v6.KnitStart = function(_) --[[ Line: 21 ]] --[[ Name: KnitStart ]]

end;
return v6;