local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedFirst_0.PlaceIds);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v12 = Random.new(game.GameId);
local v13 = {
    "Enemies.AtomicFlounder.Walk", 
    "Enemies.DirtyBubbleLarge.Walk", 
    "Enemies.DirtyBubbleMedium.Walk", 
    "Enemies.DirtyBubbleSmall.Walk", 
    "Enemies.ManRay.Walk"
};
local v14 = v4.GetController("CamShakeController");
local v15 = v4.GetController("CharacterController");
local v16 = v4.GetController("UIController");
local v17 = v4.GetController("AudioController");
local v18 = v4.GetController("TowerController");
local v19 = nil;
local v20 = nil;
local l_Animations_0 = l_ReplicatedStorage_0:FindFirstChild("Animations");
local l_Mermalair_0 = l_ReplicatedStorage_0.Objects.Cutscene.Mermalair;
local v23 = false;
local v24 = {};
v24.__index = v24;
local _ = function(v25, v26) --[[ Line: 75 ]] --[[ Name: toggleEmitters ]]
    for _, v28 in v25 do
        v28.Enabled = v26;
    end;
end;
v24.new = function(v30, v31) --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v24 (copy), v9 (copy)
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
                l_PathCutscenes_0 = l_PathCutscenes_0 and l_PathCutscenes_0:FindFirstChild(v31);
                if not l_PathCutscenes_0 then
                    return;
                else
                    v32.dependencies = l_PathCutscenes_0;
                    v32.pov = l_PathCutscenes_0.POV.CFrame;
                    v32.enemyCapsule = l_PathCutscenes_0.EnemyCapsule;
                    v32.obstacles = l_PathCutscenes_0.Obstacles:GetChildren();
                    for _, v39 in v32.obstacles do
                        v39:SetAttribute("OriginalPivot", v39.CFrame);
                    end;
                    v32.groundParticles = {};
                    for _, v41 in l_PathCutscenes_0.GroundParticles:GetChildren() do
                        table.insert(v32.groundParticles, v41);
                        v41.Enabled = false;
                    end;
                    v32.explosionParticles = {};
                    v9:IterateClass(l_PathCutscenes_0.Explosion, "ParticleEmitter", function(v42) --[[ Line: 141 ]]
                        -- upvalues: v32 (copy), v9 (ref)
                        table.insert(v32.explosionParticles, v42);
                        v9:ScaleEmitterSize(v42, 0.85);
                        v42.Enabled = false;
                    end);
                    return v32;
                end;
            end;
        end;
    end;
end;
v24.Play = function(v43) --[[ Line: 151 ]] --[[ Name: Play ]]
    -- upvalues: v16 (copy), v17 (copy), v18 (copy), v23 (ref), v13 (copy), v11 (copy), l_Animations_0 (copy), l_ContentProvider_0 (copy), v15 (copy), v20 (ref), v14 (copy), v12 (copy), l_TweenService_0 (copy), v6 (copy), v10 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v45 = v16:ToggleAll({
        "SkipCutscene"
    }, false);
    v17:FadeMusicVolume(0, 1);
    v18:StopTowerPlacement();
    if not v23 then
        local v46 = {};
        for _, v48 in v13 do
            local v49 = v11(l_Animations_0, v48);
            if v49 then
                table.insert(v46, v49);
            end;
        end;
        task.spawn(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, v46);
        v23 = true;
    end;
    v43.dumpster:Add(function() --[[ Line: 173 ]]
        -- upvalues: v15 (ref), v16 (ref), v45 (copy), v17 (ref), l_CurrentCamera_0 (copy)
        v15:ToggleHideAll(false);
        v16:RevertFromToggleAll(v45);
        v17:FadeMusicVolume(1, 0.5);
        v16:Toggle("SkipCutscene", false);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
    end);
    local v50 = v43.timestamp - workspace:GetServerTimeNow();
    local v51 = nil;
    local v52 = nil;
    if v50 > 0 then
        local v53, v54 = v43:_sting({
            holdTime = math.max(0, v50 - 0.2)
        });
        v51 = v53;
        v52 = v54;
        if not v51:await() then
            return false;
        end;
    end;
    v15:ToggleHideAll(true);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v43.pov;
    if v52 and not v52:await() then
        return false;
    else
        v20:Open(script.Name, v43.timestamp);
        local v55 = v17:PlaySound({
            name = "Cutscenes.Rumble", 
            soundGroup = "Master.SFX.VFX", 
            extraData = {
                fadeIn = true, 
                fadeTime = 0.65
            }
        });
        v43.dumpster:Add(v55);
        v14:Shake("Sustain", {
            originalPivot = v43.pov
        });
        for _, v57 in v43.groundParticles do
            v57.Enabled = true;
        end;
        if not v43:_delay(0.5) then
            return false;
        else
            for _, v59 in v43.obstacles do
                local v60 = 3 * v12:NextNumber(0.75, 1);
                local l_Size_0 = v59.Size;
                local v62 = v59.CFrame - Vector3.new(0, l_Size_0.Y, 0);
                local v63 = l_TweenService_0:Create(v59, TweenInfo.new(v60, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    CFrame = v62
                });
                v43:_addTweenToDumpster(v63);
                v63:Play();
            end;
            if not v43:_delay(3) then
                return false;
            else
                v17:StopSound(v55, {
                    fadeOut = true, 
                    fadeTime = 1
                });
                local v65 = v6.new(function(v64) --[[ Line: 254 ]]
                    -- upvalues: v14 (ref)
                    v14:BindToEnd(v64);
                end);
                v43.dumpster:Add(v65);
                v14:Stop();
                for _, v67 in v43.groundParticles do
                    v67.Enabled = false;
                end;
                if not v65:await() then
                    return false;
                else
                    local v68, v69 = v43:_sting({
                        startWhenFinished = true, 
                        holdTime = 0.5
                    });
                    v51 = v68;
                    v52 = v69;
                    if not v51:await() then
                        return false;
                    else
                        v68 = v43.enemyCapsule:GetPivot() * CFrame.new(0, 0, -20) * CFrame.Angles(0.08726646259971647, 3.141592653589793, 0);
                        l_CurrentCamera_0.CFrame = v68;
                        if not v52:await() then
                            return false;
                        elseif not v43:_delay(1) then
                            return false;
                        else
                            v17:PlaySound({
                                name = "Cutscenes.CapsuleBreak", 
                                soundGroup = "Master.SFX.VFX"
                            });
                            v14:Shake("MermalairCapsuleShake", {
                                originalPivot = v68
                            });
                            v43:_swapEnemyCapsule();
                            for _, v71 in v43.pathBeams do
                                v71.Enabled = true;
                            end;
                            for _, v73 in v43.explosionParticles do
                                local l_v73_Attribute_0 = v73:GetAttribute("EmitCount");
                                local l_v73_Attribute_1 = v73:GetAttribute("EmitDuration");
                                if l_v73_Attribute_1 and l_v73_Attribute_1 > 0 then
                                    v73.Enabled = true;
                                    task.delay(l_v73_Attribute_1, function() --[[ Line: 310 ]]
                                        -- upvalues: v73 (copy)
                                        v73.Enabled = false;
                                    end);
                                else
                                    v73:Emit(l_v73_Attribute_0);
                                end;
                            end;
                            v43.dumpster:Add(v10("CFrameValue", v68, TweenInfo.new(2), {
                                Value = v68 * CFrame.new(0, 0, 15)
                            }, function(v76) --[[ Line: 325 ]]
                                -- upvalues: v14 (ref)
                                v14:SetOriginalPivot(v76);
                            end));
                            if not v43:_delay(1) then
                                return false;
                            else
                                v16:Toggle("SkipCutscene", false);
                                if not v43:_delay(1) then
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
v24.Skip = function(v77) --[[ Line: 345 ]] --[[ Name: Skip ]]
    -- upvalues: v14 (copy)
    v77.dumpster:Destroy();
    v14:Stop(true);
    for _, v79 in v77.obstacles do
        local l_Size_1 = v79.Size;
        v79.CFrame = v79:GetAttribute("OriginalPivot") - Vector3.new(0, l_Size_1.Y, 0);
    end;
    for _, v82 in v77.groundParticles do
        v82.Enabled = false;
        v82:Clear();
    end;
    for _, v84 in v77.explosionParticles do
        v84.Enabled = false;
        v84:Clear();
    end;
    v77:_swapEnemyCapsule();
    for _, v86 in v77.pathBeams do
        v86.Enabled = true;
    end;
    v77:_cleanup();
