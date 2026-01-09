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
local _ = function(v22, v23) --[[ Line: 66 ]] --[[ Name: toggleEmitters ]]
    for _, v25 in v22 do
        v25.Enabled = v23;
    end;
end;
v21.new = function(v27, v28) --[[ Line: 73 ]] --[[ Name: new ]]
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
                [1] = l_BuildOffLimits_0["1"], 
                [4] = l_BuildOffLimits_0["4"]
            };
            v29.pathOrigins = {
                [1] = v29.pathVisuals[1]:GetPivot(), 
                [4] = v29.pathVisuals[4]:GetPivot()
            };
            v29.pathBeams = {
                {}, 
                {}
            };
            for _, v33 in l_BuildOffLimits_0[1]:GetDescendants() do
                if v33:IsA("Beam") then
                    table.insert(v29.pathBeams[1], v33);
                end;
            end;
            for _, v35 in l_BuildOffLimits_0[4]:GetDescendants() do
                if v35:IsA("Beam") then
                    table.insert(v29.pathBeams[2], v35);
                    v35.Enabled = false;
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
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Rumble1, "ParticleEmitter", function(v40) --[[ Line: 143 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.rumbleParticles[1], v40);
                        v40.Enabled = false;
                    end);
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Rumble2, "ParticleEmitter", function(v41) --[[ Line: 148 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.rumbleParticles[2], v41);
                        v41.Enabled = false;
                    end);
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Lava, "ParticleEmitter", function(v42) --[[ Line: 153 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.lavaParticles, v42);
                        v42.Enabled = false;
                    end);
                    v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.Bridge, "ParticleEmitter", function(v43) --[[ Line: 158 ]]
                        -- upvalues: v29 (copy)
                        table.insert(v29.bridgeParticles, v43);
                        v43.Enabled = false;
                    end);
                    local l_RaiseElements_0 = l_l_PathCutscenes_0_FirstChild_0.RaiseElements;
                    v29.towers = {
                        l_RaiseElements_0.Tower1, 
                        l_RaiseElements_0.Tower2
                    };
                    v29.towerOrigins = {
                        v29.towers[1]:GetPivot(), 
                        v29.towers[2]:GetPivot()
                    };
                    v29.towerSizes = {
                        v29.towers[1]:GetExtentsSize(), 
                        v29.towers[2]:GetExtentsSize()
                    };
                    return v29;
                end;
            end;
        end;
    end;
