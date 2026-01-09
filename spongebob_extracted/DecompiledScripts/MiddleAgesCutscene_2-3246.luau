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
local v12 = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
local v13 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v14 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut);
local v15 = TweenInfo.new(2, Enum.EasingStyle.Sine);
local v16 = v4.GetController("CamShakeController");
local v17 = v4.GetController("CharacterController");
local v18 = v4.GetController("UIController");
local v19 = v4.GetController("AudioController");
local v20 = v4.GetController("TowerController");
local v21 = v4.GetController("DeviceTypeController");
local v22 = nil;
local v23 = nil;
local v24 = {};
v24.__index = v24;
local _ = function(v25, v26) --[[ Line: 68 ]] --[[ Name: toggleEmitters ]]
    for _, v28 in v25 do
        v28.Enabled = v26;
    end;
end;
v24.new = function(v30, v31) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v24 (copy), v10 (copy)
    if not v31 then
        return;
    else
        local v32 = setmetatable({
            timestamp = v30, 
            pathId = v31, 
            dumpster = v5.new()
        }, v24);
        local l_Map_0 = workspace:FindFirstChild("Map");
        if not l_Map_0 then
            return;
        else
            v32.map = l_Map_0;
            local l_BuildOffLimits_0 = l_Map_0.Zones.BuildOffLimits;
            l_BuildOffLimits_0 = l_BuildOffLimits_0 and l_BuildOffLimits_0:FindFirstChild(v31);
            if not l_BuildOffLimits_0 then
                return;
            else
                v32.pathBeams = {};
                for _, v36 in l_BuildOffLimits_0:GetDescendants() do
                    if v36:IsA("Beam") then
                        table.insert(v32.pathBeams, v36);
                    end;
                end;
                local l_PathCutscenes_0 = l_Map_0:FindFirstChild("PathCutscenes");
                if not l_PathCutscenes_0 then
                    return;
                else
                    v32.startPov = l_PathCutscenes_0.StartPOV1.CFrame;
                    local l_l_PathCutscenes_0_FirstChild_0 = l_PathCutscenes_0:FindFirstChild(v31);
                    if not l_l_PathCutscenes_0_FirstChild_0 then
                        return;
                    else
                        v32.dependencies = l_l_PathCutscenes_0_FirstChild_0;
                        v32.povs = {};
                        for _, v40 in l_l_PathCutscenes_0_FirstChild_0.POV:GetChildren() do
                            v32.povs[tonumber(v40.Name)] = v40.CFrame;
                        end;
                        v32.obstacles = l_l_PathCutscenes_0_FirstChild_0.Obstacles;
                        v32.obstaclesSize = v32.obstacles:GetExtentsSize();
                        v32.obstaclesOrigin = v32.obstacles:GetPivot();
                        v32.groundParticles = {};
                        v32.rumbleParticles = {};
                        v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Ground, "ParticleEmitter", function(v41) --[[ Line: 135 ]]
                            -- upvalues: v32 (copy)
                            table.insert(v32.groundParticles, v41);
                            v41.Enabled = false;
                        end);
                        v10:IterateClass(l_l_PathCutscenes_0_FirstChild_0.VFX.Rumble, "ParticleEmitter", function(v42) --[[ Line: 140 ]]
                            -- upvalues: v32 (copy)
                            table.insert(v32.rumbleParticles, v42);
                            v42.Enabled = false;
                        end);
                        v32.tower = l_l_PathCutscenes_0_FirstChild_0.RaiseElements.Tower;
                        v32.towerOrigin = v32.tower:GetPivot();
                        v32.towerSize = v32.tower:GetExtentsSize();
                        return v32;
                    end;
                end;
            end;
        end;
    end;
