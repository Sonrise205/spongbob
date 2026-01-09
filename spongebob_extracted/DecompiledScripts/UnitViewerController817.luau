local l_CollectionService_0 = game:GetService("CollectionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.Input);
local v10 = require(l_ReplicatedStorage_0.Packages.Signal);
local v11 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v12 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v14 = require(v7.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v16 = require(l_ReplicatedFirst_0.PlaceIds);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.CameraShaker);
local v19 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v20 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local _ = require(l_ReplicatedStorage_0.Shared.Util.CharacterUtil);
local _ = v9.Keyboard.new();
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
local v36 = nil;
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
local l_VFX_0 = l_ReplicatedStorage_0.VFX;
local v39 = nil;
local v40 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
local v41 = {
    VFX1 = {
        Bubbles = {
            Emit = 10, 
            Duration = 0.8
        }, 
        Sparkles = {
            Emit = 10, 
            Duration = 0.8
        }, 
        WaterSlash = {
            Emit = 1
        }
    }, 
    VFX2 = {
        Explosion = {
            Emit = 8, 
            Duration = 0.5
        }
    }, 
    SHINY_OR_WUMBO_VFX = {
        Winds = {
            Emit = 1, 
            Duration = 1
        }, 
        Impact = {
            Emit = 5, 
            Duration = 1
        }, 
        Particles = {
            Emit = 50, 
            Duration = 1
        }
    }, 
    SHINY_WUMBO_VFX = {
        Rain_Anticipation = {
            Emit = 0, 
            Duration = 1.1
        }, 
        Winds = {
            Emit = 1, 
            Duration = 1
        }, 
        Impact = {
            Emit = 5, 
            Duration = 1
        }, 
        Particles = {
            Emit = 50, 
            Duration = 1
        }, 
        Outro = {
            Emit = 8, 
            Duration = 0.5
        }
    }
};
local v42 = nil;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
local l_Shiny_0 = l_VFX_0.Towers.Shiny;
local v46 = v7.CreateController({
    Name = script.Name, 
    FinishedTweeningIn = v10.new(), 
    QueueCompleted = v10.new(), 
    _viewDumpster = v8.new(), 
    _unitQueue = nil, 
    _currentQueueIndex = 1, 
    _animatingActive = false
});
local function v51(v47) --[[ Line: 147 ]] --[[ Name: createUnitModel ]]
    -- upvalues: l_Friendlies_0 (copy)
    local l_l_Friendlies_0_FirstChild_0 = l_Friendlies_0:FindFirstChild(v47);
    l_l_Friendlies_0_FirstChild_0 = l_l_Friendlies_0_FirstChild_0 and l_l_Friendlies_0_FirstChild_0:Clone();
    if not l_l_Friendlies_0_FirstChild_0 then
        return;
    else
        l_l_Friendlies_0_FirstChild_0.PrimaryPart.Anchored = true;
        for _, v50 in l_l_Friendlies_0_FirstChild_0:GetDescendants() do
            if v50:IsA("BasePart") then
                v50.CanQuery = false;
                v50.CanCollide = false;
                v50.CastShadow = false;
            end;
        end;
        return l_l_Friendlies_0_FirstChild_0;
    end;
end;
v46.KnitInit = function(_) --[[ Line: 168 ]] --[[ Name: KnitInit ]]
    -- upvalues: v23 (ref), v7 (copy), v24 (ref), v25 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref)
    v23 = v7.GetController("DataController");
    v24 = v7.GetController("UIController");
    v25 = v7.GetService("UnitService");
    v26 = v7.GetController("CharacterController");
    v27 = v7.GetController("NPEController");
    v28 = v7.GetController("FastTravelController");
    v29 = v7.GetController("AudioController");
    v30 = v7.GetController("CamShakeController");
    v31 = v7.GetController("DeviceTypeController");
    v32 = v7.GetController("TreasureController");
    v33 = v7.GetController("MountController");
    v34 = v7.GetController("CraftingController");
