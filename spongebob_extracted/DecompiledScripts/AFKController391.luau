local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = v3.CreateController({
    Name = script.Name, 
    Client = {}
});
v12.KnitInit = function(v13) --[[ Line: 41 ]] --[[ Name: KnitInit ]]
    -- upvalues: v9 (ref), v3 (copy), v10 (ref), v11 (ref), v7 (copy)
    v9 = v3.GetController("DataController");
    v10 = v3.GetController("PlaceTeleportController");
    v11 = v3.GetService("AFKService");
    v13.currentMode = v7:GetDestination();
end;
v12.KnitStart = function(v14) --[[ Line: 50 ]] --[[ Name: KnitStart ]]
    -- upvalues: v5 (copy)
    if v14.currentMode ~= "Game" then
        task.spawn(v14.ListenForIdle, v14);
    end;
    if v14.currentMode ~= "AFK" then
        return;
    else
        local v15 = v5.Await(workspace, "AFKRock/Camera");
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
        workspace.CurrentCamera.CFrame = v15.CFrame;
        return;
    end;
end;
v12.ListenForIdle = function(v16) --[[ Line: 66 ]] --[[ Name: ListenForIdle ]]
    -- upvalues: l_RunService_0 (copy), v3 (copy), v8 (copy), v11 (ref)
    if l_RunService_0:IsStudio() then
        return;
    else
        v3.Player.Idled:Connect(function(v17) --[[ Line: 71 ]]
            -- upvalues: v16 (copy), v8 (ref), v11 (ref)
            if v16.currentMode ~= "AFK" then
                if v17 < v8.AFK.AUTO_TELEPORT then
                    return;
                end;
            elseif v16.currentMode == "AFK" and v17 < v8.AFK.REFRESH_TIME then
                return;
            end;
            v11.Refresh:Fire();
        end);
        return;
    end;
end;
return v12;