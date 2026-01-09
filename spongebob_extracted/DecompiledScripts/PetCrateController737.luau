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
local v36 = CFrame.Angles(0, 2.792526803190927, 0);
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
    -- upvalues: v11 (copy), v30 (ref), v20 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v25 (ref), v35 (ref), l_ReplicatedStorage_0 (copy), v16 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v30 = v20:GetModuleAsync("TreasureResults"):expect();
        v26 = v20:GetModuleAsync("TreasureOpen"):expect();
        v27 = v20:GetModuleAsync("Rewards"):expect();
        v28 = v20:GetModuleAsync("PromptOverlay"):expect();
        v29 = v20:GetModuleAsync("MessagePrompt"):expect();
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
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.PetCrate;
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
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v15 (copy), v22 (ref), l_ReplicatedStorage_0 (copy), v57 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
    v58._opening = true;
    local l_v14_ByItemName_0 = v14:GetByItemName(v59);
    if not l_v14_ByItemName_0 then
        warn("no chest info");
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
        local v64 = v60[1];
        if typeof(v60[1]) == "table" then
            v64 = v60[1][1];
        end;
        if l_v14_ByItemName_0.Rarity or l_v14_ByItemName_0.rarity then
            v64 = l_v14_ByItemName_0.Rarity or l_v14_ByItemName_0.rarity;
        end;
        v58:_setRarityVisual(v64, 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v32.CFrame;
        local v65 = v35:Clone();
        v65:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 7 + Vector3.new(0, 0, 0, 0));
        v65.Parent = workspace;
        v58._dump:Add(v65);
        local _ = v65:GetScale();
        local _ = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local l_v65_Pivot_0 = v65:GetPivot();
        local v69 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 215 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v65_Pivot_0 (copy), v69 (copy), v65 (copy)
            v58._dump:Add(v15("CFrameValue", l_v65_Pivot_0, v69, {
                Value = l_v65_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v70) --[[ Line: 218 ]]
                -- upvalues: v65 (ref)
                v65:PivotTo(v70);
            end));
        end;
        local function _() --[[ Line: 223 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v65_Pivot_0 (copy), v69 (copy), v65 (copy)
            v58._dump:Add(v15("CFrameValue", l_v65_Pivot_0, v69, {
                Value = l_v65_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v72) --[[ Line: 226 ]]
                -- upvalues: v65 (ref)
                v65:PivotTo(v72);
            end));
        end;
        local function _() --[[ Line: 231 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v65 (copy), l_v65_Pivot_0 (copy), v58 (copy)
            local v74 = math.random(-25, 25);
            local v76 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v75) --[[ Line: 236 ]]
                -- upvalues: v65 (ref), l_v65_Pivot_0 (ref), v74 (copy)
                v65:PivotTo(l_v65_Pivot_0 * CFrame.Angles(math.rad(v74), math.rad(-v75), 0));
            end);
            v76:Add(function() --[[ Line: 240 ]]
                -- upvalues: v58 (ref), v15 (ref), v65 (ref), l_v65_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v65:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v65_Pivot_0
                }, function(v77) --[[ Line: 243 ]]
                    -- upvalues: v65 (ref)
                    v65:PivotTo(v77);
                end));
            end);
            v58._dump:Add(v76);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v79 = 1;
        local v80 = #v60;
        if typeof(v60[1]) == "table" then
            v80 = #v60[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local l_PetCrate_0 = l_ReplicatedStorage_0.Animations.PetCrate;
        local v82 = v58:PlayAnimation(v65, l_PetCrate_0.Shake, {
            Looped = false
        }, nil, false);
        local v84 = v58:PlayAnimation(v65, l_PetCrate_0.Open, {
            Looped = false
        }, {
            Open = function() --[[ Line: 267 ]] --[[ Name: Open ]]
                -- upvalues: v57 (ref), v65 (copy), v24 (ref), v61 (copy), v58 (copy), v60 (copy), v59 (copy)
                v57(v65.OpenPart, function(_) --[[ Line: 268 ]]
                    return true;
                end);
                v24:Shake("VDayGiftShake", {
                    originalPivot = workspace.CurrentCamera.CFrame
                }, function() --[[ Line: 273 ]]
                    -- upvalues: v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                    warn("finished shaking", #v61);
                    if #v61 > 1 then
                        v58:RevealItemsOpened(v61, v60);
                        return;
                    else
                        v58:RevealItem(v61, v60[#v60], v59);
                        return;
                    end;
                end);
            end
        }, false);
        local function v86() --[[ Line: 286 ]] --[[ Name: doTap ]]
            -- upvalues: v79 (ref), v80 (ref), v58 (copy), v20 (ref), v22 (ref), v84 (copy), v82 (copy), v60 (copy), v62 (copy), v57 (ref), v65 (copy)
            v79 = v79 + 1;
            if v79 > v80 + 1 and v58._revealingItem then
                return;
            elseif v79 > v80 + 1 and not v58._revealingItem then
                v58._revealingItem = true;
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "DragonEgg.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                warn("playing open track");
                v84:Play();
                return;
            else
                v82:Play();
                local v85 = nil;
                v85 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v79 - 1, 1, #v60[1])] else v60[math.clamp(v79 - 1, 1, #v60)];
                if v85 then
                    v58:_setRarityVisual(v85, v79, v62);
                end;
                if v79 <= v80 + 1 then
                    v22:PlaySound({
                        name = ("DragonEgg.Upgrade%*"):format(v79 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v57(v65.ShakePart, function() --[[ Line: 329 ]]
                    return true;
                end);
                return;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v87, v88) --[[ Line: 334 ]]
            -- upvalues: v37 (ref), v86 (copy)
            if v88 or not table.find(v37, v87.UserInputType) then
                return;
            else
                v86();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v86));
        return;
    end;
end;
v39.RevealItemsOpened = function(v89, v90, _, _) --[[ Line: 345 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v89._dump:Clean();
    v89._dump = nil;
    v89._opening = false;
    v89._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v89._allToggled then
        v89._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v90, table.clone(v89._allToggled));
    v89._allToggled = nil;
end;
v39.RevealItem = function(v93, v94, _, v96) --[[ Line: 373 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v93._dump:Clean();
    v93._dump:Add(function() --[[ Line: 376 ]]
        -- upvalues: v93 (copy), v32 (ref), v33 (ref)
        v93._dump = nil;
        if not v93._openAll then
            v93._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 383 ]]
            -- upvalues: v32 (ref), v33 (ref), v93 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v93._revealingItem = false;
        end);
        v93._opening = false;
    end);
    v32.Attachment.SpotLight.Enabled = false;
    v33.Attachment.SpotLight.Enabled = false;
    v20:Toggle("TreasureOpen", false):await();
    v93._allToggled.TreasureOpen = nil;
    local function v97() --[[ Line: 399 ]] --[[ Name: handleFinished ]]
        -- upvalues: v97 (ref), v93 (copy), l_RunService_0 (ref), v96 (copy)
        v97 = nil;
        v93._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v93._openAll then
            v93:AttemptOpen(v96, 1, v93._openAll);
        end;
    end;
    if v94.type == "RandomUnit" or v94.type == "Unit" then
        v93._dump:Add(v21.QueueCompleted:Once(v97));
        v25.UnitGained:Fire({
            v94.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v93._openAll or false
        }, table.clone(v93._allToggled));
        return;
    else
        v93._dump:Add(v27.Finished:Once(v97));
        v27:QueueRewards(v94, table.clone(v93._allToggled), v93._openAll);
        task.delay(3.4, function() --[[ Line: 425 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v99, v100, v101, v102, v103) --[[ Line: 431 ]] --[[ Name: PlayAnimation ]]
    if not v99 or not v100 then
        return;
    else
        if v103 == nil then
            v103 = true;
        end;
        v101 = v101 or {};
        local l_AnimationController_0 = v99:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v105 = l_AnimationController_0:LoadAnimation(v100);
            for v106, v107 in v101 do
                v105[v106] = v107;
            end;
            if v102 then
                for v108, v109 in v102 do
                    v105:GetMarkerReachedSignal(v108):Once(function(...) --[[ Line: 457 ]]
                        -- upvalues: v109 (copy), v105 (copy)
                        v109(v105, ...);
                    end);
                end;
            end;
            if v103 then
                v105:Play();
            end;
            return v105;
        end;
    end;
end;
v39.AttemptOpen = function(v110, v111, v112, v113) --[[ Line: 470 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v110:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v110._chestName = v111;
        v110:ToggleOpenAll(v113 or false);
        local v114 = nil;
        v114 = task.delay(0.25, function() --[[ Line: 494 ]]
            -- upvalues: v114 (ref), v28 (ref)
            v114 = nil;
            v28:Toggle(true);
        end);
        v112 = v112 or 1;
        v113 = v112 <= 1;
        if v112 > 1 then
            v17:OpenCustomChestAmount(v111, v112):andThen(function(v115, v116, v117) --[[ Line: 503 ]]
                -- upvalues: v20 (ref), v110 (copy), v111 (copy)
                if not v115 or not v116 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v110:OpenTreasure(v111, v115, v116, v117);
                    return;
                end;
            end):catch(function() --[[ Line: 511 ]]
                -- upvalues: v20 (ref), v110 (copy)
                v20:Toggle("Items", true);
                if v110._openAll then
                    v110:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 517 ]]
                -- upvalues: v110 (copy), v28 (ref), v114 (ref)
                v110._processingRequest = false;
                v28:Toggle(false);
                if v114 then
                    task.cancel(v114);
                end;
            end);
            return;
        else
            v17:Open(v111):andThen(function(v118, v119, v120) --[[ Line: 529 ]]
                -- upvalues: v20 (ref), v110 (copy), v28 (ref), v114 (ref), v111 (copy)
                if not v118 or not v119 then
                    v20:Toggle("Items", true);
                    if v110._openAll then
                        v110:OpenAllFailed(1);
                    end;
                    v110:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v114 then
                        task.cancel(v114);
                    end;
                    v110:OpenTreasure(v111, v118, v119, v120);
                    return;
                end;
            end):catch(function(v121) --[[ Line: 549 ]]
                -- upvalues: v20 (ref), v110 (copy)
                warn("caught err", v121);
                v20:Toggle("Items", true);
                if v110._openAll then
                    v110:OpenAllFailed(2);
                end;
                v110:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 558 ]]
                -- upvalues: v28 (ref), v114 (ref)
                v28:Toggle(false);
                if v114 then
                    task.cancel(v114);
                end;
            end);
            return;
        end;
    end;
end;
v39.OpenAllFailed = function(v122, v123) --[[ Line: 568 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v123)));
    v122:ToggleOpenAll(false);
    if v122._allToggled then
        v20:RevertFromToggleAll(v122._allToggled);
        v122._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v39.ToggleOpenAll = function(v124, v125) --[[ Line: 584 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v124._openAll = v125;
    v26:ReportOpenAll(v125);
end;
v39._setRarityVisual = function(_, v127, v128, v129) --[[ Line: 589 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v128 = v128 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v127];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v127];
    end;
    v26:SetIndex(v127, v128, v129, true);
end;
return v39;