end;
v46.KnitStart = function(v53) --[[ Line: 184 ]] --[[ Name: KnitStart ]]
    -- upvalues: v16 (copy), v39 (ref), v42 (ref), l_TweenService_0 (copy), l_CurrentCamera_0 (copy), l_CollectionService_0 (copy), v35 (ref), v24 (ref), v36 (ref), l_UserInputService_0 (copy), v31 (ref), v29 (ref), v27 (ref), l_FieldOfView_0 (copy), v28 (ref), v11 (copy), v26 (ref), v34 (ref), v25 (ref), v32 (ref)
    if not v16:IsHUB() then
        return;
    else
        local function v55(v54) --[[ Line: 189 ]] --[[ Name: summonCamPartAdded ]]
            -- upvalues: v39 (ref), v42 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref)
            v54.Transparency = 1;
            v39 = v54;
            v42 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1.55, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                CFrame = v39.CFrame, 
                FieldOfView = 55
            });
        end;
        for _, v57 in l_CollectionService_0:GetTagged("SummonPOV") do
            v55(v57);
            break;
        end;
        l_CollectionService_0:GetInstanceAddedSignal("SummonPOV"):Connect(v55);
        v35 = v24:GetModuleAsync("SummonResults"):expect();
        v36 = v24:GetModuleAsync("UnitView"):expect();
        l_UserInputService_0.InputBegan:Connect(function(v58, v59) --[[ Line: 216 ]]
            -- upvalues: v53 (copy)
            if v59 then
                return;
            elseif v53._queueFinished then
                return;
            else
                if v58.UserInputType == Enum.UserInputType.MouseButton1 or v58.UserInputType == Enum.UserInputType.Touch then
                    v53:ShowNextInQueue();
                end;
                return;
            end;
        end);
        v31.GamepadButtonPressed:Connect(function() --[[ Line: 231 ]]
            -- upvalues: v53 (copy)
            if v53._queueFinished then
                return;
            else
                v53:ShowNextInQueue();
                return;
            end;
        end);
        local function v60() --[[ Line: 239 ]] --[[ Name: revertToggleAll ]]
            -- upvalues: v53 (copy), v24 (ref)
            if v53._uiToggled then
                v24:RevertFromToggleAll(v53._uiToggled);
                v53._uiToggled = nil;
            end;
        end;
        v53.QueueCompleted:Connect(function(v61) --[[ Line: 247 ]]
            -- upvalues: v53 (copy), v29 (ref), v24 (ref), v27 (ref), l_CurrentCamera_0 (ref), l_FieldOfView_0 (ref), v28 (ref), v11 (ref), v35 (ref), v60 (copy), v26 (ref), v31 (ref), v34 (ref)
            v53._queueFinished = true;
            v29:FadeMusicVolume(1, 0.5);
            v53._viewDumpster:Clean();
            v24:Toggle("UnitView", false);
            if v27:IsInNPE() then
                v27:EndNPE();
            end;
            l_CurrentCamera_0.FieldOfView = l_FieldOfView_0;
            if not v53._extraData or not v53._extraData.fromTreasureOpenAll then
                l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
            end;
            if v53._npeSummon then
                v28:ResetCamera();
            end;
            local v62 = #v11.Keys(v53._unitsSummoned);
            if v53._unitsSummoned and not v53._npeSummon and not v53._rewardSummon and (v62 > 1 or v61) then
                v35:ShowResults(v11.Copy(v53._unitsSummoned, true), v60, v53._rewardSummon);
                v53._unitsSummoned = nil;
                v53._npeSummon = nil;
                v53._rewardSummon = nil;
            elseif (not v53._extraData or not v53._extraData.fromTreasureOpenAll) and v53._uiToggled then
                v24:RevertFromToggleAll(v53._uiToggled);
                v53._uiToggled = nil;
            end;
            if not v53._extraData or not v53._extraData.fromTreasureOpenAll then
                v26:ToggleHideAll(false);
                v31:TogglePlayerControls(true);
                if v53._isCrafting then
                    v53._isCrafting = nil;
                    v34:StartCrafting();
                end;
            end;
            v53._extraData = nil;
            v53._unitQueue = nil;
            v53._currentQueueIndex = 0;
            v53._queueFinished = nil;
        end);
        v25.UnitsSummoned:Connect(function(v63, v64) --[[ Line: 299 ]]
            -- upvalues: v24 (ref), v53 (copy)
            local v65 = {};
            if v24:GetToggleState("ItemRoll") == true then
                repeat
                    task.wait(0.1);
                until v24:GetToggleState("ItemRoll") == false;
                v24:Toggle("PlaytimePrizes", false);
            end;
            for _, v67 in v63 do
                table.insert(v65, {
                    unitName = v67.Name, 
                    unitData = v67
                });
            end;
            if v64 then
                v53._npeSummon = v64.fromNPE or false;
                v53._rewardSummon = v64.fromReward or v64.fromRewards or false;
            end;
            v53._unitsSummoned = v63;
            v53:PlaySummonSequence(v65);
        end);
        v32.UnitGained:Connect(function(v68, v69, v70) --[[ Line: 340 ]]
            -- upvalues: v53 (copy)
            local v71 = {};
            v53._uiToggled = v70;
            for _, v73 in v68 do
                table.insert(v71, {
                    unitName = v73.Name, 
                    unitData = v73
                });
            end;
            if v69 then
                v53._npeSummon = v69.fromNPE or false;
                v53._rewardSummon = v69.fromReward or false;
                v53._extraData = v69;
            end;
            v53._unitsSummoned = v68;
            v53:PlaySummonSequence(v71);
        end);
        return;
    end;
