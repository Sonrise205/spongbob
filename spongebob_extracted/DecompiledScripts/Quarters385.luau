local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local _ = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Util.CharacterUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.SharedAnimator);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v20 = {
    {
        speaker = "Fish Skeleton", 
        dialog = "That map is ours!"
    }, 
    {
        speaker = "Fish Skeleton", 
        dialog = "We will destroy all who stand in our way!"
    }, 
    {
        speaker = "The Flying Dutchman", 
        dialog = "We are being raided! Don't let them reach the map!"
    }
};
local _ = v7.GetController("CamShakeController");
local _ = v7.GetController("CharacterController");
local v23 = v7.GetController("UIController");
local v24 = v7.GetController("AudioController");
local v25 = v7.GetController("DeviceTypeController");
local v26 = v7.GetService("BarnacleService");
local v27 = nil;
local v28 = nil;
local v29 = {};
v29.__index = v29;
local _ = function(v30, v31) --[[ Line: 74 ]] --[[ Name: toggleEmitters ]]
    for _, v33 in v30 do
        v33.Enabled = v31;
    end;
end;
v29.new = function() --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v29 (copy), v12 (copy), l_ReplicatedStorage_0 (copy)
    local v35 = setmetatable({
        particles = {}, 
        dumpster = v8.new()
    }, v29);
    if not v12:IsTrading() then
        return;
    else
        if workspace:FindFirstChild("Cutscene_Edit") then
            workspace.Cutscene_Edit:Destroy();
        end;
        if workspace:FindFirstChild("QuartersCutscene") then
            workspace.QuartersCutscene:Destroy();
        end;
        local v36 = l_ReplicatedStorage_0.Cutscene:Clone();
        v36.Name = "QuartersCutscene";
        v36.Parent = workspace;
        v35.props = v36.Props;
        for _, v38 in v35.props.Particles:GetDescendants() do
            if v38:IsA("ParticleEmitter") then
                table.insert(v35.particles, v38);
            end;
        end;
        return v35;
    end;
