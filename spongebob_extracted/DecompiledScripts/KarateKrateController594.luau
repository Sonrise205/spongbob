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
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.KarateKrate;
        v16:OnChanged(v5.Player, "Inventory", function(v51) --[[ Line: 115 ]]
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
v39.IsOpening = function(v52) --[[ Line: 128 ]] --[[ Name: IsOpening ]]
    return v52._opening;
end;
local _ = function(v53, v54) --[[ Line: 132 ]] --[[ Name: emitParticles ]]
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
v39.OpenTreasure = function(v58, v59, v60, v61, v62) --[[ Line: 151 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), l_ReplicatedStorage_0 (copy), v12 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
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
        local _ = v64:GetScale();
        local _ = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local v67 = {};
        local v68 = {};
        for _, v70 in v64.PrimaryPart.ClickFX:GetDescendants() do
            if v70:IsA("ParticleEmitter") then
                v70.Enabled = false;
                v70:Clear();
                table.insert(v68, v70);
            end;
        end;
        for _, v72 in v64.PrimaryPart.OpenFX:GetDescendants() do
            if v72:IsA("ParticleEmitter") then
                v72.Enabled = false;
                v72:Clear();
                table.insert(v67, v72);
            end;
        end;
        local l_KarateKrate_0 = l_ReplicatedStorage_0.Animations.KarateKrate;
        local v74, v75 = v58:PlayAnimation(v64, l_KarateKrate_0.Shake, {
            Looped = false
        }, nil, false);
        local v76, _ = v58:PlayAnimation(v64, l_KarateKrate_0.Open, {
            Looped = false
        }, nil, false);
        v58._dump:Add(v74.Ended:Connect(function() --[[ Line: 239 ]]
            -- upvalues: v12 (ref), v68 (copy)
            v12:ToggleEmitters(v68, false);
        end));
        local l_v64_Pivot_0 = v64:GetPivot();
        local v79 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 246 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v79 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v79, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v80) --[[ Line: 249 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v80);
            end));
        end;
        local function _() --[[ Line: 254 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v79 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v79, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v82) --[[ Line: 257 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v82);
            end));
        end;
        local function _() --[[ Line: 262 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v58 (copy)
            local v84 = math.random(-25, 25);
            local v86 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v85) --[[ Line: 267 ]]
                -- upvalues: v64 (ref), l_v64_Pivot_0 (ref), v84 (copy)
                v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(math.rad(v84), math.rad(-v85), 0));
            end);
            v86:Add(function() --[[ Line: 271 ]]
                -- upvalues: v58 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v64:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v64_Pivot_0
                }, function(v87) --[[ Line: 274 ]]
                    -- upvalues: v64 (ref)
                    v64:PivotTo(v87);
                end));
            end);
            v58._dump:Add(v86);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v89 = 1;
        local v90 = #v60;
        if typeof(v60[1]) == "table" then
            v90 = #v60[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v96() --[[ Line: 293 ]] --[[ Name: fadeAway ]]
            -- upvalues: v64 (copy), l_TweenService_0 (ref), v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v32 (ref)
            for _, v92 in v64:GetDescendants() do
                if v92:IsA("BasePart") then
                    local v93 = l_TweenService_0:Create(v92, TweenInfo.new(0.4), {
                        Transparency = 1
                    });
                    do
                        local l_v93_0 = v93;
                        v58._dump:Add(l_v93_0.Completed:Once(function() --[[ Line: 299 ]]
                            -- upvalues: l_v93_0 (ref)
                            l_v93_0:Destroy();
                            l_v93_0 = nil;
                        end));
                        v58._dump:Add(l_v93_0);
                        l_v93_0:Play();
                    end;
                end;
            end;
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                Value = l_v64_Pivot_0 + v32.CFrame.LookVector * -3.5
            }, function(v95) --[[ Line: 312 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v95);
            end));
        end;
        local function v103() --[[ Line: 317 ]] --[[ Name: doTap ]]
            -- upvalues: v89 (ref), v12 (ref), v68 (copy), v90 (ref), v58 (copy), v76 (copy), v67 (copy), v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v75 (ref), v32 (ref), v96 (copy), v24 (ref), v61 (copy), v60 (copy), v59 (copy), v20 (ref), v22 (ref), v74 (copy), v62 (copy)
            v89 = v89 + 1;
            v12:ToggleEmitters(v68, true);
            if v89 > v90 + 1 and v58._revealingItem then
                return;
            elseif v89 > v90 + 1 and not v58._revealingItem then
                v58._revealingItem = true;
                v76:GetMarkerReachedSignal("Open"):Once(function() --[[ Line: 330 ]]
                    -- upvalues: v12 (ref), v67 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref), v75 (ref), v32 (ref), v96 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                    v12:ToggleEmitters(v67, true);
                    task.wait(0.25);
                    local v98 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                        Value = 360
                    }, function(v97) --[[ Line: 336 ]]
                        -- upvalues: v64 (ref), l_v64_Pivot_0 (ref)
                        v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(0, math.rad(-v97), 0));
                    end);
                    v98:Add(function() --[[ Line: 340 ]]
                        -- upvalues: v75 (ref), v67 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref), v64 (ref), v96 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                        v75();
                        v75 = nil;
                        for _, v100 in v67 do
                            v100.LockedToPart = true;
                        end;
                        v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * 2.8
                        }, function(v101) --[[ Line: 350 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v101);
                        end):Add(function() --[[ Line: 354 ]]
                            -- upvalues: v96 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                            v96();
                            v24:Shake("VDayGiftShake", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            }, function() --[[ Line: 358 ]]
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
                    v58._dump:Add(v98);
                end);
                v76:GetMarkerReachedSignal("StopOpen"):Once(function() --[[ Line: 373 ]]
                    -- upvalues: v76 (ref)
                    v76:AdjustSpeed(0);
                end);
                v76:Play();
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "DragonEgg.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                return;
            else
                v74:Play();
                local v102 = nil;
                v102 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v89 - 1, 1, #v60[1])] else v60[math.clamp(v89 - 1, 1, #v60)];
                if v102 then
                    v58:_setRarityVisual(v102, v89, v62);
                end;
                v12:JustEmit(v68);
                if v89 <= v90 + 1 then
                    v22:PlaySound({
                        name = ("DragonEgg.Upgrade%*"):format(v89 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                return;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v104, v105) --[[ Line: 415 ]]
            -- upvalues: v37 (ref), v103 (copy)
            if v105 or not table.find(v37, v104.UserInputType) then
                return;
            else
                v103();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v103));
        return;
    end;
