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
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.SnowCrate;
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
        v58.chestContainer = v64;
        v64:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 10 + Vector3.new(0, 0, 0, 0));
        v64.Parent = workspace;
        v58._dump:Add(v64);
        v58._dump:Add(function() --[[ Line: 201 ]]
            -- upvalues: v58 (copy)
            v58.chestContainer = nil;
        end);
        local v65 = {};
        local v66 = {};
        v12:IterateClass(v64.House.ClickFX, "ParticleEmitter", function(v67) --[[ Line: 208 ]]
            -- upvalues: v65 (copy)
            table.insert(v65, v67);
        end);
        v12:IterateClass(v64.House.ExplosionFX, "ParticleEmitter", function(v68) --[[ Line: 212 ]]
            -- upvalues: v66 (copy)
            table.insert(v66, v68);
        end);
        v12:IterateClass(v64.House.ExplosionFX2, "ParticleEmitter", function(v69) --[[ Line: 216 ]]
            -- upvalues: v66 (copy)
            table.insert(v66, v69);
        end);
        local l_v64_Scale_0 = v64:GetScale();
        local v71 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v64_Scale_0, v71, {
            Value = l_v64_Scale_0 * 1.2
        }, function(v72) --[[ Line: 223 ]]
            -- upvalues: v64 (copy)
            v64:ScaleTo(v72);
        end);
        local l_v64_Pivot_0 = v64:GetPivot();
        local v75 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 230 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v75 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v75, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v76) --[[ Line: 233 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v76);
            end));
        end;
        local function _() --[[ Line: 238 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v75 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v75, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v78) --[[ Line: 241 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v78);
            end));
        end;
        local function v84() --[[ Line: 246 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v58 (copy)
            local v80 = math.random(-25, 25);
            local v82 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v81) --[[ Line: 251 ]]
                -- upvalues: v64 (ref), l_v64_Pivot_0 (ref), v80 (copy)
                v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(math.rad(v80), math.rad(-v81), 0));
            end);
            v82:Add(function() --[[ Line: 255 ]]
                -- upvalues: v58 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v64:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v64_Pivot_0
                }, function(v83) --[[ Line: 258 ]]
                    -- upvalues: v64 (ref)
                    v64:PivotTo(v83);
                end));
            end);
            v58._dump:Add(v82);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v85 = 1;
        local v86 = #v60;
        if typeof(v60[1]) == "table" then
            v86 = #v60[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v98() --[[ Line: 277 ]] --[[ Name: doTap ]]
            -- upvalues: v85 (ref), v86 (ref), v58 (copy), v12 (ref), v65 (copy), v20 (ref), v22 (ref), v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), l_TweenService_0 (ref), v32 (ref), v66 (copy), v24 (ref), v61 (copy), v60 (copy), v59 (copy), v84 (copy), v62 (copy), v57 (ref)
            v85 = v85 + 1;
            if v85 > v86 + 1 and v58._revealingItem then
                return;
            else
                v12:JustEmit(v65);
                if v85 > v86 + 1 and not v58._revealingItem then
                    v58._revealingItem = true;
                    v20:Toggle("TreasureOpen", false);
                    v22:PlaySound({
                        name = "DragonEgg.Reward", 
                        soundGroup = "Master.SFX.UI"
                    });
                    local v88 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                        Value = 360
                    }, function(v87) --[[ Line: 298 ]]
                        -- upvalues: v64 (ref), l_v64_Pivot_0 (ref)
                        v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(0, math.rad(-v87), 0));
                    end);
                    local function v94() --[[ Line: 308 ]] --[[ Name: fadeAway ]]
                        -- upvalues: v64 (ref), l_TweenService_0 (ref), v58 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref)
                        for _, v90 in v64:GetDescendants() do
                            if v90:IsA("BasePart") then
                                local v91 = l_TweenService_0:Create(v90, TweenInfo.new(0.4), {
                                    Transparency = 1
                                });
                                do
                                    local l_v91_0 = v91;
                                    v58._dump:Add(l_v91_0.Completed:Once(function() --[[ Line: 314 ]]
                                        -- upvalues: l_v91_0 (ref)
                                        l_v91_0:Destroy();
                                        l_v91_0 = nil;
                                    end));
                                    v58._dump:Add(l_v91_0);
                                    l_v91_0:Play();
                                end;
                            end;
                        end;
                        v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * -5
                        }, function(v93) --[[ Line: 328 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v93);
                        end));
                    end;
                    v88:Add(function() --[[ Line: 353 ]]
                        -- upvalues: v15 (ref), l_v64_Pivot_0 (ref), v32 (ref), v64 (ref), v94 (copy), v12 (ref), v66 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                        v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * 4
                        }, function(v95) --[[ Line: 357 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v95);
                        end):Add(function() --[[ Line: 361 ]]
                            -- upvalues: v94 (ref), v12 (ref), v66 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                            v94();
                            v12:JustEmit(v66);
                            v24:Shake("VDayGiftShake", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            }, function() --[[ Line: 368 ]]
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
                    v58._dump:Add(v88);
                    return;
                else
                    v84();
                    local v96 = nil;
                    v96 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v85 - 1, 1, #v60[1])] else v60[math.clamp(v85 - 1, 1, #v60)];
                    if v96 then
                        v58:_setRarityVisual(v96, v85, v62);
                    end;
                    if v85 <= v86 + 1 then
                        v22:PlaySound({
                            name = ("DragonEgg.Upgrade%*"):format(v85 - 1), 
                            soundGroup = "Master.SFX.UI"
                        });
                    end;
                    v57(v64.PrimaryPart, function(v97) --[[ Line: 416 ]]
                        return v97.Parent.Name ~= "Explosion";
                    end);
                    return;
                end;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v99, v100) --[[ Line: 421 ]]
            -- upvalues: v37 (ref), v98 (copy)
            if v100 or not table.find(v37, v99.UserInputType) then
                return;
            else
                v98();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v98));
        return;
    end;