end;
v29.Play = function(v39) --[[ Line: 115 ]] --[[ Name: Play ]]
    -- upvalues: v23 (copy), v24 (copy), v25 (copy), l_Lighting_0 (copy), v9 (copy), l_Players_0 (copy), v7 (copy), v18 (copy), l_RunService_0 (copy), v20 (copy), v28 (ref)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    v23:ToggleAll(nil, false);
    v24:FadeMusicVolume(0, 1);
    v25:TogglePlayerControls(false);
    local v41, v42, v43 = v39:_sting({
        config = {
            tweenInInfo = TweenInfo.new(1), 
            tweenOutInfo = TweenInfo.new(1)
        }
    });
    if not v41:await() then
        return false;
    else
        v23:Toggle("Cutscene", true);
        local v44 = os.clock();
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.FieldOfView = 35;
        local l_DepthOfFieldEffect_0 = l_Lighting_0:FindFirstChildOfClass("DepthOfFieldEffect");
        l_DepthOfFieldEffect_0.Enabled = true;
        l_DepthOfFieldEffect_0.FarIntensity = 0.432;
        l_DepthOfFieldEffect_0.FocusDistance = 20.28;
        l_DepthOfFieldEffect_0.InFocusRadius = 5.435;
        l_DepthOfFieldEffect_0.NearIntensity = 0.109;
        local l_CameraRig_0 = v39.props.CameraRig;
        local l_Head_0 = l_CameraRig_0.Head;
        l_CurrentCamera_0.CFrame = l_Head_0.CFrame;
        local v48 = nil;
        local v49 = nil;
        local v50, v51 = v9.retryWithDelay(function() --[[ Line: 156 ]]
            -- upvalues: v9 (ref), l_Players_0 (ref), v7 (ref)
            return v9.try(function() --[[ Line: 157 ]]
                -- upvalues: l_Players_0 (ref), v7 (ref)
                return l_Players_0:GetHumanoidDescriptionFromUserId(v7.Player.UserId);
            end);
        end, 10, 0.5):await();
        v49 = v50;
        v48 = v51;
        if not v49 then
            return false;
        else
            v49 = function(v52) --[[ Line: 167 ]] --[[ Name: applyDescription ]]
                -- upvalues: v48 (ref)
                local l_Humanoid_0 = v52:FindFirstChildOfClass("Humanoid");
                if not l_Humanoid_0 then
                    return;
                else
                    l_Humanoid_0:ApplyDescription(v48, Enum.AssetTypeVerification.ClientOnly);
                    return;
                end;
            end;
            v50 = {};
            v51 = function(v54, v55, v56) --[[ Line: 178 ]] --[[ Name: promisifyAnimation ]]
                -- upvalues: v9 (ref), v18 (ref), l_RunService_0 (ref), v39 (copy), v50 (copy)
                v56 = v56 or {};
                local v61 = v9.new(function(v57, v58) --[[ Line: 181 ]]
                    -- upvalues: v18 (ref), v54 (copy), v55 (copy), v56 (ref), l_RunService_0 (ref)
                    v18:PlayAnimation(v54, v55, {
                        manual = true
                    }, {
                        start = v56.start, 
                        loaded = function(v59) --[[ Line: 188 ]] --[[ Name: loaded ]]
                            -- upvalues: v57 (copy)
                            v57(v59);
                        end, 
                        failed = function() --[[ Line: 191 ]] --[[ Name: failed ]]
                            -- upvalues: v56 (ref), v58 (copy)
                            if v56.failed then
                                v56.failed();
                            end;
                            v58("Failed to play animation");
                        end, 
                        finished = function(v60) --[[ Line: 198 ]] --[[ Name: finished ]]
                            -- upvalues: v56 (ref), l_RunService_0 (ref)
                            if v56.finished then
                                v56.finished();
                            end;
                            l_RunService_0.RenderStepped:Wait();
                            v60:Play(0, 1, 0);
                            v60.TimePosition = v60.Length - 0.001;
                        end, 
                        markers = v56.markers
                    });
                end);
                v39.dumpster:Add(v61);
                table.insert(v50, v61);
                return v61;
            end;
            for _, v63 in v39.props:GetChildren() do
                if v63 ~= l_CameraRig_0 then
                    if v63:HasTag("ApplyDescription") then
                        local l_Humanoid_1 = v63:FindFirstChildOfClass("Humanoid");
                        if l_Humanoid_1 then
                            l_Humanoid_1:ApplyDescription(v48, Enum.AssetTypeVerification.ClientOnly);
                        end;
                    end;
                    local v65 = ("Cutscenes.Quarters.%*"):format(v63.Name);
                    if v18:GetInstanceFromPath(v65) then
                        local l_AnimationController_0 = v63:FindFirstChildOfClass("AnimationController");
                        if not l_AnimationController_0 then
                            l_AnimationController_0 = v63:FindFirstChildOfClass("Humanoid");
                            if not l_AnimationController_0 then
                                continue;
                            end;
                        end;
                        if not l_AnimationController_0:FindFirstChild("Animator") then
                            Instance.new("Animator").Parent = l_AnimationController_0;
                        end;
                        v51(v63, v65);
                    end;
                end;
            end;
            local v67 = nil;
            local v68 = 0;
            do
                local l_v68_0 = v68;
                v67 = v9.new(function(v70) --[[ Line: 252 ]]
                    -- upvalues: v51 (copy), l_CameraRig_0 (copy), l_CurrentCamera_0 (copy), l_Head_0 (copy), l_v68_0 (ref), v20 (ref), v28 (ref), v39 (copy), v41 (ref)
                    v51(l_CameraRig_0, "Cutscenes.Quarters.CameraRig", {
                        start = function() --[[ Line: 257 ]] --[[ Name: start ]]
                            -- upvalues: l_CurrentCamera_0 (ref), l_Head_0 (ref)
                            l_CurrentCamera_0.CFrame = l_Head_0.CFrame;
                        end, 
                        markers = {
                            Dialog = function() --[[ Line: 261 ]] --[[ Name: Dialog ]]
                                -- upvalues: l_v68_0 (ref), v20 (ref), v28 (ref)
                                l_v68_0 = l_v68_0 + 1;
                                local v71 = v20[l_v68_0];
                                v28:ShowDialog(v71.speaker, v71.dialog);
                            end, 
                            ClearDialog = function() --[[ Line: 266 ]] --[[ Name: ClearDialog ]]
                                -- upvalues: v28 (ref)
                                v28:HideDialog();
                            end, 
                            ParticlesOn = function() --[[ Line: 269 ]] --[[ Name: ParticlesOn ]]
                                -- upvalues: v39 (ref)
                                for _, v73 in v39.particles do
                                    v73.Enabled = true;
                                end;
                            end, 
                            ParticlesOff = function() --[[ Line: 272 ]] --[[ Name: ParticlesOff ]]
                                -- upvalues: v39 (ref)
                                for _, v75 in v39.particles do
                                    v75.Enabled = false;
                                end;
                            end, 
                            HideBars = function() --[[ Line: 275 ]] --[[ Name: HideBars ]]
                                -- upvalues: v28 (ref)
                                v28:ToggleBars(false);
                            end, 
                            FadeToBlack = function() --[[ Line: 278 ]] --[[ Name: FadeToBlack ]]
                                -- upvalues: v41 (ref), v39 (ref), v70 (copy)
                                v41 = v39:_sting({
                                    config = {
                                        tweenInInfo = TweenInfo.new(0.75)
                                    }
                                });
                                v41:andThen(v70);
                            end
                        }
                    });
                end);
                v39.dumpster:Add(v67);
            end;
            if not v9.all(v50):await() then
                return false;
            else
                v68 = os.clock() - v44;
                if v68 < 1 and not v39:_delay(1 - v68) then
                    return false;
                else
                    local v76 = v24:PlaySound({
                        name = "Cutscenes.Quarters", 
                        soundGroup = "Master.SFX", 
                        extraData = {
                            fadeIn = true, 
                            fadeTime = 0.5
                        }
                    }, true);
                    v39.dumpster:Add(v76);
                    for _, v78 in v50 do
                        v78:expect():Play(0);
                    end;
                    v43();
                    v28:ToggleBars(true);
                    if not v42:await() then
                        return false;
                    else
                        v39.dumpster:Add(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 329 ]]
                            -- upvalues: l_CurrentCamera_0 (copy), l_Head_0 (copy)
                            l_CurrentCamera_0.CFrame = l_Head_0.CFrame;
                        end));
                        if not v67:await() then
                            return false;
                        else
                            v39:_cleanup(true);
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v29.Skip = function(v79) --[[ Line: 344 ]] --[[ Name: Skip ]]
    v79:_cleanup(false);
