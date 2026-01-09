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
local v36 = CFrame.Angles(0, 2.530727415391778, 0);
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
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.FeastCrate;
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
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v12 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), v24 (ref), v57 (copy), l_UserInputService_0 (copy), v37 (copy)
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
        v64:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 10 + Vector3.new(0, 0, 0, 0));
        v64.Parent = workspace;
        v58._dump:Add(v64);
        local v65 = {};
        local v66 = {};
        v12:IterateClass(v64.ClickFX, "ParticleEmitter", function(v67) --[[ Line: 203 ]]
            -- upvalues: v65 (copy)
            table.insert(v65, v67);
        end);
        v12:IterateClass(v64.OpenFX, "ParticleEmitter", function(v68) --[[ Line: 207 ]]
            -- upvalues: v66 (copy)
            table.insert(v66, v68);
        end);
        local l_v64_Scale_0 = v64:GetScale();
        local v70 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v64_Scale_0, v70, {
            Value = l_v64_Scale_0 * 1.2
        }, function(v71) --[[ Line: 214 ]]
            -- upvalues: v64 (copy)
            v64:ScaleTo(v71);
        end);
        local l_v64_Pivot_0 = v64:GetPivot();
        local v74 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 221 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v74 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v74, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v75) --[[ Line: 224 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v75);
            end));
        end;
        local function _() --[[ Line: 229 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v74 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v74, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v77) --[[ Line: 232 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v77);
            end));
        end;
        local function v83() --[[ Line: 237 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v58 (copy)
            local v79 = math.random(-25, 25);
            local v81 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v80) --[[ Line: 242 ]]
                -- upvalues: v64 (ref), l_v64_Pivot_0 (ref), v79 (copy)
                v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(math.rad(v79), math.rad(-v80), 0));
            end);
            v81:Add(function() --[[ Line: 246 ]]
                -- upvalues: v58 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v64:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v64_Pivot_0
                }, function(v82) --[[ Line: 249 ]]
                    -- upvalues: v64 (ref)
                    v64:PivotTo(v82);
                end));
            end);
            v58._dump:Add(v81);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v84 = 1;
        local v85 = #v60;
        if typeof(v60[1]) == "table" then
            v85 = #v60[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v97() --[[ Line: 268 ]] --[[ Name: doTap ]]
            -- upvalues: v84 (ref), v85 (ref), v58 (copy), v12 (ref), v65 (copy), v20 (ref), v22 (ref), v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), l_TweenService_0 (ref), v32 (ref), v66 (copy), v24 (ref), v61 (copy), v60 (copy), v59 (copy), v83 (copy), v62 (copy), v57 (ref)
            v84 = v84 + 1;
            if v84 > v85 + 1 and v58._revealingItem then
                return;
            else
                v12:JustEmit(v65);
                if v84 > v85 + 1 and not v58._revealingItem then
                    v58._revealingItem = true;
                    v20:Toggle("TreasureOpen", false);
                    v22:PlaySound({
                        name = "DragonEgg.Reward", 
                        soundGroup = "Master.SFX.UI"
                    });
                    local v87 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                        Value = 360
                    }, function(v86) --[[ Line: 289 ]]
                        -- upvalues: v64 (ref), l_v64_Pivot_0 (ref)
                        v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(0, math.rad(-v86), 0));
                    end);
                    local function v93() --[[ Line: 299 ]] --[[ Name: fadeAway ]]
                        -- upvalues: v64 (ref), l_TweenService_0 (ref), v58 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref)
                        for _, v89 in v64:GetDescendants() do
                            if v89:IsA("BasePart") then
                                local v90 = l_TweenService_0:Create(v89, TweenInfo.new(0.4), {
                                    Transparency = 1
                                });
                                do
                                    local l_v90_0 = v90;
                                    v58._dump:Add(l_v90_0.Completed:Once(function() --[[ Line: 305 ]]
                                        -- upvalues: l_v90_0 (ref)
                                        l_v90_0:Destroy();
                                        l_v90_0 = nil;
                                    end));
                                    v58._dump:Add(l_v90_0);
                                    l_v90_0:Play();
                                end;
                            end;
                        end;
                        v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * -5
                        }, function(v92) --[[ Line: 319 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v92);
                        end));
                    end;
                    v87:Add(function() --[[ Line: 344 ]]
                        -- upvalues: v15 (ref), l_v64_Pivot_0 (ref), v32 (ref), v64 (ref), v93 (copy), v12 (ref), v66 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                        v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * 4
                        }, function(v94) --[[ Line: 348 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v94);
                        end):Add(function() --[[ Line: 352 ]]
                            -- upvalues: v93 (ref), v12 (ref), v66 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                            v93();
                            v12:JustEmit(v66);
                            v24:Shake("VDayGiftShake", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            }, function() --[[ Line: 359 ]]
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
                    v58._dump:Add(v87);
                    return;
                else
                    v83();
                    local v95 = nil;
                    v95 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v84 - 1, 1, #v60[1])] else v60[math.clamp(v84 - 1, 1, #v60)];
                    if v95 then
                        v58:_setRarityVisual(v95, v84, v62);
                    end;
                    if v84 <= v85 + 1 then
                        v22:PlaySound({
                            name = ("DragonEgg.Upgrade%*"):format(v84 - 1), 
                            soundGroup = "Master.SFX.UI"
                        });
                    end;
                    v57(v64.PrimaryPart, function(v96) --[[ Line: 407 ]]
                        return v96.Parent.Name ~= "Explosion";
                    end);
                    return;
                end;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v98, v99) --[[ Line: 412 ]]
            -- upvalues: v37 (ref), v97 (copy)
            if v99 or not table.find(v37, v98.UserInputType) then
                return;
            else
                v97();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v97));
        return;
    end;
