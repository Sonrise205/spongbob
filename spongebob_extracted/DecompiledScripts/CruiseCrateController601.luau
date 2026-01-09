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
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
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
local v35 = nil;
local v36 = CFrame.Angles(0, 2.356194490192345, 0);
local v37 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local l_CruiseCrate_0 = l_ReplicatedStorage_0.Animations.CruiseCrate;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v40 = {
    Rare = Color3.fromRGB(111, 255, 0), 
    Epic = Color3.fromRGB(162, 0, 255), 
    Legendary = Color3.fromRGB(242, 255, 0), 
    Mythic = Color3.fromRGB(255, 0, 187), 
    Secret = Color3.fromRGB(255, 0, 4)
};
local v41 = v5.CreateController({
    Name = script.Name, 
    UnitGained = v9.new(), 
    _opening = false, 
    _revealingItem = false
});
v41.KnitInit = function(_) --[[ Line: 82 ]] --[[ Name: KnitInit ]]
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
v41.KnitStart = function(v43) --[[ Line: 96 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v26 (ref), v20 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v25 (ref), v35 (ref), l_ReplicatedStorage_0 (copy), v16 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v26 = v20:GetModuleAsync("TreasureOpen"):expect();
        v27 = v20:GetModuleAsync("Rewards"):expect();
        v28 = v20:GetModuleAsync("PromptOverlay"):expect();
        v29 = v20:GetModuleAsync("MessagePrompt"):expect();
        v30 = v20:GetModuleAsync("TreasureResults"):expect();
        local function v48(v44, v45, v46, v47) --[[ Line: 107 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v31 (ref), v32 (ref), v33 (ref), v34 (ref)
            v31 = v44;
            v32 = v45;
            v33 = v46;
            v34 = v47;
        end;
        if v25:GetArea() then
            local l_v25_Area_0, v50, v51, v52 = v25:GetArea();
            v31 = l_v25_Area_0;
            v32 = v50;
            v33 = v51;
            v34 = v52;
        end;
        v25.StopOpenAll:Connect(function() --[[ Line: 118 ]]
            -- upvalues: v43 (copy)
            v43:ToggleOpenAll(false);
        end);
        v25.TreasureAreaLoaded:Connect(v48);
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.CruiseCrate;
        v16:OnChanged(v5.Player, "Inventory", function(v53) --[[ Line: 129 ]]
            -- upvalues: v43 (copy)
            if not v43._chestName or not v43._openAll then
                return;
            else
                if not v53[v43._chestName] then
                    v43:ToggleOpenAll(false);
                end;
                return;
            end;
        end, true);
        return;
    end;
end;
v41.IsOpening = function(v54) --[[ Line: 142 ]] --[[ Name: IsOpening ]]
    return v54._opening;
end;
local _ = function(v55, v56) --[[ Line: 146 ]] --[[ Name: emitParticles ]]
    if not v55 then
        return;
    else
        for _, v58 in v55:GetDescendants() do
            if v58:IsA("ParticleEmitter") then
                if v56 ~= nil and v56(v58) then
                    v58:Emit(v58:GetAttribute("EmitCount") or 1);
                else
                    v58:Emit(v58:GetAttribute("EmitCount") or 1);
                end;
            end;
        end;
        return;
    end;
end;
v41.OpenTreasure = function(v60, v61, v62, v63, v64) --[[ Line: 165 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v12 (copy), l_CruiseCrate_0 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
    v60._opening = true;
    if not v14:GetByItemName(v61) then
        v60._opening = false;
        return;
    else
        v60._dump = v6.new();
        if not v60._allToggled then
            v60._allToggled = v20:ToggleAll(nil, false);
        end;
        v32.Attachment.SpotLight.Enabled = false;
        v33.Attachment.SpotLight.Enabled = false;
        v19:TogglePlayerControls(false);
        v18:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v62, "\nTreasure Gained:", v63);
        end;
        local v65 = v62[1];
        if typeof(v62[1]) == "table" then
            v65 = v62[1][1];
        end;
        v60:_setRarityVisual(v65, 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v32.CFrame;
        local v66 = v35:Clone();
        v66:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 8 + Vector3.new(0, 0, 0, 0));
        v66.Parent = workspace;
        v60._dump:Add(v66);
        local v67 = {};
        local v68 = {};
        v12:IterateClass(v66.Vehicle.ClickFX, "ParticleEmitter", function(v69) --[[ Line: 213 ]]
            -- upvalues: v67 (copy)
            v69.Enabled = false;
            table.insert(v67, v69);
        end);
        v12:IterateClass(v66.ExplodeFX, "ParticleEmitter", function(v70) --[[ Line: 218 ]]
            -- upvalues: v68 (copy)
            v70.Enabled = false;
            table.insert(v68, v70);
        end);
        local _ = v66:GetScale();
        local _ = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        v60:PlayAnimation(v66, l_CruiseCrate_0.Idle, {
            Priority = Enum.AnimationPriority.Action
        }, nil, true);
        local l_v66_Pivot_0 = v66:GetPivot();
        local v74 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 237 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v60 (copy), v15 (ref), l_v66_Pivot_0 (copy), v74 (copy), v66 (copy)
            v60._dump:Add(v15("CFrameValue", l_v66_Pivot_0, v74, {
                Value = l_v66_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v75) --[[ Line: 240 ]]
                -- upvalues: v66 (ref)
                v66:PivotTo(v75);
            end));
        end;
        local function _() --[[ Line: 245 ]] --[[ Name: doRightTween ]]
            -- upvalues: v60 (copy), v15 (ref), l_v66_Pivot_0 (copy), v74 (copy), v66 (copy)
            v60._dump:Add(v15("CFrameValue", l_v66_Pivot_0, v74, {
                Value = l_v66_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v77) --[[ Line: 248 ]]
                -- upvalues: v66 (ref)
                v66:PivotTo(v77);
            end));
        end;
        local function _() --[[ Line: 253 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v66 (copy), l_v66_Pivot_0 (copy), v60 (copy)
            local v79 = math.random(-25, 25);
            local v81 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v80) --[[ Line: 258 ]]
                -- upvalues: v66 (ref), l_v66_Pivot_0 (ref), v79 (copy)
                v66:PivotTo(l_v66_Pivot_0 * CFrame.Angles(math.rad(v79), math.rad(-v80), 0));
            end);
            v81:Add(function() --[[ Line: 262 ]]
                -- upvalues: v60 (ref), v15 (ref), v66 (ref), l_v66_Pivot_0 (ref)
                v60._dump:Add(v15("CFrameValue", v66:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v66_Pivot_0
                }, function(v82) --[[ Line: 265 ]]
                    -- upvalues: v66 (ref)
                    v66:PivotTo(v82);
                end));
            end);
            v60._dump:Add(v81);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v84 = 1;
        local v85 = #v62;
        if typeof(v62[1]) == "table" then
            v85 = #v62[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v95() --[[ Line: 284 ]] --[[ Name: doTap ]]
            -- upvalues: v84 (ref), v85 (ref), v60 (copy), v12 (ref), v67 (copy), v20 (ref), v22 (ref), v66 (copy), l_TweenService_0 (ref), v15 (ref), l_v66_Pivot_0 (copy), v32 (ref), l_CruiseCrate_0 (ref), v68 (copy), v24 (ref), v63 (copy), v62 (copy), v61 (copy), v64 (copy)
            v84 = v84 + 1;
            if v84 > v85 + 1 and v60._revealingItem then
                return;
            else
                v12:JustEmit(v67);
                if v84 > v85 + 1 and not v60._revealingItem then
                    v60._revealingItem = true;
                    v20:Toggle("TreasureOpen", false);
                    v22:PlaySound({
                        name = "DragonEgg.Reward", 
                        soundGroup = "Master.SFX.UI"
                    });
                    local _ = function() --[[ Line: 315 ]] --[[ Name: fadeAway ]]
                        -- upvalues: v66 (ref), l_TweenService_0 (ref), v60 (ref), v15 (ref), l_v66_Pivot_0 (ref), v32 (ref)
                        for _, v87 in v66:GetDescendants() do
                            if v87:IsA("BasePart") then
                                local v88 = l_TweenService_0:Create(v87, TweenInfo.new(0.4), {
                                    Transparency = 1
                                });
                                do
                                    local l_v88_0 = v88;
                                    v60._dump:Add(l_v88_0.Completed:Once(function() --[[ Line: 321 ]]
                                        -- upvalues: l_v88_0 (ref)
                                        l_v88_0:Destroy();
                                        l_v88_0 = nil;
                                    end));
                                    v60._dump:Add(l_v88_0);
                                    l_v88_0:Play();
                                end;
                            end;
                        end;
                        v60._dump:Add(v15("CFrameValue", l_v66_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v66_Pivot_0 + v32.CFrame.LookVector * -4
                        }, function(v90) --[[ Line: 335 ]]
                            -- upvalues: v66 (ref)
                            v66:PivotTo(v90);
                        end));
                    end;
                    local v93 = v60:PlayAnimation(v66, l_CruiseCrate_0.Open, nil, {
                        Open = function() --[[ Line: 341 ]] --[[ Name: Open ]]
                            -- upvalues: v12 (ref), v68 (ref), v24 (ref), v60 (ref), v63 (ref), v62 (ref), v61 (ref)
                            v12:JustEmit(v68);
                            v24:Shake("VDayGiftShake", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            }, function() --[[ Line: 344 ]]
                                -- upvalues: v60 (ref), v63 (ref), v62 (ref), v61 (ref)
                                v60:RevealItem(v63, v62[#v62], v61);
                            end);
                        end, 
                        Pause = function(v92) --[[ Line: 349 ]] --[[ Name: Pause ]]
                            v92:AdjustSpeed(0);
                        end
                    }, true);
                    if v93 then
                        v60._dump:Add(v93);
                    end;
                    return;
                else
                    v60:PlayAnimation(v66, l_CruiseCrate_0.Shake);
                    local v94 = nil;
                    v94 = if typeof(v62[1]) == "table" then v62[1][math.clamp(v84 - 1, 1, #v62[1])] else v62[math.clamp(v84 - 1, 1, #v62)];
                    if v94 then
                        v60:_setRarityVisual(v94, v84, v64);
                    end;
                    if v84 <= v85 + 1 then
                        v22:PlaySound({
                            name = ("DragonEgg.Upgrade%*"):format(v84 - 1), 
                            soundGroup = "Master.SFX.UI"
                        });
                    end;
                    return;
                end;
            end;
        end;
        v60._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v96, v97) --[[ Line: 427 ]]
            -- upvalues: v37 (ref), v95 (copy)
            if v97 or not table.find(v37, v96.UserInputType) then
                return;
            else
                v95();
                return;
            end;
        end));
        v60._dump:Add(v19.GamepadButtonPressed:Connect(v95));
        return;
    end;
end;
v41.RevealItemsOpened = function(v98, v99, _, _) --[[ Line: 438 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v98._dump:Clean();
    v98._dump = nil;
    v98._opening = false;
    v98._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v98._allToggled then
        v98._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v99, table.clone(v98._allToggled));
    v98._allToggled = nil;
end;
v41.RevealItem = function(v102, v103, _, v105) --[[ Line: 466 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v102._dump:Clean();
    v102._dump:Add(function() --[[ Line: 469 ]]
        -- upvalues: v102 (copy), v32 (ref), v33 (ref)
        v102._dump = nil;
        if not v102._openAll then
            v102._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 476 ]]
            -- upvalues: v32 (ref), v33 (ref), v102 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v102._revealingItem = false;
        end);
        v102._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v102._allToggled.TreasureOpen = nil;
    local function v106() --[[ Line: 489 ]] --[[ Name: handleFinished ]]
        -- upvalues: v106 (ref), v102 (copy), l_RunService_0 (ref), v105 (copy)
        v106 = nil;
        v102._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v102._openAll then
            v102:AttemptOpen(v105, 1, v102._openAll);
        end;
    end;
    if v103.type == "RandomUnit" or v103.type == "Unit" then
        v102._dump:Add(v21.QueueCompleted:Once(v106));
        v25.UnitGained:Fire({
            v103.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v102._openAll or false
        }, table.clone(v102._allToggled));
        return;
    else
        v102._dump:Add(v27.Finished:Once(v106));
        v27:QueueRewards(v103, table.clone(v102._allToggled), v102._openAll);
        task.delay(3.4, function() --[[ Line: 515 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v41.PlayAnimation = function(_, v108, v109, v110, v111, v112) --[[ Line: 521 ]] --[[ Name: PlayAnimation ]]
    if not v108 or not v109 then
        return;
    else
        if v112 == nil then
            v112 = true;
        end;
        v110 = v110 or {};
        local l_AnimationController_0 = v108:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v114 = l_AnimationController_0:LoadAnimation(v109);
            for v115, v116 in v110 do
                v114[v115] = v116;
            end;
            if v111 then
                for v117, v118 in v111 do
                    v114:GetMarkerReachedSignal(v117):Once(function(...) --[[ Line: 547 ]]
                        -- upvalues: v118 (copy), v114 (copy)
                        v118(v114, ...);
                    end);
                end;
            end;
            if v112 then
                v114:Play();
            end;
            return v114;
        end;
    end;
end;
v41.AttemptOpen = function(v119, v120, v121, v122) --[[ Line: 560 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v119:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v121 = v121 or 1;
        v122 = v121 <= 1;
        v119._chestName = v120;
        v119:ToggleOpenAll(v122 or false);
        local v123 = nil;
        v123 = task.delay(0.25, function() --[[ Line: 586 ]]
            -- upvalues: v123 (ref), v28 (ref)
            v123 = nil;
            v28:Toggle(true);
        end);
        if v121 > 1 then
            v17:OpenCustomChestAmount(v120, v121):andThen(function(v124, v125, v126) --[[ Line: 592 ]]
                -- upvalues: v20 (ref), v119 (copy), v120 (copy)
                if not v124 or not v125 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v119:OpenTreasure(v120, v124, v125, v126);
                    return;
                end;
            end):catch(function() --[[ Line: 600 ]]
                -- upvalues: v20 (ref), v119 (copy)
                v20:Toggle("Items", true);
                if v119._openAll then
                    v119:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 606 ]]
                -- upvalues: v28 (ref), v123 (ref), v119 (copy)
                v28:Toggle(false);
                if v123 then
                    task.cancel(v123);
                end;
                v119._processingRequest = false;
            end);
            return;
        else
            v17:Open(v120):andThen(function(v127, v128, v129) --[[ Line: 618 ]]
                -- upvalues: v20 (ref), v119 (copy), v28 (ref), v123 (ref), v120 (copy)
                if not v127 or not v128 then
                    v20:Toggle("Items", true);
                    if v119._openAll then
                        v119:OpenAllFailed(1);
                    end;
                    v119:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v123 then
                        task.cancel(v123);
                    end;
                    v119:OpenTreasure(v120, v127, v128, v129);
                    return;
                end;
            end):catch(function(v130) --[[ Line: 638 ]]
                -- upvalues: v20 (ref), v119 (copy)
                warn("caught err", v130);
                v20:Toggle("Items", true);
                if v119._openAll then
                    v119:OpenAllFailed(2);
                end;
                v119:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 647 ]]
                -- upvalues: v28 (ref), v123 (ref)
                v28:Toggle(false);
                if v123 then
                    task.cancel(v123);
                end;
            end);
            return;
        end;
    end;
end;
v41.OpenAllFailed = function(v131, v132) --[[ Line: 657 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v132)));
    v131:ToggleOpenAll(false);
    if v131._allToggled then
        v20:RevertFromToggleAll(v131._allToggled);
        v131._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v41.ToggleOpenAll = function(v133, v134) --[[ Line: 673 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v133._openAll = v134;
    v26:ReportOpenAll(v134);
end;
v41._setRarityVisual = function(v135, v136, v137, v138) --[[ Line: 678 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v40 (copy), v26 (ref)
    v137 = v137 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v136];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v136];
    end;
    if v135.chestContainer then
        v135.chestContainer.Vehicle.Color = v40[v136];
    end;
    v26:SetIndex(v136, v137, v138, true);
end;
return v41;