end;
v29._cleanup = function(v80) --[[ Line: 348 ]] --[[ Name: _cleanup ]]
    -- upvalues: v26 (copy)
    v26.Play:Fire();
    v80.dumpster:Destroy();
    table.clear(v80);
    setmetatable(v80, nil);
end;
v29._sting = function(v81, v82) --[[ Line: 356 ]] --[[ Name: _sting ]]
    -- upvalues: v9 (copy), v27 (ref)
    v82 = v82 or {};
    local v83 = v82.callbacks or {};
    local v84 = nil;
    local v85 = nil;
    local v88 = v9.new(function(v86) --[[ Line: 375 ]]
        -- upvalues: v84 (ref), v9 (ref), v85 (ref), v27 (ref), v82 (ref), v83 (copy)
        v84 = v9.new(function(v87) --[[ Line: 376 ]]
            -- upvalues: v85 (ref), v27 (ref), v82 (ref), v83 (ref), v86 (copy)
            v85 = v27:Transition({
                config = v82.config, 
                callbacks = {
                    hold = function() --[[ Line: 380 ]] --[[ Name: hold ]]
                        -- upvalues: v83 (ref), v87 (copy)
                        if v83.hold then
                            v83.hold();
                        end;
                        v87();
                    end, 
                    tweenOut = function() --[[ Line: 387 ]] --[[ Name: tweenOut ]]
                        -- upvalues: v83 (ref), v86 (ref)
                        if v83.tweenOut then
                            v83.tweenOut();
                        end;
                        v86();
                    end
                }
            });
        end);
    end);
    v81.dumpster:Add(v84);
    v81.dumpster:Add(v88);
    return v84, v88, v85;
end;
v29._delay = function(v89, v90) --[[ Line: 405 ]] --[[ Name: _delay ]]
    -- upvalues: v9 (copy)
    local v91 = v9.delay(v90);
    v89.dumpster:Add(v91);
    return v91:await();
end;
v29._addTweenToDumpster = function(v92, v93) --[[ Line: 412 ]] --[[ Name: _addTweenToDumpster ]]
    v92.dumpster:Add(function() --[[ Line: 413 ]]
        -- upvalues: v93 (copy)
        v93:Cancel();
        v93:Destroy();
    end);
end;
v7.OnStart():andThen(function() --[[ Line: 419 ]]
    -- upvalues: v12 (copy), v27 (ref), v23 (copy), v28 (ref), l_ReplicatedStorage_0 (copy), l_ContentProvider_0 (copy)
end);
return v29;