local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local v9 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
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
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = CFrame.Angles(0.4363323129985824, 3.141592653589793, 0);
local v33 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v35 = v5.CreateController({
    Name = script.Name, 
    UnitGained = v9.new(), 
    _opening = false, 
    _processingRequest = false
});
v35.KnitInit = function(_) --[[ Line: 69 ]] --[[ Name: KnitInit ]]
    -- upvalues: v15 (ref), v5 (copy), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref)
    v15 = v5.GetController("DataController");
    v16 = v5.GetController("CharacterController");
    v17 = v5.GetController("DeviceTypeController");
    v18 = v5.GetController("UIController");
    v19 = v5.GetController("UnitViewerController");
    v20 = v5.GetController("AudioController");
    v21 = v5.GetService("TreasureService");
    v22 = v5.GetController("TreasureController");
    v23 = v5.GetController("CamShakeController");
end;
v35.KnitStart = function(v37) --[[ Line: 82 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v24 (ref), v18 (ref), v25 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v22 (ref), v30 (ref), l_ReplicatedStorage_0 (copy), v31 (ref), v15 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v24 = v18:GetModuleAsync("TreasureOpen"):expect();
        v25 = v18:GetModuleAsync("Rewards"):expect();
        local function v42(v38, v39, v40, v41) --[[ Line: 90 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v26 (ref), v27 (ref), v28 (ref), v29 (ref)
            v26 = v38;
            v27 = v39;
            v28 = v40;
            v29 = v41;
        end;
        if v22:GetArea() then
            local l_v22_Area_0, v44, v45, v46 = v22:GetArea();
            v26 = l_v22_Area_0;
            v27 = v44;
            v28 = v45;
            v29 = v46;
        end;
        v22.StopOpenAll:Connect(function() --[[ Line: 101 ]]
            -- upvalues: v37 (copy)
            v37:ToggleOpenAll(false);
        end);
        v22.TreasureAreaLoaded:Connect(v42);
        v30 = l_ReplicatedStorage_0.Models.VDAY_GIFT;
        v31 = l_ReplicatedStorage_0.Animations.VDAY_Gift;
        v15:OnChanged(v5.Player, "Inventory", function(v47) --[[ Line: 113 ]]
            -- upvalues: v37 (copy)
            if not v37._openAll then
                return;
            else
                if not v47["Parade Present"] then
                    v37:ToggleOpenAll(false);
                end;
                return;
            end;
        end, true);
        return;
    end;
end;
v35.PlayAnimation = function(_, v49, v50, v51, v52, v53) --[[ Line: 127 ]] --[[ Name: PlayAnimation ]]
    if not v49 or not v50 then
        return;
    else
        if v53 == nil then
            v53 = true;
        end;
        v51 = v51 or {};
        local l_AnimationController_0 = v49:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v55 = l_AnimationController_0:LoadAnimation(v50);
            for v56, v57 in v51 do
                v55[v56] = v57;
            end;
            if v52 then
                for v58, v59 in v52 do
                    v55:GetMarkerReachedSignal(v58):Once(function(...) --[[ Line: 153 ]]
                        -- upvalues: v59 (copy), v55 (copy)
                        v59(v55, ...);
                    end);
                end;
            end;
            if v53 then
                v55:Play();
            end;
            return v55;
        end;
    end;
end;
v35.OpenTreasure = function(v60, v61, v62) --[[ Line: 166 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v6 (copy), v18 (ref), v27 (ref), v28 (ref), v17 (ref), v16 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v30 (ref), v32 (copy), v31 (ref), v20 (ref), v23 (ref), l_UserInputService_0 (copy), v33 (copy)
    v60._opening = true;
    v60._dump = v6.new();
    if not v60._allToggled then
        v60._allToggled = v18:ToggleAll(nil, false);
    end;
    v27.Attachment.SpotLight.Enabled = false;
    v28.Attachment.SpotLight.Enabled = false;
    v17:TogglePlayerControls(false);
    v16:ToggleHideAll(true);
    if l_RunService_0:IsStudio() then
        warn("Taps:", v61, "\nItems Gained:", v62);
    end;
    v60:_setRarityVisual(v61[1], 1);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v27.CFrame;
    local v63 = v30:Clone();
    local v64 = v27.CFrame.LookVector * 7.6;
    local v65 = CFrame.new(0, -v63.PrimaryPart.Size.Y / 2, 0);
    v63:PivotTo(v27.CFrame * v65 * v32 + v64);
    v63.Parent = workspace;
    v60._dump:Add(v63);
    if not v63:IsDescendantOf(workspace) then
        v63.AncestryChanged:Wait();
    end;
    v60:PlayAnimation(v63, v31.Idle, {
        Looped = true, 
        Priority = Enum.AnimationPriority.Action3
    }, {}, true).Priority = Enum.AnimationPriority.Idle;
    local v66 = v60:PlayAnimation(v63, v31.Shake, {
        Looped = false, 
        Priority = Enum.AnimationPriority.Action3
    }, {}, false);
    local v67 = nil;
    v67 = v60:PlayAnimation(v63, v31.Open, {
        Looped = false, 
        Priority = Enum.AnimationPriority.Action4
    }, {
        ShowReward = function() --[[ Line: 225 ]]
            -- upvalues: v67 (ref), v20 (ref), v63 (copy), v23 (ref), v60 (copy), v62 (copy), v61 (copy)
            v67:AdjustSpeed(0);
            v20:PlaySound({
                name = "VDayGift.Explosion", 
                soundGroup = "Master.SFX.UI"
            });
            for _, v69 in v63.Explosion:GetDescendants() do
                if v69:IsA("ParticleEmitter") then
                    v69:Emit(v69:GetAttribute("EmitCount") or 1);
                end;
            end;
            v23:Shake("VDayGiftShake", {
                originalPivot = workspace.CurrentCamera.CFrame
            }, function() --[[ Line: 241 ]]
                -- upvalues: v60 (ref), v62 (ref), v61 (ref)
                task.wait(0.3);
                v60:RevealItem(v62, v61[#v61]);
            end);
        end
    }, false);
    v20:FadeMusicVolume(0.3, 0.5);
    local v70 = 1;
    local v71 = #v61;
    v18:Toggle("TreasureOpen", true);
    local function v75() --[[ Line: 260 ]] --[[ Name: doTap ]]
        -- upvalues: v70 (ref), v71 (copy), v60 (copy), v20 (ref), v18 (ref), v67 (ref), v66 (copy), v63 (copy), v61 (copy)
        v70 = v70 + 1;
        if v70 > v71 + 1 and not v60._revealingItem then
            v60._revealingItem = true;
            v20:PlaySound({
                name = "VDayGift.Shake4", 
                soundGroup = "Master.SFX.UI"
            });
            v18:Toggle("TreasureOpen", false);
            v67:Play();
            return;
        else
            v66:Play();
            for _, v73 in v63.Explosion:GetDescendants() do
                if v73:IsA("ParticleEmitter") and v73.Parent.Name ~= "Particles" then
                    v73:Emit(v73:GetAttribute("EmitCount") or 1);
                end;
            end;
            local v74 = v61[math.clamp(v70 - 1, 1, #v61)];
            if v74 then
                v60:_setRarityVisual(v74, v70);
            end;
            v20:PlaySound({
                name = ("VDayGift.Shake%*"):format(v70 - 1), 
                soundGroup = "Master.SFX.UI"
            });
            return;
        end;
    end;
    v60._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v76, v77) --[[ Line: 303 ]]
        -- upvalues: v33 (ref), v60 (copy), v75 (copy)
        if v77 or not table.find(v33, v76.UserInputType) then
            return;
        elseif v60._revealingItem then
            return;
        else
            v75();
            return;
        end;
    end));
    v60._dump:Add(v17.GamepadButtonPressed:Connect(v75));
end;
v35.RevealItem = function(v78, v79, _) --[[ Line: 318 ]] --[[ Name: RevealItem ]]
    -- upvalues: v27 (ref), v28 (ref), v18 (ref), l_RunService_0 (copy), v19 (ref), v22 (ref), v25 (ref), v20 (ref)
    v78._dump:Clean();
    v78._revealingItem = true;
    v78._dump:Add(function() --[[ Line: 322 ]]
        -- upvalues: v78 (copy), v27 (ref), v28 (ref)
        v78._dump = nil;
        if not v78._openAll then
            v78._allToggled = nil;
        end;
        v78._revealingItem = false;
        v78._opening = false;
        task.delay(0.2, function() --[[ Line: 332 ]]
            -- upvalues: v27 (ref), v28 (ref)
            v27.Attachment.SpotLight.Enabled = true;
            v28.Attachment.SpotLight.Enabled = true;
        end);
    end);
    v18:Toggle("TreasureOpen", false):await();
    v78._allToggled.TreasureOpen = nil;
    local function v81() --[[ Line: 341 ]] --[[ Name: handleFinished ]]
        -- upvalues: v81 (ref), v78 (copy), l_RunService_0 (ref)
        v81 = nil;
        v78._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v78._openAll then
            v78:AttemptOpen(v78._openAll);
        end;
    end;
    if v79.type == "RandomUnit" or v79.type == "Unit" then
        v78._dump:Add(v19.QueueCompleted:Once(v81));
        v22.UnitGained:Fire({
            v79.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v78._openAll or false
        }, table.clone(v78._allToggled));
        return;
    else
        v78._dump:Add(v25.Finished:Once(v81));
        v25:QueueRewards(v79, table.clone(v78._allToggled), v78._openAll);
        task.delay(3.4, function() --[[ Line: 367 ]]
            -- upvalues: v20 (ref)
            v20:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v35.AttemptOpen = function(v82, v83) --[[ Line: 374 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v22 (ref), v21 (ref), v18 (ref)
    if v82:IsOpening() then
        return;
    elseif v22:IsOpening() then
        return;
    elseif v82._processingRequest then
        return;
    else
        v82._processingRequest = true;
        v82:ToggleOpenAll(v83 or false);
        v21:OpenVDayGift():andThen(function(v84, v85) --[[ Line: 390 ]]
            -- upvalues: v18 (ref), v82 (copy)
            if not v84 or not v85 then
                v18:Toggle("Items", true);
                if v82._openAll then
                    v82:OpenAllFailed(1);
                end;
                v82:ToggleOpenAll(false);
                return;
            else
                v82:OpenTreasure(v84, v85);
                return;
            end;
        end):catch(function() --[[ Line: 403 ]]
            -- upvalues: v18 (ref)
            v18:Toggle("Items", true);
        end):finally(function() --[[ Line: 405 ]]
            -- upvalues: v82 (copy)
            v82._processingRequest = false;
        end);
        return;
    end;
end;
v35.IsOpening = function(v86) --[[ Line: 410 ]] --[[ Name: IsOpening ]]
    if v86._processingRequest then
        return true;
    else
        return v86._opening;
    end;
end;
v35.OpenAllFailed = function(v87, v88) --[[ Line: 418 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v18 (ref), v17 (ref), v16 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v88)));
    v87:ToggleOpenAll(false);
    if v87._allToggled then
        v18:RevertFromToggleAll(v87._allToggled);
        v87._allToggled = nil;
    end;
    v17:TogglePlayerControls(true);
    v16:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v35.ToggleOpenAll = function(v89, v90) --[[ Line: 434 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v24 (ref)
    v89._openAll = v90;
    v24:ReportOpenAll(v90);
end;
v35._setRarityVisual = function(_, v92, v93) --[[ Line: 439 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v29 (ref), v13 (copy), v24 (ref)
    v93 = v93 or 1;
    if v29 then
        v29.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v92];
        v29.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v92];
    end;
    v24:SetIndex(v92, v93);
end;
return v35;