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
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.PrizedEgg;
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
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v15 (copy), l_ReplicatedStorage_0 (copy), v22 (ref), l_TweenService_0 (copy), v12 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
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
        }, function(v67) --[[ Line: 199 ]]
            -- upvalues: v64 (copy)
            v64:ScaleTo(v67);
        end);
        local v69 = {};
        local v70 = {};
        for _, v72 in v64.PrimaryPart.ClickFX:GetDescendants() do
            if v72:IsA("ParticleEmitter") then
                table.insert(v70, v72);
            end;
        end;
        for _, v74 in v64.PrimaryPart.Root.OpenFX:GetDescendants() do
            if v74:IsA("ParticleEmitter") then
                table.insert(v69, v74);
            end;
        end;
        local l_PrizedEgg_0 = l_ReplicatedStorage_0.Animations.PrizedEgg;
        local v76, v77 = v58:PlayAnimation(v64, l_PrizedEgg_0.Shake, {
            Looped = false
        }, nil, false);
        local v78, _ = v58:PlayAnimation(v64, l_PrizedEgg_0.Open, {
            Looped = false
        }, nil, false);
        local l_v64_Pivot_0 = v64:GetPivot();
        local v81 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 238 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v81 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v81, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v82) --[[ Line: 241 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v82);
            end));
        end;
        local function _() --[[ Line: 246 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v81 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v81, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v84) --[[ Line: 249 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v84);
            end));
        end;
        local function _() --[[ Line: 254 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v58 (copy)
            local v86 = math.random(-25, 25);
            local v88 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v87) --[[ Line: 259 ]]
                -- upvalues: v64 (ref), l_v64_Pivot_0 (ref), v86 (copy)
                v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(math.rad(v86), math.rad(-v87), 0));
            end);
            v88:Add(function() --[[ Line: 263 ]]
                -- upvalues: v58 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v64:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v64_Pivot_0
                }, function(v89) --[[ Line: 266 ]]
                    -- upvalues: v64 (ref)
                    v64:PivotTo(v89);
                end));
            end);
            v58._dump:Add(v88);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v91 = 1;
        local v92 = #v60;
        if typeof(v60[1]) == "table" then
            v92 = #v60[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v98() --[[ Line: 285 ]] --[[ Name: fadeAway ]]
            -- upvalues: v64 (copy), l_TweenService_0 (ref), v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v32 (ref)
            for _, v94 in v64:GetDescendants() do
                if v94:IsA("BasePart") then
                    local v95 = l_TweenService_0:Create(v94, TweenInfo.new(0.4), {
                        Transparency = 1
                    });
                    do
                        local l_v95_0 = v95;
                        v58._dump:Add(l_v95_0.Completed:Once(function() --[[ Line: 291 ]]
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
            }, function(v97) --[[ Line: 304 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v97);
            end));
        end;
        local function v105() --[[ Line: 309 ]] --[[ Name: doTap ]]
            -- upvalues: v91 (ref), v92 (ref), v58 (copy), v78 (copy), v12 (ref), v69 (copy), v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v77 (ref), v32 (ref), v98 (copy), v24 (ref), v61 (copy), v60 (copy), v59 (copy), v20 (ref), v22 (ref), v76 (copy), v62 (copy), v70 (copy)
            v91 = v91 + 1;
            if v91 > v92 + 1 and v58._revealingItem then
                return;
            elseif v91 > v92 + 1 and not v58._revealingItem then
                v58._revealingItem = true;
                v78:GetMarkerReachedSignal("Open"):Once(function() --[[ Line: 320 ]]
                    -- upvalues: v12 (ref), v69 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref), v77 (ref), v32 (ref), v98 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                    v12:ToggleEmitters(v69, true, true);
                    task.wait(0.25);
                    local v100 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                        Value = 360
                    }, function(v99) --[[ Line: 327 ]]
                        -- upvalues: v64 (ref), l_v64_Pivot_0 (ref)
                        v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(0, math.rad(-v99), 0));
                    end);
                    v100:Add(function() --[[ Line: 331 ]]
                        -- upvalues: v77 (ref), v69 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref), v64 (ref), v98 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                        v77();
                        v77 = nil;
                        for _, v102 in v69 do
                            v102.LockedToPart = true;
                        end;
                        v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * 2.8
                        }, function(v103) --[[ Line: 341 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v103);
                        end):Add(function() --[[ Line: 345 ]]
                            -- upvalues: v98 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                            v98();
                            v24:Shake("VDayGiftShake", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            }, function() --[[ Line: 349 ]]
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
                    v58._dump:Add(v100);
                end);
                v78:GetMarkerReachedSignal("StopOpen"):Once(function() --[[ Line: 364 ]]
                    -- upvalues: v78 (ref)
                    v78:AdjustSpeed(0);
                end);
                v78:Play();
                v20:Toggle("TreasureOpen", false);
                v22:PlaySound({
                    name = "DragonEgg.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                return;
            else
                v76:Play(0.25);
                local v104 = nil;
                v104 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v91 - 1, 1, #v60[1])] else v60[math.clamp(v91 - 1, 1, #v60)];
                if v104 then
                    v58:_setRarityVisual(v104, v91, v62);
                end;
                v12:JustEmit(v70);
                if v91 <= v92 + 1 then
                    v22:PlaySound({
                        name = ("DragonEgg.Upgrade%*"):format(v91 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                return;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v106, v107) --[[ Line: 406 ]]
            -- upvalues: v37 (ref), v105 (copy)
            if v107 or not table.find(v37, v106.UserInputType) then
                return;
            else
                v105();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v105));
        return;
    end;
end;
v39.RevealItemsOpened = function(v108, v109, _, _) --[[ Line: 417 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v108._dump:Clean();
    v108._dump = nil;
    v108._opening = false;
    v108._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v108._allToggled then
        v108._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v109, table.clone(v108._allToggled));
    v108._allToggled = nil;
end;
v39.RevealItem = function(v112, v113, _, v115) --[[ Line: 445 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v112._dump:Clean();
    v112._dump:Add(function() --[[ Line: 448 ]]
        -- upvalues: v112 (copy), v32 (ref), v33 (ref)
        v112._dump = nil;
        if not v112._openAll then
            v112._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 455 ]]
            -- upvalues: v32 (ref), v33 (ref), v112 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v112._revealingItem = false;
        end);
        v112._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v112._allToggled.TreasureOpen = nil;
    local function v116() --[[ Line: 468 ]] --[[ Name: handleFinished ]]
        -- upvalues: v116 (ref), v112 (copy), l_RunService_0 (ref), v115 (copy)
        v116 = nil;
        v112._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v112._openAll then
            v112:AttemptOpen(v115, 1, v112._openAll);
        end;
    end;
    if v113.type == "RandomUnit" or v113.type == "Unit" then
        v112._dump:Add(v21.QueueCompleted:Once(v116));
        v25.UnitGained:Fire({
            v113.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v112._openAll or false
        }, table.clone(v112._allToggled));
        return;
    else
        v112._dump:Add(v27.Finished:Once(v116));
        v27:QueueRewards(v113, table.clone(v112._allToggled), v112._openAll);
        task.delay(3.4, function() --[[ Line: 494 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v118, v119, v120, v121, v122) --[[ Line: 500 ]] --[[ Name: PlayAnimation ]]
    if not v118 or not v119 then
        return;
    else
        if v122 == nil then
            v122 = true;
        end;
        v120 = v120 or {};
        local l_AnimationController_0 = v118:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v124 = l_AnimationController_0:LoadAnimation(v119);
            local v125 = {};
            for v126, v127 in v120 do
                v124[v126] = v127;
            end;
            local function v130() --[[ Line: 525 ]]
                -- upvalues: v125 (ref), v124 (ref)
                for _, v129 in v125 do
                    v129:Disconnect();
                end;
                table.clear(v125);
                v125 = nil;
                v124:Destroy();
                v124 = nil;
            end;
            if v121 then
                for v131, v132 in v121 do
                    table.insert(v125, v124:GetMarkerReachedSignal(v131):Connect(function(...) --[[ Line: 539 ]]
                        -- upvalues: v132 (copy), v124 (ref)
                        v132(v124, ...);
                    end));
                end;
            end;
            if v122 then
                v124:Play();
            end;
            return v124, v130;
        end;
    end;
end;
v39.AttemptOpen = function(v133, v134, v135, v136) --[[ Line: 552 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v133:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v135 = v135 or 1;
        v136 = v135 <= 1;
        v133._chestName = v134;
        v133:ToggleOpenAll(v136 or false);
        local v137 = nil;
        v137 = task.delay(0.25, function() --[[ Line: 578 ]]
            -- upvalues: v137 (ref), v28 (ref)
            v137 = nil;
            v28:Toggle(true);
        end);
        if v135 > 1 then
            v17:OpenCustomChestAmount(v134, v135):andThen(function(v138, v139, v140) --[[ Line: 585 ]]
                -- upvalues: v20 (ref), v133 (copy), v134 (copy)
                if not v138 or not v139 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v133:OpenTreasure(v134, v138, v139, v140);
                    return;
                end;
            end):catch(function() --[[ Line: 593 ]]
                -- upvalues: v20 (ref), v133 (copy)
                v20:Toggle("Items", true);
                if v133._openAll then
                    v133:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 599 ]]
                -- upvalues: v28 (ref), v137 (ref), v133 (copy)
                v28:Toggle(false);
                if v137 then
                    task.cancel(v137);
                end;
                v133._processingRequest = false;
            end);
            return;
        else
            v17:Open(v134):andThen(function(v141, v142, v143) --[[ Line: 611 ]]
                -- upvalues: v20 (ref), v133 (copy), v28 (ref), v137 (ref), v134 (copy)
                if not v141 or not v142 then
                    v20:Toggle("Items", true);
                    if v133._openAll then
                        v133:OpenAllFailed(1);
                    end;
                    v133:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v137 then
                        task.cancel(v137);
                    end;
                    v133:OpenTreasure(v134, v141, v142, v143);
                    return;
                end;
            end):catch(function(v144) --[[ Line: 631 ]]
                -- upvalues: v20 (ref), v133 (copy)
                warn("caught err", v144);
                v20:Toggle("Items", true);
                if v133._openAll then
                    v133:OpenAllFailed(2);
                end;
                v133:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 640 ]]
                -- upvalues: v28 (ref), v137 (ref)
                v28:Toggle(false);
                if v137 then
                    task.cancel(v137);
                end;
            end);
            return;
        end;
    end;
end;
v39.OpenAllFailed = function(v145, v146) --[[ Line: 650 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v146)));
    v145:ToggleOpenAll(false);
    if v145._allToggled then
        v20:RevertFromToggleAll(v145._allToggled);
        v145._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v39.ToggleOpenAll = function(v147, v148) --[[ Line: 666 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v147._openAll = v148;
    v26:ReportOpenAll(v148);
end;
v39._setRarityVisual = function(_, v150, v151, v152) --[[ Line: 671 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v151 = v151 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v150];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v150];
    end;
    v26:SetIndex(v150, v151, v152, true);
end;
return v39;