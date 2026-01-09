local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedFirst_0.PlaceIds);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v8 = nil;
local v9 = nil;
local v10 = v2.CreateController({
    Name = script.Name
});
v10.KnitInit = function(_) --[[ Line: 21 ]] --[[ Name: KnitInit ]]
    -- upvalues: v8 (ref), v2 (copy), v9 (ref)
    v8 = v2.GetController("UIController");
    v9 = v2.GetService("OlipopService");
end;
v10.KnitStart = function(_) --[[ Line: 27 ]] --[[ Name: KnitStart ]]
    -- upvalues: v4 (copy), v7 (copy), v5 (copy), v8 (ref), v2 (copy), v6 (copy), v9 (ref)
    if not v4:IsLobby() then
        return;
    else
        return;
    end;
end;
v10.ToggleVideoPlayback = function(_, _) --[[ Line: 112 ]] --[[ Name: ToggleVideoPlayback ]]

end;
return v10;