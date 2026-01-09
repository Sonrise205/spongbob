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
local v35 = nil;
local v36 = CFrame.Angles(0, 3.141592653589793, 0);
local v37 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v39 = v5.CreateController({
    Name = script.Name, 
    UnitGained = v9.new(), 
    _opening = false, 
    _revealingItem = false
});
v39.KnitInit = function(_) --[[ Line: 72 ]] --[[ Name: KnitInit ]]
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
v39.KnitStart = function(v41) --[[ Line: 86 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v26 (ref), v20 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v25 (ref), v35 (ref), l_ReplicatedStorage_0 (copy), v16 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v26 = v20:GetModuleAsync("TreasureOpen"):expect();
        v27 = v20:GetModuleAsync("Rewards"):expect();
        v28 = v20:GetModuleAsync("PromptOverlay"):expect();
        v29 = v20:GetModuleAsync("MessagePrompt"):expect();
        v30 = v20:GetModuleAsync("TreasureResults"):expect();
        local function v46(v42, v43, v44, v45) --[[ Line: 97 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v31 (ref), v32 (ref), v33 (ref), v34 (ref)
            v31 = v42;
            v32 = v43;
            v33 = v44;
            v34 = v45;
        end;
        if v25:GetArea() then
            local l_v25_Area_0, v48, v49, v50 = v25:GetArea();
            v31 = l_v25_Area_0;
            v32 = v48;
            v33 = v49;
            v34 = v50;
        end;
        v25.StopOpenAll:Connect(function() --[[ Line: 108 ]]
            -- upvalues: v41 (copy)
            v41:ToggleOpenAll(false);
        end);
        v25.TreasureAreaLoaded:Connect(v46);
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.PatriciaCrate;
        v16:OnChanged(v5.Player, "Inventory", function(v51) --[[ Line: 119 ]]
            -- upvalues: v41 (copy)
            if not v41._chestName or not v41._openAll then
                return;
            else
                if not v51[v41._chestName] then
                    v41:ToggleOpenAll(false);
                end;
                return;
            end;
        end, true);
        return;
    end;
end;
v39.IsOpening = function(v52) --[[ Line: 132 ]] --[[ Name: IsOpening ]]
    return v52._opening;
end;
local function v57(v53, v54) --[[ Line: 136 ]] --[[ Name: emitParticles ]]
    if not v53 then
        return;
    else
        for _, v56 in v53:GetDescendants() do
            if v56:IsA("ParticleEmitter") then
                if v54 ~= nil and v54(v56) then
                    v56:Emit(v56:GetAttribute("EmitCount") or 1);
                else
                    v56:Emit(v56:GetAttribute("EmitCount") or 1);
                end;
            end;
        end;
        return;
    end;
end;
v39.OpenTreasure = function(v58, v59, v60, v61, v62) --[[ Line: 155 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), v57 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
    v58._opening = true;
    if not v14:GetByItemName(v59) then
        v58._opening = false;
        return;
    else
        v58._dump = v6.new();
        if not v58._allToggled then
            v58._allToggled = v20:ToggleAll(nil, false);
        end;
        v32.Attachment.SpotLight.Enabled = false;
        v33.Attachment.SpotLight.Enabled = false;
        v19:TogglePlayerControls(false);
        v18:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v60, "\nTreasure Gained:", v61);
        end;
        local v63 = v60[1];
        if typeof(v60[1]) == "table" then
            v63 = v60[1][1];
        end;
        v58:_setRarityVisual(v63, 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v32.CFrame;
        local v64 = v35:Clone();
        v64:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 7 + Vector3.new(0, 0, 0, 0));
        v64.Parent = workspace;
        v58._dump:Add(v64);
        local l_v64_Scale_0 = v64:GetScale();
        local v66 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v64_Scale_0, v66, {
            Value = l_v64_Scale_0 * 1.2
        }, function(v67) --[[ Line: 203 ]]
            -- upvalues: v64 (copy)
            v64:ScaleTo(v67);
        end);
        local l_v64_Pivot_0 = v64:GetPivot();
        local v70 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 210 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v70 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v70, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v71) --[[ Line: 213 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v71);
            end));
        end;
        local function _() --[[ Line: 218 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v70 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v70, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v73) --[[ Line: 221 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v73);
            end));
        end;
        local function v79() --[[ Line: 226 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v58 (copy)
            local v75 = math.random(-25, 25);
            local v77 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v76) --[[ Line: 231 ]]
                -- upvalues: v64 (ref), l_v64_Pivot_0 (ref), v75 (copy)
                v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(math.rad(v75), math.rad(-v76), 0));
            end);
            v77:Add(function() --[[ Line: 235 ]]
                -- upvalues: v58 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v64:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v64_Pivot_0
                }, function(v78) --[[ Line: 238 ]]
                    -- upvalues: v64 (ref)
                    v64:PivotTo(v78);
                end));
            end);
            v58._dump:Add(v77);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v80 = 1;
        local v81 = #v60;
        if typeof(v60[1]) == "table" then
            v81 = #v60[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v94() --[[ Line: 257 ]] --[[ Name: doTap ]]
            -- upvalues: v80 (ref), v81 (ref), v58 (copy), v20 (ref), v22 (ref), v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), l_TweenService_0 (ref), v32 (ref), v57 (ref), v24 (ref), v61 (copy), v60 (copy), v59 (copy), v79 (copy), v62 (copy)
            v80 = v80 + 1;
            if v80 > v81 + 1 and v58._revealingItem then
                return;
            elseif v80 > v81 + 1 and not v58._revealingItem then
                v58._revealingItem = true;
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "DragonEgg.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                local v83 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                    Value = 360
                }, function(v82) --[[ Line: 276 ]]
                    -- upvalues: v64 (ref), l_v64_Pivot_0 (ref)
                    v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(0, math.rad(-v82), 0));
                end);
                local function v89() --[[ Line: 286 ]] --[[ Name: fadeAway ]]
                    -- upvalues: v64 (ref), l_TweenService_0 (ref), v58 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref)
                    for _, v85 in v64:GetDescendants() do
                        if v85:IsA("BasePart") then
                            local v86 = l_TweenService_0:Create(v85, TweenInfo.new(0.4), {
                                Transparency = 1
                            });
                            do
                                local l_v86_0 = v86;
                                v58._dump:Add(l_v86_0.Completed:Once(function() --[[ Line: 292 ]]
                                    -- upvalues: l_v86_0 (ref)
                                    l_v86_0:Destroy();
                                    l_v86_0 = nil;
                                end));
                                v58._dump:Add(l_v86_0);
                                l_v86_0:Play();
                            end;
                        end;
                    end;
                    v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v64_Pivot_0 + v32.CFrame.LookVector * -3.5
                    }, function(v88) --[[ Line: 306 ]]
                        -- upvalues: v64 (ref)
                        v64:PivotTo(v88);
                    end));
                end;
                v83:Add(function() --[[ Line: 331 ]]
                    -- upvalues: v15 (ref), l_v64_Pivot_0 (ref), v32 (ref), v64 (ref), v89 (copy), v57 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                    v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v64_Pivot_0 + v32.CFrame.LookVector * 2.8
                    }, function(v90) --[[ Line: 335 ]]
                        -- upvalues: v64 (ref)
                        v64:PivotTo(v90);
                    end):Add(function() --[[ Line: 339 ]]
                        -- upvalues: v89 (ref), v57 (ref), v64 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                        v89();
                        v57(v64.PrimaryPart, function(_) --[[ Line: 342 ]]
                            return true;
                        end);
                        v24:Shake("VDayGiftShake", {
                            originalPivot = workspace.CurrentCamera.CFrame
                        }, function() --[[ Line: 348 ]]
                            -- upvalues: v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                            if #v61 > 1 then
                                v58:RevealItemsOpened(v61, v60);
                                return;
                            else
                                v58:RevealItem(v61, v60[#v60], v59);
                                return;
                            end;
                        end);
                    end);
                end);
                v58._dump:Add(v83);
                return;
            else
                v79();
                local v92 = nil;
                v92 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v80 - 1, 1, #v60[1])] else v60[math.clamp(v80 - 1, 1, #v60)];
                if v92 then
                    v58:_setRarityVisual(v92, v80, v62);
                end;
                if v80 <= v81 + 1 then
                    v22:PlaySound({
                        name = ("DragonEgg.Upgrade%*"):format(v80 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v57(v64.PrimaryPart, function(v93) --[[ Line: 396 ]]
                    return v93.Parent.Name ~= "Explosion";
                end);
                return;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v95, v96) --[[ Line: 401 ]]
            -- upvalues: v37 (ref), v94 (copy)
            if v96 or not table.find(v37, v95.UserInputType) then
                return;
            else
                v94();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v94));
        return;
    end;
end;
v39.RevealItemsOpened = function(v97, v98, _, _) --[[ Line: 412 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v97._dump:Clean();
    v97._dump = nil;
    v97._opening = false;
    v97._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v97._allToggled then
        v97._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v98, table.clone(v97._allToggled));
    v97._allToggled = nil;
end;
v39.RevealItem = function(v101, v102, _, v104) --[[ Line: 440 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v101._dump:Clean();
    v101._dump:Add(function() --[[ Line: 443 ]]
        -- upvalues: v101 (copy), v32 (ref), v33 (ref)
        v101._dump = nil;
        if not v101._openAll then
            v101._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 450 ]]
            -- upvalues: v32 (ref), v33 (ref), v101 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v101._revealingItem = false;
        end);
        v101._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v101._allToggled.TreasureOpen = nil;
    local function v105() --[[ Line: 463 ]] --[[ Name: handleFinished ]]
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
        task.delay(3.4, function() --[[ Line: 489 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v107, v108, v109, v110, v111) --[[ Line: 495 ]] --[[ Name: PlayAnimation ]]
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
                    v113:GetMarkerReachedSignal(v116):Once(function(...) --[[ Line: 521 ]]
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
v39.AttemptOpen = function(v118, v119, v120, v121) --[[ Line: 534 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v118:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v120 = v120 or 1;
        v121 = v120 <= 1;
        v118._chestName = v119;
        v118:ToggleOpenAll(v121 or false);
        local v122 = nil;
        v122 = task.delay(0.25, function() --[[ Line: 560 ]]
            -- upvalues: v122 (ref), v28 (ref)
            v122 = nil;
            v28:Toggle(true);
        end);
        if v120 > 1 then
            v17:OpenCustomChestAmount(v119, v120):andThen(function(v123, v124, v125) --[[ Line: 566 ]]
                -- upvalues: v20 (ref), v118 (copy), v119 (copy)
                if not v123 or not v124 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v118:OpenTreasure(v119, v123, v124, v125);
                    return;
                end;
            end):catch(function() --[[ Line: 574 ]]
                -- upvalues: v20 (ref), v118 (copy)
                v20:Toggle("Items", true);
                if v118._openAll then
                    v118:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 580 ]]
                -- upvalues: v28 (ref), v122 (ref), v118 (copy)
                v28:Toggle(false);
                if v122 then
                    task.cancel(v122);
                end;
                v118._processingRequest = false;
            end);
            return;
        else
            v17:Open(v119):andThen(function(v126, v127, v128) --[[ Line: 592 ]]
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
            end):catch(function(v129) --[[ Line: 612 ]]
                -- upvalues: v20 (ref), v118 (copy)
                warn("caught err", v129);
                v20:Toggle("Items", true);
                if v118._openAll then
                    v118:OpenAllFailed(2);
                end;
                v118:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 621 ]]
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
v39.OpenAllFailed = function(v130, v131) --[[ Line: 631 ]] --[[ Name: OpenAllFailed ]]
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
v39.ToggleOpenAll = function(v132, v133) --[[ Line: 647 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v132._openAll = v133;
    v26:ReportOpenAll(v133);
end;
v39._setRarityVisual = function(_, v135, v136, v137) --[[ Line: 652 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v136 = v136 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v135];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v135];
    end;
    v26:SetIndex(v135, v136, v137, true);
end;
return v39;