end;
v39.RevealItemsOpened = function(v101, v102, _, _) --[[ Line: 432 ]] --[[ Name: RevealItemsOpened ]]
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
v39.RevealItem = function(v105, v106, _, v108) --[[ Line: 460 ]] --[[ Name: RevealItem ]]
    -- upvalues: v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v105._dump:Clean();
    v105._dump:Add(function() --[[ Line: 463 ]]
        -- upvalues: v105 (copy)
        v105._dump = nil;
        if not v105._openAll then
            v105._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 470 ]]
            -- upvalues: v105 (ref)
            v105._revealingItem = false;
        end);
        v105._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v105._allToggled.TreasureOpen = nil;
    local function v109() --[[ Line: 483 ]] --[[ Name: handleFinished ]]
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
        task.delay(3.4, function() --[[ Line: 509 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v111, v112, v113, v114, v115) --[[ Line: 515 ]] --[[ Name: PlayAnimation ]]
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
                    v117:GetMarkerReachedSignal(v120):Once(function(...) --[[ Line: 541 ]]
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
v39.AttemptOpen = function(v122, v123, v124, v125) --[[ Line: 554 ]] --[[ Name: AttemptOpen ]]
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
        v126 = task.delay(0.25, function() --[[ Line: 580 ]]
            -- upvalues: v126 (ref), v28 (ref)
            v126 = nil;
            v28:Toggle(true);
        end);
        if v124 > 1 then
            v17:OpenCustomChestAmount(v123, v124):andThen(function(v127, v128, v129) --[[ Line: 586 ]]
                -- upvalues: v20 (ref), v122 (copy), v123 (copy)
                if not v127 or not v128 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v122:OpenTreasure(v123, v127, v128, v129);
                    return;
                end;
            end):catch(function() --[[ Line: 594 ]]
                -- upvalues: v20 (ref), v122 (copy)
                v20:Toggle("Items", true);
                if v122._openAll then
                    v122:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 600 ]]
                -- upvalues: v28 (ref), v126 (ref), v122 (copy)
                v28:Toggle(false);
                if v126 then
                    task.cancel(v126);
                end;
                v122._processingRequest = false;
            end);
            return;
        else
            v17:Open(v123):andThen(function(v130, v131, v132) --[[ Line: 612 ]]
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
            end):catch(function(v133) --[[ Line: 632 ]]
                -- upvalues: v20 (ref), v122 (copy)
                warn("caught err", v133);
                v20:Toggle("Items", true);
                if v122._openAll then
                    v122:OpenAllFailed(2);
                end;
                v122:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 641 ]]
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
v39.OpenAllFailed = function(v134, v135) --[[ Line: 651 ]] --[[ Name: OpenAllFailed ]]
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
v39.ToggleOpenAll = function(v136, v137) --[[ Line: 667 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v136._openAll = v137;
    v26:ReportOpenAll(v137);
end;
local v138 = {
    Rare = Color3.fromRGB(111, 255, 0), 
    Epic = Color3.fromRGB(162, 0, 255), 
    Legendary = Color3.fromRGB(242, 255, 0), 
    Mythic = Color3.fromRGB(255, 0, 187), 
    Secret = Color3.fromRGB(255, 0, 4)
};
v39._setRarityVisual = function(v139, v140, v141, v142) --[[ Line: 680 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v138 (copy), v26 (ref)
    v141 = v141 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v140];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v140];
    end;
    if v139.chestContainer then
        for _, v144 in v139.chestContainer.Accents:GetChildren() do
            v144.Color = v138[v140];
        end;
    end;
    v26:SetIndex(v140, v141, v142, true);
end;
return v39;