end;
v24._cleanup = function(v87) --[[ Line: 377 ]] --[[ Name: _cleanup ]]
    v87.dumpster:Destroy();
    table.clear(v87);
    setmetatable(v87, nil);
end;
v24._sting = function(v88, v89) --[[ Line: 383 ]] --[[ Name: _sting ]]
    -- upvalues: v6 (copy), v19 (ref)
    v89 = v89 or {};
    local v90 = nil;
    local v93 = v6.new(function(v91) --[[ Line: 394 ]]
        -- upvalues: v90 (ref), v6 (ref), v19 (ref), v89 (ref)
        v90 = v6.new(function(v92) --[[ Line: 395 ]]
            -- upvalues: v19 (ref), v89 (ref), v91 (copy)
            v19:Transition({
                config = {
                    tweenInInfo = v89.tweenInInfo, 
                    holdTime = v89.holdTime
                }, 
                callbacks = {
                    hold = v92, 
                    tweenOut = not v89.startWhenFinished and v91, 
                    finished = v89.startWhenFinished and v91
                }
            });
        end);
    end);
    v88.dumpster:Add(v90);
    v88.dumpster:Add(v93);
    return v90, v93;
end;
v24._delay = function(v94, v95) --[[ Line: 416 ]] --[[ Name: _delay ]]
    -- upvalues: v6 (copy)
    local v96 = v6.delay(v95);
    v94.dumpster:Add(v96);
    return v96:await();
end;
v24._swapEnemyCapsule = function(v97) --[[ Line: 423 ]] --[[ Name: _swapEnemyCapsule ]]
    -- upvalues: l_Mermalair_0 (copy)
    if not v97.enemyCapsule then
        return;
    else
        local v98 = l_Mermalair_0.EnemyCapsuleBroken:Clone();
        v98:PivotTo(v97.enemyCapsule:GetPivot());
        v97.enemyCapsule:Destroy();
        v97.enemyCapsule = nil;
        v98.Parent = v97.dependencies;
        return;
    end;
end;
v24._addTweenToDumpster = function(v99, v100) --[[ Line: 435 ]] --[[ Name: _addTweenToDumpster ]]
    v99.dumpster:Add(function() --[[ Line: 436 ]]
        -- upvalues: v100 (copy)
        v100:Cancel();
        v100:Destroy();
    end);
end;
v4.OnStart():andThen(function() --[[ Line: 442 ]]
    -- upvalues: v8 (copy), v19 (ref), v16 (copy), v20 (ref)
    if not v8:IsGame() then
        return;
    else
        v19 = v16:GetModuleAsync("Sting"):expect();
        v20 = v20 or v16:GetModuleAsync("SkipCutscene"):expect();
        return;
    end;
end);
return v24;