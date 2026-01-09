local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedFirst_0.PlaceIds);
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = v4.CreateController({
    Name = script.Name, 
    Client = {}
});
v13.KnitInit = function(_) --[[ Line: 42 ]] --[[ Name: KnitInit ]]
    -- upvalues: v9 (ref), v4 (copy), v10 (ref), v11 (ref), v12 (ref)
    v9 = v4.GetController("DataController");
    v10 = v4.GetService("GameService");
    v11 = v4.GetController("UIController");
    v12 = v4.GetController("CutsceneController");
end;
v13.KnitStart = function(_) --[[ Line: 50 ]] --[[ Name: KnitStart ]]
    -- upvalues: v8 (copy), l_RunService_0 (copy)
    if v8:GetDestination() == "AFK" then
        return;
    elseif not l_RunService_0:IsStudio() then
        return;
    else
        return;
    end;
end;
return v13;