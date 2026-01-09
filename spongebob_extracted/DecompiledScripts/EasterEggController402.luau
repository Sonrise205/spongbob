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
    -- upvalues: v11 (copy), v26 (ref), v20 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v25 (ref), v34 (ref), l_ReplicatedStorage_0 (copy), v16 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v26 = v20:GetModuleAsync("TreasureOpen"):expect();
        v27 = v20:GetModuleAsync("Rewards"):expect();
        v28 = v20:GetModuleAsync("PromptOverlay"):expect();
        v29 = v20:GetModuleAsync("TreasureResults"):expect();
        local function v45(v41, v42, v43, v44) --[[ Line: 95 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v30 (ref), v31 (ref), v32 (ref), v33 (ref)
            v30 = v41;
            v31 = v42;
            v32 = v43;
            v33 = v44;
        end;
        if v25:GetArea() then
            local l_v25_Area_0, v47, v48, v49 = v25:GetArea();
            v30 = l_v25_Area_0;
            v31 = v47;
            v32 = v48;
            v33 = v49;
        end;
        v25.TreasureAreaLoaded:Connect(v45);
        v25.StopOpenAll:Connect(function() --[[ Line: 108 ]]
            -- upvalues: v40 (copy)
            v40:ToggleOpenAll(false);
        end);
        v34 = l_ReplicatedStorage_0.Models.RNG_BOXES.EasterEgg;
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
v38.OpenTreasure = function(v57, v58, v59, v60, v61) --[[ Line: 153 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v31 (ref), v32 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v34 (ref), v35 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), l_ReplicatedStorage_0 (copy), v56 (copy), v24 (ref), l_UserInputService_0 (copy), v36 (copy)
    v57._opening = true;
    if not v14:GetByItemName(v58) then
        v57._opening = false;
        return;
    else
        v57._dump = v6.new();
        if not v57._allToggled then
            v57._allToggled = v20:ToggleAll(nil, false);
        end;
        v31.Attachment.SpotLight.Enabled = false;
        v32.Attachment.SpotLight.Enabled = false;
        v19:TogglePlayerControls(false);
        v18:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v59, "\nTreasure Gained:", v60);
        end;
        local v62 = v59[1];
        if typeof(v59[1]) == "table" then
            v62 = v59[1][1];
        end;
        v57:_setRarityVisual(v62, 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v31.CFrame;
        local v63 = v34:Clone();
        v63:PivotTo(v31.CFrame * v35 + v31.CFrame.LookVector * 5.25 + Vector3.new(0, 0, 0, 0));
        v63.Parent = workspace;
        v57._dump:Add(v63);
        local l_v63_Scale_0 = v63:GetScale();
        local v65 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v63_Scale_0, v65, {
            Value = l_v63_Scale_0 * 1.2
        }, function(v66) --[[ Line: 201 ]]
            -- upvalues: v63 (copy)
            v63:ScaleTo(v66);
        end);
        local l_v63_Pivot_0 = v63:GetPivot();
        local v69 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 208 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v57 (copy), v15 (ref), l_v63_Pivot_0 (copy), v69 (copy), v63 (copy)
            v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, v69, {
                Value = l_v63_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v70) --[[ Line: 211 ]]
                -- upvalues: v63 (ref)
                v63:PivotTo(v70);
            end));
        end;
        local function _() --[[ Line: 216 ]] --[[ Name: doRightTween ]]
            -- upvalues: v57 (copy), v15 (ref), l_v63_Pivot_0 (copy), v69 (copy), v63 (copy)
            v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, v69, {
                Value = l_v63_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v72) --[[ Line: 219 ]]
                -- upvalues: v63 (ref)
                v63:PivotTo(v72);
            end));
        end;
        local function v78() --[[ Line: 224 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v63 (copy), l_v63_Pivot_0 (copy), v57 (copy)
            local v74 = math.random(-25, 25);
            local v76 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v75) --[[ Line: 229 ]]
                -- upvalues: v63 (ref), l_v63_Pivot_0 (ref), v74 (copy)
                v63:PivotTo(l_v63_Pivot_0 * CFrame.Angles(math.rad(v74), math.rad(-v75), 0));
            end);
            v76:Add(function() --[[ Line: 233 ]]
                -- upvalues: v57 (ref), v15 (ref), v63 (ref), l_v63_Pivot_0 (ref)
                v57._dump:Add(v15("CFrameValue", v63:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v63_Pivot_0
                }, function(v77) --[[ Line: 236 ]]
                    -- upvalues: v63 (ref)
                    v63:PivotTo(v77);
                end));
            end);
            v57._dump:Add(v76);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v79 = 1;
        local v80 = #v59;
        if typeof(v59[1]) == "table" then
            v80 = #v59[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v94() --[[ Line: 267 ]] --[[ Name: doTap ]]
            -- upvalues: v79 (ref), v80 (ref), v57 (copy), v20 (ref), v22 (ref), v15 (ref), v63 (copy), l_v63_Pivot_0 (copy), l_TweenService_0 (ref), v31 (ref), l_ReplicatedStorage_0 (ref), v56 (ref), v24 (ref), v60 (copy), v59 (copy), v58 (copy), v78 (copy), v61 (copy)
            v79 = v79 + 1;
            if v79 > v80 + 1 and v57._revealingItem then
                return;
            elseif v79 > v80 + 1 and not v57._revealingItem then
                v57._revealingItem = true;
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "EasterEgg.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                local v82 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                    Value = 90
                }, function(v81) --[[ Line: 286 ]]
                    -- upvalues: v63 (ref), l_v63_Pivot_0 (ref)
                    v63:PivotTo(l_v63_Pivot_0 * CFrame.Angles(0, math.rad(-v81), 0));
                end);
                local _ = function() --[[ Line: 296 ]] --[[ Name: fadeAway ]]
                    -- upvalues: v63 (ref), l_TweenService_0 (ref), v57 (ref), v15 (ref), l_v63_Pivot_0 (ref), v31 (ref)
                    for _, v84 in v63:GetDescendants() do
                        if v84:IsA("BasePart") then
                            local v85 = l_TweenService_0:Create(v84, TweenInfo.new(0.4), {
                                Transparency = 1
                            });
                            do
                                local l_v85_0 = v85;
                                v57._dump:Add(l_v85_0.Completed:Once(function() --[[ Line: 302 ]]
                                    -- upvalues: l_v85_0 (ref)
                                    l_v85_0:Destroy();
                                    l_v85_0 = nil;
                                end));
                                v57._dump:Add(l_v85_0);
                                l_v85_0:Play();
                            end;
                        end;
                    end;
                    v57._dump:Add(v15("CFrameValue", l_v63_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v63_Pivot_0 + v31.CFrame.LookVector * -2.625
                    }, function(v87) --[[ Line: 316 ]]
                        -- upvalues: v63 (ref)
                        v63:PivotTo(v87);
                    end));
                end;
                local v91 = v57:PlayAnimation(v63, l_ReplicatedStorage_0.Animations.EggOpen, nil, {
                    EggOpen = function() --[[ Line: 322 ]] --[[ Name: EggOpen ]]
                        -- upvalues: v56 (ref), v63 (ref), v24 (ref), v60 (ref), v57 (ref), v59 (ref), v58 (ref)
                        v56(v63.PrimaryPart, function(v89) --[[ Line: 323 ]]
                            return v89.Parent.Name == "Explosion";
                        end);
                        v24:Shake("VDayGiftShake", {
                            originalPivot = workspace.CurrentCamera.CFrame
                        }, function() --[[ Line: 327 ]]
                            -- upvalues: v60 (ref), v57 (ref), v59 (ref), v58 (ref)
                            if #v60 > 1 then
                                v57:RevealItemsOpened(v60, v59);
                                return;
                            else
                                v57:RevealItem(v60, v59[#v59], v58);
                                return;
                            end;
                        end);
                    end, 
                    Pause = function(v90) --[[ Line: 337 ]] --[[ Name: Pause ]]
                        v90:AdjustSpeed(0);
                    end
                }, true);
                if v91 then
                    v57._dump:Add(v91);
                end;
                v82:Add(function() --[[ Line: 346 ]]

                end);
                v57._dump:Add(v82);
                return;
            else
                v78();
                local v92 = nil;
                v92 = if typeof(v59[1]) == "table" then v59[1][math.clamp(v79 - 1, 1, #v59[1])] else v59[math.clamp(v79 - 1, 1, #v59)];
                if v92 then
                    v57:_setRarityVisual(v92, v79, v61);
                end;
                if v79 <= v80 + 1 then
                    v22:PlaySound({
                        name = ("EasterEgg.Upgrade%*"):format(v79 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v56(v63.PrimaryPart, function(v93) --[[ Line: 412 ]]
                    return v93.Parent.Name == "Explosion";
                end);
                return;
            end;
        end;
        v57._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v95, v96) --[[ Line: 417 ]]
            -- upvalues: v36 (ref), v94 (copy)
            if v96 or not table.find(v36, v95.UserInputType) then
                return;
            else
                v94();
                return;
            end;
        end));
        v57._dump:Add(v19.GamepadButtonPressed:Connect(v94));
        return;
    end;
end;
v38.RevealItemsOpened = function(v97, v98, _, _) --[[ Line: 428 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v29 (ref)
    v97._dump:Clean();
    v97._dump = nil;
    v97._opening = false;
    v97._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v97._allToggled then
        v97._allToggled.TreasureOpen = nil;
    end;
    v29:ShowResults(v98, table.clone(v97._allToggled));
    v97._allToggled = nil;
end;
v38.RevealItem = function(v101, v102, _, v104) --[[ Line: 456 ]] --[[ Name: RevealItem ]]
    -- upvalues: v31 (ref), v32 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v101._dump:Clean();
    v101._dump:Add(function() --[[ Line: 459 ]]
        -- upvalues: v101 (copy), v31 (ref), v32 (ref)
        v101._dump = nil;
        if not v101._openAll then
            v101._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 466 ]]
            -- upvalues: v31 (ref), v32 (ref), v101 (ref)
            v31.Attachment.SpotLight.Enabled = true;
            v32.Attachment.SpotLight.Enabled = true;
            v101._revealingItem = false;
        end);
        v101._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v101._allToggled.TreasureOpen = nil;
    local function v105() --[[ Line: 479 ]] --[[ Name: handleFinished ]]
        -- upvalues: v105 (ref), v101 (copy), l_RunService_0 (ref), v104 (copy)
        v105 = nil;
        v101._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v101._openAll then
            v101:AttemptOpen(v104, 1, v101._openAll);
        end;
    end;
    if v102.type == "RandomUnit" or v102.type == "Unit" then
        v101._dump:Add(v21.QueueCompleted:Once(v105));
        v25.UnitGained:Fire({
            v102.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v101._openAll or false
        }, table.clone(v101._allToggled));
        return;
    else
        v101._dump:Add(v27.Finished:Once(v105));
        v27:QueueRewards(v102, table.clone(v101._allToggled), v101._openAll);
        task.delay(3.4, function() --[[ Line: 505 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v38.PlayAnimation = function(_, v107, v108, v109, v110, v111) --[[ Line: 511 ]] --[[ Name: PlayAnimation ]]
    if not v107 or not v108 then
        return;
    else
        if v111 == nil then
            v111 = true;
        end;
        v109 = v109 or {};
        local l_AnimationController_0 = v107:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v113 = l_AnimationController_0:LoadAnimation(v108);
            for v114, v115 in v109 do
                v113[v114] = v115;
            end;
            if v110 then
                for v116, v117 in v110 do
                    v113:GetMarkerReachedSignal(v116):Once(function(...) --[[ Line: 537 ]]
                        -- upvalues: v117 (copy), v113 (copy)
                        v117(v113, ...);
                    end);
                end;
            end;
            if v111 then
                v113:Play();
            end;
            return v113;
        end;
    end;
end;
v38.AttemptOpen = function(v118, v119, v120, v121) --[[ Line: 550 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if not v119 or v118:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v120 = v120 or 1;
        v121 = v120 <= 1;
        v118._chestName = v119;
        v118:ToggleOpenAll(v121 or false);
        local v122 = nil;
        v122 = task.delay(0.25, function() --[[ Line: 566 ]]
            -- upvalues: v122 (ref), v28 (ref)
            v122 = nil;
            v28:Toggle(true);
        end);
        if v120 > 1 then
            v17:OpenCustomChestAmount(v119, v120):andThen(function(v123, v124, v125) --[[ Line: 572 ]]
                -- upvalues: v20 (ref), v118 (copy), v119 (copy)
                if not v123 or not v124 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v118:OpenTreasure(v119, v123, v124, v125);
                    return;
                end;
            end):catch(function() --[[ Line: 580 ]]
                -- upvalues: v20 (ref), v118 (copy)
                v20:Toggle("Items", true);
                if v118._openAll then
                    v118:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 586 ]]
                -- upvalues: v28 (ref), v122 (ref), v118 (copy)
                v28:Toggle(false);
                if v122 then
                    task.cancel(v122);
                end;
                v118._processingRequest = false;
            end);
            return;
        else
            v17:Open(v119):andThen(function(v126, v127, v128) --[[ Line: 598 ]]
                -- upvalues: v20 (ref), v118 (copy), v28 (ref), v122 (ref), v119 (copy)
                if not v126 or not v127 then
                    v20:Toggle("Items", true);
                    if v118._openAll then
                        v118:OpenAllFailed(1);
                    end;
                    v118:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v122 then
                        task.cancel(v122);
                    end;
                    v118:OpenTreasure(v119, v126, v127, v128);
                    return;
                end;
            end):catch(function(v129) --[[ Line: 618 ]]
                -- upvalues: v20 (ref), v118 (copy)
                warn("caught err", v129);
                v20:Toggle("Items", true);
                if v118._openAll then
                    v118:OpenAllFailed(2);
                end;
                v118:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 627 ]]
                -- upvalues: v28 (ref), v122 (ref)
                v28:Toggle(false);
                if v122 then
                    task.cancel(v122);
                end;
            end);
            return;
        end;
    end;
end;
v38.OpenAllFailed = function(v130, v131) --[[ Line: 637 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v131)));
    v130:ToggleOpenAll(false);
    if v130._allToggled then
        v20:RevertFromToggleAll(v130._allToggled);
        v130._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v38.ToggleOpenAll = function(v132, v133) --[[ Line: 653 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v132._openAll = v133;
    v26:ReportOpenAll(v133);
end;
v38._setRarityVisual = function(_, v135, v136, v137) --[[ Line: 658 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v33 (ref), v13 (copy), v26 (ref)
    v136 = v136 or 1;
    if v33 then
        v33.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v135];
        v33.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v135];
    end;
    v26:SetIndex(v135, v136, v137, true);
end;
return v38;