local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = v3.CreateController({
    Name = script.Name, 
    Client = {}
});
v15.KnitInit = function(_) --[[ Line: 45 ]] --[[ Name: KnitInit ]]
    -- upvalues: v9 (ref), v3 (copy), v10 (ref), v11 (ref)
    v9 = v3.GetController("DataController");
    v10 = v3.GetController("UIController");
    v11 = v3.GetService("GameService");
end;
v15.KnitStart = function(v17) --[[ Line: 54 ]] --[[ Name: KnitStart ]]
    -- upvalues: v7 (copy), v12 (ref), v5 (copy), v11 (ref), v3 (copy), v14 (ref), v13 (ref)
    if not v7:IsGame() then
        return;
    else
        v12 = workspace:FindFirstChild("Enemies");
        local v18 = select(2, v5.Custom(function() --[[ Line: 61 ]]
            -- upvalues: v11 (ref)
            return v11.LevelInfo:Get();
        end):await());
        if not v18 then
            return;
        elseif v18.Mode ~= "BossBattle" then
            return;
        else
            v17.map = workspace:WaitForChild("Map");
            if v3.Player:GetAttribute("Loading") then
                v3.Player:GetAttributeChangedSignal("Loading"):Wait();
            end;
            v14 = v17.map:WaitForChild("BossSpawn"):GetPivot();
            local v19 = {};
            for _, v21 in v17.map.POV:GetChildren() do
                v19[tonumber(v21.Name)] = v21.CFrame;
            end;
            v17.povs = v19;
            v13 = workspace.CurrentCamera;
            v13.FieldOfView = 85;
            v13.CameraType = Enum.CameraType.Scriptable;
            v17:StartIdleLoop(true);
            return;
        end;
    end;
end;
v15.StartIdleLoop = function(v22, v23) --[[ Line: 101 ]] --[[ Name: StartIdleLoop ]]
    -- upvalues: v13 (ref), v12 (ref), v5 (copy), v11 (ref), v14 (ref), v8 (copy), v4 (copy), l_RunService_0 (copy)
    if v22.orbitDumpster then
        v22.orbitDumpster:Destroy();
    end;
    v22.previewingTower = nil;
    v13.CameraType = Enum.CameraType.Scriptable;
    v13.CameraSubject = nil;
    local v24 = v12:GetChildren()[1];
    local v25 = if v24 then v24:GetExtentsSize().Y * 0.3 else 10;
    local v26 = math.min(80, if v24 then v5.Custom(function() --[[ Line: 115 ]]
        -- upvalues: v11 (ref)
        return v11.BossBattleRadius:Get();
    end):expect() + 10 else 40);
    local v27 = v14.Position + Vector3.new(0, v25, 0);
    local v28 = v14.Y + v8.BOSS_BATTLE.CAMERA_HEIGHT_OFFSET;
    v22.orbitAngle = -1.5707963267948966;
    v22.orbitDumpster = v4.new();
    local v34 = l_RunService_0.PreSimulation:Connect(function(v29) --[[ Line: 128 ]]
        -- upvalues: v22 (copy), v14 (ref), v26 (copy), v28 (copy), v27 (copy), v23 (ref), v13 (ref)
        v22.orbitAngle = (v22.orbitAngle + v29 * 0.1) % 6.283185307179586;
        local v30 = v14.X + math.cos(v22.orbitAngle) * v26;
        local v31 = v14.Z + math.sin(v22.orbitAngle) * v26;
        local v32 = Vector3.new(v30, v28, v31);
        local v33 = CFrame.lookAt(v32, v27);
        if v23 then
            v13.CFrame = v33;
            v23 = false;
            return;
        else
            v13.CFrame = v13.CFrame:Lerp(v33, v29 * 10);
            return;
        end;
    end);
    v22.orbitDumpster:Add(v34);
end;
v15.PreviewTower = function(v35, v36) --[[ Line: 150 ]] --[[ Name: PreviewTower ]]
    -- upvalues: v13 (ref)
    if not v36 or not v36.PrimaryPart then
        return;
    else
        v35:StopIdleLoop();
        v35.previewingTower = v36;
        local l_VisualModel_0 = v36:FindFirstChild("VisualModel");
        local l_CameraAdornee_0 = v36:FindFirstChild("CameraAdornee");
        if not l_CameraAdornee_0 then
            l_CameraAdornee_0 = Instance.new("Part");
            l_CameraAdornee_0.Name = "CameraAdornee";
            l_CameraAdornee_0.Size = Vector3.new(1, 1, 1, 0);
            l_CameraAdornee_0.CanCollide = false;
            l_CameraAdornee_0.CanQuery = false;
            l_CameraAdornee_0.Anchored = true;
            l_CameraAdornee_0.Transparency = 1;
            local l_l_VisualModel_0_ExtentsSize_0 = l_VisualModel_0:GetExtentsSize();
            l_CameraAdornee_0.CFrame = v36.PrimaryPart.CFrame + Vector3.new(0, l_l_VisualModel_0_ExtentsSize_0.Y / 2);
            l_CameraAdornee_0.Parent = v36;
        end;
        v13.CameraType = Enum.CameraType.Custom;
        v13.CameraSubject = l_CameraAdornee_0;
        v13.CFrame = CFrame.lookAlong(v13.CFrame.Position, (v36.PrimaryPart.CFrame * CFrame.Angles(-0.2617993877991494, 0, 0)).LookVector);
        return;
    end;
end;
v15.GetPreviewTower = function(v40) --[[ Line: 186 ]] --[[ Name: GetPreviewTower ]]
    return v40.previewingTower;
end;
v15.StopIdleLoop = function(v41) --[[ Line: 192 ]] --[[ Name: StopIdleLoop ]]
    if v41.orbitDumpster then
        v41.orbitDumpster:Destroy();
        v41.orbitDumpster = nil;
    end;
    return v41.orbitAngle;
end;
return v15;