end;
v46.ViewUnitQueue = function(v74, v75, v76) --[[ Line: 364 ]] --[[ Name: ViewUnitQueue ]]
    -- upvalues: v11 (copy)
    if v74._unitQueue then
        return;
    else
        table.sort(v75, function(v77, v78) --[[ Line: 369 ]]
            return v77.unitData.Rarity < v78.unitData.Rarity;
        end);
        v74._unitQueue = v75;
        if #v11.Keys(v75) > 10 then
            v74._queueFinished = true;
            v74.QueueCompleted:Fire(true);
            return;
        else
            v74._currentQueueIndex = 1;
            v74:ViewUnit(v75[1].unitName, v75[1].unitData, v76);
            return;
        end;
    end;
end;
v46.ViewUnit = function(v79, v80, v81, v82) --[[ Line: 385 ]] --[[ Name: ViewUnit ]]
    -- upvalues: v26 (ref), v36 (ref), v51 (copy), v24 (ref), l_CurrentCamera_0 (copy), v39 (ref), l_Shiny_0 (copy), v14 (copy), v15 (copy), v20 (copy), v29 (ref), v40 (copy), v17 (copy), l_VFX_0 (copy), v19 (copy)
    if v79._viewDumpster then
        v79._viewDumpster:Clean();
    end;
    v26:ToggleHideAll(true);
    v36:_resetTweenStates();
    local v83 = v51(v80);
    if not v83 then
        return;
    else
        local l_v83_Attribute_0 = v83:GetAttribute("SummonScale");
        if l_v83_Attribute_0 then
            v83:ScaleTo(v83:GetScale() * l_v83_Attribute_0);
        end;
        v79._animatingActive = true;
        v24:Toggle("UnitView", true);
        l_v83_Attribute_0 = v83:GetExtentsSize();
        local v85 = math.max(l_v83_Attribute_0.X, l_v83_Attribute_0.Y, l_v83_Attribute_0.Z) * 1.5;
        local v86 = Vector3.new(0, 1, 0, 0) * (l_v83_Attribute_0.Y / 2);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.FieldOfView = 65;
        local v87 = if not v79._npeSummon then v39.CFrame else l_CurrentCamera_0.CFrame;
        local l_v83_Attribute_1 = v83:GetAttribute("SummonOffset");
        if l_v83_Attribute_1 then
            v87 = v87 * CFrame.new(l_v83_Attribute_1);
        end;
        local l_v83_Attribute_2 = v83:GetAttribute("SummonOrientation");
        if not l_v83_Attribute_2 then
            warn("No summon orientation for", v80, "using default");
            l_v83_Attribute_2 = CFrame.Angles(0, 0, 0);
        end;
        l_CurrentCamera_0.CFrame = v87;
        local v90 = v87.LookVector * v85;
        local v91 = v87.Position + v90 - v86;
        local v92 = (l_CurrentCamera_0.CFrame.Position - v91) * Vector3.new(1, 0, 1, 0);
        local v93 = if v92.Magnitude > 1.0E-4 then v92.Unit else -v87.LookVector * Vector3.new(1, 0, 1, 0);
        if v93.Magnitude <= 1.0E-4 then
            v93 = Vector3.new(0, 0, 1, 0);
        end;
        local v94 = CFrame.lookAt(v91, v91 + v93) * l_v83_Attribute_2;
        local v95 = v87.Position + v90 * 1.5 - v86;
        local v96 = (l_CurrentCamera_0.CFrame.Position - v95) * Vector3.new(1, 0, 1, 0);
        local v97 = if v96.Magnitude > 1.0E-4 then v96.Unit else -v87.LookVector * Vector3.new(1, 0, 1, 0);
        if v97.Magnitude <= 1.0E-4 then
            v97 = Vector3.new(0, 0, 1, 0);
        end;
        local v98 = CFrame.lookAt(v95, v95 + v97) * l_v83_Attribute_2;
        local l_SurfaceLight_0 = Instance.new("SurfaceLight");
        l_SurfaceLight_0.Brightness = 0.65;
        l_SurfaceLight_0.Shadows = true;
        l_SurfaceLight_0.Parent = v83.PrimaryPart;
        if v81.Shiny then
            local l_v83_ExtentsSize_0 = v83:GetExtentsSize();
            local v101 = l_v83_ExtentsSize_0 / 2;
            local v102 = l_Shiny_0:Clone();
            v102.Size = l_v83_ExtentsSize_0;
            local l_WorldCFrame_0 = v83.PrimaryPart.FloorPoint.WorldCFrame;
            v102.CFrame = l_WorldCFrame_0.Rotation + (l_WorldCFrame_0.Position + Vector3.new(0, v101.Y, 0));
            v102.Parent = v83;
            for _, v105 in v102:GetDescendants() do
                if v105:IsA("ParticleEmitter") then
                    v105.Enabled = true;
                end;
            end;
        end;
        v83.Parent = l_CurrentCamera_0;
        if not v83:IsDescendantOf(workspace) then
            v83.AncestryChanged:Wait();
        end;
        local v106 = v79._viewDumpster:Construct(v14, v80, v83, "Friendlies");
        v106:Play("Summon");
        v79._viewDumpster:Add(v83);
        v83:PivotTo(v98);
        local v107 = 1;
        if v79._unitQueue and #v79._unitQueue >= 5 then
            v107 = v107 / 2;
        end;
        local v108 = TweenInfo.new(v107, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
        local v110 = v15("CFrameValue", v98, v108, {
            Value = v94
        }, function(v109) --[[ Line: 501 ]]
            -- upvalues: v83 (copy)
            v83:PivotTo(v109);
        end);
        local v111 = select(2, v20:GetRarity(v80));
        if not v82 then
            v29:PlaySound({
                name = ("Summoning.%*Summon"):format(v111), 
                soundGroup = "Master.SFX.UI"
            });
        end;
        v110:Add(function() --[[ Line: 514 ]]
            -- upvalues: v81 (copy), v83 (copy), v15 (ref), v40 (ref), v17 (ref), v79 (copy), v80 (copy), l_VFX_0 (ref), v20 (ref), v19 (ref), v110 (ref)
            if v81.Mega then
                local l_v83_Scale_0 = v83:GetScale();
                v15("NumberValue", v83:GetScale(), v40, {
                    Value = l_v83_Scale_0 * (v17.TOWERS.MEGA_SCALE / 1.2)
                }, function(v113) --[[ Line: 521 ]]
                    -- upvalues: v83 (ref)
                    v83:ScaleTo(v113);
                end):Add(function() --[[ Line: 525 ]]
                    -- upvalues: v79 (ref), v80 (ref), v81 (ref)
                    v79.FinishedTweeningIn:Fire(v80, v81, v79._unitsSummoned ~= nil, v79._npeSummon);
                end);
                return;
            else
                local v114 = l_VFX_0.UnitBackdrop:FindFirstChildOfClass("Attachment"):Clone();
                v114.Parent = v83.PrimaryPart;
                local v115 = select(2, v20:GetRarity(v80));
                for _, v117 in v114:GetDescendants() do
                    if v117:IsA("ParticleEmitter") then
                        v117.Color = v19.Gradient[v115];
                    end;
                end;
                v79.FinishedTweeningIn:Fire(v80, v81, v79._unitsSummoned ~= nil, v79._npeSummon);
                v110 = nil;
                return;
            end;
        end);
        if v110 then
            v79.FinishedTweeningIn:Wait();
        end;
        v106:Play("Idle");
        task.delay(0.25, function() --[[ Line: 553 ]]
            -- upvalues: v79 (copy)
            v79._animatingActive = false;
        end);
        return;
    end;
end;
v46.ShowNextInQueue = function(v118) --[[ Line: 560 ]] --[[ Name: ShowNextInQueue ]]
    if not v118._unitQueue then
        return;
    elseif v118._animatingActive then
        return;
    else
        v118._currentQueueIndex = v118._currentQueueIndex + 1;
        if v118._currentQueueIndex > #v118._unitQueue then
            v118.QueueCompleted:Fire();
            v118._unitQueue = nil;
            v118._currentQueueIndex = 0;
            return;
        else
            local v119 = v118._unitQueue[v118._currentQueueIndex];
            v118:ViewUnit(v119.unitName, v119.unitData);
            return;
        end;
    end;
end;
v46.PlaySummonSequence = function(v120, v121, v122, v123) --[[ Line: 586 ]] --[[ Name: PlaySummonSequence ]]
    -- upvalues: l_CollectionService_0 (copy), v34 (ref), v29 (ref), l_GuiService_0 (copy), v8 (copy), v17 (copy), v26 (ref), v24 (ref), l_ReplicatedStorage_0 (copy), v39 (ref), l_CurrentCamera_0 (copy), v12 (copy), l_RunService_0 (copy), v19 (copy), v41 (copy), v15 (copy), v40 (copy), v30 (ref), v42 (ref)
    if v120._summoningActive then
        return;
    else
        local v124 = l_CollectionService_0:GetTagged("SummonBanner")[1];
        if v124 then
            v124.Enabled = false;
        end;
        v120._isCrafting = v34:IsCrafting();
        v34:StopCrafting(true);
        if not v122 then
            v29:FadeMusicVolume(0.1, 0.5);
        end;
        l_GuiService_0.TouchControlsEnabled = false;
        local v125 = v8.new();
        local v126 = 1;
        local v127 = false;
        local v128 = false;
        local v129 = false;
        for _, v131 in v121 do
            if v131.unitData.Rarity then
                if v131.unitData.Shiny and v131.unitData.Mega then
                    v129 = true;
                end;
                if v131.unitData.Shiny then
                    v127 = true;
                end;
                if v131.unitData.Mega then
                    v128 = true;
                end;
                if v126 < v131.unitData.Rarity then
                    v126 = v131.unitData.Rarity;
                end;
            end;
        end;
        v126 = v17.RARITIES_FROM_INDEX[v126];
        if not v122 then
            v26:ToggleHideAll(true);
            if not v120._uiToggled then
                v120._uiToggled = v24:ToggleAll({}, false);
            end;
        end;
        v120._summoningActive = true;
        local v132 = l_ReplicatedStorage_0.Models.KrabbyPattySummon:Clone();
        v132:PivotTo(v39.CFrame * CFrame.new(0, -0.25, -4));
        v132.Parent = l_CurrentCamera_0;
        if not v132:IsDescendantOf(workspace) then
            v132.AncestryChanged:Wait();
        end;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.FieldOfView = 70;
        l_CurrentCamera_0.CFrame = v39.CFrame * CFrame.new(0, 0, 1);
        local l_KrabbyPatty_0 = v132:WaitForChild("KrabbyPatty");
        local l_Animator_0 = l_KrabbyPatty_0:WaitForChild("AnimationController"):WaitForChild("Animator");
        local v135 = l_Animator_0:LoadAnimation(l_ReplicatedStorage_0.Animations.KrabbyPattySummon);
        v135.Looped = false;
        v135.Priority = Enum.AnimationPriority.Action3;
        local v136 = l_Animator_0:LoadAnimation(l_ReplicatedStorage_0.Animations.KrabbyPattyShake);
        v136.Looped = false;
        v136.Priority = Enum.AnimationPriority.Action4;
        if not v12.new(function(v137, v138) --[[ Line: 672 ]]
            -- upvalues: l_RunService_0 (ref), v135 (copy), v136 (copy), v17 (ref)
            local v139 = 0;
            l_RunService_0.Heartbeat:Connect(function(v140) --[[ Line: 675 ]]
                -- upvalues: v139 (ref), v135 (ref), v136 (ref), v137 (copy), v17 (ref), v138 (copy)
                v139 = v139 + v140;
                if v135.Length ~= 0 and v136.Length ~= 0 then
                    v137();
                    return;
                else
                    if v139 >= v17.ANIMATIONS.MAX_LOAD_TIME then
                        v138();
                    end;
                    return;
                end;
            end);
        end):await() then
            v123 = (v123 or 0) + 1;
            v132:Destroy();
            v120._summoningActive = false;
            if v123 > 2 then
                v120.QueueCompleted:Fire(true);
                return;
            else
                v120:PlaySummonSequence(v121, true, v123);
                return;
            end;
        else
            local v141 = {};
            for _, v143 in v132:GetDescendants() do
                if v143:IsA("ParticleEmitter") then
                    local l_v143_FirstAncestorOfClass_0 = v143:FindFirstAncestorOfClass("Part");
                    if l_v143_FirstAncestorOfClass_0 then
                        if not v141[l_v143_FirstAncestorOfClass_0.Name] then
                            v141[l_v143_FirstAncestorOfClass_0.Name] = {};
                        end;
                        if not l_v143_FirstAncestorOfClass_0:HasTag("DontColor") and not v143:HasTag("DontColor") then
                            v143.Color = v19.Gradient[v126 or "Common"];
                        end;
                        table.insert(v141[l_v143_FirstAncestorOfClass_0.Name], v143);
                    end;
                end;
            end;
            v135:GetMarkerReachedSignal("VFX1"):Once(function() --[[ Line: 732 ]]
                -- upvalues: v29 (ref), v41 (ref), v141 (ref)
                v29:PlaySound({
                    name = "Summoning.SummonIntro", 
                    soundGroup = "Master.SFX.UI"
                });
                for v145, v146 in v41.VFX1 do
                    for _, v148 in v141[v145] do
                        v148:Emit(v146.Emit);
                    end;
                end;
            end);
            v135:GetMarkerReachedSignal("VFX2"):Once(function() --[[ Line: 746 ]]
                -- upvalues: v29 (ref), v126 (ref), v128 (ref), v135 (copy), v15 (ref), l_KrabbyPatty_0 (copy), v40 (ref), v127 (ref), v136 (copy), v125 (copy)
                v29:PlaySound({
                    name = ("Summoning.%*Summon"):format(v126), 
                    soundGroup = "Master.SFX.UI"
                });
                if v128 then
                    v135:AdjustSpeed(0);
                    local function v152() --[[ Line: 755 ]] --[[ Name: shakeCompleted ]]
                        -- upvalues: v15 (ref), l_KrabbyPatty_0 (ref), v40 (ref), v127 (ref), v29 (ref), v135 (ref)
                        local v150 = v15("NumberValue", l_KrabbyPatty_0:GetScale(), v40, {
                            Value = l_KrabbyPatty_0:GetScale() * 3
                        }, function(v149) --[[ Line: 758 ]]
                            -- upvalues: l_KrabbyPatty_0 (ref)
                            l_KrabbyPatty_0:ScaleTo(v149);
                        end);
                        local v151 = "WumboSummon";
                        if v127 then
                            v151 = "ShinyWumboSummon";
                        end;
                        v29:PlaySound({
                            name = ("Summoning.%*"):format(v151), 
                            soundGroup = "Master.SFX.UI"
                        });
                        v150:Add(function() --[[ Line: 773 ]]
                            -- upvalues: v135 (ref)
                            v135:AdjustSpeed(1);
                        end);
                    end;
                    v136.Stopped:Once(v152);
                    local v153 = if v136.Length > 0 then v136.Length * 1.5 else 2;
                    v125:Add(task.delay(v153, function() --[[ Line: 781 ]]
                        -- upvalues: v125 (ref), v152 (copy)
                        v125:Remove("ShakeTimeout", true);
                        v152();
                    end), "ShakeTimeout");
                    v136:Play();
                end;
            end);
            local function v161() --[[ Line: 790 ]] --[[ Name: runAfterSummonStopped ]]
                -- upvalues: v125 (copy), l_KrabbyPatty_0 (copy), v41 (ref), v127 (ref), v128 (ref), v141 (ref), v30 (ref), v120 (copy), v121 (copy), v132 (ref)
                v125:Destroy();
                for _, v155 in l_KrabbyPatty_0:GetDescendants() do
                    if v155:IsA("BasePart") then
                        v155.Transparency = 1;
                    end;
                end;
                local l_VFX2_0 = v41.VFX2;
                if v127 and v128 then
                    l_VFX2_0 = v41.SHINY_WUMBO_VFX;
                elseif v127 or v128 then
                    l_VFX2_0 = v41.SHINY_OR_WUMBO_VFX;
                end;
                for v157, v158 in l_VFX2_0 do
                    for _, v160 in v141[v157] do
                        v160:Emit(v158.Emit);
                    end;
                end;
                v30:Shake(v128 and "SummonWumboShake" or "SummonShake", {
                    originalPivot = workspace.CurrentCamera.CFrame
                });
                v120:ViewUnitQueue(v121, true);
                task.delay(0.5, function() --[[ Line: 819 ]]
                    -- upvalues: v132 (ref), v120 (ref)
                    v132:Destroy();
                    v132 = nil;
                    v120._summoningActive = false;
                end);
                table.clear(v141);
                v141 = nil;
            end;
            local v162 = {};
            table.insert(v162, v12.new(function(v163) --[[ Line: 831 ]]
                -- upvalues: v42 (ref), v128 (ref), v30 (ref)
                v42.Completed:Once(function(v164) --[[ Line: 832 ]]
                    -- upvalues: v163 (copy), v128 (ref), v30 (ref)
                    v163();
                    if v164 ~= Enum.PlaybackState.Completed then
                        return;
                    else
                        if v128 then
                            v30:Shake("SummonSustain", {
                                originalPivot = workspace.CurrentCamera.CFrame
                            });
                        end;
                        return;
                    end;
                end);
            end));
            table.insert(v162, v12.new(function(v165) --[[ Line: 845 ]]
                -- upvalues: v135 (copy), v161 (copy)
                v135.Stopped:Connect(function() --[[ Line: 846 ]]
                    -- upvalues: v165 (copy), v161 (ref)
                    v165();
                    v161();
                end);
            end));
            v42:Play();
            v135:Play();
            v12.allSettled(v162):andThen(function() --[[ Line: 855 ]]
                -- upvalues: l_CurrentCamera_0 (ref), l_GuiService_0 (ref)
                l_CurrentCamera_0.FieldOfView = 70;
                l_GuiService_0.TouchControlsEnabled = true;
            end);
            return;
        end;
    end;
end;
return v46;