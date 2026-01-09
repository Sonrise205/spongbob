local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedFirst_0.PlaceIds);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v12 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut);
local v13 = v4.GetController("CamShakeController");
local v14 = v4.GetController("CharacterController");
local v15 = v4.GetController("UIController");
local v16 = v4.GetController("AudioController");
local v17 = v4.GetController("TowerController");
local v18 = v4.GetController("DeviceTypeController");
local v19 = nil;
local v20 = nil;
local v21 = {};
v21.__index = v21;
local _ = function(v22, v23) --[[ Line: 68 ]] --[[ Name: toggleEmitters ]]
    for _, v25 in v22 do
        v25.Enabled = v23;
    end;
end;
v21.new = function(v27, v28) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v21 (copy), v10 (copy)
    if not v28 then
        return;
    else
        local v29 = setmetatable({
            timestamp = v27, 
            pathId = v28, 
            dumpster = v5.new()
        }, v21);
        local l_Map_0 = workspace:FindFirstChild("Map");
        if not l_Map_0 then
            return;
        else
            v29.map = l_Map_0;
            local l_BuildOffLimits_0 = l_Map_0.Zones.BuildOffLimits;
            v29.pathVisuals = {
                [2] = l_BuildOffLimits_0["2"], 
                [3] = l_BuildOffLimits_0["3"], 
                [5] = l_BuildOffLimits_0["5"], 
                [6] = l_BuildOffLimits_0["6"]
            };
            v29.pathOrigins = {
                [2] = v29.pathVisuals[2]:GetPivot(), 
                [3] = v29.pathVisuals[3]:GetPivot(), 
                [5] = v29.pathVisuals[5]:GetPivot(), 
                [6] = v29.pathVisuals[6]:GetPivot()
            };
            v29.pathBeams = {
                [2] = {}, 
                [3] = {}, 
                [5] = {}, 
                [6] = {}
            };
            for v32, v33 in v29.pathVisuals do
                for _, v35 in v33:GetDescendants() do
                    if v35:IsA("Beam") then
                        table.insert(v29.pathBeams[v32], v35);
                    end;
                end;
            end;
            local l_PathCutscenes_0 = l_Map_0:FindFirstChild("PathCutscenes");
            if not l_PathCutscenes_0 then
                return;
            else
                local l_l_PathCutscenes_0_FirstChild_0 = l_PathCutscenes_0:FindFirstChild(v28);
                if not l_l_PathCutscenes_0_FirstChild_0 then
                    return;
                else
                    v29.dependencies = l_l_PathCutscenes_0_FirstChild_0;
                    v29.povs = {};
                    for _, v39 in l_l_PathCutscenes_0_FirstChild_0.POV:GetChildren() do
                        v29.povs[tonumber(v39.Name)] = v39.CFrame;
                    end;
                    v29.bridge = l_l_PathCutscenes_0_FirstChild_0.Bridge;
                    v29.bridgeOrigin = v29.bridge:GetPivot();
                    v29.rumbleParticles = {
                        {}, 
                        {}
                    };
                    v29.lavaParticles = {};
                    v29.bridgeParticles = {};
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Rumble1, "ParticleEmitter", function(v40) --[[ Line: 144 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.rumbleParticles[1], v40);
                        v40.Enabled = false;
                    end);
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Rumble2, "ParticleEmitter", function(v41) --[[ Line: 149 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.rumbleParticles[2], v41);
                        v41.Enabled = false;
                    end);
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Lava, "ParticleEmitter", function(v42) --[[ Line: 154 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.lavaParticles, v42);
                        v42.Enabled = false;
                    end);
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.Bridge, "ParticleEmitter", function(v43) --[[ Line: 159 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.bridgeParticles, v43);
                        v43.Enabled = false;
                    end);
                    v29.clouds = l_l_PathCutscenes_0_FirstChild_0.Clouds;
                    v29.cloudsOrigin = v29.clouds:GetPivot();
                    local l_RaiseElements_0 = l_l_PathCutscenes_0_FirstChild_0.RaiseElements;
                    v29.towers = {
                        {
                            l_PathCutscenes_0["2"].RaiseElements.Tower, 
                            l_PathCutscenes_0["3"].RaiseElements.Tower
                        }, 
                        {
                            l_RaiseElements_0.Tower1, 
                            l_RaiseElements_0.Tower2
                        }
                    };
                    v29.towerOrigins = {
                        {
                            v29.towers[1][1]:GetPivot(), 
                            v29.towers[1][2]:GetPivot()
                        }, 
                        {
                            v29.towers[2][1]:GetPivot(), 
                            v29.towers[2][2]:GetPivot()
                        }
                    };
                    v29.towerSizes = {
                        {
                            v29.towers[1][1]:GetExtentsSize(), 
                            v29.towers[1][2]:GetExtentsSize()
                        }, 
                        {
                            v29.towers[2][1]:GetExtentsSize(), 
                            v29.towers[2][2]:GetExtentsSize()
                        }
                    };
                    return v29;
                end;
            end;
        end;
    end;