end;
v21.Play = function(v45) --[[ Line: 184 ]] --[[ Name: Play ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy), v18 (copy), v14 (copy), v20 (ref), l_TweenService_0 (copy), v10 (copy), v11 (copy), v13 (copy), v12 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v47 = v15:ToggleAll({
        "SkipCutscene"
    }, false);
    v16:FadeMusicVolume(0.25, 1);
    v17:StopTowerPlacement();
    v18:TogglePlayerControls(false);
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v45.dumpster:Add(function() --[[ Line: 195 ]]
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
    for _, v56 in v45.pathBeams[1] do
        v56.Enabled = false;
    end;
    if v51 and not v51:await() then
        return false;
    else
        v20:Open(script.Name, v45.timestamp);
        local v57 = nil;
        local v58 = v45.povs[1] * CFrame.new(0, 0, 8);
        local v59 = TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        v57 = l_TweenService_0:Create(l_CurrentCamera_0, v59, {
            CFrame = v58
        });
        v45:_addTweenToDumpster(v57);
        v57:Play();
        if not v45:_delay(1) then
            return;
        else
            v57:Cancel();
            for _, v61 in v45.rumbleParticles[1] do
                v61.Enabled = true;
            end;
            v58 = v45:_rumble();
            v10:IterateClass(v45.towers[1].Base, "SpotLight", function(v62) --[[ Line: 254 ]]
                v62.Enabled = false;
            end);
            v59 = v45.towerOrigins[1] - Vector3.new(0, v45.towerSizes[1].Y + 1, 0);
            v45.dumpster:Add(v11("CFrameValue", v45.towerOrigins[1], TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Value = v59
            }, function(v63) --[[ Line: 269 ]]
                -- upvalues: v45 (copy)
                v45.towers[1]:PivotTo(v63);
            end));
            local v64 = CFrame.lookAt((l_CurrentCamera_0.CFrame * CFrame.new(0, 0, 8)).Position, v45.towerOrigins[1].Position);
            v45.dumpster:Add(v11("CFrameValue", l_CurrentCamera_0.CFrame, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Value = v64
            }, function(v65) --[[ Line: 289 ]]
                -- upvalues: v13 (ref)
                v13:SetOriginalPivot(v65);
            end));
            v45.dumpster:Add(v11("CFrameValue", v45.pathOrigins[1], TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Value = v45.pathOrigins[1] - Vector3.new(0, 0.44999998807907104, 0, 0)
            }, function(v66) --[[ Line: 305 ]]
                -- upvalues: v45 (copy)
                v45.pathVisuals[1]:PivotTo(v66);
            end));
            v45.pathVisuals[4]:PivotTo(v45.pathOrigins[4] + Vector3.new(0, 50, 0, 0));
            if not v45:_delay(2) then
                return false;
            else
                for _, v68 in v45.rumbleParticles[1] do
                    v68.Enabled = false;
                end;
                v16:StopSound(v58, {
                    fadeOut = true, 
                    fadeTime = 1
                });
                if not v45:_stopShake() then
                    return false;
                elseif not v45:_delay(0.5) then
                    return false;
                else
                    v58, v59 = v45:_sting({
                        startWhenFinished = true, 
                        holdTime = 1
                    });
                    v50 = v58;
                    v51 = v59;
                    if not v50:await() then
                        return false;
                    else
                        l_CurrentCamera_0.CFrame = v45.povs[2];
                        v58 = v11("CFrameValue", l_CurrentCamera_0.CFrame, TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            Value = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -10)
                        }, function(v69) --[[ Line: 356 ]]
                            -- upvalues: v13 (ref), l_CurrentCamera_0 (copy)
                            v13:SetOriginalPivot(v69);
                            if not v13:IsShaking() then
                                l_CurrentCamera_0.CFrame = v69;
                            end;
                        end);
                        v45.dumpster:Add(v58);
                        if not v51:await() then
                            return false;
                        else
                            v59 = v16:PlaySound({
                                name = "Cutscenes.MiddleAges.BridgeFire", 
                                soundGroup = "Master.SFX.VFX"
                            });
                            v45.dumpster:Add(v59);
                            v64 = v16:PlaySound({
                                name = "Cutscenes.MiddleAges.FireLoop", 
                                soundGroup = "Master.SFX.VFX", 
                                adornee = v45.bridge.VFX, 
                                extraData = {
                                    fadeIn = true, 
                                    fadeTime = 0.5
                                }
                            });
                            v45.dumpster:Add(v64);
                            for _, v71 in v45.bridgeParticles do
                                v71.Enabled = true;
                            end;
                            v13:Shake("MiddleAgesBridgeFire", {
                                originalPivot = l_CurrentCamera_0.CFrame
                            });
                            if not v45:_delay(0.5) then
                                return false;
                            else
                                v45.dumpster:Add(v11("CFrameValue", v45.bridgeOrigin, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                                    Value = v45.bridgeOrigin - Vector3.new(0, 11, 0, 0)
                                }, function(v72) --[[ Line: 408 ]]
                                    -- upvalues: v45 (copy)
                                    v45.bridge:PivotTo(v72);
                                end));
                                if not v45:_delay(1.5) then
                                    return false;
                                else
                                    for _, v74 in v45.bridgeParticles do
                                        v74.Enabled = false;
                                    end;
                                    v16:StopSound(v64, {
                                        fadeOut = true, 
                                        fadeTime = 1
                                    });
                                    if not v45:_delay(0.5) then
                                        return false;
                                    else
                                        v58:Destroy();
                                        l_CurrentCamera_0.CFrame = v45.povs[3] * CFrame.new(0, 0, -10);
                                        if not v45:_delay(1) then
                                            return false;
                                        else
                                            v45.dumpster:Add(v11("CFrameValue", l_CurrentCamera_0.CFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                                                Value = v45.povs[3]
                                            }, function(v75) --[[ Line: 444 ]]
                                                -- upvalues: v13 (ref), l_CurrentCamera_0 (copy)
                                                v13:SetOriginalPivot(v75);
                                                if not v13:IsShaking() then
                                                    l_CurrentCamera_0.CFrame = v75;
                                                end;
                                            end));
                                            if not v45:_delay(0.2) then
                                                return false;
                                            else
                                                for _, v77 in v45.lavaParticles do
                                                    v77.Enabled = true;
                                                end;
                                                v13:Shake("MiddleAgesFireBurst", {
                                                    originalPivot = l_CurrentCamera_0.CFrame
                                                });
                                                local v78 = v16:PlaySound({
                                                    name = "Cutscenes.MiddleAges.FireBurst", 
                                                    soundGroup = "Master.SFX.VFX"
                                                });
                                                v45.dumpster:Add(v78);
                                                if not v45:_waitForShakeStop() then
                                                    return false;
                                                else
                                                    local v79 = v45:_rumble();
                                                    for _, v81 in v45.rumbleParticles[2] do
                                                        v81.Enabled = true;
                                                    end;
                                                    local v82 = v45.towerOrigins[2] + Vector3.new(0, 85, 0, 0);
                                                    v45.dumpster:Add(v11("CFrameValue", v45.towerOrigins[2], TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                                        Value = v82
                                                    }, function(v83) --[[ Line: 487 ]]
                                                        -- upvalues: v45 (copy)
                                                        v45.towers[2]:PivotTo(v83);
                                                    end));
                                                    local v84 = CFrame.lookAt((l_CurrentCamera_0.CFrame * CFrame.new(0, 0, 60)).Position, v82.Position + Vector3.new(0, v45.towerSizes[2].Y / 2.25));
                                                    v45.dumpster:Add(v11("CFrameValue", v45.povs[3], TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                                                        Value = v84
                                                    }, function(v85) --[[ Line: 507 ]]
                                                        -- upvalues: v13 (ref)
                                                        v13:SetOriginalPivot(v85);
                                                    end));
                                                    if not v45:_delay(2) then
                                                        return false;
                                                    else
                                                        for _, v87 in v45.lavaParticles do
                                                            v87.Enabled = false;
                                                        end;
                                                        for _, v89 in v45.rumbleParticles[2] do
                                                            v89.Enabled = false;
                                                        end;
                                                        v16:StopSound(v79, {
                                                            fadeOut = true, 
                                                            fadeTime = 1
                                                        });
                                                        if not v45:_stopShake() then
                                                            return false;
                                                        else
                                                            for _, v91 in v45.pathBeams[2] do
                                                                v91.Enabled = true;
                                                            end;
                                                            v15:Toggle("SkipCutscene", false);
                                                            if not v45:_delay(1) then
                                                                return false;
                                                            else
                                                                v58 = l_TweenService_0:Create(l_CurrentCamera_0, v12, {
                                                                    CFrame = l_CFrame_0, 
                                                                    FieldOfView = l_FieldOfView_0
                                                                });
                                                                v45:_addTweenToDumpster(v58);
                                                                v58:Play();
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
                end;
            end;
        end;
    end;
