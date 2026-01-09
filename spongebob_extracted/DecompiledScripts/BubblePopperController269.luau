local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
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
local v14 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
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
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = CFrame.Angles(0, 3.141592653589793, 0);
local v36 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v38 = v5.CreateController({
    Name = script.Name, 
    UnitGained = v9.new(), 
    _opening = false, 
    _revealingItem = false
});
v38.KnitInit = function(_) --[[ Line: 71 ]] --[[ Name: KnitInit ]]
    -- upvalues: v16 (ref), v5 (copy), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v25 (ref)
    v16 = v5.GetController("DataController");
    v17 = v5.GetService("TreasureService");
    v18 = v5.GetController("CharacterController");
    v19 = v5.GetController("DeviceTypeController");
    v20 = v5.GetController("UIController");
    v21 = v5.GetController("UnitViewerController");
    v22 = v5.GetController("AudioController");
    v23 = v5.GetController("VDayGiftController");
    v24 = v5.GetController("CamShakeController");
    v25 = v5.GetController("TreasureController");
end;
v38.KnitStart = function(v40) --[[ Line: 85 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v26 (ref), v20 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v25 (ref), v33 (ref), l_ReplicatedStorage_0 (copy), v34 (ref), v16 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v26 = v20:GetModuleAsync("TreasureOpen"):expect();
        v27 = v20:GetModuleAsync("Rewards"):expect();
        v28 = v20:GetModuleAsync("PromptOverlay"):expect();
        local function v45(v41, v42, v43, v44) --[[ Line: 94 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v29 (ref), v30 (ref), v31 (ref), v32 (ref)
            v29 = v41;
            v30 = v42;
            v31 = v43;
            v32 = v44;
        end;
        if v25:GetArea() then
            local l_v25_Area_0, v47, v48, v49 = v25:GetArea();
            v29 = l_v25_Area_0;
            v30 = v47;
            v31 = v48;
            v32 = v49;
        end;
        v25.TreasureAreaLoaded:Connect(v45);
        v25.StopOpenAll:Connect(function() --[[ Line: 107 ]]
            -- upvalues: v40 (copy)
            v40:ToggleOpenAll(false);
        end);
        v33 = l_ReplicatedStorage_0.Models.RNG_BOXES.BubblePopper;
        v34 = l_ReplicatedStorage_0.Animations.TreasureChest;
        v16:OnChanged(v5.Player, "Inventory", function(v50) --[[ Line: 117 ]]
            -- upvalues: v40 (copy)
            if not v40._chestName or not v40._openAll then
                return;
            else
                if not v50[v40._chestName] then
                    v40:ToggleOpenAll(false);
                end;
                return;
            end;
        end, true);
        return;
    end;
end;
v38.IsOpening = function(v51) --[[ Line: 130 ]] --[[ Name: IsOpening ]]
    return v51._opening;
end;
local function v56(v52, v53) --[[ Line: 134 ]] --[[ Name: emitParticles ]]
    if not v52 then
        return;
    else
        for _, v55 in v52:GetDescendants() do
            if v55:IsA("ParticleEmitter") then
                if v53 ~= nil and v53(v55) then
                    v55:Emit(v55:GetAttribute("EmitCount") or 1);
                else
                    v55:Emit(v55:GetAttribute("EmitCount") or 1);
                end;
            end;
        end;
        return;
    end;
end;
v38.OpenTreasure = function(v57, v58, v59, v60) --[[ Line: 153 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v30 (ref), v31 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v33 (ref), v35 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), v56 (copy), v24 (ref), l_UserInputService_0 (copy), v36 (copy)
    v57._opening = true;
    local l_v14_ByItemName_0 = v14:GetByItemName(v58);
    if not l_v14_ByItemName_0 then
        v57._opening = false;
        return;
    else
        v57._dump = v6.new();
        if not v57._allToggled then
            v57._allToggled = v20:ToggleAll(nil, false);
        end;
        v30.Attachment.SpotLight.Enabled = false;
        v31.Attachment.SpotLight.Enabled = false;
        v19:TogglePlayerControls(false);
        v18:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v59, "\nTreasure Gained:", v60);
        end;
        local v62 = "Rare";
        if l_v14_ByItemName_0.Rarity or l_v14_ByItemName_0.rarity then
            v62 = l_v14_ByItemName_0.Rarity or l_v14_ByItemName_0.rarity;
        end;
        v57:_setRarityVisual(v62, 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v30.CFrame;
        local v63 = v33:Clone();
        local v64 = Vector3.new(-0, -1, -0, -0) * v63.PrimaryPart.Size.Y / 2;
        v63:PivotTo(v30.CFrame * v35 + v30.CFrame.LookVector * 6.5 + v64);
        v63.Parent = workspace;
        v57._dump:Add(v63);
        local l_v63_Scale_0 = v63:GetScale();
        local v66 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v63_Scale_0, v66, {
            Value = l_v63_Scale_0 * 1.2
        }, function(v67) --[[ Line: 201 ]]
            -- upvalues: v63 (copy)
            v63:ScaleTo(v67);
        end);
        local l_v63_Pivot_0 = v63:GetPivot();
        local v70 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function v72() --[[ Line: 208 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v57 (copy), v15 (ref), l_v63_Pivot_0 (copy), v70 (copy), v63 (copy)
            v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, v70, {
                Value = l_v63_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v71) --[[ Line: 211 ]]
                -- upvalues: v63 (ref)
                v63:PivotTo(v71);
            end));
        end;
        local function v74() --[[ Line: 216 ]] --[[ Name: doRightTween ]]
            -- upvalues: v57 (copy), v15 (ref), l_v63_Pivot_0 (copy), v70 (copy), v63 (copy)
            v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, v70, {
                Value = l_v63_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v73) --[[ Line: 219 ]]
                -- upvalues: v63 (ref)
                v63:PivotTo(v73);
            end));
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v75 = 1;
        local v76 = #v59;
        v20:Toggle("TreasureOpen", true);
        local function v88() --[[ Line: 235 ]] --[[ Name: doTap ]]
            -- upvalues: v75 (ref), v76 (copy), v57 (copy), v20 (ref), v22 (ref), v15 (ref), v63 (copy), l_v63_Pivot_0 (copy), l_TweenService_0 (ref), v30 (ref), v56 (ref), v24 (ref), v60 (copy), v59 (copy), v58 (copy), v74 (copy), v72 (copy)
            v75 = v75 + 1;
            if v75 > v76 + 1 and v57._revealingItem then
                return;
            elseif v75 > v76 + 1 and not v57._revealingItem then
                v57._revealingItem = true;
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "BubblePopper.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                local v78 = v15("NumberValue", 0, TweenInfo.new(0.4), {
                    Value = 720
                }, function(v77) --[[ Line: 254 ]]
                    -- upvalues: v63 (ref), l_v63_Pivot_0 (ref)
                    v63:PivotTo(l_v63_Pivot_0 * CFrame.Angles(0, math.rad(-v77), 0));
                end);
                local function v84() --[[ Line: 264 ]] --[[ Name: fadeAway ]]
                    -- upvalues: v63 (ref), l_TweenService_0 (ref), v57 (ref), v15 (ref), l_v63_Pivot_0 (ref), v30 (ref)
                    for _, v80 in v63:GetDescendants() do
                        if v80:IsA("BasePart") then
                            local v81 = l_TweenService_0:Create(v80, TweenInfo.new(0.4), {
                                Transparency = 1
                            });
                            do
                                local l_v81_0 = v81;
                                v57._dump:Add(l_v81_0.Completed:Once(function() --[[ Line: 270 ]]
                                    -- upvalues: l_v81_0 (ref)
                                    l_v81_0:Destroy();
                                    l_v81_0 = nil;
                                end));
                                v57._dump:Add(l_v81_0);
                                l_v81_0:Play();
                            end;
                        end;
                    end;
                    v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v63_Pivot_0 + v30.CFrame.LookVector * -3.25
                    }, function(v83) --[[ Line: 284 ]]
                        -- upvalues: v63 (ref)
                        v63:PivotTo(v83);
                    end));
                end;
                v78:Add(function() --[[ Line: 289 ]]
                    -- upvalues: v56 (ref), v63 (ref), v84 (copy), v24 (ref), v57 (ref), v60 (ref), v59 (ref), v58 (ref)
                    v56(v63.PrimaryPart, function(v85) --[[ Line: 291 ]]
                        return v85.Parent.Name == "Explosion";
                    end);
                    task.delay(0.165, v84);
                    v24:Shake("VDayGiftShake", {
                        originalPivot = workspace.CurrentCamera.CFrame
                    }, function() --[[ Line: 298 ]]
                        -- upvalues: v57 (ref), v60 (ref), v59 (ref), v58 (ref)
                        v57:RevealItem(v60, v59[#v59], v58);
                    end);
                end);
                v57._dump:Add(v78);
                return;
            else
                if v75 % 2 == 0 then
                    v74();
                else
                    v72();
                end;
                local v86 = v59[math.clamp(v75 - 1, 1, #v59)];
                if v86 then
                    v57:_setRarityVisual(v86, v75);
                end;
                if v75 <= v76 + 1 then
                    v22:PlaySound({
                        name = ("BubblePopper.Upgrade%*"):format(v75 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v56(v63.PrimaryPart, function(v87) --[[ Line: 332 ]]
                    return v87.Parent.Name == "Flash";
                end);
                return;
            end;
        end;
        v57._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v89, v90) --[[ Line: 337 ]]
            -- upvalues: v36 (ref), v88 (copy)
            if v90 or not table.find(v36, v89.UserInputType) then
                return;
            else
                v88();
                return;
            end;
        end));
        v57._dump:Add(v19.GamepadButtonPressed:Connect(v88));
        return;
    end;
end;
v38.RevealItem = function(v91, v92, _, v94) --[[ Line: 348 ]] --[[ Name: RevealItem ]]
    -- upvalues: v30 (ref), v31 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v91._dump:Clean();
    v91._dump:Add(function() --[[ Line: 351 ]]
        -- upvalues: v91 (copy), v30 (ref), v31 (ref)
        v91._dump = nil;
        if not v91._openAll then
            v91._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 358 ]]
            -- upvalues: v30 (ref), v31 (ref), v91 (ref)
            v30.Attachment.SpotLight.Enabled = true;
            v31.Attachment.SpotLight.Enabled = true;
            v91._revealingItem = false;
        end);
        v91._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v91._allToggled.TreasureOpen = nil;
    local function v95() --[[ Line: 371 ]] --[[ Name: handleFinished ]]
        -- upvalues: v95 (ref), v91 (copy), l_RunService_0 (ref), v94 (copy)
        v95 = nil;
        v91._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v91._openAll then
            v91:AttemptOpen(v94, v91._openAll);
        end;
    end;
    if v92.type == "RandomUnit" or v92.type == "Unit" then
        v91._dump:Add(v21.QueueCompleted:Once(v95));
        v25.UnitGained:Fire({
            v92.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v91._openAll or false
        }, table.clone(v91._allToggled));
        return;
    else
        v91._dump:Add(v27.Finished:Once(v95));
        v27:QueueRewards(v92, table.clone(v91._allToggled), v91._openAll);
        task.delay(3.4, function() --[[ Line: 402 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v38.PlayAnimation = function(_, v97, v98, v99, v100, v101) --[[ Line: 408 ]] --[[ Name: PlayAnimation ]]
    if not v97 or not v98 then
        return;
    else
        if v101 == nil then
            v101 = true;
        end;
        v99 = v99 or {};
        local l_AnimationController_0 = v97:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v103 = l_AnimationController_0:LoadAnimation(v98);
            for v104, v105 in v99 do
                v103[v104] = v105;
            end;
            if v100 then
                for v106, v107 in v100 do
                    v103:GetMarkerReachedSignal(v106):Once(function(...) --[[ Line: 434 ]]
                        -- upvalues: v107 (copy), v103 (copy)
                        v107(v103, ...);
                    end);
                end;
            end;
            if v101 then
                v103:Play();
            end;
            return v103;
        end;
    end;
end;
v38.AttemptOpen = function(v108, v109, v110) --[[ Line: 447 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if not v109 or v108:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v108._chestName = v109;
        v108:ToggleOpenAll(v110 or false);
        local v111 = nil;
        v111 = task.delay(0.25, function() --[[ Line: 460 ]]
            -- upvalues: v111 (ref), v28 (ref)
            v111 = nil;
            v28:Toggle(true);
        end);
        v17:OpenBubbleCapsule(v109):andThen(function(v112, v113) --[[ Line: 465 ]]
            -- upvalues: v20 (ref), v108 (copy), v28 (ref), v111 (ref), v109 (copy)
            if not v112 or not v113 then
                v20:Toggle("Items", true);
                if v108._openAll then
                    v108:OpenAllFailed(1);
                end;
                v108:ToggleOpenAll(false);
                return;
            else
                v28:Toggle(false);
                if v111 then
                    task.cancel(v111);
                end;
                v108:OpenTreasure(v109, v112, v113);
                return;
            end;
        end):catch(function(v114) --[[ Line: 485 ]]
            -- upvalues: v20 (ref), v108 (copy)
            warn("caught err", v114);
            v20:Toggle("Items", true);
            if v108._openAll then
                v108:OpenAllFailed(2);
            end;
            v108:ToggleOpenAll(false);
        end):finally(function() --[[ Line: 494 ]]
            -- upvalues: v28 (ref), v111 (ref)
            v28:Toggle(false);
            if v111 then
                task.cancel(v111);
            end;
        end);
        return;
    end;
end;
v38.OpenAllFailed = function(v115, v116) --[[ Line: 504 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v116)));
    v115:ToggleOpenAll(false);
    if v115._allToggled then
        v20:RevertFromToggleAll(v115._allToggled);
        v115._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v38.ToggleOpenAll = function(v117, v118) --[[ Line: 520 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v117._openAll = v118;
    v26:ReportOpenAll(v118);
end;
v38._setRarityVisual = function(_, v120, v121) --[[ Line: 525 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v32 (ref), v13 (copy), v26 (ref)
    v121 = v121 or 1;
    if v32 then
        v32.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v120];
        v32.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v120];
    end;
    v26:SetIndex(v120, v121);
end;
return v38;