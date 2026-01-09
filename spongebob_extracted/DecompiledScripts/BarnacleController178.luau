local _ = game:GetService("Debris");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local _ = game:GetService("TweenService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v11 = require(l_ReplicatedFirst_0.PlaceIds);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.SharedAnimator);
local v13 = TweenInfo.new(1);
local v14 = {
    NotFound = {
        "There's nothing of value inside, look elsewhere.", 
        "Just a couple of doubloons, nothing out of the ordinary.", 
        "An old grocery list inside, but it is too difficult to read..", 
        "Nothing interesting to you, just a glass bottle with a list of ingredients inside it.", 
        "A bunch of sea urchins crawl out, not the right spot."
    }, 
    Found = {
        "I just found treasure! This will help me!"
    }
};
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = v6.CreateController({
    Name = script.Name, 
    Client = {}
});
v26.KnitInit = function(_) --[[ Line: 66 ]] --[[ Name: KnitInit ]]
    -- upvalues: v15 (ref), v6 (copy), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref)
    v15 = v6.GetController("DataController");
    v16 = v6.GetService("BarnacleService");
    v17 = v6.GetController("UIController");
    v18 = v6.GetController("DeviceTypeController");
    v19 = v6.GetController("AudioController");
    v20 = v6.GetController("PlaceTeleportController");
    v21 = v6.GetController("CutsceneController");
end;
v26.KnitStart = function(_) --[[ Line: 77 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v22 (ref), v17 (ref), v24 (ref), v25 (ref), v23 (ref), v6 (copy), v7 (copy), v9 (copy), v13 (copy), v18 (ref), l_StarterGui_0 (copy), v19 (ref), v16 (ref), l_ReplicatedStorage_0 (copy), v12 (copy), v14 (copy), v20 (ref), v21 (ref)
end;
v26._debugWarn = function(_, ...) --[[ Line: 523 ]] --[[ Name: _debugWarn ]]
    -- upvalues: l_RunService_0 (copy), v10 (copy)
    if not l_RunService_0:IsStudio() then

    end;
    v10:Warn(...);
end;
return v26;