end;
v39.RevealItemsOpened = function(v100, v101, _, _) --[[ Line: 423 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v100._dump:Clean();
    v100._dump = nil;
    v100._opening = false;
    v100._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v100._allToggled then
        v100._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v101, table.clone(v100._allToggled));
    v100._allToggled = nil;
end;
v39.RevealItem = function(v104, v105, _, v107) --[[ Line: 451 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v104._dump:Clean();
    v104._dump:Add(function() --[[ Line: 454 ]]
        -- upvalues: v104 (copy), v32 (ref), v33 (ref)
        v104._dump = nil;
        if not v104._openAll then
            v104._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 461 ]]
            -- upvalues: v32 (ref), v33 (ref), v104 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v104._revealingItem = false;
        end);
        v104._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v104._allToggled.TreasureOpen = nil;
    local function v108() --[[ Line: 474 ]] --[[ Name: handleFinished ]]
        -- upvalues: v108 (ref), v104 (copy), l_RunService_0 (ref), v107 (copy)
        v108 = nil;
        v104._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v104._openAll then
            v104:AttemptOpen(v107, 1, v104._openAll);
        end;
    end;
    if v105.type == "RandomUnit" or v105.type == "Unit" then
        v104._dump:Add(v21.QueueCompleted:Once(v108));
        v25.UnitGained:Fire({
            v105.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v104._openAll or false
        }, table.clone(v104._allToggled));
        return;
    else
        v104._dump:Add(v27.Finished:Once(v108));
        v27:QueueRewards(v105, table.clone(v104._allToggled), v104._openAll);
        task.delay(3.4, function() --[[ Line: 500 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v110, v111, v112, v113, v114) --[[ Line: 506 ]] --[[ Name: PlayAnimation ]]
    if not v110 or not v111 then
        return;
    else
        if v114 == nil then
            v114 = true;
        end;
        v112 = v112 or {};
        local l_AnimationController_0 = v110:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v116 = l_AnimationController_0:LoadAnimation(v111);
            for v117, v118 in v112 do
                v116[v117] = v118;
            end;
            if v113 then
                for v119, v120 in v113 do
                    v116:GetMarkerReachedSignal(v119):Once(function(...) --[[ Line: 532 ]]
                        -- upvalues: v120 (copy), v116 (copy)
                        v120(v116, ...);
                    end);
                end;
            end;
            if v114 then
                v116:Play();
            end;
            return v116;
        end;
    end;
end;
v39.AttemptOpen = function(v121, v122, v123, v124) --[[ Line: 545 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v121:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v123 = v123 or 1;
        v124 = v123 <= 1;
        v121._chestName = v122;
        v121:ToggleOpenAll(v124 or false);
        local v125 = nil;
        v125 = task.delay(0.25, function() --[[ Line: 571 ]]
            -- upvalues: v125 (ref), v28 (ref)
            v125 = nil;
            v28:Toggle(true);
        end);
        if v123 > 1 then
            v17:OpenCustomChestAmount(v122, v123):andThen(function(v126, v127, v128) --[[ Line: 577 ]]
                -- upvalues: v20 (ref), v121 (copy), v122 (copy)
                if not v126 or not v127 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v121:OpenTreasure(v122, v126, v127, v128);
                    return;
                end;
            end):catch(function() --[[ Line: 585 ]]
                -- upvalues: v20 (ref), v121 (copy)
                v20:Toggle("Items", true);
                if v121._openAll then
                    v121:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 591 ]]
                -- upvalues: v28 (ref), v125 (ref), v121 (copy)
                v28:Toggle(false);
                if v125 then
                    task.cancel(v125);
                end;
                v121._processingRequest = false;
            end);
            return;
        else
            v17:Open(v122):andThen(function(v129, v130, v131) --[[ Line: 603 ]]
                -- upvalues: v20 (ref), v121 (copy), v28 (ref), v125 (ref), v122 (copy)
                if not v129 or not v130 then
                    v20:Toggle("Items", true);
                    if v121._openAll then
                        v121:OpenAllFailed(1);
                    end;
                    v121:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v125 then
                        task.cancel(v125);
                    end;
                    v121:OpenTreasure(v122, v129, v130, v131);
                    return;
                end;
            end):catch(function(v132) --[[ Line: 623 ]]
                -- upvalues: v20 (ref), v121 (copy)
                warn("caught err", v132);
                v20:Toggle("Items", true);
                if v121._openAll then
                    v121:OpenAllFailed(2);
                end;
                v121:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 632 ]]
                -- upvalues: v28 (ref), v125 (ref)
                v28:Toggle(false);
                if v125 then
                    task.cancel(v125);
                end;
            end);
            return;
        end;
    end;
end;
v39.OpenAllFailed = function(v133, v134) --[[ Line: 642 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v134)));
    v133:ToggleOpenAll(false);
    if v133._allToggled then
        v20:RevertFromToggleAll(v133._allToggled);
        v133._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v39.ToggleOpenAll = function(v135, v136) --[[ Line: 658 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v135._openAll = v136;
    v26:ReportOpenAll(v136);
end;
v39._setRarityVisual = function(_, v138, v139, v140) --[[ Line: 663 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v139 = v139 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v138];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v138];
    end;
    v26:SetIndex(v138, v139, v140, true);
end;
return v39;