end;
v21.Skip = function(v92) --[[ Line: 567 ]] --[[ Name: Skip ]]
    -- upvalues: v13 (copy), v10 (copy)
    v92.dumpster:Destroy();
    v13:Stop(true);
    v10:IterateClass(v92.towers[1].Base, "SpotLight", function(v93) --[[ Line: 572 ]]
        v93.Enabled = false;
    end);
    for _, v95 in v92.rumbleParticles do
        for _, v97 in v95 do
            v97.Enabled = false;
            v97:Clear();
        end;
    end;
    for _, v99 in v92.lavaParticles do
        v99.Enabled = false;
        v99:Clear();
    end;
    for _, v101 in v92.bridgeParticles do
        v101.Enabled = false;
        v101:Clear();
    end;
    v92.towers[1]:PivotTo(v92.towerOrigins[1] - Vector3.new(0, v92.towerSizes[1].Y + 1, 0));
    v92.towers[2]:PivotTo(v92.towerOrigins[2] + Vector3.new(0, 85, 0, 0));
    v92.pathVisuals[4]:PivotTo(v92.pathOrigins[4] + Vector3.new(0, 50, 0, 0));
    v92.bridge:PivotTo(v92.bridgeOrigin - Vector3.new(0, 11, 0, 0));
    v92.pathVisuals[1]:Destroy();
    for _, v103 in v92.pathBeams[2] do
        v103.Enabled = true;
    end;
    v92:_cleanup();
