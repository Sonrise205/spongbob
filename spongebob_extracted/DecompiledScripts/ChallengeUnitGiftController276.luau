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
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
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
        v32 = l_ReplicatedStorage_0.Models.ChallengeCrate;
        v33 = l_ReplicatedStorage_0.Animations.ChallengeCrate;
        v16:OnChanged(v5.Player, "Inventory", function(v49) --[[ Line: 115 ]]
            -- upvalues: v39 (copy)
            if not v39._openAll then
                return;
            else
                if not v49.ChallengeGift then
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
    -- upvalues: v6 (copy), v19 (ref), v29 (ref), v30 (ref), v18 (ref), v17 (ref), l_RunService_0 (copy), v15 (copy), l_CurrentCamera_0 (copy), v32 (ref), v34 (copy), v33 (ref), v21 (ref), v24 (ref), v8 (copy), l_UserInputService_0 (copy), v35 (copy)
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
            -- upvalues: v78 (ref), v21 (ref), v71 (copy), v24 (ref), v64 (copy), v62 (copy), v63 (copy)
            v78:AdjustSpeed(0);
            v21:PlaySound({
                name = "VDayGift.Explosion", 
                soundGroup = "Master.SFX.UI"
            });
            v71.Base.Attachment.Smoke:Emit(math.random(100, 160));
            v24:Shake("VDayGiftShake", {
                originalPivot = workspace.CurrentCamera.CFrame
            }, function() --[[ Line: 278 ]]
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
    task.delay(0.12, function() --[[ Line: 307 ]]
        -- upvalues: v71 (copy)
        for _, v80 in v71:GetDescendants() do
            if v80:IsA("BasePart") then
                v80.Transparency = v80:GetAttribute("Transparency");
            end;
        end;
    end);
    v8.fromEvent(v76.Stopped):await();
    local v81 = 1;
    local v82 = #v63;
    if typeof(v63[1]) == "table" then
        v82 = #v63[1];
    end;
    v19:Toggle("TreasureOpen", true);
    local function v84() --[[ Line: 327 ]] --[[ Name: doTap ]]
        -- upvalues: v81 (ref), v82 (ref), v62 (copy), v21 (ref), v19 (ref), v78 (ref), v77 (copy), v71 (copy), v63 (copy), v65 (copy)
        v81 = v81 + 1;
        if v81 > v82 + 1 and not v62._revealingItem then
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
            v71.Base.Attachment.Smoke:Emit(math.random(30, 60));
            local v83 = nil;
            v83 = if typeof(v63[1]) == "table" then v63[1][math.clamp(v81 - 1, 1, #v63[1])] else v63[math.clamp(v81 - 1, 1, #v63)];
            if v83 then
                v62:_setRarityVisual(v83, v81, v65);
            end;
            v21:PlaySound({
                name = ("ChallengeCrate.Upgrade%*"):format(v81 - 1), 
                soundGroup = "Master.SFX.UI"
            });
            return;
        end;
    end;
    v62._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v85, v86) --[[ Line: 377 ]]
        -- upvalues: v35 (ref), v62 (copy), v84 (copy)
        if v86 or not table.find(v35, v85.UserInputType) then
            warn("r1");
            return;
        elseif v62._revealingItem then
            warn("r2");
            return;
        else
            warn("tapping");
            v84();
            return;
        end;
    end));
    v62._dump:Add(v18.GamepadButtonPressed:Connect(v84));
end;
v37.RevealItemsOpened = function(v87, v88, _, _) --[[ Line: 395 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v19 (ref), v27 (ref)
    v87._dump:Clean();
    v87._dump = nil;
    v87._opening = false;
    v87._revealingItem = false;
    v19:Toggle("TreasureOpen", false):await();
    if v87._allToggled then
        v87._allToggled.TreasureOpen = nil;
    end;
    v27:ShowResults(v88, table.clone(v87._allToggled));
    v87._allToggled = nil;
end;
v37.RevealItem = function(v91, v92, _) --[[ Line: 423 ]] --[[ Name: RevealItem ]]
    -- upvalues: v29 (ref), v30 (ref), v19 (ref), l_RunService_0 (copy), v20 (ref), v23 (ref), v26 (ref), v21 (ref)
    v91._dump:Clean();
    v91._revealingItem = true;
    v91._dump:Add(function() --[[ Line: 427 ]]
        -- upvalues: v91 (copy), v29 (ref), v30 (ref)
        v91._dump = nil;
        if not v91._openAll then
            v91._allToggled = nil;
        end;
        v91._revealingItem = false;
        v91._opening = false;
        task.delay(0.2, function() --[[ Line: 437 ]]
            -- upvalues: v29 (ref), v30 (ref)
            v29.Attachment.SpotLight.Enabled = true;
            v30.Attachment.SpotLight.Enabled = true;
        end);
    end);
    v19:Toggle("TreasureOpen", false):await();
    v91._allToggled.TreasureOpen = nil;
    local function v94() --[[ Line: 446 ]] --[[ Name: handleFinished ]]
        -- upvalues: v94 (ref), v91 (copy), l_RunService_0 (ref)
        v94 = nil;
        v91._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v91._openAll then
            v91:AttemptOpen(1, v91._openAll);
        end;
    end;
    if v92.type == "RandomUnit" or v92.type == "Unit" then
        v91._dump:Add(v20.QueueCompleted:Once(v94));
        v23.UnitGained:Fire({
            v92.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v91._openAll or false
        }, table.clone(v91._allToggled));
        return;
    else
        v91._dump:Add(v26.Finished:Once(v94));
        v26:QueueRewards(v92, table.clone(v91._allToggled), v91._openAll);
        task.delay(3.4, function() --[[ Line: 472 ]]
            -- upvalues: v21 (ref)
            v21:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v37.AttemptOpen = function(v95, v96, v97) --[[ Line: 479 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v22 (ref), v19 (ref)
    if v95:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    elseif v95._processingRequest then
        return;
    else
        v96 = v96 or 1;
        v97 = v96 <= 1;
        v95._processingRequest = true;
        v95:ToggleOpenAll(v97 or false);
        if v96 > 1 then
            v22:OpenCustomChestAmount("ChallengeGift", v96):andThen(function(v98, v99, v100) --[[ Line: 499 ]]
                -- upvalues: v19 (ref), v95 (copy)
                if not v98 or not v99 then
                    v19:Toggle("Items", true);
                    return;
                else
                    v95:OpenTreasure(v98, v99, v100);
                    return;
                end;
            end):catch(function() --[[ Line: 507 ]]
                -- upvalues: v19 (ref), v95 (copy)
                v19:Toggle("Items", true);
                if v95._openAll then
                    v95:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 513 ]]
                -- upvalues: v95 (copy)
                v95._processingRequest = false;
            end);
            return;
        else
            v22:Open("ChallengeGift"):andThen(function(v101, v102, v103) --[[ Line: 519 ]]
                -- upvalues: v19 (ref), v95 (copy)
                if not v101 or not v102 then
                    v19:Toggle("Items", true);
                    if v95._openAll then
                        v95:OpenAllFailed(1);
                    end;
                    v95:ToggleOpenAll(false);
                    return;
                else
                    v95:OpenTreasure(v101, v102, v103);
                    return;
                end;
            end):catch(function() --[[ Line: 532 ]]
                -- upvalues: v19 (ref)
                v19:Toggle("Items", true);
            end):finally(function() --[[ Line: 534 ]]
                -- upvalues: v95 (copy)
                v95._processingRequest = false;
            end);
            return;
        end;
    end;
end;
v37.IsOpening = function(v104) --[[ Line: 539 ]] --[[ Name: IsOpening ]]
    if v104._processingRequest then
        return true;
    else
        return v104._opening;
    end;
end;
v37.OpenAllFailed = function(v105, v106) --[[ Line: 547 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v19 (ref), v18 (ref), v17 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v106)));
    v105:ToggleOpenAll(false);
    if v105._allToggled then
        v19:RevertFromToggleAll(v105._allToggled);
        v105._allToggled = nil;
    end;
    v18:TogglePlayerControls(true);
    v17:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v37.ToggleOpenAll = function(v107, v108) --[[ Line: 563 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v25 (ref)
    v107._openAll = v108;
    v25:ReportOpenAll(v108);
end;
v37._setRarityVisual = function(_, v110, v111, v112) --[[ Line: 568 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v31 (ref), v13 (copy), v25 (ref)
    v111 = v111 or 1;
    if v31 then
        v31.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v110];
        v31.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v110];
    end;
    v25:SetIndex(v110, v111, v112);
end;
return v37;