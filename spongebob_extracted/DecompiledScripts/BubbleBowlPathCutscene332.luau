local _ = game:GetService("ContentProvider");
local _ = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local v10 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local _ = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.CharacterUtil);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
local v19 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v20 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut);
local v21 = TweenInfo.new(2, Enum.EasingStyle.Sine);
local v22 = TweenInfo.new(1.25);
local v23 = v7.GetController("CamShakeController");
local v24 = v7.GetController("CharacterController");
local v25 = v7.GetController("UIController");
local v26 = v7.GetController("AudioController");
local v27 = v7.GetController("TowerController");
local v28 = v7.GetController("DeviceTypeController");
local v29 = nil;
local v30 = nil;
local l_BubbleBowl_0 = l_ReplicatedStorage_0:FindFirstChild("Animations").Cutscenes.BubbleBowl;
local l_BubbleBowl_1 = l_ReplicatedStorage_0.Objects.Cutscene.BubbleBowl;
local v33 = {};
v33.__index = v33;
local _ = function(v34, v35) --[[ Line: 81 ]] --[[ Name: toggleEmitters ]]
    for _, v37 in v34 do
        v37.Enabled = v35;
    end;
end;
v33.new = function(v39, v40) --[[ Line: 88 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v33 (copy)
    if not v40 then
        return;
    else
        local v41 = setmetatable({
            timestamp = v39, 
            pathId = v40, 
            dumpster = v8.new()
        }, v33);
        local l_Map_0 = workspace:FindFirstChild("Map");
        if not l_Map_0 then
            return;
        else
            v41.map = l_Map_0;
            local l_BuildOffLimits_0 = l_Map_0.Zones.BuildOffLimits;
            l_BuildOffLimits_0 = l_BuildOffLimits_0 and l_BuildOffLimits_0:FindFirstChild(v40);
            if not l_BuildOffLimits_0 then
                return;
            else
                v41.pathBeams = {};
                for _, v45 in l_BuildOffLimits_0:GetDescendants() do
                    if v45:IsA("Beam") then
                        table.insert(v41.pathBeams, v45);
                    end;
                end;
                local l_PathCutscenes_0 = l_Map_0:FindFirstChild("PathCutscenes");
                if not l_PathCutscenes_0 then
                    return;
                else
                    v41.startPov = l_PathCutscenes_0.StartPOV.CFrame;
                    local l_l_PathCutscenes_0_FirstChild_0 = l_PathCutscenes_0:FindFirstChild(v40);
                    if not l_l_PathCutscenes_0_FirstChild_0 then
                        return;
                    else
                        v41.dependencies = l_l_PathCutscenes_0_FirstChild_0;
                        v41.povs = {};
                        for _, v49 in l_l_PathCutscenes_0_FirstChild_0.POV:GetChildren() do
                            v41.povs[tonumber(v49.Name)] = v49.CFrame;
                        end;
                        v41.obstacles = {};
                        for _, v51 in l_l_PathCutscenes_0_FirstChild_0.Obstacles:GetDescendants() do
                            if v51:IsA("BasePart") then
                                if v51.Transparency > 0.9 then
                                    v51:Destroy();
                                else
                                    v51:SetAttribute("OriginalPivot", v51.CFrame);
                                    table.insert(v41.obstacles, v51);
                                end;
                            end;
                        end;
                        v41.groundParticles = {};
                        for _, v53 in l_l_PathCutscenes_0_FirstChild_0.GroundParticles:GetChildren() do
                            table.insert(v41.groundParticles, v53);
                            v53.Enabled = false;
                        end;
                        local l_RaiseElements_0 = l_l_PathCutscenes_0_FirstChild_0.RaiseElements;
                        v41.platform = l_RaiseElements_0.Platform;
                        v41.platformGlow = l_RaiseElements_0.PlatformGlow.Decal;
                        v41.spotLight = l_RaiseElements_0.SpotLight;
                        v41.performer = l_RaiseElements_0.Performer;
                        v41.enemyTunnel = l_l_PathCutscenes_0_FirstChild_0.EnemyTunnel;
                        v41.enemyTunnel:SetAttribute("OriginalPivot", v41.enemyTunnel:GetPivot());
                        v41.performer:SetAttribute("OriginalPivot", v41.performer:GetPivot());
                        v41.performerSize = v41.performer:GetExtentsSize();
                        return v41;
                    end;
                end;
            end;
        end;
    end;
end;
v33.Play = function(v55) --[[ Line: 181 ]] --[[ Name: Play ]]
    -- upvalues: v25 (copy), v26 (copy), v27 (copy), v28 (copy), v24 (copy), v30 (ref), l_TweenService_0 (copy), v19 (copy), v18 (copy), v14 (copy), v21 (copy), v22 (copy), v20 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v57 = v25:ToggleAll({
        "SkipCutscene"
    }, false);
    v26:FadeMusicVolume(0.5, 1);
    v27:StopTowerPlacement();
    v28:TogglePlayerControls(false);
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v55.dumpster:Add(function() --[[ Line: 192 ]]
        -- upvalues: v28 (ref), v25 (ref), v57 (copy), v26 (ref), l_CurrentCamera_0 (copy), l_FieldOfView_0 (copy)
        v28:TogglePlayerControls(true);
        v25:RevertFromToggleAll(v57);
        v26:FadeMusicVolume(1, 0.5);
        v25:Toggle("SkipCutscene", false);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_CurrentCamera_0.FieldOfView = l_FieldOfView_0;
    end);
    local v59 = v55.timestamp - workspace:GetServerTimeNow();
    local v60 = nil;
    local v61 = nil;
    if v59 > 0 then
        local v62, v63 = v55:_sting({
            holdTime = math.max(0, v59 - 0.2)
        });
        v60 = v62;
        v61 = v63;
        if not v60:await() then
            return false;
        end;
    end;
    if v55.pathId == 6 then
        v55:_showPerformerPlayers(true);
        v55.loadedPlayerPerfomers = true;
    end;
    v24:ToggleHideAll(true);
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v55.startPov;
    l_CurrentCamera_0.FieldOfView = 60;
    if v61 and not v61:await() then
        return false;
    else
        local v65 = v26:PlaySound({
            name = "Cutscenes.BubbleBowl", 
            soundGroup = "Master.SFX.VFX"
        });
        v55.dumpster:Add(v65);
        v30:Open(script.Name, v55.timestamp);
        local v66 = v55.startPov * CFrame.new(0, 0, 5);
        local v67 = TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v68 = l_TweenService_0:Create(l_CurrentCamera_0, v67, {
            CFrame = v66
        });
        v55:_addTweenToDumpster(v68);
        v68:Play();
        if not v55:_delay(2) then
            return;
        else
            v66 = nil;
            v67 = v55.povs[1];
            v66 = l_TweenService_0:Create(l_CurrentCamera_0, v19, {
                CFrame = v67
            });
            v55:_addTweenToDumpster(v66);
            v66:Play();
            for _, v70 in v55.groundParticles do
                v70.Enabled = true;
            end;
            if not v55:_delay(0.5) then
                return false;
            else
                for _, v72 in v55.pathBeams do
                    v72.Enabled = true;
                end;
                for _, v74 in v55.obstacles do
                    local l_Size_0 = v74.Size;
                    local v76 = v74.CFrame - Vector3.new(0, l_Size_0.Y + 2, 0);
                    local v77 = l_TweenService_0:Create(v74, v18, {
                        CFrame = v76
                    });
                    v55:_addTweenToDumpster(v77);
                    v77:Play();
                end;
                if not v55:_delay(1) then
                    return false;
                else
                    for _, v79 in v55.groundParticles do
                        v79.Enabled = false;
                    end;
                    if not v55:_delay(2.5) then
                        return false;
                    else
                        if v66 then
                            v66:Cancel();
                            v66:Destroy();
                        end;
                        l_CurrentCamera_0.CFrame = v55.povs[2];
                        if not v55:_delay(1) then
                            return;
                        else
                            v55.platformGlow.Transparency = 0;
                            v55.spotLight.Enabled = true;
                            if not v55:_delay(0.5) then
                                return false;
                            else
                                v67 = v55.performer:GetAttribute("OriginalPivot");
                                v68 = v67 + Vector3.new(0, v55.performerSize.Y + 1, 0);
                                v55.dumpster:Add(v14("CFrameValue", v67, v21, {
                                    Value = v68
                                }, function(v80) --[[ Line: 315 ]]
                                    -- upvalues: v55 (copy)
                                    v55.performer:PivotTo(v80);
                                end));
                                local v81 = nil;
                                v81 = CFrame.lookAt(l_CurrentCamera_0.CFrame.Position, v68.Position) * CFrame.new(0, 0, 5);
                                local v82 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                                local v83 = l_TweenService_0:Create(l_CurrentCamera_0, v82, {
                                    CFrame = v81
                                });
                                v55:_addTweenToDumpster(v83);
                                v83:Play();
                                if not v55:_delay(v21.Time / 2) then
                                    return false;
                                else
                                    v82 = l_TweenService_0:Create(v55.platform, v22, {
                                        Transparency = 0
                                    });
                                    v55:_addTweenToDumpster(v82);
                                    v82:Play();
                                    if not v55:_delay(v21.Time / 2) then
                                        return false;
                                    else
                                        v83 = v55.enemyTunnel:GetAttribute("OriginalPivot");
                                        local v84 = v83 * CFrame.new(0, 7, 0);
                                        local v85 = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut);
                                        v55.dumpster:Add(v14("CFrameValue", v83, v85, {
                                            Value = v84
                                        }, function(v86) --[[ Line: 351 ]]
                                            -- upvalues: v55 (copy)
                                            v55.enemyTunnel:PivotTo(v86);
                                        end));
                                        local v87 = v81 * CFrame.new(0, 0, 8) * CFrame.Angles(-0.17453292519943295, 0, 0);
                                        local v88 = l_TweenService_0:Create(l_CurrentCamera_0, v85, {
                                            CFrame = v87
                                        });
                                        v55:_addTweenToDumpster(v88);
                                        v88:Play();
                                        if not v55:_delay(v85.Time) then
                                            return false;
                                        else
                                            v25:Toggle("SkipCutscene", false);
                                            if not v55:_delay(1) then
                                                return false;
                                            else
                                                v83 = l_TweenService_0:Create(l_CurrentCamera_0, v20, {
                                                    CFrame = l_CFrame_0, 
                                                    FieldOfView = l_FieldOfView_0
                                                });
                                                v55:_addTweenToDumpster(v83);
                                                v83:Play();
                                                v24:ToggleHideAll(false);
                                                if not v55:_delay(v20.Time) then
                                                    return false;
                                                else
                                                    v55:_cleanup(true);
                                                    return true;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v33.Skip = function(v89) --[[ Line: 397 ]] --[[ Name: Skip ]]
    -- upvalues: v23 (copy)
    v89.dumpster:Destroy();
    v23:Stop(true);
    for _, v91 in v89.obstacles do
        local l_Size_1 = v91.Size;
        v91.CFrame = v91:GetAttribute("OriginalPivot") - Vector3.new(0, l_Size_1.Y + 2, 0);
    end;
    for _, v94 in v89.groundParticles do
        v94.Enabled = false;
        v94:Clear();
    end;
    v89.platform.Transparency = 0;
    v89.spotLight.Enabled = true;
    v89.platformGlow.Transparency = 0;
    local l_Attribute_0 = v89.performer:GetAttribute("OriginalPivot");
    v89.performer:PivotTo(l_Attribute_0 + Vector3.new(0, v89.performerSize.Y + 1, 0));
    local l_Attribute_1 = v89.enemyTunnel:GetAttribute("OriginalPivot");
    v89.enemyTunnel:PivotTo(l_Attribute_1 * CFrame.new(0, 7, 0));
    if v89.pathId == 6 and not v89.loadedPlayerPerfomers then
        v89:_showPerformerPlayers(false);
    end;
    for _, v98 in v89.pathBeams do
        v98.Enabled = true;
    end;
    v89:_cleanup();
end;
v33._cleanup = function(v99, v100) --[[ Line: 436 ]] --[[ Name: _cleanup ]]
    -- upvalues: v24 (copy)
    if not v100 then
        v24:ToggleHideAll(false);
    end;
    v99.dumpster:Destroy();
    table.clear(v99);
    setmetatable(v99, nil);
end;
v33._sting = function(v101, v102) --[[ Line: 446 ]] --[[ Name: _sting ]]
    -- upvalues: v9 (copy), v29 (ref)
    v102 = v102 or {};
    local v103 = nil;
    local v106 = v9.new(function(v104) --[[ Line: 457 ]]
        -- upvalues: v103 (ref), v9 (ref), v29 (ref), v102 (ref)
        v103 = v9.new(function(v105) --[[ Line: 458 ]]
            -- upvalues: v29 (ref), v102 (ref), v104 (copy)
            v29:Transition({
                config = {
                    tweenInInfo = v102.tweenInInfo, 
                    holdTime = v102.holdTime
                }, 
                callbacks = {
                    hold = v105, 
                    tweenOut = not v102.startWhenFinished and v104, 
                    finished = v102.startWhenFinished and v104
                }
            });
        end);
    end);
    v101.dumpster:Add(v103);
    v101.dumpster:Add(v106);
    return v103, v106;
end;
v33._delay = function(v107, v108) --[[ Line: 479 ]] --[[ Name: _delay ]]
    -- upvalues: v9 (copy)
    local v109 = v9.delay(v108);
    v107.dumpster:Add(v109);
    return v109:await();
end;
v33._addTweenToDumpster = function(v110, v111) --[[ Line: 486 ]] --[[ Name: _addTweenToDumpster ]]
    v110.dumpster:Add(function() --[[ Line: 487 ]]
        -- upvalues: v111 (copy)
        v111:Cancel();
        v111:Destroy();
    end);
end;
v33._showPerformerPlayers = function(v112, v113) --[[ Line: 493 ]] --[[ Name: _showPerformerPlayers ]]
    -- upvalues: v10 (copy), l_Players_0 (copy), v16 (copy), l_BubbleBowl_1 (copy), l_BubbleBowl_0 (copy), l_RunService_0 (copy), v17 (copy)
    local v114 = v10.Shuffle(l_Players_0:GetPlayers());
    local l_Players_1 = v112.performer.Players;
    local function _(v116) --[[ Line: 497 ]] --[[ Name: addToDumpster ]]
        -- upvalues: v113 (copy), v112 (copy)
        if v113 then
            v112.dumpster:Add(v116);
        end;
    end;
    for v118 = 1, 4 do
        local l_l_Players_1_FirstChild_0 = l_Players_1:FindFirstChild(v118);
        local v120 = v114[v118];
        if not v120 then
            l_l_Players_1_FirstChild_0:Destroy();
        else
            local v143 = v16:DuplicateCharacterAsync(v120):andThen(function(v121) --[[ Line: 514 ]]
                -- upvalues: l_l_Players_1_FirstChild_0 (copy), v118 (copy), l_Players_1 (copy), l_BubbleBowl_1 (ref), l_BubbleBowl_0 (ref), l_RunService_0 (ref), v17 (ref), v113 (copy), v112 (copy)
                if not l_l_Players_1_FirstChild_0 or not l_l_Players_1_FirstChild_0.Parent then
                    return;
                else
                    v121.Name = v118;
                    v121.PrimaryPart.Anchored = true;
                    local l_Humanoid_0 = v121:FindFirstChildOfClass("Humanoid");
                    l_Humanoid_0.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                    l_Humanoid_0.EvaluateStateMachine = false;
                    local v123 = v121.PrimaryPart.Size.Y / 2 + l_Humanoid_0.HipHeight;
                    v121:PivotTo(l_l_Players_1_FirstChild_0:GetPivot() + Vector3.new(0, v123, 0));
                    for _, v125 in v121:GetDescendants() do
                        if v125:IsA("BasePart") then
                            v125.CanCollide = false;
                            v125.CollisionGroup = "None";
                        end;
                    end;
                    v121.Parent = l_Players_1;
                    local v126 = l_BubbleBowl_1:FindFirstChild(v118):Clone();
                    local l_LeftHand_0 = v121:FindFirstChild("LeftHand");
                    local l_RightHand_0 = v121:FindFirstChild("RightHand");
                    if v118 ~= 4 then
                        local l_WorldCFrame_0 = l_RightHand_0.RightGripAttachment.WorldCFrame;
                        local l_Handle_0 = v126.Handle;
                        local l_Motor6D_0 = Instance.new("Motor6D");
                        l_Motor6D_0.Name = "RightGrip";
                        l_Motor6D_0.C0 = l_RightHand_0.CFrame:ToObjectSpace(l_WorldCFrame_0);
                        l_Motor6D_0.C1 = v126.Grip;
                        l_Motor6D_0.Part0 = l_RightHand_0;
                        l_Motor6D_0.Part1 = l_Handle_0;
                        l_Motor6D_0.Parent = l_RightHand_0;
                    else
                        local l_LeftHandle_0 = v126.LeftHandle;
                        local l_RightHandle_0 = v126.RightHandle;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.C1 = l_LeftHandle_0:GetAttribute("Grip");
                        l_Weld_0.Part0 = l_LeftHandle_0;
                        l_Weld_0.Part1 = l_LeftHand_0;
                        l_Weld_0.Parent = l_LeftHandle_0;
                        local l_Weld_1 = Instance.new("Weld");
                        l_Weld_1.C1 = l_RightHandle_0:GetAttribute("Grip");
                        l_Weld_1.Part0 = l_RightHandle_0;
                        l_Weld_1.Part1 = l_RightHand_0;
                        l_Weld_1.Parent = l_RightHandle_0;
                    end;
                    v126.Parent = v121;
                    local v136 = v121.Humanoid.Animator:LoadAnimation((l_BubbleBowl_0:FindFirstChild(v118)));
                    if v136.Length == 0 then
                        local v137 = 0;
                        local v138 = nil;
                        do
                            local l_v137_0, l_v138_0 = v137, v138;
                            l_v138_0 = l_RunService_0.Heartbeat:Connect(function(v141) --[[ Line: 582 ]]
                                -- upvalues: l_v137_0 (ref), v136 (copy), l_v138_0 (ref), v17 (ref)
                                l_v137_0 = l_v137_0 + v141;
                                if v136.Length ~= 0 then
                                    l_v138_0:Disconnect();
                                    v136:Play();
                                    return;
                                else
                                    if l_v137_0 >= v17.ANIMATIONS.MAX_LOAD_TIME then
                                        l_v138_0:Disconnect();
                                    end;
                                    return;
                                end;
                            end);
                            local l_l_v138_0_0 = l_v138_0;
                            if v113 then
                                v112.dumpster:Add(l_l_v138_0_0);
                            end;
                        end;
                    else
                        v136:Play();
                    end;
                    l_l_Players_1_FirstChild_0:Destroy();
                    return;
                end;
            end, function() --[[ Line: 603 ]]
                -- upvalues: l_l_Players_1_FirstChild_0 (copy)
                l_l_Players_1_FirstChild_0:Destroy();
            end);
            if v113 then
                v112.dumpster:Add(v143);
            end;
        end;
    end;
end;
v7.OnStart():andThen(function() --[[ Line: 609 ]]
    -- upvalues: v12 (copy), v29 (ref), v25 (copy), v30 (ref)
    if not v12:IsGame() then
        return;
    else
        v29 = v25:GetModuleAsync("Sting"):expect();
        v30 = v30 or v25:GetModuleAsync("SkipCutscene"):expect();
        return;
    end;
end);
return v33;