end;
v24.Play = function(v43) --[[ Line: 154 ]] --[[ Name: Play ]]
    -- upvalues: v18 (copy), v19 (copy), v20 (copy), v21 (copy), v17 (copy), v23 (ref), l_TweenService_0 (copy), v11 (copy), v13 (copy), v16 (copy), v12 (copy), v15 (copy), v14 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v45 = v18:ToggleAll({
        "SkipCutscene"
    }, false);
    v19:FadeMusicVolume(0.25, 1);
    v20:StopTowerPlacement();
    v21:TogglePlayerControls(false);
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v43.dumpster:Add(function() --[[ Line: 165 ]]
        -- upvalues: v21 (ref), v18 (ref), v45 (copy), v19 (ref), l_CurrentCamera_0 (copy), l_FieldOfView_0 (copy)
        v21:TogglePlayerControls(true);
        v18:RevertFromToggleAll(v45);
        v19:FadeMusicVolume(1, 0.5);
        v18:Toggle("SkipCutscene", false);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_CurrentCamera_0.FieldOfView = l_FieldOfView_0;
    end);
    local v47 = v43.timestamp - workspace:GetServerTimeNow();
    local v48 = nil;
    local v49 = nil;
    if v47 > 0 then
        local v50, v51 = v43:_sting({
            holdTime = math.max(0, v47 - 0.2)
        });
        v48 = v50;
        v49 = v51;
        if not v48:await() then
            return false;
        end;
    end;
    v17:ToggleHideAll(true);
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v43.startPov;
    l_CurrentCamera_0.FieldOfView = 60;
    if v49 and not v49:await() then
        return false;
    else
        v23:Open(script.Name, v43.timestamp);
        local v53 = nil;
        local v54 = v43.startPov * CFrame.new(0, 0, 5);
        local v55 = TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        v53 = l_TweenService_0:Create(l_CurrentCamera_0, v55, {
            CFrame = v54
        });
        v43:_addTweenToDumpster(v53);
        v53:Play();
        if not v43:_delay(2) then
            return;
        else
            for _, v57 in v43.groundParticles do
                v57.Enabled = true;
            end;
            v54 = v43:_rumble();
            v53:Cancel();
            v55 = v11("CFrameValue", l_CurrentCamera_0.CFrame, v13, {
                Value = v43.povs[1]
            }, function(v58) --[[ Line: 224 ]]
                -- upvalues: v16 (ref)
                v16:SetOriginalPivot(v58);
            end);
            v43.dumpster:Add(v55);
            local v59 = v43.obstaclesOrigin - Vector3.new(0, v43.obstaclesSize.Y + 2, 0);
            v43.dumpster:Add(v11("CFrameValue", v43.obstaclesOrigin, v12, {
                Value = v59
            }, function(v60) --[[ Line: 239 ]]
                -- upvalues: v43 (copy)
                v43.obstacles:PivotTo(v60);
            end));
            if not v43:_delay(v12.Time) then
                return false;
            else
                v19:StopSound(v54, {
                    fadeOut = true, 
                    fadeTime = 1
                });
                for _, v62 in v43.groundParticles do
                    v62.Enabled = false;
                end;
                if not v43:_stopShake() then
                    return false;
                elseif not v43:_delay(1.5) then
                    return false;
                else
                    local v63;
                    v59, v63 = v43:_sting({
                        startWhenFinished = true, 
                        holdTime = 1
                    });
                    v48 = v59;
                    v49 = v63;
                    if not v48:await() then
                        return false;
                    else
                        if v55 then
                            v55:Destroy();
                        end;
                        l_CurrentCamera_0.CFrame = v43.povs[2];
                        if not v43:_delay(1) then
                            return;
                        else
                            for _, v65 in v43.rumbleParticles do
                                v65.Enabled = true;
                            end;
                            v54 = v43:_rumble();
                            v59 = v43.towerOrigin + Vector3.new(0, v43.towerSize.Y + 1, 0);
                            v43.dumpster:Add(v11("CFrameValue", v43.towerOrigin, v15, {
                                Value = v59
                            }, function(v66) --[[ Line: 293 ]]
                                -- upvalues: v43 (copy)
                                v43.tower:PivotTo(v66);
                            end));
                            v63 = CFrame.lookAt((l_CurrentCamera_0.CFrame * CFrame.new(0, 0, 30)).Position, v59.Position + Vector3.new(0, v43.towerSize.Y / 2.25));
                            v43.dumpster:Add(v11("CFrameValue", v43.povs[2], TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                                Value = v63
                            }, function(v67) --[[ Line: 313 ]]
                                -- upvalues: v16 (ref)
                                v16:SetOriginalPivot(v67);
                            end));
                            if not v43:_delay(v15.Time) then
                                return false;
                            else
                                for _, v69 in v43.rumbleParticles do
                                    v69.Enabled = false;
                                end;
                                v19:StopSound(v54, {
                                    fadeOut = true, 
                                    fadeTime = 1
                                });
                                if not v43:_stopShake() then
                                    return false;
                                else
                                    for _, v71 in v43.pathBeams do
                                        v71.Enabled = true;
                                    end;
                                    v18:Toggle("SkipCutscene", false);
                                    if not v43:_delay(1) then
                                        return false;
                                    else
                                        v63 = l_TweenService_0:Create(l_CurrentCamera_0, v14, {
                                            CFrame = l_CFrame_0, 
                                            FieldOfView = l_FieldOfView_0
                                        });
                                        v43:_addTweenToDumpster(v63);
                                        v63:Play();
                                        v17:ToggleHideAll(false);
                                        if not v43:_delay(v14.Time) then
                                            return false;
                                        else
                                            v43:_cleanup(true);
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
v24.Skip = function(v72) --[[ Line: 369 ]] --[[ Name: Skip ]]
    -- upvalues: v16 (copy)
    v72.dumpster:Destroy();
    v16:Stop(true);
    v72.obstacles:PivotTo(v72.obstaclesOrigin - Vector3.new(0, v72.obstaclesSize.Y + 2, 0));
    for _, v74 in v72.groundParticles do
        v74.Enabled = false;
        v74:Clear();
    end;
    for _, v76 in v72.rumbleParticles do
        v76.Enabled = false;
        v76:Clear();
    end;
    for _, v78 in v72.pathBeams do
        v78.Enabled = true;
    end;
    v72.tower:PivotTo(v72.towerOrigin + Vector3.new(0, v72.towerSize.Y + 1, 0));
    v72:_cleanup();