end;
v21.Play = function(v45) --[[ Line: 206 ]] --[[ Name: Play ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy), v18 (copy), v14 (copy), v20 (ref), v11 (copy), v13 (copy), l_TweenService_0 (copy), v12 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v47 = v15:ToggleAll({
        "SkipCutscene"
    }, false);
    v16:FadeMusicVolume(0.25, 1);
    v17:StopTowerPlacement();
    v18:TogglePlayerControls(false);
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v45.dumpster:Add(function() --[[ Line: 217 ]]
        -- upvalues: v18 (ref), v15 (ref), v47 (copy), v16 (ref), l_CurrentCamera_0 (copy), l_FieldOfView_0 (copy)
        v18:TogglePlayerControls(true);
        v15:RevertFromToggleAll(v47);
        v16:FadeMusicVolume(1, 0.5);
        v15:Toggle("SkipCutscene", false);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_CurrentCamera_0.FieldOfView = l_FieldOfView_0;
    end);
    local v49 = v45.timestamp - workspace:GetServerTimeNow();
    local v50 = nil;
    local v51 = nil;
    if v49 > 0 then
        local v52, v53 = v45:_sting({
            holdTime = math.max(0, v49 - 0.2)
        });
        v50 = v52;
        v51 = v53;
        if not v50:await() then
            return false;
        end;
    end;
    v14:ToggleHideAll(true);
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v45.povs[1];
    l_CurrentCamera_0.FieldOfView = 60;
    for _, v56 in v45.pathBeams[2] do
        v56.Enabled = false;
    end;
    for _, v58 in v45.pathBeams[3] do
        v58.Enabled = false;
    end;
    if v51 and not v51:await() then
        return false;
    else
        v20:Open(script.Name, v45.timestamp);
        local v60 = v11("CFrameValue", l_CurrentCamera_0.CFrame, TweenInfo.new(15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Value = v45.povs[1] - Vector3.new(0, 30, 0, 0)
        }, function(v59) --[[ Line: 270 ]]
            -- upvalues: v13 (ref), l_CurrentCamera_0 (copy)
            v13:SetOriginalPivot(v59);
            if not v13:IsShaking() then
                l_CurrentCamera_0.CFrame = v59;
            end;
        end);
        v45.dumpster:Add(v60);
        if not v45:_delay(1) then
            return;
        else
            for _, v62 in v45.rumbleParticles[1] do
                v62.Enabled = true;
            end;
            local v63 = v45:_rumble();
            for v64, v65 in v45.towers[1] do
                local v66 = v45.towerOrigins[1][v64] - Vector3.new(0, v45.towerSizes[1][v64].Y + 1, 0);
                v45.dumpster:Add(v11("CFrameValue", v45.towerOrigins[1][v64], TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    Value = v66
                }, function(v67) --[[ Line: 301 ]]
                    -- upvalues: v65 (copy)
                    v65:PivotTo(v67);
                end));
            end;
            for _, v69 in {
                2, 
                3
            } do
                v45.dumpster:Add(v11("CFrameValue", v45.pathOrigins[v69], TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    Value = v45.pathOrigins[v69] - Vector3.new(0, 0.44999998807907104, 0, 0)
                }, function(v70) --[[ Line: 319 ]]
                    -- upvalues: v45 (copy), v69 (copy)
                    v45.pathVisuals[v69]:PivotTo(v70);
                end));
            end;
            v45.pathVisuals[5]:PivotTo(v45.pathOrigins[5] + Vector3.new(0, 50, 0, 0));
            v45.pathVisuals[6]:PivotTo(v45.pathOrigins[6] + Vector3.new(0, 50, 0, 0));
            local v71 = v16:PlaySound({
                name = "Cutscenes.MiddleAges.BridgeFire", 
                soundGroup = "Master.SFX.VFX", 
                adornee = v45.bridge.VFX
            });
            v45.dumpster:Add(v71);
            local v72 = v16:PlaySound({
                name = "Cutscenes.MiddleAges.FireLoop", 
                soundGroup = "Master.SFX.VFX", 
                adornee = v45.bridge.VFX, 
                extraData = {
                    fadeIn = true, 
                    fadeTime = 0.5
                }
            });
            v45.dumpster:Add(v72);
            for _, v74 in v45.bridgeParticles do
                v74.Enabled = true;
            end;
            if not v45:_delay(0.5) then
                return false;
            else
                v45.dumpster:Add(v11("CFrameValue", v45.bridgeOrigin, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                    Value = v45.bridgeOrigin - Vector3.new(0, 11, 0, 0)
                }, function(v75) --[[ Line: 364 ]]
                    -- upvalues: v45 (copy)
                    v45.bridge:PivotTo(v75);
                end));
                if not v45:_delay(1.5) then
                    return false;
                else
                    for _, v77 in v45.bridgeParticles do
                        v77.Enabled = false;
                    end;
                    v16:StopSound(v72, {
                        fadeOut = true, 
                        fadeTime = 1
                    });
                    for _, v79 in v45.rumbleParticles[1] do
                        v79.Enabled = false;
                    end;
                    v16:StopSound(v63, {
                        fadeOut = true, 
                        fadeTime = 1
                    });
                    if not v45:_stopShake() then
                        return false;
                    elseif not v45:_delay(1) then
                        return false;
                    else
                        v60:Destroy();
                        v45.dumpster:Add(v11("CFrameValue", l_CurrentCamera_0.CFrame, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
                            Value = v45.povs[2]
                        }, function(v80) --[[ Line: 408 ]]
                            -- upvalues: v13 (ref), l_CurrentCamera_0 (copy)
                            v13:SetOriginalPivot(v80);
                            if not v13:IsShaking() then
                                l_CurrentCamera_0.CFrame = v80;
                            end;
                        end));
                        if not v45:_delay(0.5) then
                            return false;
                        else
                            for _, v82 in v45.lavaParticles do
                                v82.Enabled = true;
                            end;
                            v13:Shake("MiddleAgesFireBurst", {
                                originalPivot = l_CurrentCamera_0.CFrame
                            });
                            v63 = v16:PlaySound({
                                name = "Cutscenes.MiddleAges.FireBurst", 
                                soundGroup = "Master.SFX.VFX"
                            });
                            v45.dumpster:Add(v63);
                            if not v45:_waitForShakeStop() then
                                return false;
                            else
                                local v83 = v45:_rumble();
                                for _, v85 in v45.rumbleParticles[2] do
                                    v85.Enabled = true;
                                end;
                                for v86, v87 in v45.towers[2] do
                                    local v88 = v45.towerOrigins[2][v86] + Vector3.new(0, 75, 0, 0);
                                    v45.dumpster:Add(v11("CFrameValue", v45.towerOrigins[2][v86], TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                        Value = v88
                                    }, function(v89) --[[ Line: 452 ]]
                                        -- upvalues: v87 (copy)
                                        v87:PivotTo(v89);
                                    end));
                                end;
                                v45.dumpster:Add(v11("CFrameValue", v45.cloudsOrigin, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                                    Value = v45.cloudsOrigin * CFrame.new(0, 0, -150)
                                }, function(v90) --[[ Line: 467 ]]
                                    -- upvalues: v45 (copy)
                                    v45.clouds:PivotTo(v90);
                                end));
                                if not v45:_delay(2) then
                                    return false;
                                else
                                    for _, v92 in v45.lavaParticles do
                                        v92.Enabled = false;
                                    end;
                                    for _, v94 in v45.rumbleParticles[2] do
                                        v94.Enabled = false;
                                    end;
                                    v16:StopSound(v83, {
                                        fadeOut = true, 
                                        fadeTime = 1
                                    });
                                    if not v45:_stopShake() then
                                        return false;
                                    else
                                        for _, v96 in v45.pathBeams[5] do
                                            v96.Enabled = true;
                                        end;
                                        for _, v98 in v45.pathBeams[6] do
                                            v98.Enabled = true;
                                        end;
                                        v15:Toggle("SkipCutscene", false);
                                        if not v45:_delay(1) then
                                            return false;
                                        else
                                            v63 = l_TweenService_0:Create(l_CurrentCamera_0, v12, {
                                                CFrame = l_CFrame_0, 
                                                FieldOfView = l_FieldOfView_0
                                            });
                                            v45:_addTweenToDumpster(v63);
                                            v63:Play();
                                            v14:ToggleHideAll(false);
                                            if not v45:_delay(v12.Time) then
                                                return false;
                                            else
                                                v45:_cleanup(true);
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
v21.Skip = function(v99) --[[ Line: 530 ]] --[[ Name: Skip ]]
    -- upvalues: v13 (copy)
    v99.dumpster:Destroy();
    v13:Stop(true);
    for _, v101 in v99.rumbleParticles do
        for _, v103 in v101 do
            v103.Enabled = false;
            v103:Clear();
        end;
    end;
    for _, v105 in v99.lavaParticles do
        v105.Enabled = false;
        v105:Clear();
    end;
    for _, v107 in v99.bridgeParticles do
        v107.Enabled = false;
        v107:Clear();
    end;
    v99.towers[1][1]:PivotTo(v99.towerOrigins[1][1] - Vector3.new(0, v99.towerSizes[1][1].Y + 1, 0));
    v99.towers[1][2]:PivotTo(v99.towerOrigins[1][2] - Vector3.new(0, v99.towerSizes[1][2].Y + 1, 0));
    v99.towers[2][1]:PivotTo(v99.towerOrigins[2][1] + Vector3.new(0, 75, 0, 0));
    v99.towers[2][2]:PivotTo(v99.towerOrigins[2][2] + Vector3.new(0, 75, 0, 0));
    v99.pathVisuals[5]:PivotTo(v99.pathOrigins[5] + Vector3.new(0, 50, 0, 0));
    v99.pathVisuals[6]:PivotTo(v99.pathOrigins[6] + Vector3.new(0, 50, 0, 0));
    v99.bridge:PivotTo(v99.bridgeOrigin - Vector3.new(0, 11, 0, 0));
    v99.clouds:PivotTo(v99.cloudsOrigin * CFrame.new(0, 0, -150));
    v99.pathVisuals[2]:Destroy();
    v99.pathVisuals[3]:Destroy();
    for _, v109 in v99.pathBeams[5] do
        v109.Enabled = true;
    end;
    for _, v111 in v99.pathBeams[6] do
        v111.Enabled = true;
    end;
    v99:_cleanup();
