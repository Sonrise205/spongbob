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
        v25.TreasureAreaLoaded:Connect(v46);
        v25.StopOpenAll:Connect(function() --[[ Line: 110 ]]
            -- upvalues: v41 (copy)
            v41:ToggleOpenAll(false);
        end);
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.RogueCrate;
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
local function v58(v53, v54, v55) --[[ Line: 136 ]] --[[ Name: emitParticles ]]
    if not v53 then
        return;
    else
        v55 = v55 or 1;
        for _, v57 in v53:GetDescendants() do
            if v57:IsA("ParticleEmitter") then
                if v54 ~= nil and v54(v57) then
                    v57:Emit(v57:GetAttribute("EmitCount") or 1);
                else
                    v57:Emit((v57:GetAttribute("EmitCount") or 1) * v55);
                end;
            end;
        end;
        return;
    end;
end;
v39.OpenTreasure = function(v59, v60, v61, v62, v63) --[[ Line: 157 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), v58 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
    v59._opening = true;
    if not v14:GetByItemName(v60) then
        v59._opening = false;
        return;
    else
        v59._dump = v6.new();
        if not v59._allToggled then
            v59._allToggled = v20:ToggleAll(nil, false);
        end;
        v32.Attachment.SpotLight.Enabled = false;
        v33.Attachment.SpotLight.Enabled = false;
        v19:TogglePlayerControls(false);
        v18:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v61, "\nTreasure Gained:", v62);
        end;
        local v64 = v61[1];
        if typeof(v61[1]) == "table" then
            v64 = v61[1][1];
        end;
        v59:_setRarityVisual(v64, 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v32.CFrame;
        local v65 = v35:Clone();
        v65:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 7 + Vector3.new(0, 0, 0, 0));
        v65.Parent = workspace;
        v59._dump:Add(v65);
        local l_v65_Scale_0 = v65:GetScale();
        local v67 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v65_Scale_0, v67, {
            Value = l_v65_Scale_0 * 1.2
        }, function(v68) --[[ Line: 205 ]]
            -- upvalues: v65 (copy)
            v65:ScaleTo(v68);
        end);
        local l_v65_Pivot_0 = v65:GetPivot();
        local v71 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 212 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v59 (copy), v15 (ref), l_v65_Pivot_0 (copy), v71 (copy), v65 (copy)
            v59._dump:Add(v15("CFrameValue", l_v65_Pivot_0, v71, {
                Value = l_v65_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v72) --[[ Line: 215 ]]
                -- upvalues: v65 (ref)
                v65:PivotTo(v72);
            end));
        end;
        local function _() --[[ Line: 220 ]] --[[ Name: doRightTween ]]
            -- upvalues: v59 (copy), v15 (ref), l_v65_Pivot_0 (copy), v71 (copy), v65 (copy)
            v59._dump:Add(v15("CFrameValue", l_v65_Pivot_0, v71, {
                Value = l_v65_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v74) --[[ Line: 223 ]]
                -- upvalues: v65 (ref)
                v65:PivotTo(v74);
            end));
        end;
        local function v80() --[[ Line: 228 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v65 (copy), l_v65_Pivot_0 (copy), v59 (copy)
            local v76 = math.random(-25, 25);
            local v78 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v77) --[[ Line: 233 ]]
                -- upvalues: v65 (ref), l_v65_Pivot_0 (ref), v76 (copy)
                v65:PivotTo(l_v65_Pivot_0 * CFrame.Angles(math.rad(v76), math.rad(-v77), 0));
            end);
            v78:Add(function() --[[ Line: 237 ]]
                -- upvalues: v59 (ref), v15 (ref), v65 (ref), l_v65_Pivot_0 (ref)
                v59._dump:Add(v15("CFrameValue", v65:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v65_Pivot_0
                }, function(v79) --[[ Line: 240 ]]
                    -- upvalues: v65 (ref)
                    v65:PivotTo(v79);
                end));
            end);
            v59._dump:Add(v78);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v81 = 1;
        local v82 = #v61;
        if typeof(v61[1]) == "table" then
            v82 = #v61[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local l_Pivot_0 = v65.Top:GetPivot();
        local function v98() --[[ Line: 261 ]] --[[ Name: doTap ]]
            -- upvalues: v81 (ref), v82 (ref), v59 (copy), v20 (ref), v22 (ref), v15 (ref), v65 (copy), l_v65_Pivot_0 (copy), l_TweenService_0 (ref), v32 (ref), l_Pivot_0 (copy), v58 (ref), v24 (ref), v62 (copy), v61 (copy), v60 (copy), v80 (copy), v63 (copy)
            v81 = v81 + 1;
            if v81 > v82 + 1 and v59._revealingItem then
                return;
            elseif v81 > v82 + 1 and not v59._revealingItem then
                v59._revealingItem = true;
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "DragonEgg.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                local v85 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                    Value = 360
                }, function(v84) --[[ Line: 280 ]]
                    -- upvalues: v65 (ref), l_v65_Pivot_0 (ref)
                    v65:PivotTo(l_v65_Pivot_0 * CFrame.Angles(0, math.rad(-v84), 0));
                end);
                local function v91() --[[ Line: 290 ]] --[[ Name: fadeAway ]]
                    -- upvalues: v65 (ref), l_TweenService_0 (ref), v59 (ref), v15 (ref), l_v65_Pivot_0 (ref), v32 (ref)
                    for _, v87 in v65:GetDescendants() do
                        if v87:IsA("BasePart") then
                            local v88 = l_TweenService_0:Create(v87, TweenInfo.new(0.4), {
                                Transparency = 1
                            });
                            do
                                local l_v88_0 = v88;
                                v59._dump:Add(l_v88_0.Completed:Once(function() --[[ Line: 296 ]]
                                    -- upvalues: l_v88_0 (ref)
                                    l_v88_0:Destroy();
                                    l_v88_0 = nil;
                                end));
                                v59._dump:Add(l_v88_0);
                                l_v88_0:Play();
                            end;
                        end;
                    end;
                    v59._dump:Add(v15("CFrameValue", l_v65_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v65_Pivot_0 + v32.CFrame.LookVector * -3.5
                    }, function(v90) --[[ Line: 310 ]]
                        -- upvalues: v65 (ref)
                        v65:PivotTo(v90);
                    end));
                end;
                v85:Add(function() --[[ Line: 335 ]]
                    -- upvalues: v15 (ref), l_Pivot_0 (ref), v65 (ref), l_v65_Pivot_0 (ref), v32 (ref), v91 (copy), v58 (ref), v24 (ref), v62 (ref), v59 (ref), v61 (ref), v60 (ref)
                    local v92 = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
                    v15("CFrameValue", l_Pivot_0, v92, {
                        Value = l_Pivot_0 * CFrame.Angles(1.5707963267948966, 0, 0)
                    }, function(v93) --[[ Line: 352 ]]
                        -- upvalues: v65 (ref)
                        v65.Top:PivotTo(v93);
                    end):Add(function() --[[ Line: 356 ]]
                        -- upvalues: v15 (ref), l_v65_Pivot_0 (ref), v32 (ref), v65 (ref), v91 (ref), v58 (ref), v24 (ref), v62 (ref), v59 (ref), v61 (ref), v60 (ref)
                        task.wait(0.25);
                        v15("CFrameValue", l_v65_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v65_Pivot_0 + v32.CFrame.LookVector * 2.8
                        }, function(v94) --[[ Line: 361 ]]
                            -- upvalues: v65 (ref)
                            v65:PivotTo(v94);
                        end):Add(function() --[[ Line: 365 ]]
                            -- upvalues: v91 (ref), v58 (ref), v65 (ref), v24 (ref), v62 (ref), v59 (ref), v61 (ref), v60 (ref)
                            v91();
                            v58(v65.PrimaryPart, function(_) --[[ Line: 368 ]]
                                return true;
                            end, 2);
                            v24:Shake("VDayGiftShake", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            }, function() --[[ Line: 374 ]]
                                -- upvalues: v62 (ref), v59 (ref), v61 (ref), v60 (ref)
                                if #v62 > 1 then
                                    v59:RevealItemsOpened(v62, v61);
                                    return;
                                else
                                    v59:RevealItem(v62, v61[#v61], v60);
                                    return;
                                end;
                            end);
                        end);
                    end);
                end);
                v59._dump:Add(v85);
                return;
            else
                v80();
                local v96 = nil;
                v96 = if typeof(v61[1]) == "table" then v61[1][math.clamp(v81 - 1, 1, #v61[1])] else v61[math.clamp(v81 - 1, 1, #v61)];
                if v96 then
                    v59:_setRarityVisual(v96, v81, v63);
                end;
                if v81 <= v82 + 1 then
                    v22:PlaySound({
                        name = ("DragonEgg.Upgrade%*"):format(v81 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v58(v65.PrimaryPart, function(_) --[[ Line: 422 ]]
                    return true;
                end);
                return;
            end;
        end;
        v59._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v99, v100) --[[ Line: 427 ]]
            -- upvalues: v37 (ref), v98 (copy)
            if v100 or not table.find(v37, v99.UserInputType) then
                return;
            else
                v98();
                return;
            end;
        end));
        v59._dump:Add(v19.GamepadButtonPressed:Connect(v98));
        return;
    end;
end;
v39.RevealItemsOpened = function(v101, v102, _, _) --[[ Line: 438 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v101._dump:Clean();
    v101._dump = nil;
    v101._opening = false;
    v101._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v101._allToggled then
        v101._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v102, table.clone(v101._allToggled));
    v101._allToggled = nil;
end;
v39.RevealItem = function(v105, v106, _, v108) --[[ Line: 466 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v105._dump:Clean();
    v105._dump:Add(function() --[[ Line: 469 ]]
        -- upvalues: v105 (copy), v32 (ref), v33 (ref)
        v105._dump = nil;
        if not v105._openAll then
            v105._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 476 ]]
            -- upvalues: v32 (ref), v33 (ref), v105 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v105._revealingItem = false;
        end);
        v105._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v105._allToggled.TreasureOpen = nil;
    local function v109() --[[ Line: 489 ]] --[[ Name: handleFinished ]]
        -- upvalues: v109 (ref), v105 (copy), l_RunService_0 (ref), v108 (copy)
        v109 = nil;
        v105._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v105._openAll then
            v105:AttemptOpen(v108, 1, v105._openAll);
        end;
    end;
    if v106.type == "RandomUnit" or v106.type == "Unit" then
        v105._dump:Add(v21.QueueCompleted:Once(v109));
        v25.UnitGained:Fire({
            v106.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v105._openAll or false
        }, table.clone(v105._allToggled));
        return;
    else
        v105._dump:Add(v27.Finished:Once(v109));
        v27:QueueRewards(v106, table.clone(v105._allToggled), v105._openAll);
        task.delay(3.4, function() --[[ Line: 515 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v111, v112, v113, v114, v115) --[[ Line: 521 ]] --[[ Name: PlayAnimation ]]
    if not v111 or not v112 then
        return;
    else
        if v115 == nil then
            v115 = true;
        end;
        v113 = v113 or {};
        local l_AnimationController_0 = v111:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v117 = l_AnimationController_0:LoadAnimation(v112);
            for v118, v119 in v113 do
                v117[v118] = v119;
            end;
            if v114 then
                for v120, v121 in v114 do
                    v117:GetMarkerReachedSignal(v120):Once(function(...) --[[ Line: 547 ]]
                        -- upvalues: v121 (copy), v117 (copy)
                        v121(v117, ...);
                    end);
                end;
            end;
            if v115 then
                v117:Play();
            end;
            return v117;
        end;
    end;
end;
v39.AttemptOpen = function(v122, v123, v124, v125) --[[ Line: 560 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v122:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v124 = v124 or 1;
        v125 = v124 <= 1;
        v122._chestName = v123;
        v122:ToggleOpenAll(v125 or false);
        local v126 = nil;
        v126 = task.delay(0.25, function() --[[ Line: 586 ]]
            -- upvalues: v126 (ref), v28 (ref)
            v126 = nil;
            v28:Toggle(true);
        end);
        if v124 > 1 then
            v17:OpenCustomChestAmount(v123, v124):andThen(function(v127, v128, v129) --[[ Line: 592 ]]
                -- upvalues: v20 (ref), v122 (copy), v123 (copy)
                if not v127 or not v128 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v122:OpenTreasure(v123, v127, v128, v129);
                    return;
                end;
            end):catch(function() --[[ Line: 600 ]]
                -- upvalues: v20 (ref), v122 (copy)
                v20:Toggle("Items", true);
                if v122._openAll then
                    v122:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 606 ]]
                -- upvalues: v28 (ref), v126 (ref), v122 (copy)
                v28:Toggle(false);
                if v126 then
                    task.cancel(v126);
                end;
                v122._processingRequest = false;
            end);
            return;
        else
            v17:Open(v123):andThen(function(v130, v131, v132) --[[ Line: 618 ]]
                -- upvalues: v20 (ref), v122 (copy), v28 (ref), v126 (ref), v123 (copy)
                if not v130 or not v131 then
                    v20:Toggle("Items", true);
                    if v122._openAll then
                        v122:OpenAllFailed(1);
                    end;
                    v122:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v126 then
                        task.cancel(v126);
                    end;
                    v122:OpenTreasure(v123, v130, v131, v132);
                    return;
                end;
            end):catch(function(v133) --[[ Line: 638 ]]
                -- upvalues: v20 (ref), v122 (copy)
                warn("caught err", v133);
                v20:Toggle("Items", true);
                if v122._openAll then
                    v122:OpenAllFailed(2);
                end;
                v122:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 647 ]]
                -- upvalues: v28 (ref), v126 (ref)
                v28:Toggle(false);
                if v126 then
                    task.cancel(v126);
                end;
            end);
            return;
        end;
    end;
end;
v39.OpenAllFailed = function(v134, v135) --[[ Line: 657 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v135)));
    v134:ToggleOpenAll(false);
    if v134._allToggled then
        v20:RevertFromToggleAll(v134._allToggled);
        v134._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v39.ToggleOpenAll = function(v136, v137) --[[ Line: 673 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v136._openAll = v137;
    v26:ReportOpenAll(v137);
end;
v39._setRarityVisual = function(_, v139, v140, v141) --[[ Line: 678 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v140 = v140 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v139];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v139];
    end;
    v26:SetIndex(v139, v140, v141, true);
end;
return v39;