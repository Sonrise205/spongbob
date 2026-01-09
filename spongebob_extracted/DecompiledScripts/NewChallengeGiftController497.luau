local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v8 = require(l_ReplicatedStorage_0.Packages.Promise);
local v9 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedFirst_0.PlaceIds);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
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
local v34 = CFrame.Angles(0, 3.141592653589793, 0);
local v35 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v37 = v5.CreateController({
    Name = script.Name, 
    UnitGained = v9.new(), 
    _opening = false, 
    _processingRequest = false
});
v37.KnitInit = function(_) --[[ Line: 70 ]] --[[ Name: KnitInit ]]
    -- upvalues: v16 (ref), v5 (copy), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref)
    v16 = v5.GetController("DataController");
    v17 = v5.GetController("CharacterController");
    v18 = v5.GetController("DeviceTypeController");
    v19 = v5.GetController("UIController");
    v20 = v5.GetController("UnitViewerController");
    v21 = v5.GetController("AudioController");
    v22 = v5.GetService("TreasureService");
    v23 = v5.GetController("TreasureController");
    v24 = v5.GetController("CamShakeController");
end;
v37.KnitStart = function(v39) --[[ Line: 83 ]] --[[ Name: KnitStart ]]
    -- upvalues: v11 (copy), v25 (ref), v19 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v23 (ref), v32 (ref), l_ReplicatedStorage_0 (copy), v33 (ref), v16 (ref), v5 (copy)
    if not v11:IsHUB() then
        return;
    else
        v25 = v19:GetModuleAsync("TreasureOpen"):expect();
        v26 = v19:GetModuleAsync("Rewards"):expect();
        v27 = v19:GetModuleAsync("TreasureResults"):expect();
        local function v44(v40, v41, v42, v43) --[[ Line: 92 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v28 (ref), v29 (ref), v30 (ref), v31 (ref)
            v28 = v40;
            v29 = v41;
            v30 = v42;
            v31 = v43;
        end;
        if v23:GetArea() then
            local l_v23_Area_0, v46, v47, v48 = v23:GetArea();
            v28 = l_v23_Area_0;
            v29 = v46;
            v30 = v47;
            v31 = v48;
        end;
        v23.TreasureAreaLoaded:Connect(v44);
        v23.StopOpenAll:Connect(function() --[[ Line: 105 ]]
            -- upvalues: v39 (copy)
            v39:ToggleOpenAll(false);
        end);
        v32 = l_ReplicatedStorage_0.Models.ChallengeCrate2;
        v33 = l_ReplicatedStorage_0.Animations.ChallengeCrate;
        v16:OnChanged(v5.Player, "Inventory", function(v49) --[[ Line: 115 ]]
            -- upvalues: v39 (copy)
            if not v39._openAll then
                return;
            else
                if not v49.ChallengeCrate2 then
                    v39:ToggleOpenAll(false);
                end;
                return;
            end;
        end, true);
        return;
    end;
end;
v37.PlayAnimation = function(_, v51, v52, v53, v54, v55) --[[ Line: 129 ]] --[[ Name: PlayAnimation ]]
    if not v51 or not v52 then
        return;
    else
        if v55 == nil then
            v55 = true;
        end;
        v53 = v53 or {};
        local l_AnimationController_0 = v51:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v57 = l_AnimationController_0:LoadAnimation(v52);
            for v58, v59 in v53 do
                v57[v58] = v59;
            end;
            if v54 then
                for v60, v61 in v54 do
                    v57:GetMarkerReachedSignal(v60):Once(function(...) --[[ Line: 155 ]]
                        -- upvalues: v61 (copy), v57 (copy)
                        v61(v57, ...);
                    end);
                end;
            end;
            if v55 then
                v57:Play();
            end;
            return v57;
        end;
    end;
end;
v37.OpenTreasure = function(v62, v63, v64, v65) --[[ Line: 168 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v6 (copy), v19 (ref), v29 (ref), v30 (ref), v18 (ref), v17 (ref), l_RunService_0 (copy), v15 (copy), l_CurrentCamera_0 (copy), v32 (ref), v34 (copy), v33 (ref), v21 (ref), v12 (copy), v24 (ref), v8 (copy), l_UserInputService_0 (copy), v35 (copy)
    v62._opening = true;
    v62._dump = v6.new();
    if not v62._allToggled then
        v62._allToggled = v19:ToggleAll(nil, false);
    end;
    v29.Attachment.SpotLight.Enabled = false;
    v30.Attachment.SpotLight.Enabled = false;
    v18:TogglePlayerControls(false);
    v17:ToggleHideAll(true);
    if l_RunService_0:IsStudio() then
        warn("Taps:", v63, "\nItems Gained:", v64, "\nVariation Taps:", v65);
    end;
    local v66 = v63[1];
    if typeof(v63[1]) == "table" then
        v66 = v63[1][1];
    end;
    local v67 = nil;
    for _, v69 in v63 do
        local v70 = v69[#v69];
        if not v67 then
            v67 = v70;
        elseif v70 ~= v67 and v15.RARITIES_FROM_NAME[v70] > v15.RARITIES_FROM_NAME[v67] then
            v67 = v70;
        end;
    end;
    v62:_setRarityVisual(v66, 1, v65);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v29.CFrame;
    local v71 = v32:Clone();
    local v72 = v29.CFrame.LookVector * 7.6;
    local v73 = CFrame.new(0, -v71.PrimaryPart.Size.Y / 2, 0);
    v71:PivotTo(v29.CFrame * v73 * v34 + v72);
    for _, v75 in v71:GetDescendants() do
        if v75:IsA("BasePart") then
            v75:SetAttribute("Transparency", v75.Transparency);
            v75.Transparency = 1;
        end;
    end;
    v71.Parent = workspace;
    v62._dump:Add(v71);
    if not v71:IsDescendantOf(workspace) then
        v71.AncestryChanged:Wait();
    end;
    local v76 = v62:PlayAnimation(v71, v33.Drop, {
        Looped = false, 
        Priority = Enum.AnimationPriority.Action2
    }, {}, true);
    local v77 = v62:PlayAnimation(v71, v33.Shake, {
        Looped = false, 
        Priority = Enum.AnimationPriority.Action3
    }, {}, false);
    local v78 = nil;
    v78 = v62:PlayAnimation(v71, v33.Open, {
        Looped = false, 
        Priority = Enum.AnimationPriority.Action4
    }, {
        ShowReward = function() --[[ Line: 259 ]]
            -- upvalues: v78 (ref), v21 (ref), v12 (ref), v71 (copy), v24 (ref), v64 (copy), v62 (copy), v63 (copy)
            v78:AdjustSpeed(0);
            v21:PlaySound({
                name = "VDayGift.Explosion", 
                soundGroup = "Master.SFX.UI"
            });
            v12:IterateClass(v71.Base.Attachment, "ParticleEmitter", function(v79) --[[ Line: 268 ]]
                v79:Emit(v79:GetAttribute("EmitCount") or 1);
            end);
            v24:Shake("VDayGiftShake", {
                originalPivot = workspace.CurrentCamera.CFrame
            }, function() --[[ Line: 281 ]]
                -- upvalues: v64 (ref), v62 (ref), v63 (ref)
                task.wait(0.2);
                if #v64 > 1 then
                    v62:RevealItemsOpened(v64, v63);
                    return;
                else
                    v62:RevealItem(v64, v63[#v63]);
                    return;
                end;
            end);
        end
    }, false);
    v21:FadeMusicVolume(0.3, 0.5);
    v76:AdjustSpeed(1.2);
    v78:AdjustSpeed(1.2);
    v21:PlaySound({
        name = "ChallengeCrate.Landing", 
        soundGroup = "Master.SFX.UI"
    });
    task.delay(0.12, function() --[[ Line: 310 ]]
        -- upvalues: v71 (copy)
        for _, v81 in v71:GetDescendants() do
            if v81:IsA("BasePart") then
                v81.Transparency = v81:GetAttribute("Transparency");
            end;
        end;
    end);
    v8.fromEvent(v76.Stopped):await();
    local v82 = 1;
    local v83 = #v63;
    if typeof(v63[1]) == "table" then
        v83 = #v63[1];
    end;
    v19:Toggle("TreasureOpen", true);
    local function v86() --[[ Line: 330 ]] --[[ Name: doTap ]]
        -- upvalues: v82 (ref), v83 (ref), v62 (copy), v21 (ref), v19 (ref), v78 (ref), v77 (copy), v12 (ref), v71 (copy), v63 (copy), v65 (copy)
        v82 = v82 + 1;
        if v82 > v83 + 1 and not v62._revealingItem then
            v62._revealingItem = true;
            v21:PlaySound({
                name = "ChallengeCrate.Reward", 
                soundGroup = "Master.SFX.UI"
            });
            v19:Toggle("TreasureOpen", false);
            v78:Play();
            return;
        else
            v77:Play();
            v12:IterateClass(v71.Base.Attachment, "ParticleEmitter", function(v84) --[[ Line: 349 ]]
                v84:Emit(v84:GetAttribute("EmitCount") or 1);
            end);
            local v85 = nil;
            v85 = if typeof(v63[1]) == "table" then v63[1][math.clamp(v82 - 1, 1, #v63[1])] else v63[math.clamp(v82 - 1, 1, #v63)];
            if v85 then
                v62:_setRarityVisual(v85, v82, v65);
            end;
            v21:PlaySound({
                name = ("ChallengeCrate.Upgrade%*"):format(v82 - 1), 
                soundGroup = "Master.SFX.UI"
            });
            return;
        end;
    end;
    v62._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v87, v88) --[[ Line: 383 ]]
        -- upvalues: v35 (ref), v62 (copy), v86 (copy)
        if v88 or not table.find(v35, v87.UserInputType) then
            warn("r1");
            return;
        elseif v62._revealingItem then
            warn("r2");
            return;
        else
            warn("tapping");
            v86();
            return;
        end;
    end));
    v62._dump:Add(v18.GamepadButtonPressed:Connect(v86));
end;
v37.RevealItemsOpened = function(v89, v90, _, _) --[[ Line: 401 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v19 (ref), v27 (ref)
    v89._dump:Clean();
    v89._dump = nil;
    v89._opening = false;
    v89._revealingItem = false;
    v19:Toggle("TreasureOpen", false):await();
    if v89._allToggled then
        v89._allToggled.TreasureOpen = nil;
    end;
    v27:ShowResults(v90, table.clone(v89._allToggled));
    v89._allToggled = nil;
end;
v37.RevealItem = function(v93, v94, _) --[[ Line: 429 ]] --[[ Name: RevealItem ]]
    -- upvalues: v29 (ref), v30 (ref), v19 (ref), l_RunService_0 (copy), v20 (ref), v23 (ref), v26 (ref), v21 (ref)
    v93._dump:Clean();
    v93._revealingItem = true;
    v93._dump:Add(function() --[[ Line: 433 ]]
        -- upvalues: v93 (copy), v29 (ref), v30 (ref)
        v93._dump = nil;
        if not v93._openAll then
            v93._allToggled = nil;
        end;
        v93._revealingItem = false;
        v93._opening = false;
        task.delay(0.2, function() --[[ Line: 443 ]]
            -- upvalues: v29 (ref), v30 (ref)
            v29.Attachment.SpotLight.Enabled = true;
            v30.Attachment.SpotLight.Enabled = true;
        end);
    end);
    v19:Toggle("TreasureOpen", false):await();
    v93._allToggled.TreasureOpen = nil;
    local function v96() --[[ Line: 452 ]] --[[ Name: handleFinished ]]
        -- upvalues: v96 (ref), v93 (copy), l_RunService_0 (ref)
        v96 = nil;
        v93._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v93._openAll then
            v93:AttemptOpen(1, v93._openAll);
        end;
    end;
    if v94.type == "RandomUnit" or v94.type == "Unit" then
        v93._dump:Add(v20.QueueCompleted:Once(v96));
        v23.UnitGained:Fire({
            v94.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v93._openAll or false
        }, table.clone(v93._allToggled));
        return;
    else
        v93._dump:Add(v26.Finished:Once(v96));
        v26:QueueRewards(v94, table.clone(v93._allToggled), v93._openAll);
        task.delay(3.4, function() --[[ Line: 478 ]]
            -- upvalues: v21 (ref)
            v21:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v37.AttemptOpen = function(v97, v98, v99) --[[ Line: 485 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v22 (ref), v19 (ref)
    if v97:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    elseif v97._processingRequest then
        return;
    else
        v98 = v98 or 1;
        v99 = v98 <= 1;
        v97._processingRequest = true;
        v97:ToggleOpenAll(v99 or false);
        if v98 > 1 then
            v22:OpenCustomChestAmount("ChallengeCrate2", v98):andThen(function(v100, v101, v102) --[[ Line: 505 ]]
                -- upvalues: v19 (ref), v97 (copy)
                if not v100 or not v101 then
                    v19:Toggle("Items", true);
                    return;
                else
                    v97:OpenTreasure(v100, v101, v102);
                    return;
                end;
            end):catch(function() --[[ Line: 513 ]]
                -- upvalues: v19 (ref), v97 (copy)
                v19:Toggle("Items", true);
                if v97._openAll then
                    v97:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 519 ]]
                -- upvalues: v97 (copy)
                v97._processingRequest = false;
            end);
            return;
        else
            v22:Open("ChallengeCrate2"):andThen(function(v103, v104, v105) --[[ Line: 525 ]]
                -- upvalues: v19 (ref), v97 (copy)
                if not v103 or not v104 then
                    v19:Toggle("Items", true);
                    if v97._openAll then
                        v97:OpenAllFailed(1);
                    end;
                    v97:ToggleOpenAll(false);
                    return;
                else
                    v97:OpenTreasure(v103, v104, v105);
                    return;
                end;
            end):catch(function() --[[ Line: 538 ]]
                -- upvalues: v19 (ref)
                v19:Toggle("Items", true);
            end):finally(function() --[[ Line: 540 ]]
                -- upvalues: v97 (copy)
                v97._processingRequest = false;
            end);
            return;
        end;
    end;
end;
v37.IsOpening = function(v106) --[[ Line: 545 ]] --[[ Name: IsOpening ]]
    if v106._processingRequest then
        return true;
    else
        return v106._opening;
    end;
end;
v37.OpenAllFailed = function(v107, v108) --[[ Line: 553 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v19 (ref), v18 (ref), v17 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v108)));
    v107:ToggleOpenAll(false);
    if v107._allToggled then
        v19:RevertFromToggleAll(v107._allToggled);
        v107._allToggled = nil;
    end;
    v18:TogglePlayerControls(true);
    v17:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v37.ToggleOpenAll = function(v109, v110) --[[ Line: 569 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v25 (ref)
    v109._openAll = v110;
    v25:ReportOpenAll(v110);
end;
v37._setRarityVisual = function(_, v112, v113, v114) --[[ Line: 574 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v31 (ref), v13 (copy), v25 (ref)
    v113 = v113 or 1;
    if v31 then
        v31.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v112];
        v31.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v112];
    end;
    v25:SetIndex(v112, v113, v114);
end;
return v37;