end;
v21._cleanup = function(v104, v105) --[[ Line: 609 ]] --[[ Name: _cleanup ]]
    -- upvalues: v14 (copy)
    if not v105 then
        v14:ToggleHideAll(false);
    end;
    v104.dumpster:Destroy();
    table.clear(v104);
    setmetatable(v104, nil);
end;
v21._sting = function(v106, v107) --[[ Line: 619 ]] --[[ Name: _sting ]]
    -- upvalues: v6 (copy), v19 (ref)
    v107 = v107 or {};
    local v108 = nil;
    local v111 = v6.new(function(v109) --[[ Line: 630 ]]
        -- upvalues: v108 (ref), v6 (ref), v19 (ref), v107 (ref)
        v108 = v6.new(function(v110) --[[ Line: 631 ]]
            -- upvalues: v19 (ref), v107 (ref), v109 (copy)
            v19:Transition({
                config = {
                    tweenInInfo = v107.tweenInInfo, 
                    holdTime = v107.holdTime
                }, 
                callbacks = {
                    hold = v110, 
                    tweenOut = not v107.startWhenFinished and v109, 
                    finished = v107.startWhenFinished and v109
                }
            });
        end);
    end);
    v106.dumpster:Add(v108);
    v106.dumpster:Add(v111);
    return v108, v111;
end;
v21._delay = function(v112, v113) --[[ Line: 652 ]] --[[ Name: _delay ]]
    -- upvalues: v6 (copy)
    local v114 = v6.delay(v113);
    v112.dumpster:Add(v114);
    return v114:await();
end;
v21._addTweenToDumpster = function(v115, v116) --[[ Line: 659 ]] --[[ Name: _addTweenToDumpster ]]
    v115.dumpster:Add(function() --[[ Line: 660 ]]
        -- upvalues: v116 (copy)
        v116:Cancel();
        v116:Destroy();
    end);
end;
v21._rumble = function(v117) --[[ Line: 666 ]] --[[ Name: _rumble ]]
    -- upvalues: v16 (copy), v13 (copy)
    local v118 = v16:PlaySound({
        name = "Cutscenes.Rumble", 
        soundGroup = "Master.SFX.VFX", 
        extraData = {
            fadeIn = true, 
            fadeTime = 0.65
        }
    });
    v117.dumpster:Add(v118);
    v13:Shake("Sustain");
    return v118;
end;
v21._stopShake = function(v119) --[[ Line: 683 ]] --[[ Name: _stopShake ]]
    -- upvalues: v13 (copy)
    v13:Stop();
    return v119:_waitForShakeStop();
end;
v21._waitForShakeStop = function(v120) --[[ Line: 689 ]] --[[ Name: _waitForShakeStop ]]
    -- upvalues: v6 (copy), v13 (copy)
    local v122 = v6.new(function(v121) --[[ Line: 690 ]]
        -- upvalues: v13 (ref)
        v13:BindToEnd(v121);
    end);
    v120.dumpster:Add(v122);
    return v122:await();
end;
v4.OnStart():andThen(function() --[[ Line: 699 ]]
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