end;
v21._cleanup = function(v112, v113) --[[ Line: 577 ]] --[[ Name: _cleanup ]]
    -- upvalues: v14 (copy)
    if not v113 then
        v14:ToggleHideAll(false);
    end;
    v112.dumpster:Destroy();
    table.clear(v112);
    setmetatable(v112, nil);
end;
v21._sting = function(v114, v115) --[[ Line: 587 ]] --[[ Name: _sting ]]
    -- upvalues: v6 (copy), v19 (ref)
    v115 = v115 or {};
    local v116 = nil;
    local v119 = v6.new(function(v117) --[[ Line: 598 ]]
        -- upvalues: v116 (ref), v6 (ref), v19 (ref), v115 (ref)
        v116 = v6.new(function(v118) --[[ Line: 599 ]]
            -- upvalues: v19 (ref), v115 (ref), v117 (copy)
            v19:Transition({
                config = {
                    tweenInInfo = v115.tweenInInfo, 
                    holdTime = v115.holdTime
                }, 
                callbacks = {
                    hold = v118, 
                    tweenOut = not v115.startWhenFinished and v117, 
                    finished = v115.startWhenFinished and v117
                }
            });
        end);
    end);
    v114.dumpster:Add(v116);
    v114.dumpster:Add(v119);
    return v116, v119;