end;
v39.RevealItemsOpened = function(v106, v107, _, _) --[[ Line: 426 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v106._dump:Clean();
    v106._dump = nil;
    v106._opening = false;
    v106._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v106._allToggled then
        v106._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v107, table.clone(v106._allToggled));
    v106._allToggled = nil;
end;
v39.RevealItem = function(v110, v111, _, v113) --[[ Line: 454 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v110._dump:Clean();
    v110._dump:Add(function() --[[ Line: 457 ]]
        -- upvalues: v110 (copy), v32 (ref), v33 (ref)
        v110._dump = nil;
        if not v110._openAll then
            v110._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 464 ]]
            -- upvalues: v32 (ref), v33 (ref), v110 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v110._revealingItem = false;
        end);
        v110._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v110._allToggled.TreasureOpen = nil;
    local function v114() --[[ Line: 477 ]] --[[ Name: handleFinished ]]
        -- upvalues: v114 (ref), v110 (copy), l_RunService_0 (ref), v113 (copy)
        v114 = nil;
        v110._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v110._openAll then
            v110:AttemptOpen(v113, 1, v110._openAll);
        end;
    end;
    if v111.type == "RandomUnit" or v111.type == "Unit" then
        v110._dump:Add(v21.QueueCompleted:Once(v114));
        v25.UnitGained:Fire({
            v111.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v110._openAll or false
        }, table.clone(v110._allToggled));
        return;
    else
        v110._dump:Add(v27.Finished:Once(v114));
        v27:QueueRewards(v111, table.clone(v110._allToggled), v110._openAll);
        task.delay(3.4, function() --[[ Line: 503 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v116, v117, v118, v119, v120) --[[ Line: 509 ]] --[[ Name: PlayAnimation ]]
    if not v116 or not v117 then
        return;
    else
        if v120 == nil then
            v120 = true;
        end;
        v118 = v118 or {};
        local l_AnimationController_0 = v116:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v122 = l_AnimationController_0:LoadAnimation(v117);
            local v123 = {};
            for v124, v125 in v118 do
                v122[v124] = v125;
            end;
            local function v128() --[[ Line: 534 ]]
                -- upvalues: v123 (ref), v122 (ref)
                for _, v127 in v123 do
                    v127:Disconnect();
                end;
                table.clear(v123);
                v123 = nil;
                v122:Destroy();
                v122 = nil;
            end;
            if v119 then
                for v129, v130 in v119 do
                    table.insert(v123, v122:GetMarkerReachedSignal(v129):Connect(function(...) --[[ Line: 548 ]]
                        -- upvalues: v130 (copy), v122 (ref)
                        v130(v122, ...);
                    end));
                end;
            end;
            if v120 then
                v122:Play();
            end;
            return v122, v128;
        end;
    end;
end;
v39.AttemptOpen = function(v131, v132, v133, v134) --[[ Line: 561 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v131:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v133 = v133 or 1;
        v134 = v133 <= 1;
        v131._chestName = v132;
        v131:ToggleOpenAll(v134 or false);
        local v135 = nil;
        v135 = task.delay(0.25, function() --[[ Line: 587 ]]
            -- upvalues: v135 (ref), v28 (ref)
            v135 = nil;
            v28:Toggle(true);
        end);
        if v133 > 1 then
            v17:OpenCustomChestAmount(v132, v133):andThen(function(v136, v137, v138) --[[ Line: 594 ]]
                -- upvalues: v20 (ref), v131 (copy), v132 (copy)
                if not v136 or not v137 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v131:OpenTreasure(v132, v136, v137, v138);
                    return;
                end;
            end):catch(function() --[[ Line: 602 ]]
                -- upvalues: v20 (ref), v131 (copy)
                v20:Toggle("Items", true);
                if v131._openAll then
                    v131:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 608 ]]
                -- upvalues: v28 (ref), v135 (ref), v131 (copy)
                v28:Toggle(false);
                if v135 then
                    task.cancel(v135);
                end;
                v131._processingRequest = false;
            end);
            return;
        else
            v17:Open(v132):andThen(function(v139, v140, v141) --[[ Line: 620 ]]
                -- upvalues: v20 (ref), v131 (copy), v28 (ref), v135 (ref), v132 (copy)
                if not v139 or not v140 then
                    v20:Toggle("Items", true);
                    if v131._openAll then
                        v131:OpenAllFailed(1);
                    end;
                    v131:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v135 then
                        task.cancel(v135);
                    end;
                    v131:OpenTreasure(v132, v139, v140, v141);
                    return;
                end;
            end):catch(function(v142) --[[ Line: 640 ]]
                -- upvalues: v20 (ref), v131 (copy)
                warn("caught err", v142);
                v20:Toggle("Items", true);
                if v131._openAll then
                    v131:OpenAllFailed(2);
                end;
                v131:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 649 ]]
                -- upvalues: v28 (ref), v135 (ref)
                v28:Toggle(false);
                if v135 then
                    task.cancel(v135);
                end;
            end);
            return;
        end;
    end;
end;
v39.OpenAllFailed = function(v143, v144) --[[ Line: 659 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v144)));
    v143:ToggleOpenAll(false);
    if v143._allToggled then
        v20:RevertFromToggleAll(v143._allToggled);
        v143._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v39.ToggleOpenAll = function(v145, v146) --[[ Line: 675 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v145._openAll = v146;
    v26:ReportOpenAll(v146);
end;
v39._setRarityVisual = function(_, v148, v149, v150) --[[ Line: 680 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v149 = v149 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v148];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v148];
    end;
    v26:SetIndex(v148, v149, v150, true);
end;
return v39;