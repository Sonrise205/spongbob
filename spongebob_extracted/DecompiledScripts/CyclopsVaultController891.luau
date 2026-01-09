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
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.CyclopsVault;
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
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v15 (copy), l_ReplicatedStorage_0 (copy), v12 (copy), v22 (ref), l_TweenService_0 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
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
        v64:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 7 + Vector3.new(-0, -2.4000000953674316, -0, -0));
        v64.Parent = workspace;
        v58._dump:Add(v64);
        local l_v64_Scale_0 = v64:GetScale();
        local v66 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v64_Scale_0, v66, {
            Value = l_v64_Scale_0 * 1.2
        }, function(v67) --[[ Line: 199 ]]
            -- upvalues: v64 (copy)
            v64:ScaleTo(v67);
        end);
        local v69 = false;
        local v70 = {};
        local v71 = {};
        for _, v73 in v64.PrimaryPart:GetDescendants() do
            if v73:IsA("ParticleEmitter") then
                table.insert(v71, v73);
            end;
        end;
        for _, v75 in v64.ExplosionFX:GetDescendants() do
            if v75:IsA("ParticleEmitter") then
                table.insert(v70, v75);
            end;
        end;
        local v76, v77 = v58:PlayAnimation(v64, l_ReplicatedStorage_0.Animations.CyclopsVaultTap, {
            Looped = false
        }, {
            StartVFX = function() --[[ Line: 228 ]] --[[ Name: StartVFX ]]
                -- upvalues: v12 (ref), v71 (copy), v69 (ref), v70 (copy)
                v12:ToggleEmitters(v71, true, v69);
                if v69 then
                    task.delay(1, function() --[[ Line: 236 ]]
                        -- upvalues: v12 (ref), v70 (ref)
                        v12:ToggleEmitters(v70, true);
                    end);
                end;
            end, 
            StopVFX = function() --[[ Line: 242 ]] --[[ Name: StopVFX ]]
                -- upvalues: v12 (ref), v71 (copy), v70 (copy)
                v12:ToggleEmitters(v71, false);
                v12:ToggleEmitters(v70, false);
            end
        }, false);
        local l_v64_Pivot_0 = v64:GetPivot();
        local v79 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 255 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v79 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v79, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v80) --[[ Line: 258 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v80);
            end));
        end;
        local function _() --[[ Line: 263 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v79 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v79, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v82) --[[ Line: 266 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v82);
            end));
        end;
        local function _() --[[ Line: 271 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v58 (copy)
            local v84 = math.random(-25, 25);
            local v86 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v85) --[[ Line: 276 ]]
                -- upvalues: v64 (ref), l_v64_Pivot_0 (ref), v84 (copy)
                v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(math.rad(v84), math.rad(-v85), 0));
            end);
            v86:Add(function() --[[ Line: 280 ]]
                -- upvalues: v58 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v64:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v64_Pivot_0
                }, function(v87) --[[ Line: 283 ]]
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
        local function v101() --[[ Line: 302 ]] --[[ Name: doTap ]]
            -- upvalues: v89 (ref), v90 (ref), v58 (copy), v69 (ref), v76 (copy), v20 (ref), v22 (ref), v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), l_TweenService_0 (ref), v32 (ref), v77 (ref), v24 (ref), v61 (copy), v60 (copy), v59 (copy), v62 (copy)
            v89 = v89 + 1;
            if v89 > v90 + 1 and v58._revealingItem then
                return;
            elseif v89 > v90 + 1 and not v58._revealingItem then
                v58._revealingItem = true;
                v69 = true;
                v76:AdjustSpeed(0.5);
                v76:Play(0.25);
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "DragonEgg.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                v76.Stopped:Wait();
                local v92 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                    Value = 360
                }, function(v91) --[[ Line: 328 ]]
                    -- upvalues: v64 (ref), l_v64_Pivot_0 (ref)
                    v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(0, math.rad(-v91), 0));
                end);
                local function v98() --[[ Line: 338 ]] --[[ Name: fadeAway ]]
                    -- upvalues: v64 (ref), l_TweenService_0 (ref), v58 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref)
                    for _, v94 in v64:GetDescendants() do
                        if v94:IsA("BasePart") then
                            local v95 = l_TweenService_0:Create(v94, TweenInfo.new(0.4), {
                                Transparency = 1
                            });
                            do
                                local l_v95_0 = v95;
                                v58._dump:Add(l_v95_0.Completed:Once(function() --[[ Line: 344 ]]
                                    -- upvalues: l_v95_0 (ref)
                                    l_v95_0:Destroy();
                                    l_v95_0 = nil;
                                end));
                                v58._dump:Add(l_v95_0);
                                l_v95_0:Play();
                            end;
                        end;
                    end;
                    v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v64_Pivot_0 + v32.CFrame.LookVector * -3.5
                    }, function(v97) --[[ Line: 358 ]]
                        -- upvalues: v64 (ref)
                        v64:PivotTo(v97);
                    end));
                end;
                v92:Add(function() --[[ Line: 383 ]]
                    -- upvalues: v77 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref), v64 (ref), v98 (copy), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                    v77();
                    v77 = nil;
                    v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                        Value = l_v64_Pivot_0 + v32.CFrame.LookVector * 2.8
                    }, function(v99) --[[ Line: 389 ]]
                        -- upvalues: v64 (ref)
                        v64:PivotTo(v99);
                    end):Add(function() --[[ Line: 393 ]]
                        -- upvalues: v98 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                        v98();
                        v24:Shake("VDayGiftShake", {
                            originalPivot = workspace.CurrentCamera.CFrame
                        }, function() --[[ Line: 402 ]]
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
                v58._dump:Add(v92);
                return;
            else
                v76:Play(0.25);
                local v100 = nil;
                v100 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v89 - 1, 1, #v60[1])] else v60[math.clamp(v89 - 1, 1, #v60)];
                if v100 then
                    v58:_setRarityVisual(v100, v89, v62);
                end;
                if v89 <= v90 + 1 then
                    v22:PlaySound({
                        name = ("DragonEgg.Upgrade%*"):format(v89 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                return;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v102, v103) --[[ Line: 451 ]]
            -- upvalues: v37 (ref), v101 (copy)
            if v103 or not table.find(v37, v102.UserInputType) then
                return;
            else
                v101();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v101));
        return;
    end;
end;
v39.RevealItemsOpened = function(v104, v105, _, _) --[[ Line: 462 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v104._dump:Clean();
    v104._dump = nil;
    v104._opening = false;
    v104._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v104._allToggled then
        v104._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v105, table.clone(v104._allToggled));
    v104._allToggled = nil;
end;
v39.RevealItem = function(v108, v109, _, v111) --[[ Line: 490 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v108._dump:Clean();
    v108._dump:Add(function() --[[ Line: 493 ]]
        -- upvalues: v108 (copy), v32 (ref), v33 (ref)
        v108._dump = nil;
        if not v108._openAll then
            v108._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 500 ]]
            -- upvalues: v32 (ref), v33 (ref), v108 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v108._revealingItem = false;
        end);
        v108._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v108._allToggled.TreasureOpen = nil;
    local function v112() --[[ Line: 513 ]] --[[ Name: handleFinished ]]
        -- upvalues: v112 (ref), v108 (copy), l_RunService_0 (ref), v111 (copy)
        v112 = nil;
        v108._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v108._openAll then
            v108:AttemptOpen(v111, 1, v108._openAll);
        end;
    end;
    if v109.type == "RandomUnit" or v109.type == "Unit" then
        v108._dump:Add(v21.QueueCompleted:Once(v112));
        v25.UnitGained:Fire({
            v109.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v108._openAll or false
        }, table.clone(v108._allToggled));
        return;
    else
        v108._dump:Add(v27.Finished:Once(v112));
        v27:QueueRewards(v109, table.clone(v108._allToggled), v108._openAll);
        task.delay(3.4, function() --[[ Line: 539 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v114, v115, v116, v117, v118) --[[ Line: 545 ]] --[[ Name: PlayAnimation ]]
    if not v114 or not v115 then
        return;
    else
        if v118 == nil then
            v118 = true;
        end;
        v116 = v116 or {};
        local l_AnimationController_0 = v114:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v120 = l_AnimationController_0:LoadAnimation(v115);
            local v121 = {};
            for v122, v123 in v116 do
                v120[v122] = v123;
            end;
            local function v126() --[[ Line: 570 ]]
                -- upvalues: v121 (ref), v120 (ref)
                for _, v125 in v121 do
                    v125:Disconnect();
                end;
                table.clear(v121);
                v121 = nil;
                v120:Destroy();
                v120 = nil;
            end;
            if v117 then
                for v127, v128 in v117 do
                    table.insert(v121, v120:GetMarkerReachedSignal(v127):Connect(function(...) --[[ Line: 584 ]]
                        -- upvalues: v128 (copy), v120 (ref)
                        v128(v120, ...);
                    end));
                end;
            end;
            if v118 then
                v120:Play();
            end;
            return v120, v126;
        end;
    end;
end;
v39.AttemptOpen = function(v129, v130, v131, v132) --[[ Line: 597 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v129:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v131 = v131 or 1;
        v132 = v131 <= 1;
        v129._chestName = v130;
        v129:ToggleOpenAll(v132 or false);
        local v133 = nil;
        v133 = task.delay(0.25, function() --[[ Line: 623 ]]
            -- upvalues: v133 (ref), v28 (ref)
            v133 = nil;
            v28:Toggle(true);
        end);
        v131 = v131 or 1;
        v132 = v131 <= 1;
        if v131 > 1 then
            v17:OpenCustomChestAmount(v130, v131):andThen(function(v134, v135, v136) --[[ Line: 632 ]]
                -- upvalues: v20 (ref), v129 (copy), v130 (copy)
                if not v134 or not v135 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v129:OpenTreasure(v130, v134, v135, v136);
                    return;
                end;
            end):catch(function() --[[ Line: 640 ]]
                -- upvalues: v20 (ref), v129 (copy)
                v20:Toggle("Items", true);
                if v129._openAll then
                    v129:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 646 ]]
                -- upvalues: v28 (ref), v133 (ref), v129 (copy)
                v28:Toggle(false);
                if v133 then
                    task.cancel(v133);
                end;
                v129._processingRequest = false;
            end);
            return;
        else
            v17:Open(v130):andThen(function(v137, v138, v139) --[[ Line: 658 ]]
                -- upvalues: v20 (ref), v129 (copy), v28 (ref), v133 (ref), v130 (copy)
                if not v137 or not v138 then
                    v20:Toggle("Items", true);
                    if v129._openAll then
                        v129:OpenAllFailed(1);
                    end;
                    v129:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v133 then
                        task.cancel(v133);
                    end;
                    v129:OpenTreasure(v130, v137, v138, v139);
                    return;
                end;
            end):catch(function(v140) --[[ Line: 678 ]]
                -- upvalues: v20 (ref), v129 (copy)
                warn("caught err", v140);
                v20:Toggle("Items", true);
                if v129._openAll then
                    v129:OpenAllFailed(2);
                end;
                v129:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 687 ]]
                -- upvalues: v28 (ref), v133 (ref)
                v28:Toggle(false);
                if v133 then
                    task.cancel(v133);
                end;
            end);
            return;
        end;
    end;
end;
v39.OpenAllFailed = function(v141, v142) --[[ Line: 697 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v142)));
    v141:ToggleOpenAll(false);
    if v141._allToggled then
        v20:RevertFromToggleAll(v141._allToggled);
        v141._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v39.ToggleOpenAll = function(v143, v144) --[[ Line: 713 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v143._openAll = v144;
    v26:ReportOpenAll(v144);
end;
v39._setRarityVisual = function(_, v146, v147, v148) --[[ Line: 718 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v147 = v147 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v146];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v146];
    end;
    v26:SetIndex(v146, v147, v148, true);
end;
return v39;