end;
v21._delay = function(v120, v121) --[[ Line: 620 ]] --[[ Name: _delay ]]
    -- upvalues: v6 (copy)
    local v122 = v6.delay(v121);
    v120.dumpster:Add(v122);
    return v122:await();
end;
v21._addTweenToDumpster = function(v123, v124) --[[ Line: 627 ]] --[[ Name: _addTweenToDumpster ]]
    v123.dumpster:Add(function() --[[ Line: 628 ]]
        -- upvalues: v124 (copy)
        v124:Cancel();
        v124:Destroy();
    end);
end;
v21._rumble = function(v125) --[[ Line: 634 ]] --[[ Name: _rumble ]]
    -- upvalues: v16 (copy), v13 (copy)
    local v126 = v16:PlaySound({
        name = "Cutscenes.Rumble", 
        soundGroup = "Master.SFX.VFX", 
        extraData = {
            fadeIn = true, 
            fadeTime = 0.65
        }
    });
    v125.dumpster:Add(v126);
    v13:Shake("SustainLight");
    return v126;
end;
v21._stopShake = function(v127) --[[ Line: 651 ]] --[[ Name: _stopShake ]]
    -- upvalues: v13 (copy)
    v13:Stop();
    return v127:_waitForShakeStop();
end;
v21._waitForShakeStop = function(v128) --[[ Line: 657 ]] --[[ Name: _waitForShakeStop ]]
    -- upvalues: v6 (copy), v13 (copy)
    local v130 = v6.new(function(v129) --[[ Line: 658 ]]
        -- upvalues: v13 (ref)
        v13:BindToEnd(v129);
    end);
    v128.dumpster:Add(v130);
    return v130:await();
end;
v4.OnStart():andThen(function() --[[ Line: 667 ]]
    -- upvalues: v9 (copy), v19 (ref), v15 (copy), v20 (ref)
    if not v9:IsGame() then
        return;
    else
        v19 = v15:GetModuleAsync("Sting"):expect();
        v20 = v20 or v15:GetModuleAsync("SkipCutscene"):expect();
        return;
    end;
end);
return v21;