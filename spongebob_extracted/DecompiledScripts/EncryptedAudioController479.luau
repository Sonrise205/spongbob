local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_SoundService_0 = game:GetService("SoundService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedFirst_0.PlaceIds);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = false;
local v15 = v4.CreateController({
    Name = script.Name, 
    Client = {}, 
    Loaded = v6.new()
});
v15.KnitInit = function(_) --[[ Line: 46 ]] --[[ Name: KnitInit ]]
    -- upvalues: v10 (ref), v4 (copy), v11 (ref), v12 (ref), v13 (ref)
    v10 = v4.GetController("DataController");
    v11 = v4.GetService("EncryptedAudioService");
    v12 = v4.GetController("AudioController");
    v13 = v4.GetController("EventController");
end;
v15.KnitStart = function(v17) --[[ Line: 54 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (ref), l_ContentProvider_0 (copy), l_ReplicatedStorage_0 (copy), v14 (ref), v8 (copy), v9 (copy), v12 (ref), l_SoundService_0 (copy), v13 (ref)
    for _, v19 in (v11:Request():expect()) do
        l_ContentProvider_0:RegisterSessionEncryptedAsset(v19.assetId, v19.scrambledKey);
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.SoundId = v19.assetId;
        l_Sound_0.Looped = false;
        l_Sound_0.Name = "IceSpice_BigGuy";
        l_Sound_0.RollOffMode = Enum.RollOffMode.InverseTapered;
        l_Sound_0.Parent = l_ReplicatedStorage_0;
    end;
    v14 = true;
    v17.Loaded:Fire();
end;
v15.IsLoaded = function(_) --[[ Line: 131 ]] --[[ Name: IsLoaded ]]
    -- upvalues: v14 (ref)
    return v14;
end;
return v15;