end;
v24._cleanup = function(v79, v80) --[[ Line: 397 ]] --[[ Name: _cleanup ]]
    -- upvalues: v17 (copy)
    if not v80 then
        v17:ToggleHideAll(false);
    end;
    v79.dumpster:Destroy();
    table.clear(v79);
    setmetatable(v79, nil);
end;
v24._sting = function(v81, v82) --[[ Line: 407 ]] --[[ Name: _sting ]]
    -- upvalues: v6 (copy), v22 (ref)
    v82 = v82 or {};
    local v83 = nil;
    local v86 = v6.new(function(v84) --[[ Line: 418 ]]
        -- upvalues: v83 (ref), v6 (ref), v22 (ref), v82 (ref)
        v83 = v6.new(function(v85) --[[ Line: 419 ]]
            -- upvalues: v22 (ref), v82 (ref), v84 (copy)
            v22:Transition({
                config = {
                    tweenInInfo = v82.tweenInInfo, 
                    holdTime = v82.holdTime
                }, 
                callbacks = {
                    hold = v85, 
                    tweenOut = not v82.startWhenFinished and v84, 
                    finished = v82.startWhenFinished and v84
                }
            });
        end);
    end);
    v81.dumpster:Add(v83);
    v81.dumpster:Add(v86);
    return v83, v86;
end;
v24._delay = function(v87, v88) --[[ Line: 440 ]] --[[ Name: _delay ]]
    -- upvalues: v6 (copy)
    local v89 = v6.delay(v88);
    v87.dumpster:Add(v89);
    return v89:await();
end;
v24._addTweenToDumpster = function(v90, v91) --[[ Line: 447 ]] --[[ Name: _addTweenToDumpster ]]
    v90.dumpster:Add(function() --[[ Line: 448 ]]
        -- upvalues: v91 (copy)
        v91:Cancel();
        v91:Destroy();
    end);
end;
v24._rumble = function(v92) --[[ Line: 454 ]] --[[ Name: _rumble ]]
    -- upvalues: v19 (copy), v16 (copy)
    local v93 = v19:PlaySound({
        name = "Cutscenes.Rumble", 
        soundGroup = "Master.SFX.VFX", 
        extraData = {
            fadeIn = true, 
            fadeTime = 0.65
        }
    });
    v92.dumpster:Add(v93);
    v16:Shake("Sustain");
    return v93;
end;
v24._stopShake = function(v94) --[[ Line: 471 ]] --[[ Name: _stopShake ]]
    -- upvalues: v6 (copy), v16 (copy)
    local v96 = v6.new(function(v95) --[[ Line: 472 ]]
        -- upvalues: v16 (ref)
        v16:BindToEnd(v95);
    end);
    v94.dumpster:Add(v96);
    v16:Stop();
    return v96:await();
end;
v4.OnStart():andThen(function() --[[ Line: 483 ]]
    -- upvalues: v9 (copy), v22 (ref), v18 (copy), v23 (ref)
    if not v9:IsGame() then
        return;
    else
        v22 = v18:GetModuleAsync("Sting"):expect();
        v23 = v23 or v18:GetModuleAsync("SkipCutscene"):expect();
        return;
    end;
end);
return v24;