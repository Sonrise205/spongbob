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
        v35 = l_ReplicatedStorage_0.Models.RNG_BOXES.CoralGift;
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
    -- upvalues: v14 (copy), v6 (copy), v20 (ref), v32 (ref), v33 (ref), v19 (ref), v18 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v35 (ref), v36 (copy), v12 (copy), v15 (copy), v22 (ref), l_TweenService_0 (copy), v57 (copy), v24 (ref), l_UserInputService_0 (copy), v37 (copy)
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
        v64:PivotTo(v32.CFrame * v36 + v32.CFrame.LookVector * 10 + Vector3.new(-0, -1.25, -0, -0));
        v64.Parent = workspace;
        v58._dump:Add(v64);
        local v65 = {};
        v12:IterateClass(v64, "ParticleEmitter", function(v66) --[[ Line: 202 ]]
            -- upvalues: v65 (copy)
            table.insert(v65, v66);
        end);
        local l_v64_Scale_0 = v64:GetScale();
        local v68 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local _ = v15("NumberValue", l_v64_Scale_0, v68, {
            Value = l_v64_Scale_0 * 1.2
        }, function(v69) --[[ Line: 209 ]]
            -- upvalues: v64 (copy)
            v64:ScaleTo(v69);
        end);
        local l_v64_Pivot_0 = v64:GetPivot();
        local v72 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local function _() --[[ Line: 216 ]] --[[ Name: doLeftTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v72 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v72, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), -0.5235987755982988, 0)
            }, function(v73) --[[ Line: 219 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v73);
            end));
        end;
        local function _() --[[ Line: 224 ]] --[[ Name: doRightTween ]]
            -- upvalues: v58 (copy), v15 (ref), l_v64_Pivot_0 (copy), v72 (copy), v64 (copy)
            v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, v72, {
                Value = l_v64_Pivot_0 * CFrame.Angles(math.rad((math.random(-24, 24))), 0.5235987755982988, 0)
            }, function(v75) --[[ Line: 227 ]]
                -- upvalues: v64 (ref)
                v64:PivotTo(v75);
            end));
        end;
        local function v81() --[[ Line: 232 ]] --[[ Name: doTapTween ]]
            -- upvalues: v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), v58 (copy)
            local v77 = math.random(-25, 25);
            local v79 = v15("NumberValue", 0, TweenInfo.new(0.3), {
                Value = 720
            }, function(v78) --[[ Line: 237 ]]
                -- upvalues: v64 (ref), l_v64_Pivot_0 (ref), v77 (copy)
                v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(math.rad(v77), math.rad(-v78), 0));
            end);
            v79:Add(function() --[[ Line: 241 ]]
                -- upvalues: v58 (ref), v15 (ref), v64 (ref), l_v64_Pivot_0 (ref)
                v58._dump:Add(v15("CFrameValue", v64:GetPivot(), TweenInfo.new(0.2), {
                    Value = l_v64_Pivot_0
                }, function(v80) --[[ Line: 244 ]]
                    -- upvalues: v64 (ref)
                    v64:PivotTo(v80);
                end));
            end);
            v58._dump:Add(v79);
        end;
        v22:FadeMusicVolume(0.3, 0.5);
        local v82 = 1;
        local v83 = #v60;
        if typeof(v60[1]) == "table" then
            v83 = #v60[1];
        end;
        v20:Toggle("TreasureOpen", true);
        local function v96() --[[ Line: 263 ]] --[[ Name: doTap ]]
            -- upvalues: v82 (ref), v83 (ref), v58 (copy), v12 (ref), v65 (copy), v20 (ref), v22 (ref), v15 (ref), v64 (copy), l_v64_Pivot_0 (copy), l_TweenService_0 (ref), v32 (ref), v57 (ref), v24 (ref), v61 (copy), v60 (copy), v59 (copy), v81 (copy), v62 (copy)
            v82 = v82 + 1;
            if v82 > v83 + 1 and v58._revealingItem then
                return;
            else
                v12:JustEmit(v65);
                if v82 > v83 + 1 and not v58._revealingItem then
                    v58._revealingItem = true;
                    v20:Toggle("TreasureOpen", false);
                    v22:PlaySound({
                        name = "DragonEgg.Reward", 
                        soundGroup = "Master.SFX.UI"
                    });
                    local v85 = v15("NumberValue", 0, TweenInfo.new(0.2), {
                        Value = 360
                    }, function(v84) --[[ Line: 284 ]]
                        -- upvalues: v64 (ref), l_v64_Pivot_0 (ref)
                        v64:PivotTo(l_v64_Pivot_0 * CFrame.Angles(0, math.rad(-v84), 0));
                    end);
                    local function v91() --[[ Line: 294 ]] --[[ Name: fadeAway ]]
                        -- upvalues: v64 (ref), l_TweenService_0 (ref), v58 (ref), v15 (ref), l_v64_Pivot_0 (ref), v32 (ref)
                        for _, v87 in v64:GetDescendants() do
                            if v87:IsA("BasePart") then
                                local v88 = l_TweenService_0:Create(v87, TweenInfo.new(0.4), {
                                    Transparency = 1
                                });
                                do
                                    local l_v88_0 = v88;
                                    v58._dump:Add(l_v88_0.Completed:Once(function() --[[ Line: 300 ]]
                                        -- upvalues: l_v88_0 (ref)
                                        l_v88_0:Destroy();
                                        l_v88_0 = nil;
                                    end));
                                    v58._dump:Add(l_v88_0);
                                    l_v88_0:Play();
                                end;
                            end;
                        end;
                        v58._dump:Add(v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * -5
                        }, function(v90) --[[ Line: 314 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v90);
                        end));
                    end;
                    v85:Add(function() --[[ Line: 339 ]]
                        -- upvalues: v15 (ref), l_v64_Pivot_0 (ref), v32 (ref), v64 (ref), v91 (copy), v57 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                        v15("CFrameValue", l_v64_Pivot_0, TweenInfo.new(0.25), {
                            Value = l_v64_Pivot_0 + v32.CFrame.LookVector * 4
                        }, function(v92) --[[ Line: 343 ]]
                            -- upvalues: v64 (ref)
                            v64:PivotTo(v92);
                        end):Add(function() --[[ Line: 347 ]]
                            -- upvalues: v91 (ref), v57 (ref), v64 (ref), v24 (ref), v61 (ref), v58 (ref), v60 (ref), v59 (ref)
                            v91();
                            v57(v64.Explosion, function(_) --[[ Line: 350 ]]
                                return true;
                            end);
                            v24:Shake("VDayGiftShake", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            }, function() --[[ Line: 356 ]]
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
                    v58._dump:Add(v85);
                    return;
                else
                    v81();
                    local v94 = nil;
                    v94 = if typeof(v60[1]) == "table" then v60[1][math.clamp(v82 - 1, 1, #v60[1])] else v60[math.clamp(v82 - 1, 1, #v60)];
                    if v94 then
                        v58:_setRarityVisual(v94, v82, v62);
                    end;
                    if v82 <= v83 + 1 then
                        v22:PlaySound({
                            name = ("DragonEgg.Upgrade%*"):format(v82 - 1), 
                            soundGroup = "Master.SFX.UI"
                        });
                    end;
                    v57(v64.Click, function(_) --[[ Line: 404 ]]
                        return true;
                    end);
                    return;
                end;
            end;
        end;
        v58._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v97, v98) --[[ Line: 409 ]]
            -- upvalues: v37 (ref), v96 (copy)
            if v98 or not table.find(v37, v97.UserInputType) then
                return;
            else
                v96();
                return;
            end;
        end));
        v58._dump:Add(v19.GamepadButtonPressed:Connect(v96));
        return;
    end;
end;
v39.RevealItemsOpened = function(v99, v100, _, _) --[[ Line: 420 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v20 (ref), v30 (ref)
    v99._dump:Clean();
    v99._dump = nil;
    v99._opening = false;
    v99._revealingItem = false;
    v20:Toggle("TreasureOpen", false):await();
    if v99._allToggled then
        v99._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v100, table.clone(v99._allToggled));
    v99._allToggled = nil;
end;
v39.RevealItem = function(v103, v104, _, v106) --[[ Line: 448 ]] --[[ Name: RevealItem ]]
    -- upvalues: v32 (ref), v33 (ref), v20 (ref), l_RunService_0 (copy), v21 (ref), v25 (ref), v27 (ref), v22 (ref)
    v103._dump:Clean();
    v103._dump:Add(function() --[[ Line: 451 ]]
        -- upvalues: v103 (copy), v32 (ref), v33 (ref)
        v103._dump = nil;
        if not v103._openAll then
            v103._allToggled = nil;
        end;
        task.delay(0.2, function() --[[ Line: 458 ]]
            -- upvalues: v32 (ref), v33 (ref), v103 (ref)
            v32.Attachment.SpotLight.Enabled = true;
            v33.Attachment.SpotLight.Enabled = true;
            v103._revealingItem = false;
        end);
        v103._opening = false;
    end);
    v20:Toggle("TreasureOpen", false):await();
    v103._allToggled.TreasureOpen = nil;
    local function v107() --[[ Line: 471 ]] --[[ Name: handleFinished ]]
        -- upvalues: v107 (ref), v103 (copy), l_RunService_0 (ref), v106 (copy)
        v107 = nil;
        v103._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v103._openAll then
            v103:AttemptOpen(v106, 1, v103._openAll);
        end;
    end;
    if v104.type == "RandomUnit" or v104.type == "Unit" then
        v103._dump:Add(v21.QueueCompleted:Once(v107));
        v25.UnitGained:Fire({
            v104.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v103._openAll or false
        }, table.clone(v103._allToggled));
        return;
    else
        v103._dump:Add(v27.Finished:Once(v107));
        v27:QueueRewards(v104, table.clone(v103._allToggled), v103._openAll);
        task.delay(3.4, function() --[[ Line: 497 ]]
            -- upvalues: v22 (ref)
            v22:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v39.PlayAnimation = function(_, v109, v110, v111, v112, v113) --[[ Line: 503 ]] --[[ Name: PlayAnimation ]]
    if not v109 or not v110 then
        return;
    else
        if v113 == nil then
            v113 = true;
        end;
        v111 = v111 or {};
        local l_AnimationController_0 = v109:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v115 = l_AnimationController_0:LoadAnimation(v110);
            for v116, v117 in v111 do
                v115[v116] = v117;
            end;
            if v112 then
                for v118, v119 in v112 do
                    v115:GetMarkerReachedSignal(v118):Once(function(...) --[[ Line: 529 ]]
                        -- upvalues: v119 (copy), v115 (copy)
                        v119(v115, ...);
                    end);
                end;
            end;
            if v113 then
                v115:Play();
            end;
            return v115;
        end;
    end;
end;
v39.AttemptOpen = function(v120, v121, v122, v123) --[[ Line: 542 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v23 (ref), v28 (ref), v17 (ref), v20 (ref)
    if v120:IsOpening() then
        return;
    elseif v23:IsOpening() then
        return;
    else
        v122 = v122 or 1;
        v123 = v122 <= 1;
        v120._chestName = v121;
        v120:ToggleOpenAll(v123 or false);
        local v124 = nil;
        v124 = task.delay(0.25, function() --[[ Line: 568 ]]
            -- upvalues: v124 (ref), v28 (ref)
            v124 = nil;
            v28:Toggle(true);
        end);
        if v122 > 1 then
            v17:OpenCustomChestAmount(v121, v122):andThen(function(v125, v126, v127) --[[ Line: 574 ]]
                -- upvalues: v20 (ref), v120 (copy), v121 (copy)
                if not v125 or not v126 then
                    v20:Toggle("Items", true);
                    return;
                else
                    v120:OpenTreasure(v121, v125, v126, v127);
                    return;
                end;
            end):catch(function() --[[ Line: 582 ]]
                -- upvalues: v20 (ref), v120 (copy)
                v20:Toggle("Items", true);
                if v120._openAll then
                    v120:OpenAllFailed(2);
                end;
            end):finally(function() --[[ Line: 588 ]]
                -- upvalues: v28 (ref), v124 (ref), v120 (copy)
                v28:Toggle(false);
                if v124 then
                    task.cancel(v124);
                end;
                v120._processingRequest = false;
            end);
            return;
        else
            v17:Open(v121):andThen(function(v128, v129, v130) --[[ Line: 600 ]]
                -- upvalues: v20 (ref), v120 (copy), v28 (ref), v124 (ref), v121 (copy)
                if not v128 or not v129 then
                    v20:Toggle("Items", true);
                    if v120._openAll then
                        v120:OpenAllFailed(1);
                    end;
                    v120:ToggleOpenAll(false);
                    return;
                else
                    v28:Toggle(false);
                    if v124 then
                        task.cancel(v124);
                    end;
                    v120:OpenTreasure(v121, v128, v129, v130);
                    return;
                end;
            end):catch(function(v131) --[[ Line: 620 ]]
                -- upvalues: v20 (ref), v120 (copy)
                warn("caught err", v131);
                v20:Toggle("Items", true);
                if v120._openAll then
                    v120:OpenAllFailed(2);
                end;
                v120:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 629 ]]
                -- upvalues: v28 (ref), v124 (ref)
                v28:Toggle(false);
                if v124 then
                    task.cancel(v124);
                end;
            end);
            return;
        end;
    end;
end;
v39.OpenAllFailed = function(v132, v133) --[[ Line: 639 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v20 (ref), v19 (ref), v18 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v133)));
    v132:ToggleOpenAll(false);
    if v132._allToggled then
        v20:RevertFromToggleAll(v132._allToggled);
        v132._allToggled = nil;
    end;
    v19:TogglePlayerControls(true);
    v18:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v39.ToggleOpenAll = function(v134, v135) --[[ Line: 655 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v26 (ref)
    v134._openAll = v135;
    v26:ReportOpenAll(v135);
end;
v39._setRarityVisual = function(_, v137, v138, v139) --[[ Line: 660 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v34 (ref), v13 (copy), v26 (ref)
    v138 = v138 or 1;
    if v34 then
        v34.SurfaceGui.ImageLabel.UIGradient.Color = v13.Gradient[v137];
        v34.SurfaceGui.Spotlight.UIGradient.Color = v13.Gradient[v137];
    end;
    v26:SetIndex(v137, v138, v139, true);
end;
return v39;