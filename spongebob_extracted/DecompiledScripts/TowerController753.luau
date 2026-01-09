local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("HttpService");
local _ = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v10 = require(l_ReplicatedStorage_0.Packages.Knit);
local v11 = require(l_ReplicatedStorage_0.Packages.Fusion);
local l_peek_0 = v11.peek;
local v13 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v14 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v15 = require(l_ReplicatedStorage_0.Packages.Signal);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v17 = require(l_ReplicatedStorage_0.Packages.Input);
local v18 = require(l_ReplicatedStorage_0.Packages.Promise);
local v19 = require(l_ReplicatedStorage_0.Packages.Tree);
local v20 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local v21 = require(l_ReplicatedStorage_0.ReplicaController);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v23 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v24 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v25 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v26 = require(v10.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v27 = require(l_ReplicatedFirst_0.PlaceIds);
local v28 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v29 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v30 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v31 = require(l_ReplicatedStorage_0.TowerAttackInfos);
local v32 = require(v10.Player.PlayerScripts.Knit.Modules.UIClasses.PlacementTooltip);
local v33 = require(v10.Player.PlayerScripts.Knit.Modules.UIClasses.MobilePlacement);
local v34 = require(v10.Player.PlayerScripts.Knit.Modules.UIClasses.ConsolePlacement);
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
local _ = {
    Enum.UserInputType.MouseButton1, 
    Enum.KeyCode.ButtonA
};
local v53 = RaycastParams.new();
v53.FilterType = Enum.RaycastFilterType.Include;
v53.CollisionGroup = "Friendlies";
local v54 = {
    [1] = {
        Enum.KeyCode.One
    }, 
    [2] = {
        Enum.KeyCode.Two
    }, 
    [3] = {
        Enum.KeyCode.Three
    }, 
    [4] = {
        Enum.KeyCode.Four
    }, 
    [5] = {
        Enum.KeyCode.Five
    }, 
    [6] = {
        Enum.KeyCode.Six
    }
};
local l_White_0 = v30.Solid.White;
local l_DeepPurple_0 = v30.Solid.DeepPurple;
local v57 = {
    [true] = {
        frame = Color3.fromRGB(0, 148, 156), 
        gradient = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#0c9eff")), 
            ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
        }), 
        halo = Color3.fromRGB(0, 150, 255), 
        beam = ColorSequence.new(Color3.fromRGB(0, 150, 255))
    }, 
    [false] = {
        frame = Color3.new(1, 1, 1), 
        gradient = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new()), 
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("#ff676a")), 
            ColorSequenceKeypoint.new(1, Color3.new())
        }), 
        halo = Color3.fromHex("#ff676a"), 
        beam = ColorSequence.new(Color3.fromHex("#ff676a"))
    }
};
local l_Highlight_0 = Instance.new("Highlight");
l_Highlight_0.Name = "SelectionHighlight";
l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
l_Highlight_0.FillTransparency = 1;
l_Highlight_0.OutlineTransparency = 0;
l_Highlight_0.Adornee = nil;
l_Highlight_0.Parent = workspace.CurrentCamera;
local v59 = l_Highlight_0:Clone();
v59.Name = "FocusHighlight";
v59.FillColor = Color3.new(1, 1, 1);
v59.Parent = workspace.CurrentCamera;
local v60 = v59:Clone();
v60.Name = "PlacingHighlight";
v60.Parent = workspace.CurrentCamera;
local l_Highlight_1 = Instance.new("Highlight");
l_Highlight_1.Name = "NoBuildHighlight";
l_Highlight_1.FillTransparency = 0;
l_Highlight_1.OutlineTransparency = 1;
l_Highlight_1.Adornee = nil;
l_Highlight_1.DepthMode = Enum.HighlightDepthMode.Occluded;
l_Highlight_1.Parent = workspace.CurrentCamera;
local l_Objects_0 = l_ReplicatedStorage_0.Objects;
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
local l_AttackType_0 = l_ReplicatedStorage_0.VFX.Towers.AttackType;
local v65 = nil;
local v66 = nil;
local l_Friendlies_1 = l_ReplicatedStorage_0.Animations.Friendlies;
local v68 = {};
local v69 = {};
local v70 = {};
local v71 = {};
local v72 = {};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v74 = v17.Mouse.new();
local v75 = l_Objects_0.RangeFinder.RangeViewer:Clone();
local v76 = l_Objects_0.RangeFinder.FocusRangeViewer:Clone();
local l_Rings_0 = v76.PrimaryPart.Attachment.Rings;
local v78 = l_Objects_0.RangeFinder.UpgradeRangeViewer:Clone();
local v79 = {};
local l_SurfaceGui_0 = v78.PrimaryPart:FindFirstChildOfClass("SurfaceGui");
local l_Main_0 = l_SurfaceGui_0.Main;
local l_Halo_0 = l_SurfaceGui_0.Halo;
v79 = {
    [true] = {
        l_TweenService_0:Create(l_Main_0, v51, {
            BackgroundTransparency = 0.7
        }), 
        l_TweenService_0:Create(l_Halo_0, v51, {
            ImageTransparency = 0
        })
    }, 
    [false] = {
        l_TweenService_0:Create(l_Main_0, v51, {
            BackgroundTransparency = 1
        }), 
        l_TweenService_0:Create(l_Halo_0, v51, {
            ImageTransparency = 1
        })
    }
};
l_SurfaceGui_0 = v10.CreateController({
    Name = script.Name, 
    TowerSelected = v15.new(), 
    TowerDeselected = v15.new(), 
    StoppedPlacing = v15.new(), 
    TowerReplicaReceived = v15.new(), 
    currentLoadout = {}, 
    currentLoadoutUnits = {}, 
    _canPlace = true, 
    _buildRotation = 0, 
    _placementTower = nil, 
    _placementModeActive = false, 
    _previewingUpgradeRange = false, 
    _upgradeRangeDumpster = v13.new()
});
l_Main_0 = function(v83, v84, _) --[[ Line: 247 ]] --[[ Name: processClick ]]
    -- upvalues: l_SurfaceGui_0 (copy)
    if v83 ~= "MouseClick" and v83 ~= "Select" then
        return;
    elseif v84 ~= Enum.UserInputState.Begin then
        return;
    else
        l_SurfaceGui_0:_processWorldClick();
        return;
    end;
end;
l_SurfaceGui_0.KnitInit = function(v86) --[[ Line: 260 ]] --[[ Name: KnitInit ]]
    -- upvalues: v35 (ref), v10 (copy), v36 (ref), v37 (ref), v38 (ref), v39 (ref), v40 (ref), v41 (ref), v42 (ref), v43 (ref), v44 (ref), v45 (ref), v46 (ref), v47 (ref), v48 (ref), v27 (copy)
    v35 = v10.GetController("DataController");
    v36 = v10.GetService("TowerService");
    v37 = v10.GetController("UnitController");
    v38 = v10.GetService("GameService");
    v39 = v10.GetController("UIController");
    v40 = v10.GetController("DeviceTypeController");
    v41 = v10.GetController("CharacterController");
    v42 = v10.GetController("AudioController");
    v43 = v10.GetController("CutsceneController");
    v44 = v10.GetController("BossBattleController");
    v45 = v10.GetService("CardService");
    v46 = v10.GetController("PetController");
    v47 = v10.GetService("TowerKarateService");
    v48 = v10.GetService("SessionService");
    v86.currentMode = v27:GetDestination();
end;
l_SurfaceGui_0.KnitStart = function(v87) --[[ Line: 279 ]] --[[ Name: KnitStart ]]
    -- upvalues: v49 (ref), v39 (ref), v50 (ref), v65 (ref), v66 (ref), l_Friendlies_1 (copy), v69 (copy), v70 (copy), v68 (copy), v71 (copy), l_ReplicatedStorage_0 (copy), v10 (copy), v40 (ref), v20 (copy), v38 (ref), v19 (copy), l_TweenService_0 (copy), v59 (copy), v60 (copy), v21 (copy), v36 (ref), v72 (copy), v53 (copy), v35 (ref), v28 (copy), v29 (copy), v48 (ref), l_UserInputService_0 (copy), v14 (copy), v54 (copy), v45 (ref), v42 (ref), l_ContextActionService_0 (copy), l_Main_0 (copy), v16 (copy)
    if v87.currentMode ~= "Game" then
        return;
    else
        v49 = v39:GetModuleAsync("Notification"):expect();
        v50 = v39:GetModuleAsync("GameUI"):expect();
        v65 = workspace.Friendlies;
        v66 = workspace.Enemies;
        for _, v89 in l_Friendlies_1:GetChildren() do
            local v90 = {};
            for _, v92 in v89:GetChildren() do
                if v92:IsA("Animation") then
                    if string.find(string.lower(v92.Name), "ability") then
                        v69[v92.AnimationId] = true;
                        v70[v92.AnimationId] = v92.Name;
                    elseif not string.find(string.lower(v92.Name), "attack") then
                        v90[v92.AnimationId] = true;
                    end;
                end;
            end;
            v68[v89.Name] = v90;
        end;
        for _, v94 in script.AttackEffects:GetChildren() do
            local v95 = require(v94);
            v71[v94.Name] = v95;
        end;
        for _, v97 in v65:GetChildren() do
            task.spawn(v87._connectTowerAttacks, v87, v97);
        end;
        v65.ChildAdded:Connect(function(v98) --[[ Line: 323 ]]
            -- upvalues: v87 (copy)
            task.spawn(v87._connectTowerAttacks, v87, v98);
        end);
        v87.HoverHintBillboard = l_ReplicatedStorage_0.GUI.UnitHoverHint:Clone();
        v87.HoverHintBillboard.Adornee = nil;
        v87.HoverHintBillboard.Enabled = false;
        v87.HoverHintBillboard.PCMobile.Visible = false;
        v87.HoverHintBillboard.GamepadKeyCode.Visible = false;
        v87.HoverHintBillboard.Parent = v10.PlayerGui;
        v87.HoverHintBillboard.PCMobile.Visible = not v40:IsConsole();
        v87.HoverHintBillboard.GamepadKeyCode.Visible = v40:IsConsole();
        v40.DeviceChanged:Connect(function() --[[ Line: 337 ]]
            -- upvalues: v87 (copy), v40 (ref)
            v87.HoverHintBillboard.PCMobile.Visible = not v40:IsConsole();
            v87.HoverHintBillboard.GamepadKeyCode.Visible = v40:IsConsole();
        end);
        v87.HoverHintBillboard:GetPropertyChangedSignal("Adornee"):Connect(function() --[[ Line: 342 ]]
            -- upvalues: v87 (copy)
            v87.HoverHintBillboard.Enabled = v87.HoverHintBillboard.Adornee ~= nil;
        end);
        v87.levelInfo = select(2, v20.Custom(function() --[[ Line: 346 ]]
            -- upvalues: v38 (ref)
            return v38.LevelInfo:Get();
        end):await());
        if v87.levelInfo and v87.levelInfo.Mode ~= "BossBattle" and v87.levelInfo.Mode ~= "TowerOfKarate" then
            local v99 = v19.Await(workspace, "Map/Zones/BuildZone/BuildArea");
            v87._buildAreaPosition = v99.Position.Y + v99.Size.Y / 2;
        end;
        local v100 = l_TweenService_0:Create(v59, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
            FillTransparency = 0.5
        });
        local v101 = l_TweenService_0:Create(v60, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
            FillTransparency = 0.5
        });
        v100:Play();
        v101:Play();
        v21.ReplicaOfClassCreated("Towers", function(v102) --[[ Line: 366 ]]
            -- upvalues: v87 (copy)
            v87.towerReplica = v102;
            v87.TowerReplicaReceived:Fire(v87.towerReplica);
            v102:AddCleanupTask(function() --[[ Line: 371 ]]
                -- upvalues: v87 (ref), v102 (ref)
                v87.towerReplica = nil;
                v102 = nil;
            end);
        end);
        v36.ClearTowerCount:Connect(function(v103) --[[ Line: 378 ]]
            -- upvalues: v72 (ref)
            if v103 then
                v72[v103] = 0;
                return;
            else
                table.clear(v72);
                return;
            end;
        end);
        v53.FilterDescendantsInstances = {
            workspace:WaitForChild("Friendlies")
        };
        local v104 = false;
        local function v112(v105) --[[ Line: 394 ]] --[[ Name: updateLoadout ]]
            -- upvalues: v104 (ref), v35 (ref), v10 (ref), v28 (ref), v87 (copy)
            if v104 then
                return;
            else
                local v106 = v35:Get(v10.Player, "Units"):expect();
                if v104 then
                    return;
                else
                    for v107, v108 in v105 do
                        local v109, v110 = v28:ParseLoadout(v108);
                        v87.currentLoadout[v107] = v109;
                        local v111 = v106[v109];
                        if v111 then
                            v87.currentLoadoutUnits[v107] = v111[v110];
                        end;
                    end;
                    return;
                end;
            end;
        end;
        local v113 = v87.levelInfo.Mode == "Roguelike" and "RoguelikeLoadout" or "Loadout";
        v35:OnChanged(v10.Player, v113, v112, true);
        v38.PresetLoadout:Observe(function(v114) --[[ Line: 422 ]]
            -- upvalues: v104 (ref), v35 (ref), v10 (ref), v113 (copy), v112 (copy), v87 (copy), v29 (ref)
            if v114 == nil then
                return;
            else
                v104 = v114 ~= false;
                if not v114 then
                    local v115 = v35:Get(v10.Player, v113):expect();
                    v112(v115);
                    return;
                else
                    for v116 = 1, 6 do
                        local v117 = v114[v116];
                        if not v117 then
                            v87.currentLoadout[v116] = nil;
                            v87.currentLoadoutUnits[v116] = nil;
                        else
                            local v118 = table.clone(v29.UNITS.UNIT_TEMPLATE);
                            v118.Name = v117.UnitName;
                            if v117.ExtraData then
                                for v119, v120 in v117.ExtraData do
                                    v118[v119] = v120;
                                end;
                            end;
                            v87.currentLoadout[v116] = v117.UnitName;
                            v87.currentLoadoutUnits[v116] = v118;
                        end;
                    end;
                    return;
                end;
            end;
        end);
        local v121 = false;
        v48:PromiseGetMatchSettings():andThen(function(v122) --[[ Line: 460 ]]
            -- upvalues: v121 (ref)
            if v122 and v122.Mode == "TowerOfKarate" then
                v121 = true;
            end;
        end);
        l_UserInputService_0.InputBegan:Connect(function(v123, v124) --[[ Line: 467 ]]
            -- upvalues: v121 (ref), v14 (ref), v54 (ref), v87 (copy), v45 (ref), v42 (ref)
            if v124 or v121 then
                return;
            else
                local _, v127 = v14.Find(v54, function(v125) --[[ Line: 473 ]]
                    -- upvalues: v123 (copy)
                    return table.find(v125, v123.KeyCode);
                end);
                local v128 = v87.currentLoadout[v127];
                if not v128 or v128 == "" then
                    return;
                elseif v127 then
                    if v45.LockedLoadoutSlot:Get() == v127 then
                        return;
                    else
                        v87:StartTowerPlacement(v128, v127);
                        v42:PlaySound({
                            name = "UI.Click", 
                            soundGroup = "Master.SFX.UI"
                        });
                        return;
                    end;
                else
                    return;
                end;
            end;
        end);
        if l_UserInputService_0.TouchEnabled then
            l_UserInputService_0.TouchTapInWorld:Connect(function(v129, v130) --[[ Line: 502 ]]
                -- upvalues: v87 (copy)
                if v130 then
                    return;
                else
                    v87:_processWorldClick(v129);
                    return;
                end;
            end);
        end;
        l_ContextActionService_0:BindAction("MouseClick", l_Main_0, false, Enum.UserInputType.MouseButton1);
        v16.Simple(0.1, function() --[[ Line: 514 ]]
            -- upvalues: v87 (copy), l_ContextActionService_0 (ref), l_Main_0 (ref)
            if v87._placementModeActive then
                return;
            else
                local v131 = v87:_getTowerOnMouse();
                if not v131 then
                    l_ContextActionService_0:UnbindAction("Select");
                    v87._binded = false;
                end;
                if v87._currentUnitHoveredOn == v131 then
                    return;
                else
                    if v131 and not v87._binded then
                        v87._binded = true;
                        l_ContextActionService_0:BindAction("Select", l_Main_0, false, Enum.KeyCode.ButtonA);
                    end;
                    v87:_showHoverHighlightOnTower(v131);
                    return;
                end;
            end;
        end);
        v10.Player:GetAttributeChangedSignal("Stunned"):Connect(function() --[[ Line: 540 ]]
            -- upvalues: v10 (ref), v87 (copy)
            if v10.Player:GetAttribute("Stunned") or false then
                v87:StopTowerPlacement();
                v87:DeselectTower();
            end;
        end);
        v87:_ConnectEntityDrops();
        return;
    end;
end;
l_SurfaceGui_0.IsBuildModeActive = function(v132) --[[ Line: 552 ]] --[[ Name: IsBuildModeActive ]]
    return v132._placementModeActive;
end;
l_SurfaceGui_0.AttemptToPlaceTower = function(v133) --[[ Line: 557 ]] --[[ Name: AttemptToPlaceTower ]]
    -- upvalues: v49 (ref), v42 (ref), v36 (ref), v72 (copy)
    if not v133._placementCFrame or not v133._buildPreviewModel or not v133._unitBeingPlaced then
        return;
    else
        local l_name_0 = v133._unitBeingPlaced.name;
        local v135, v136 = v133:CanBuild();
        if not v135 then
            if v136 then
                v49:Notify({
                    message = v136, 
                    duration = 3, 
                    isPositive = false
                });
                return;
            else
                v42:PlaySound({
                    name = "UI.Error", 
                    soundGroup = "Master.SFX.UI"
                });
                return;
            end;
        else
            v36:PlaceTower(v133._placementCFrame, v133._unitBeingPlaced.index):andThen(function(v137) --[[ Line: 588 ]]
                -- upvalues: v72 (ref), l_name_0 (copy)
                if not v137 then
                    return;
                else
                    v72[l_name_0] = (v72[l_name_0] or 0) + 1;
                    return;
                end;
            end);
            v133:StopTowerPlacement();
            return;
        end;
    end;
end;
l_SurfaceGui_0.CanBuild = function(v138) --[[ Line: 599 ]] --[[ Name: CanBuild ]]
    -- upvalues: v38 (ref), v29 (copy), v25 (copy)
    if not v138._placementCFrame or not v138._placementTowerSize or not v138._placementNormal or not v138._unitBeingPlaced then
        return false;
    elseif v38.Gold:Get() < v138._unitBeingPlaced.cost then
        return false, "Need more Gold to place this Tower!";
    elseif v138._unitBeingPlaced.count + 1 > v138._unitBeingPlaced.max then
        return false, (("You can only place (%*) of this Tower!"):format(v138._unitBeingPlaced.max));
    elseif math.abs(v138._placementCFrame.Y - v138._buildAreaPosition) > v29.TOWERS.MAX_PLACEMENT_HEIGHT_OFFSET then
        return false, "Cannot place Tower here";
    elseif not v25:CanBuildHere(v138._placementCFrame.Position, v138._placementTowerSize, v138._placementNormal) then
        return false, "Cannot place Tower here";
    else
        return true;
    end;
end;
l_SurfaceGui_0.StartTowerPlacement = function(v139, v140, v141) --[[ Line: 632 ]] --[[ Name: StartTowerPlacement ]]
    -- upvalues: v39 (ref), v10 (copy), v43 (ref), v65 (ref), v44 (ref), v50 (ref), l_Friendlies_0 (copy), l_GuiService_0 (copy), l_GamepadService_0 (copy), l_ContextActionService_0 (copy), l_Main_0 (copy), v28 (copy), v72 (copy), v46 (ref), v29 (copy), v11 (copy), l_Objects_0 (copy), l_TweenService_0 (copy), v51 (copy), l_Highlight_1 (copy), v19 (copy), l_CurrentCamera_0 (copy), v60 (copy), v26 (copy), v13 (copy), l_peek_0 (copy), v40 (ref), v33 (copy), v34 (copy), v32 (copy), v42 (ref), v38 (ref), v25 (copy), v74 (copy), v57 (copy), l_RunService_0 (copy), v41 (ref), l_UserInputService_0 (copy)
    if v39:GetToggleState("RoundSummary") or v39:GetToggleState("EnemyAlert") or v39:GetToggleState("Cards") or v10.Player:GetAttribute("Stunned") then
        return;
    elseif v43:IsPlaying() then
        return;
    elseif v139.levelInfo.Mode == "BossBattle" then
        local l_v65_FirstChild_0 = v65:FindFirstChild(v140);
        v44:PreviewTower(l_v65_FirstChild_0);
        v50:BindBackButton(function() --[[ Line: 647 ]]
            -- upvalues: v44 (ref)
            v44:StartIdleLoop(true);
        end);
        return;
    elseif not v139._canPlace then
        return;
    elseif v139._unitBeingPlaced and v139._unitBeingPlaced.index == v141 then
        v139:StopTowerPlacement();
        return;
    else
        v139._canPlace = false;
        if v139._buildRangeFinder then
            v139:StopTowerPlacement(true);
        end;
        v139._canPlace = true;
        local l_l_Friendlies_0_FirstChild_0 = l_Friendlies_0:FindFirstChild(v140);
        if not l_l_Friendlies_0_FirstChild_0 then
            return;
        else
            v139:DeselectTower(true);
            l_GuiService_0.SelectedObject = nil;
            l_GamepadService_0:EnableGamepadCursor(nil);
            l_GuiService_0.SelectedObject = nil;
            local v144 = v139.currentLoadoutUnits[v141];
            v139._placementModeActive = true;
            if not v139._binded then
                v139._binded = true;
                l_ContextActionService_0:BindAction("Select", l_Main_0, false, Enum.KeyCode.ButtonA);
            end;
            v139._unitBeingPlaced = {
                index = v141, 
                name = v140, 
                cost = v28:GetUnitValue(v140, "Cost"), 
                count = v72[v140] or 0, 
                max = v28:GetMaxUnits(v140, v144, v46:GetEquippedPets())
            };
            if not v144 then
                return;
            else
                local l_v28_UnitValue_0 = v28:GetUnitValue(v140, "Size");
                local l_Mega_0 = v144.Mega;
                if l_Mega_0 then
                    l_v28_UnitValue_0 = l_v28_UnitValue_0 * v29.TOWERS.MEGA_SCALE;
                end;
                local v147 = l_v28_UnitValue_0 * 2;
                v139._placementTowerSize = l_v28_UnitValue_0;
                local l_v46_EquippedPets_0 = v46:GetEquippedPets();
                local v149 = v28:GetRange(v144, nil, nil, nil, l_v46_EquippedPets_0) - v29.IN_GAME.RANGE_VISUAL_REDUCTION;
                local v150 = v11.scoped(v11);
                local v151 = v150:Value(v147);
                local v152 = v150:Spring(v151, 20, 0.7);
                local v153 = v139._buildRangeFinder or l_Objects_0.RangeFinder.PlacementRangeViewer:Clone();
                v153.PrimaryPart.Size = Vector3.new(v147, 0.45, v147);
                v139._buildRangeFinder = v153;
                local v154 = v139._buildSizeViewer or l_Objects_0.RangeFinder.PlacementSizeViewer:Clone();
                v154.PrimaryPart.Size = Vector3.new(0, 0.44999998807907104, 0, 0);
                v139._buildSizeViewer = v154;
                local l_SurfaceGui_1 = v153.PrimaryPart:FindFirstChildOfClass("SurfaceGui");
                local l_Frame_0 = l_SurfaceGui_1.Frame;
                local l_UIGradient_0 = l_Frame_0.UIGradient;
                local l_Halo_1 = l_SurfaceGui_1.Halo;
                local v159 = l_Friendlies_0["*RootFriendly"]:Clone();
                v159.Name = "ModelPreview";
                v159.AlignPosition.Enabled = false;
                v159.AlignOrientation.Enabled = false;
                v159:SetAttribute("TowerName", v140);
                local l_FloorPoint_0 = v159.PrimaryPart.FloorPoint;
                v159.Parent = v153;
                local v161 = l_l_Friendlies_0_FirstChild_0:Clone();
                local l_PrimaryPart_0 = v161.PrimaryPart;
                local l_FloorPoint_1 = l_PrimaryPart_0.FloorPoint;
                v161.Parent = v159;
                v161.Name = "CharacterModel";
                v139._buildPreviewModel = v161;
                if l_Mega_0 then
                    v161:ScaleTo(v161:GetScale() * v29.TOWERS.MEGA_SCALE);
                end;
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = v159.PrimaryPart;
                l_Weld_0.Part0 = v159.PrimaryPart;
                l_Weld_0.Part1 = l_PrimaryPart_0;
                l_Weld_0.C0 = l_FloorPoint_1.CFrame:ToObjectSpace(l_FloorPoint_0.CFrame);
                local l_Weld_1 = Instance.new("Weld");
                l_Weld_1.Parent = v153.PrimaryPart;
                l_Weld_1.Part0 = v153.PrimaryPart;
                l_Weld_1.Part1 = v159.PrimaryPart;
                local l_Weld_2 = Instance.new("Weld");
                l_Weld_2.Parent = v154.PrimaryPart;
                l_Weld_2.Part0 = v154.PrimaryPart;
                l_Weld_2.Part1 = v159.PrimaryPart;
                local v167 = math.abs(l_FloorPoint_0.CFrame.Y);
                local v168 = Vector3.new(0, 1, 0, 0) * v167;
                l_Weld_1.C0 = CFrame.new(0, v167 + 0.225 - v29.TOWERS.RANGE_VIEWER_OFFSET, 0);
                l_Weld_2.C0 = CFrame.new(0, v167 + 0.225 - v29.TOWERS.RANGE_VIEWER_OFFSET, 0);
                local v169 = {
                    l_TweenService_0:Create(v154.PrimaryPart, v51, {
                        Size = Vector3.new(v147, 0.45, v147)
                    }), 
                    l_TweenService_0:Create(l_Highlight_1, TweenInfo.new(0.5), {
                        FillTransparency = 0.5
                    })
                };
                local v170 = select(2, v139:_showAttackTypeVFX(v140, v159, v149));
                if v139.fadeOutTween then
                    v139.fadeOutTween:Cancel();
                end;
                local l_Map_0 = workspace:FindFirstChild("Map");
                if l_Map_0 then
                    if v19.Exists(l_Map_0, "Zones/PathVisualZone") then
                        l_Highlight_1.Adornee = v19.Find(l_Map_0, "Zones/PathVisualZone");
                    end;
                    l_Map_0 = nil;
                end;
                for _, v173 in v169 do
                    v173.Completed:Once(function() --[[ Line: 812 ]]
                        -- upvalues: v173 (copy)
                        v173:Destroy();
                    end);
                    v173:Play();
                end;
                v153.Parent = l_CurrentCamera_0;
                v154.Parent = l_CurrentCamera_0;
                v60.Adornee = v161;
                if not v153:IsDescendantOf(workspace) then
                    v153.AncestryChanged:Wait();
                end;
                local v174 = v26.new(v140, v161, "Friendlies");
                v174:Play("Idle");
                local v175 = v13.new();
                v175:AttachTo(v139._buildRangeFinder);
                v175:Add(v174);
                v150:Observer(v152):onBind(function() --[[ Line: 835 ]]
                    -- upvalues: l_peek_0 (ref), v152 (copy), v153 (copy)
                    local v176 = l_peek_0(v152);
                    v153.PrimaryPart.Size = Vector3.new(v176, 0.45, v176);
                end);
                v175:Add(function() --[[ Line: 840 ]]
                    -- upvalues: v11 (ref), v150 (copy)
                    v11.doCleanup(v150);
                end);
                v139:_toggleBuildSizeViewers(true);
                if v40:IsMobile() then
                    v175:Construct(v33, v161);
                elseif v40:IsConsole() then
                    v175:Construct(v34, v161);
                else
                    v175:Construct(v32, v161);
                end;
                local function v180(v177, v178, _) --[[ Line: 854 ]] --[[ Name: processRotation ]]
                    -- upvalues: v139 (copy)
                    if v177 ~= "Rotate" then
                        return;
                    elseif v178 ~= Enum.UserInputState.Begin then
                        return;
                    else
                        v139:UpdatePlacementRotation();
                        return;
                    end;
                end;
                l_ContextActionService_0:BindAction("CancelBuild", function(v181, v182, _) --[[ Line: 866 ]] --[[ Name: processCancelBuild ]]
                    -- upvalues: v139 (copy), v42 (ref)
                    if v181 ~= "CancelBuild" then
                        return;
                    elseif v182 ~= Enum.UserInputState.Begin then
                        return;
                    else
                        v139:StopTowerPlacement();
                        v42:PlaySound({
                            name = "UI.Click", 
                            soundGroup = "Master.SFX.UI"
                        });
                        return;
                    end;
                end, false, Enum.KeyCode.Q, Enum.KeyCode.ButtonB);
                l_ContextActionService_0:BindAction("Rotate", v180, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY);
                local v184 = RaycastParams.new();
                v184.CollisionGroup = "Placement";
                local v185 = true;
                local v186 = nil;
                local l_Conditions_0 = v38.LevelInfo:Get().Conditions;
                if l_Conditions_0 then
                    local v188 = select(2, v25:GetPlacementConditionData(l_Conditions_0));
                    if v188 then
                        v186 = v188.statReductions;
                    end;
                end;
                v161:GetAttributeChangedSignal("InPlacementCondition"):Connect(function() --[[ Line: 917 ]]
                    -- upvalues: v161 (copy), v186 (ref), v28 (ref), v144 (copy), l_v46_EquippedPets_0 (copy), v29 (ref), v151 (copy)
                    local v189 = if not v161:GetAttribute("InPlacementCondition") then v186 else nil;
                    local v190 = v28:GetRange(v144, 0, {
                        Reductions = v189
                    }, nil, l_v46_EquippedPets_0) - v29.IN_GAME.RANGE_VISUAL_REDUCTION;
                    v151:set(v190 * 2);
                end);
                local function v199(v191) --[[ Line: 932 ]] --[[ Name: positionTower ]]
                    -- upvalues: v74 (ref), v184 (copy), v139 (copy), v159 (copy), v168 (copy), v161 (copy), v185 (ref), l_SurfaceGui_1 (copy), v57 (ref), l_Frame_0 (copy), l_UIGradient_0 (copy), l_Halo_1 (copy), v170 (copy)
                    local v192 = v74:Raycast(v184, 150, v191);
                    if not v192 then
                        return;
                    else
                        local v193 = CFrame.Angles(0, math.rad(v139._buildRotation), 0);
                        v139._placementCFrame = CFrame.new(v192.Position) * v193;
                        v139._placementNormal = v192.Normal;
                        v159:PivotTo(v139._placementCFrame + v168);
                        local v194 = v192.Instance:HasTag("ConditionObject");
                        v161:SetAttribute("InPlacementCondition", v194);
                        local v195 = v139:CanBuild();
                        if v195 == v185 then
                            return;
                        else
                            v185 = v195;
                            l_SurfaceGui_1.Brightness = v185 and 2 or 3;
                            local v196 = v57[v185];
                            l_Frame_0.BackgroundColor3 = v196.frame;
                            l_UIGradient_0.Color = v196.gradient;
                            l_Halo_1.ImageColor3 = v196.halo;
                            if not v170 then
                                return;
                            else
                                for _, v198 in v170 do
                                    if v198:IsA("Beam") then
                                        v198.Color = v196.beam;
                                    elseif v198:IsA("Frame") then
                                        v198.BackgroundColor3 = v196.halo;
                                    elseif v198:IsA("ImageLabel") then
                                        v198.ImageColor3 = if v198.Name == "Lines" and v185 then Color3.new(1, 1, 1) else v196.halo;
                                    else
                                        v198.Color = v196.halo;
                                    end;
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
                l_Conditions_0 = nil;
                local v200 = not v40:IsMobile();
                local v201 = not v40:IsMobile();
                local v202 = nil;
                l_RunService_0:BindToRenderStep("TowerPlacement", Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 996 ]]
                    -- upvalues: v201 (ref), v139 (copy), v200 (ref), v202 (ref), v199 (copy)
                    if v201 then
                        if not v139._buildRangeFinder then
                            v139:StopTowerPlacement();
                            return;
                        else
                            if v200 then
                                v202 = nil;
                            end;
                            v199(v202);
                            return;
                        end;
                    else
                        return;
                    end;
                end);
                if not v40:IsMobile() then
                    return;
                else
                    task.defer(function() --[[ Line: 1018 ]]
                        -- upvalues: l_GuiService_0 (ref), v41 (ref), l_CurrentCamera_0 (ref)
                        l_GuiService_0.TouchControlsEnabled = false;
                        v41:ToggleHideAll(true);
                        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                    end);
                    v175:Add(function() --[[ Line: 1024 ]]
                        -- upvalues: l_GuiService_0 (ref), v41 (ref), l_CurrentCamera_0 (ref)
                        l_GuiService_0.TouchControlsEnabled = true;
                        v41:ToggleHideAll(false, true);
                        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                    end);
                    local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
                    v202 = Vector2.new(l_ViewportSize_0.Y / 1.05, l_ViewportSize_0.Y / 2.5);
                    v200 = false;
                    v201 = true;
                    v175:Add(l_UserInputService_0.TouchStarted:Connect(function(v204, v205) --[[ Line: 1041 ]]
                        -- upvalues: v200 (ref), l_Conditions_0 (ref)
                        if v205 then
                            return;
                        elseif v200 then
                            return;
                        else
                            l_Conditions_0 = v204;
                            v200 = true;
                            return;
                        end;
                    end));
                    v175:Add(l_UserInputService_0.TouchEnded:Connect(function(v206) --[[ Line: 1054 ]]
                        -- upvalues: l_Conditions_0 (ref), v202 (ref), v74 (ref), v200 (ref)
                        if v206 ~= l_Conditions_0 then
                            return;
                        else
                            v202 = v74:GetPosition();
                            l_Conditions_0 = nil;
                            v200 = false;
                            return;
                        end;
                    end));
                    return;
                end;
            end;
        end;
    end;
end;
l_SurfaceGui_0.StopTowerPlacement = function(v207, v208) --[[ Line: 1066 ]] --[[ Name: StopTowerPlacement ]]
    -- upvalues: v41 (ref), l_GamepadService_0 (copy), l_GuiService_0 (copy), v60 (copy), l_TweenService_0 (copy), l_Highlight_1 (copy), l_RunService_0 (copy), l_ContextActionService_0 (copy)
    local l_v41_Humanoid_0 = v41:GetHumanoid();
    if l_v41_Humanoid_0 and not v208 then
        l_v41_Humanoid_0.CameraOffset = Vector3.new(0, 0, 0, 0);
        v207.StoppedPlacing:Fire();
    end;
    l_GamepadService_0:DisableGamepadCursor();
    task.defer(function() --[[ Line: 1076 ]]
        -- upvalues: l_GuiService_0 (ref)
        l_GuiService_0.SelectedObject = nil;
    end);
    v60.Adornee = nil;
    if not v208 then
        v207.fadeOutTween = l_TweenService_0:Create(l_Highlight_1, TweenInfo.new(0.5), {
            FillTransparency = 1
        });
        v207.fadeOutTween.Completed:Once(function(v210) --[[ Line: 1087 ]]
            -- upvalues: v207 (copy), l_Highlight_1 (ref)
            v207.fadeOutTween:Destroy();
            v207.fadeOutTween = nil;
            if v210 ~= Enum.PlaybackState.Completed then
                return;
            else
                l_Highlight_1.Adornee = nil;
                return;
            end;
        end);
        v207.fadeOutTween:Play();
        v207:_toggleBuildSizeViewers(false);
    end;
    l_RunService_0:UnbindFromRenderStep("TowerPlacement");
    l_ContextActionService_0:UnbindAction("Rotate");
    l_ContextActionService_0:UnbindAction("CancelBuild");
    l_ContextActionService_0:UnbindAction("Select");
    v207._binded = false;
    if v207._buildRangeFinder then
        v207._buildRangeFinder:Destroy();
        v207._buildRangeFinder = nil;
    end;
    if v207._buildSizeViewer then
        v207._buildSizeViewer:Destroy();
        v207._buildSizeViewer = nil;
    end;
    v207._placementTowerSize = nil;
    v207._unitBeingPlaced = nil;
    v207._placementModeActive = false;
    v207._placementCFrame = nil;
    v207._placementNormal = nil;
end;
l_SurfaceGui_0.IsPlacingTower = function(v211) --[[ Line: 1130 ]] --[[ Name: IsPlacingTower ]]
    return v211._unitBeingPlaced ~= nil;
end;
l_SurfaceGui_0.UpdatePlacementRotation = function(v212) --[[ Line: 1135 ]] --[[ Name: UpdatePlacementRotation ]]
    v212._buildRotation = v212._buildRotation + 90;
end;
l_SurfaceGui_0.SelectTower = function(v213, v214, v215) --[[ Line: 1141 ]] --[[ Name: SelectTower ]]
    -- upvalues: v39 (ref), v10 (copy), v43 (ref), v42 (ref), v46 (ref), v28 (copy), v29 (copy), v76 (copy), l_Rings_0 (copy), l_CurrentCamera_0 (copy), v59 (copy), l_White_0 (copy), l_DeepPurple_0 (copy), l_ContextActionService_0 (copy), v13 (copy), v36 (ref)
    if v39:GetToggleState("RoundSummary") or v39:GetToggleState("EnemyAlert") or v39:GetToggleState("Cards") or v10.Player:GetAttribute("Stunned") then
        return;
    elseif v43:IsPlaying() then
        return;
    elseif not v214 then
        v213:DeselectTower();
        return;
    elseif v213._unitFocusedOn and v213._unitFocusedOn.Model and v213._unitFocusedOn.Model == v214 then
        if v215 then
            v213:DeselectTower(false);
        end;
        return;
    else
        v213:DeselectTower();
        v213:_showHoverHighlightOnTower();
        local l_Name_0 = v214.Name;
        v213._unitFocusedOn = {
            Name = l_Name_0, 
            Model = v214, 
            Id = v214:GetAttribute("Id"), 
            OwnerId = v214:GetAttribute("OwnerId")
        };
        local l_v214_Attribute_0 = v214:GetAttribute("Origin");
        local l_v214_Attribute_1 = v214:GetAttribute("OwnerId");
        local l_v214_Attribute_2 = v214:GetAttribute("Level");
        local l_v214_Attribute_3 = v214:GetAttribute("Stars");
        local l_v214_Attribute_4 = v214:GetAttribute("Upgrade");
        local v222 = v213:_getTraitDataFromModel(v214);
        local l_v214_Attribute_5 = v214:GetAttribute("ShinyMega");
        l_v214_Attribute_5 = l_v214_Attribute_5 and string.split(l_v214_Attribute_5, ",");
        local v224 = v213:_getStatReductionsFromModel(v214);
        local l_v214_Attribute_6 = v214:GetAttribute("Relic");
        if not l_v214_Attribute_2 or not l_v214_Attribute_4 then
            return;
        else
            v214:AddTag("TowerGlow");
            v42:PlaySound({
                name = "UI.Click", 
                soundGroup = "Master.SFX.UI"
            });
            local l_v46_EquippedPets_1 = v46:GetEquippedPets();
            local v227 = {
                Name = l_Name_0, 
                Level = l_v214_Attribute_2, 
                Stars = l_v214_Attribute_3, 
                Trait = v222[1], 
                Trait2 = v222[2], 
                Relic = l_v214_Attribute_6, 
                Shiny = l_v214_Attribute_5 and l_v214_Attribute_5[1], 
                Mega = l_v214_Attribute_5 and l_v214_Attribute_5[2]
            };
            local v228 = v28:GetRange(v227, l_v214_Attribute_4, {
                Reductions = v224
            }, nil, l_v46_EquippedPets_1) - v29.IN_GAME.RANGE_VISUAL_REDUCTION;
            local v229 = v228 * 2;
            local l_Size_0 = v76.PrimaryPart.Size;
            l_Rings_0.Size = NumberSequence.new(2.8);
            v76.PrimaryPart.Size = Vector3.new(4, l_Size_0.Y, 4);
            v213:_updateFocusViewerSize(v229, 2.8);
            local l_FloorPoint_2 = v214.PrimaryPart.FloorPoint;
            v76.Parent = l_CurrentCamera_0;
            local v232 = math.abs(l_FloorPoint_2.CFrame.Y);
            v76:PivotTo(l_v214_Attribute_0 + Vector3.new(0, 1, 0, 0) * (v232 + 0.225 - v29.TOWERS.RANGE_VIEWER_OFFSET));
            v76.PrimaryPart.Anchored = true;
            v59.OutlineColor = if l_v214_Attribute_1 == v10.Player.UserId then l_White_0 else l_DeepPurple_0;
            v59.Adornee = v214;
            if v213._unitFocusedOn.OwnerId == v10.Player.UserId then
                local function v236(v233, v234, _) --[[ Line: 1246 ]] --[[ Name: processSellTower ]]
                    -- upvalues: v213 (copy)
                    if v233 ~= "SellUnit" then
                        return;
                    elseif v234 ~= Enum.UserInputState.Begin then
                        return;
                    else
                        v213:SellTower();
                        return;
                    end;
                end;
                local function v240(v237, v238, _) --[[ Line: 1258 ]] --[[ Name: processTargetChange ]]
                    -- upvalues: v213 (copy)
                    if v237 ~= "ChangePriority" then
                        return;
                    elseif v238 ~= Enum.UserInputState.Begin then
                        return;
                    elseif not v213.towerReplica or not v213._unitFocusedOn then
                        return;
                    else
                        v213:UpdateTargetMode(v213._unitFocusedOn.Id, v213.towerReplica.Data.AttackMode);
                        return;
                    end;
                end;
                local function v244(v241, v242, _) --[[ Line: 1274 ]] --[[ Name: processTargetUpgrade ]]
                    -- upvalues: v213 (copy)
                    if v241 ~= "UpgradeUnit" then
                        return;
                    elseif v242 ~= Enum.UserInputState.Begin then
                        return;
                    else
                        v213:UpgradeTower();
                        return;
                    end;
                end;
                l_ContextActionService_0:BindAction("SellUnit", v236, false, Enum.KeyCode.X, Enum.KeyCode.ButtonX);
                l_ContextActionService_0:BindAction("ChangePriority", v240, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY);
                l_ContextActionService_0:BindAction("UpgradeUnit", v244, false, Enum.KeyCode.T, Enum.KeyCode.ButtonL2);
            end;
            v213._selectionDump = v13.new();
            v213._selectionDump:Add(function() --[[ Line: 1294 ]]
                -- upvalues: v213 (copy)
                v213._selectionDump = nil;
            end);
            v213._selectionDump:Add(function() --[[ Line: 1298 ]]
                -- upvalues: v213 (copy)
                v213:DeselectTower();
            end, "Deselect");
            local v245 = v213:_showAttackTypeVFX(l_Name_0, v214, v228, v213._selectionDump);
            if v245 then
                v213._selectionDump:Add(v245);
            end;
            v36:SubscribeToTower(v213._unitFocusedOn.Id);
            v213.TowerSelected:Fire(v213._unitFocusedOn);
            v213._selectionDump:AttachTo(v214);
            v213._selectionDump:Add(v214:GetAttributeChangedSignal("Upgrade"):Connect(function() --[[ Line: 1316 ]]
                -- upvalues: v214 (copy), v28 (ref), v227 (copy), v224 (copy), l_v46_EquippedPets_1 (copy), v29 (ref), v213 (copy)
                local l_v214_Attribute_7 = v214:GetAttribute("Upgrade");
                if not l_v214_Attribute_7 then
                    return;
                else
                    local v247 = v28:GetRange(v227, l_v214_Attribute_7, {
                        Reductions = v224
                    }, nil, l_v46_EquippedPets_1) - v29.IN_GAME.RANGE_VISUAL_REDUCTION;
                    v213:_updateFocusViewerSize(v247 * 2);
                    local l_v28_Range_0 = v28:GetRange(v227, l_v214_Attribute_7 + 1, {
                        Reductions = v224
                    }, nil, l_v46_EquippedPets_1);
                    if not l_v28_Range_0 then
                        v213:ToggleUpgradeRangeViewer(false);
                        return;
                    else
                        l_v28_Range_0 = l_v28_Range_0 - v29.IN_GAME.RANGE_VISUAL_REDUCTION;
                        if v213._previewingUpgradeRange then
                            v213:_updateUpgradeViewer(true, l_v28_Range_0 * 2);
                        end;
                        return;
                    end;
                end;
            end));
            return;
        end;
    end;
end;
l_SurfaceGui_0.DeselectTower = function(v249, v250) --[[ Line: 1355 ]] --[[ Name: DeselectTower ]]
    -- upvalues: l_ContextActionService_0 (copy), v76 (copy), v59 (copy), v36 (ref), v42 (ref)
    if not v249._unitFocusedOn then
        return;
    else
        l_ContextActionService_0:UnbindAction("Select");
        v249._binded = false;
        v76.Parent = nil;
        v59.Adornee = nil;
        if v249._unitFocusedOn.Model then
            v249._unitFocusedOn.Model:RemoveTag("TowerGlow");
        end;
        l_ContextActionService_0:UnbindAction("SellUnit");
        l_ContextActionService_0:UnbindAction("ChangePriority");
        l_ContextActionService_0:UnbindAction("UpgradeUnit");
        v36:UnsubscribeFromTower(v249._unitFocusedOn.Id);
        v249.TowerDeselected:Fire(v249._unitFocusedOn);
        v249:ToggleUpgradeRangeViewer(false);
        table.clear(v249._unitFocusedOn);
        v249._unitFocusedOn = nil;
        if v249._selectionDump then
            v249._selectionDump:Remove("Deselect", true);
            v249._selectionDump:Destroy();
        end;
        if not v250 then
            v42:PlaySound({
                name = "UI.Click", 
                soundGroup = "Master.SFX.UI"
            });
        end;
        return;
    end;
end;
l_SurfaceGui_0.SellTower = function(v251, v252, v253) --[[ Line: 1397 ]] --[[ Name: SellTower ]]
    -- upvalues: v10 (copy), v36 (ref), v72 (copy)
    if not v252 and (not v251._unitFocusedOn or v251._unitFocusedOn.OwnerId ~= v10.Player.UserId) then
        return;
    else
        v252 = v252 or v251._unitFocusedOn.Id;
        v253 = v253 or v251._unitFocusedOn.Name;
        return v36:SellTower(v252):tap(function(v254) --[[ Line: 1406 ]]
            -- upvalues: v72 (ref), v253 (ref)
            if v254 and v72[v253] then
                local l_v72_0 = v72;
                local l_v253_0 = v253;
                l_v72_0[l_v253_0] = l_v72_0[l_v253_0] - 1;
            end;
        end);
    end;
end;
l_SurfaceGui_0.UpdateTargetMode = function(_, v258, v259) --[[ Line: 1413 ]] --[[ Name: UpdateTargetMode ]]
    -- upvalues: v29 (copy), v38 (ref)
    if not v258 or not v259 then
        return;
    else
        local v260 = table.find(v29.TOWERS.PRIORITIES, v259) or 1;
        local v261 = #v29.TOWERS.PRIORITIES;
        v260 = v260 + 1;
        if v261 < v260 then
            v260 = 1;
        end;
        v38:ChangeTowerTargetMode(v258, v260);
        return;
    end;
end;
l_SurfaceGui_0.IsMaxUpgrade = function(v262) --[[ Line: 1430 ]] --[[ Name: IsMaxUpgrade ]]
    -- upvalues: v28 (copy)
    if not v262._unitFocusedOn then
        return false, nil;
    else
        local l_Model_0 = v262._unitFocusedOn.Model;
        local l_Name_1 = l_Model_0.Name;
        local l_l_Model_0_Attribute_0 = l_Model_0:GetAttribute("Upgrade");
        return v28:IsMaxUpgrade(l_Name_1, l_l_Model_0_Attribute_0), l_l_Model_0_Attribute_0;
    end;
end;
l_SurfaceGui_0.UpgradeTower = function(v266) --[[ Line: 1442 ]] --[[ Name: UpgradeTower ]]
    -- upvalues: v38 (ref)
    if not v266.towerReplica then
        return;
    elseif v266:IsMaxUpgrade() then
        return;
    elseif not v266._unitFocusedOn then
        return;
    else
        v38:UpgradeTower(v266._unitFocusedOn.Id);
        return;
    end;
end;
l_SurfaceGui_0.ToggleUpgradeRangeViewer = function(v267, v268) --[[ Line: 1460 ]] --[[ Name: ToggleUpgradeRangeViewer ]]
    -- upvalues: v46 (ref), v28 (copy), v29 (copy), v78 (copy), v76 (copy), l_CurrentCamera_0 (copy), l_RunService_0 (copy)
    if not v267._unitFocusedOn then
        return;
    elseif v267._previewingUpgradeRange == v268 then
        return;
    else
        v267._previewingUpgradeRange = v268;
        local l_Model_1 = v267._unitFocusedOn.Model;
        local l_Name_2 = l_Model_1.Name;
        local l_l_Model_1_Attribute_0 = l_Model_1:GetAttribute("Origin");
        local l_l_Model_1_Attribute_1 = l_Model_1:GetAttribute("Level");
        local l_l_Model_1_Attribute_2 = l_Model_1:GetAttribute("Stars");
        local v274 = v267:_getTraitDataFromModel(l_Model_1);
        local v275, v276 = v267:IsMaxUpgrade();
        local l_l_Model_1_Attribute_3 = l_Model_1:GetAttribute("ShinyMega");
        l_l_Model_1_Attribute_3 = l_l_Model_1_Attribute_3 and string.split(l_l_Model_1_Attribute_3, ",");
        local v278 = v267:_getStatReductionsFromModel(l_Model_1);
        local l_l_Model_1_Attribute_4 = l_Model_1:GetAttribute("Relic");
        local l_v46_EquippedPets_2 = v46:GetEquippedPets();
        local v281 = {
            Name = l_Name_2, 
            Level = l_l_Model_1_Attribute_1, 
            Stars = l_l_Model_1_Attribute_2, 
            Trait = v274[1], 
            Trait2 = v274[2], 
            Relic = l_l_Model_1_Attribute_4, 
            Shiny = l_l_Model_1_Attribute_3 and l_l_Model_1_Attribute_3[1], 
            Mega = l_l_Model_1_Attribute_3 and l_l_Model_1_Attribute_3[2]
        };
        if not v268 then
            local v282 = v28:GetRange(v281, v276, {
                Reductions = v278
            }, nil, l_v46_EquippedPets_2) - v29.IN_GAME.RANGE_VISUAL_REDUCTION;
            v267._upgradeRangeDumpster:Destroy();
            v267:_updateUpgradeViewer(false, v282 * 2, function() --[[ Line: 1507 ]]
                -- upvalues: v78 (ref)
                v78.Parent = nil;
            end);
            return;
        elseif v275 then
            return;
        else
            local v283 = (v28:GetRange(v281, v276 + 1, {
                Reductions = v278
            }, nil, l_v46_EquippedPets_2) - v29.IN_GAME.RANGE_VISUAL_REDUCTION) * 2;
            local l_Size_1 = v76.PrimaryPart.Size;
            local l_PrimaryPart_1 = v78.PrimaryPart;
            l_PrimaryPart_1.Size = l_Size_1;
            v78:PivotTo(l_l_Model_1_Attribute_0 - Vector3.new(0, l_Size_1.Y / 2 - v29.TOWERS.RANGE_VIEWER_OFFSET, 0));
            v78.Parent = l_CurrentCamera_0;
            v267:_updateUpgradeViewer(true, v283);
            v267._upgradeRangeDumpster:Add(l_RunService_0.RenderStepped:Connect(function(v286) --[[ Line: 1537 ]]
                -- upvalues: l_PrimaryPart_1 (copy)
                local l_l_PrimaryPart_1_0 = l_PrimaryPart_1;
                l_l_PrimaryPart_1_0.CFrame = l_l_PrimaryPart_1_0.CFrame * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), 0.5235987755982988 * v286);
            end));
            return;
        end;
    end;
end;
l_SurfaceGui_0.SellAllTowers = function(_) --[[ Line: 1542 ]] --[[ Name: SellAllTowers ]]
    -- upvalues: v72 (copy), v36 (ref)
    table.clear(v72);
    v36:SellAllTowers();
end;
l_Halo_0 = function(v289, v290, v291) --[[ Line: 1549 ]] --[[ Name: positionAttackTypeAttachments ]]
    -- upvalues: l_TweenService_0 (copy), v51 (copy)
    local v292 = {};
    for _, v294 in v289:GetChildren() do
        if v294:IsA("Attachment") and string.find(v294.Name, "End") then
            table.insert(v292, v294);
            local l_Position_0 = v294.Position;
            local v296 = Vector3.new(l_Position_0.X, l_Position_0.Y, -v290);
            if v291 then
                v294.Position = v296;
            else
                local v297 = l_TweenService_0:Create(v294, v51, {
                    Position = v296
                });
                v297.Completed:Once(function() --[[ Line: 1576 ]]
                    -- upvalues: v297 (copy)
                    v297:Destroy();
                end);
                v294.Position = v294.Position * Vector3.new(1, 1, 0, 0);
                v297:Play();
            end;
        end;
    end;
    return v292;
end;
l_SurfaceGui_0._showAttackTypeVFX = function(_, v299, v300, v301, v302) --[[ Line: 1589 ]] --[[ Name: _showAttackTypeVFX ]]
    -- upvalues: v28 (copy), v29 (copy), l_AttackType_0 (copy), l_Halo_0 (copy), v13 (copy), v31 (copy), v14 (copy), v25 (copy), v66 (ref), l_RunService_0 (copy), l_TweenService_0 (copy), v51 (copy)
    local l_v28_UnitValue_1 = v28:GetUnitValue(v299, "Type");
    local v304 = l_v28_UnitValue_1 and v29.TOWERS.ATTACK_TYPE_VFX_LEGEND[l_v28_UnitValue_1];
    local v305 = v304 and l_AttackType_0:FindFirstChild(v304);
    if not v305 then
        return;
    else
        local v306 = {};
        v305 = v305:Clone();
        local l_PrimaryPart_2 = v305.PrimaryPart;
        v305.Parent = v300;
        local l_Weld_3 = Instance.new("Weld");
        l_Weld_3.Part0 = l_PrimaryPart_2;
        l_Weld_3.Part1 = v300.PrimaryPart;
        l_Weld_3.Parent = l_PrimaryPart_2;
        local l_PrimaryPart_3 = v300.PrimaryPart;
        if v304 == "Beam" then
            for _, v311 in v305.Beams:GetChildren() do
                table.insert(v306, v311);
            end;
            l_Halo_0(l_PrimaryPart_2, v301);
        elseif v304 == "Splash" then
            local l_v300_Attribute_0 = v300:GetAttribute("IsFollowTower");
            local l_Target_0 = v305.Target;
            local l_Aura_0 = l_Target_0.Aura;
            local l_Highlight_2 = l_Target_0.Highlight;
            local v316 = v13.new();
            v316:AttachTo(v305);
            v316:Add(l_Target_0);
            table.insert(v306, l_Aura_0.Frame);
            table.insert(v306, l_Aura_0.Halo);
            table.insert(v306, l_Highlight_2.Frame);
            local l_Lines_0 = l_Highlight_2.Lines;
            table.insert(v306, l_Lines_0);
            local v318 = nil;
            if not l_v300_Attribute_0 then
                v318 = Instance.new("Weld");
                v318.Part0 = l_Target_0;
                v318.Part1 = l_PrimaryPart_2;
                v318.C0 = CFrame.new(0, -0.125, 0);
                v318.Parent = l_Target_0;
                for _, v320 in v305.Beams:GetChildren() do
                    table.insert(v306, v320);
                end;
            else
                l_Target_0.Anchored = true;
                for _, v322 in v305.Beams:GetChildren() do
                    v322:Destroy();
                end;
            end;
            local v323 = v31[v299];
            local v324 = v323 and v323[1];
            local v327 = v14.Find(v324.AttackStyles, function(v325) --[[ Line: 1658 ]]
                local v326 = false;
                if v325.Style == "Outward" then
                    v326 = v325.Size ~= nil;
                end;
                return v326;
            end);
            local v328 = v327 and v327.Size * 2;
            if v328 then
                l_Target_0.Size = Vector3.new(v328, 0.2, v328);
                l_Aura_0.Size = UDim2.fromScale(v328, v328);
            end;
            local l_Position_1 = l_PrimaryPart_3.Position;
            local l_LookVector_0 = l_PrimaryPart_3.CFrame.LookVector;
            local v331 = nil;
            local v332 = nil;
            local v333 = nil;
            local v334 = {};
            do
                local l_v318_0, l_l_LookVector_0_0, l_v331_0, l_v332_0, l_v333_0, l_v334_0 = v318, l_LookVector_0, v331, v332, v333, v334;
                local function v349() --[[ Line: 1676 ]] --[[ Name: getOffset ]]
                    -- upvalues: l_PrimaryPart_3 (copy), l_l_LookVector_0_0 (ref), v300 (copy), v301 (copy), v25 (ref), l_Position_1 (copy), l_v331_0 (ref), l_v332_0 (ref), l_v333_0 (ref), v66 (ref)
                    local l_LookVector_1 = l_PrimaryPart_3.CFrame.LookVector;
                    local v342 = math.acos((l_l_LookVector_0_0:Dot(l_LookVector_1)));
                    local l_v300_Attribute_1 = v300:GetAttribute("Attacking");
                    local l_v300_Attribute_2 = v300:GetAttribute("AttackPosition");
                    local l_v300_Attribute_3 = v300:GetAttribute("TargetEnemy");
                    local l_v301_0 = v301;
                    if l_v300_Attribute_1 and l_v300_Attribute_2 then
                        l_v301_0 = v25:Get2DDistance(l_Position_1, l_v300_Attribute_2);
                    elseif l_v300_Attribute_3 then
                        local l_l_v331_0_0 = l_v331_0;
                        if l_v332_0 ~= l_v300_Attribute_3 then
                            if l_v332_0 and v342 < 0.05235987755982989 then
                                return l_v333_0 or v301;
                            else
                                l_l_v331_0_0 = v66:FindFirstChild(l_v300_Attribute_3);
                            end;
                        end;
                        if l_l_v331_0_0 and l_l_v331_0_0.PrimaryPart and l_l_v331_0_0.PrimaryPart.Parent then
                            local l_Position_2 = l_l_v331_0_0.PrimaryPart.Position;
                            l_v301_0 = v25:Get2DDistance(l_Position_1, l_Position_2);
                            l_v331_0 = l_l_v331_0_0;
                            l_v332_0 = l_v300_Attribute_3;
                        else
                            l_v331_0 = nil;
                            l_v332_0 = nil;
                        end;
                    end;
                    l_v301_0 = math.min(l_v301_0, v301);
                    if l_v333_0 ~= l_v301_0 and not l_v300_Attribute_1 then
                        l_l_LookVector_0_0 = l_LookVector_1;
                        l_v333_0 = l_v301_0;
                    end;
                    return l_v301_0;
                end;
                local _ = function() --[[ Line: 1720 ]] --[[ Name: update ]]
                    -- upvalues: v302 (copy), l_RunService_0 (ref), l_Lines_0 (copy), l_v300_Attribute_0 (copy), v300 (copy), l_Target_0 (copy), v305 (ref), v349 (copy), l_v318_0 (ref), l_v334_0 (ref)
                    if not v302 then
                        return;
                    else
                        v302:Add(l_RunService_0.Heartbeat:Connect(function(v350) --[[ Line: 1725 ]]
                            -- upvalues: l_Lines_0 (ref), l_v300_Attribute_0 (ref), v300 (ref), l_Target_0 (ref), v305 (ref), v349 (ref), l_v318_0 (ref), l_v334_0 (ref)
                            l_Lines_0.Rotation = (l_Lines_0.Rotation + 25 * v350) % 360;
                            if l_v300_Attribute_0 then
                                local l_v300_Attribute_4 = v300:GetAttribute("AttackPosition");
                                if not l_v300_Attribute_4 then
                                    l_Target_0.Parent = nil;
                                    return;
                                else
                                    l_Target_0.Parent = v305;
                                    l_Target_0.CFrame = CFrame.new(l_v300_Attribute_4);
                                    return;
                                end;
                            else
                                local v352 = v349();
                                l_v318_0.C0 = CFrame.new(0, -0.125, v352);
                                for _, v354 in l_v334_0 do
                                    v354.Position = Vector3.new(v354.Position.X, v354.Position.Y, -v352);
                                end;
                                return;
                            end;
                        end));
                        return;
                    end;
                end;
                if not l_v300_Attribute_0 then
                    local v356 = v349();
                    l_v334_0 = l_Halo_0(l_PrimaryPart_2, v301, v356 ~= v301);
                    if v356 == v301 then
                        local v357 = l_TweenService_0:Create(l_v318_0, v51, {
                            C0 = CFrame.new(0, -0.125, (v349()))
                        });
                        v357.Completed:Once(function() --[[ Line: 1766 ]]
                            -- upvalues: v357 (copy), v302 (copy), l_RunService_0 (ref), l_Lines_0 (copy), l_v300_Attribute_0 (copy), v300 (copy), l_Target_0 (copy), v305 (ref), v349 (copy), l_v318_0 (ref), l_v334_0 (ref)
                            v357:Destroy();
                            if not v302 then
                                return;
                            else
                                v302:Add(l_RunService_0.Heartbeat:Connect(function(v358) --[[ Line: 1725 ]]
                                    -- upvalues: l_Lines_0 (ref), l_v300_Attribute_0 (ref), v300 (ref), l_Target_0 (ref), v305 (ref), v349 (ref), l_v318_0 (ref), l_v334_0 (ref)
                                    l_Lines_0.Rotation = (l_Lines_0.Rotation + 25 * v358) % 360;
                                    if l_v300_Attribute_0 then
                                        local l_v300_Attribute_5 = v300:GetAttribute("AttackPosition");
                                        if not l_v300_Attribute_5 then
                                            l_Target_0.Parent = nil;
                                            return;
                                        else
                                            l_Target_0.Parent = v305;
                                            l_Target_0.CFrame = CFrame.new(l_v300_Attribute_5);
                                            return;
                                        end;
                                    else
                                        local v360 = v349();
                                        l_v318_0.C0 = CFrame.new(0, -0.125, v360);
                                        for _, v362 in l_v334_0 do
                                            v362.Position = Vector3.new(v362.Position.X, v362.Position.Y, -v360);
                                        end;
                                        return;
                                    end;
                                end));
                                return;
                            end;
                        end);
                        v357:Play();
                    elseif v302 then
                        v302:Add(l_RunService_0.Heartbeat:Connect(function(v363) --[[ Line: 1725 ]]
                            -- upvalues: l_Lines_0 (copy), l_v300_Attribute_0 (copy), v300 (copy), l_Target_0 (copy), v305 (ref), v349 (copy), l_v318_0 (ref), l_v334_0 (ref)
                            l_Lines_0.Rotation = (l_Lines_0.Rotation + 25 * v363) % 360;
                            if l_v300_Attribute_0 then
                                local l_v300_Attribute_6 = v300:GetAttribute("AttackPosition");
                                if not l_v300_Attribute_6 then
                                    l_Target_0.Parent = nil;
                                    return;
                                else
                                    l_Target_0.Parent = v305;
                                    l_Target_0.CFrame = CFrame.new(l_v300_Attribute_6);
                                    return;
                                end;
                            else
                                local v365 = v349();
                                l_v318_0.C0 = CFrame.new(0, -0.125, v365);
                                for _, v367 in l_v334_0 do
                                    v367.Position = Vector3.new(v367.Position.X, v367.Position.Y, -v365);
                                end;
                                return;
                            end;
                        end));
                    end;
                elseif v302 then
                    v302:Add(l_RunService_0.Heartbeat:Connect(function(v368) --[[ Line: 1725 ]]
                        -- upvalues: l_Lines_0 (copy), l_v300_Attribute_0 (copy), v300 (copy), l_Target_0 (copy), v305 (ref), v349 (copy), l_v318_0 (ref), l_v334_0 (ref)
                        l_Lines_0.Rotation = (l_Lines_0.Rotation + 25 * v368) % 360;
                        if l_v300_Attribute_0 then
                            local l_v300_Attribute_7 = v300:GetAttribute("AttackPosition");
                            if not l_v300_Attribute_7 then
                                l_Target_0.Parent = nil;
                                return;
                            else
                                l_Target_0.Parent = v305;
                                l_Target_0.CFrame = CFrame.new(l_v300_Attribute_7);
                                return;
                            end;
                        else
                            local v370 = v349();
                            l_v318_0.C0 = CFrame.new(0, -0.125, v370);
                            for _, v372 in l_v334_0 do
                                v372.Position = Vector3.new(v372.Position.X, v372.Position.Y, -v370);
                            end;
                            return;
                        end;
                    end));
                end;
            end;
        end;
        return v305, v306;
    end;
end;
l_SurfaceGui_0._getTowerOnMouse = function(_, v374) --[[ Line: 1783 ]] --[[ Name: _getTowerOnMouse ]]
    -- upvalues: v74 (copy), v53 (copy), v29 (copy)
    local v375 = nil;
    local v376 = v74:Raycast(v53, 150, v374);
    if not v376 or not v376.Instance then
        return;
    else
        v375 = v376.Instance:FindFirstAncestorOfClass("Model");
        if not v375 then
            return;
        else
            if v375.Name == "VisualModel" or v375.Name == "Base" then
                v375 = v375:FindFirstAncestorOfClass("Model");
            end;
            if not v375:HasTag(v29.TOWERS.TAG) then
                return;
            else
                return v375;
            end;
        end;
    end;
end;
l_SurfaceGui_0._processWorldClick = function(v377, v378) --[[ Line: 1808 ]] --[[ Name: _processWorldClick ]]
    -- upvalues: v43 (ref), v40 (ref), v44 (ref), v50 (ref)
    if v43:IsPlaying() then
        return;
    elseif v377._placementModeActive and not v40:IsMobile() then
        v377:AttemptToPlaceTower();
        return;
    else
        local v379 = v377:_getTowerOnMouse(v378);
        if v377.levelInfo.Mode == "BossBattle" then
            if v44:GetPreviewTower() == v379 then
                return;
            else
                v377:_showHoverHighlightOnTower();
                v44:PreviewTower(v379);
                v50:BindBackButton(function() --[[ Line: 1829 ]]
                    -- upvalues: v44 (ref)
                    v44:StartIdleLoop(true);
                end);
                return;
            end;
        else
            v377:SelectTower(v379);
            return;
        end;
    end;
end;
l_SurfaceGui_0._showHoverHighlightOnTower = function(v380, v381) --[[ Line: 1840 ]] --[[ Name: _showHoverHighlightOnTower ]]
    -- upvalues: l_Highlight_0 (copy), v75 (copy), v44 (ref), v46 (ref), v28 (copy), v29 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (copy), v51 (copy), v10 (copy), l_White_0 (copy), l_DeepPurple_0 (copy), v40 (ref)
    if not v381 then
        v380._currentUnitHoveredOn = nil;
        l_Highlight_0.Adornee = nil;
        v380.HoverHintBillboard.Adornee = nil;
        v75.Parent = nil;
        return;
    elseif v380._unitFocusedOn and v380._unitFocusedOn.Model and v380._unitFocusedOn.Model == v381 then
        return;
    elseif v44:GetPreviewTower() == v381 then
        return;
    else
        v380._currentUnitHoveredOn = v381;
        local l_v381_Attribute_0 = v381:GetAttribute("OwnerId");
        if v380.levelInfo.Mode ~= "BossBattle" then
            local l_Name_3 = v381.Name;
            local l_v381_Attribute_1 = v381:GetAttribute("Level");
            local l_v381_Attribute_2 = v381:GetAttribute("Stars");
            local l_v381_Attribute_3 = v381:GetAttribute("Upgrade");
            local v387 = v380:_getTraitDataFromModel(v381);
            local l_v381_Attribute_4 = v381:GetAttribute("ShinyMega");
            l_v381_Attribute_4 = l_v381_Attribute_4 and string.split(l_v381_Attribute_4, ",");
            local v389 = v380:_getStatReductionsFromModel(v381);
            local l_v381_Attribute_5 = v381:GetAttribute("Relic");
            if not l_v381_Attribute_1 or not l_v381_Attribute_3 then
                return;
            else
                local l_v46_EquippedPets_3 = v46:GetEquippedPets();
                local v392 = {
                    Name = l_Name_3, 
                    Level = l_v381_Attribute_1, 
                    Stars = l_v381_Attribute_2, 
                    Trait = v387[1], 
                    Trait2 = v387[2], 
                    Relic = l_v381_Attribute_5, 
                    Shiny = l_v381_Attribute_4 and l_v381_Attribute_4[1], 
                    Mega = l_v381_Attribute_4 and l_v381_Attribute_4[2]
                };
                local v393 = (v28:GetRange(v392, l_v381_Attribute_3, {
                    Reductions = v389
                }, nil, l_v46_EquippedPets_3) - v29.IN_GAME.RANGE_VISUAL_REDUCTION) * 2;
                local l_Size_2 = v75.PrimaryPart.Size;
                local v395 = Vector3.new(v393, l_Size_2.Y, v393);
                v75.PrimaryPart.Size = Vector3.new(4, v395.Y, 4);
                local l_v381_Attribute_6 = v381:GetAttribute("Origin");
                v75:PivotTo(l_v381_Attribute_6 - Vector3.new(0, l_Size_2.Y / 2 - v29.TOWERS.RANGE_VIEWER_OFFSET, 0));
                v75.Parent = l_CurrentCamera_0;
                local v397 = l_TweenService_0:Create(v75.PrimaryPart, v51, {
                    Size = v395
                });
                do
                    local l_v397_0 = v397;
                    l_v397_0.Completed:Once(function() --[[ Line: 1916 ]]
                        -- upvalues: l_v397_0 (ref)
                        l_v397_0:Destroy();
                        l_v397_0 = nil;
                    end);
                    l_v397_0:Play();
                end;
            end;
        end;
        local v399 = l_v381_Attribute_0 == v10.Player.UserId;
        l_Highlight_0.OutlineColor = if v399 then l_White_0 else l_DeepPurple_0;
        l_Highlight_0.Adornee = v381;
        if v40:IsConsole() then
            v380.HoverHintBillboard.Adornee = if v399 then v381:FindFirstChild("VisualModel") else nil;
            return;
        else
            v380.HoverHintBillboard.Adornee = nil;
            return;
        end;
    end;
end;
l_SurfaceGui_0._updateFocusViewerSize = function(_, v401, v402) --[[ Line: 1936 ]] --[[ Name: _updateFocusViewerSize ]]
    -- upvalues: v76 (copy), l_TweenService_0 (copy), v51 (copy), v24 (copy), l_Rings_0 (copy)
    local l_Size_3 = v76.PrimaryPart.Size;
    local v404 = Vector3.new(v401, l_Size_3.Y, v401);
    v402 = v402 or l_Size_3.X * 0.7;
    local v405 = l_TweenService_0:Create(v76.PrimaryPart, v51, {
        Size = v404
    });
    local v407 = v24("NumberValue", v402, v51, {
        Value = v401 * 0.7
    }, function(v406) --[[ Line: 1950 ]]
        -- upvalues: l_Rings_0 (ref)
        l_Rings_0.Size = NumberSequence.new(v406);
    end);
    v405.Completed:Once(function() --[[ Line: 1955 ]]
        -- upvalues: v407 (ref), v405 (ref)
        if v407 then
            v407:Destroy();
            v407 = nil;
        end;
        v405:Destroy();
        v405 = nil;
    end);
    v405:Play();
end;
l_SurfaceGui_0._updateUpgradeViewer = function(_, v409, v410, v411) --[[ Line: 1968 ]] --[[ Name: _updateUpgradeViewer ]]
    -- upvalues: v78 (copy), v14 (copy), l_TweenService_0 (copy), v51 (copy), v79 (ref), v18 (copy), v23 (copy)
    local v412 = Vector3.new(v410, v78.PrimaryPart.Size.Y, v410);
    local v413 = {};
    for _, v415 in (v14.Extend({
        l_TweenService_0:Create(v78.PrimaryPart, v51, {
            Size = v412
        })
    }, v79[v409])) do
        do
            local l_v415_0 = v415;
            table.insert(v413, v18.new(function(v417, v418) --[[ Line: 1986 ]]
                -- upvalues: l_v415_0 (ref)
                l_v415_0.Completed:Once(function(v419) --[[ Line: 1987 ]]
                    -- upvalues: v418 (copy), l_v415_0 (ref), v417 (copy)
                    if v419 ~= Enum.PlaybackState.Completed then
                        v418();
                    end;
                    l_v415_0:Destroy();
                    l_v415_0 = nil;
                    v417();
                end);
                l_v415_0:Play();
            end));
        end;
    end;
    v18.all(v413):andThen(function() --[[ Line: 2001 ]]
        -- upvalues: v411 (copy)
        if v411 then
            v411();
        end;
    end, v23.EmptyPromiseCatch);
end;
l_SurfaceGui_0._getTraitDataFromModel = function(_, v421) --[[ Line: 2008 ]] --[[ Name: _getTraitDataFromModel ]]
    local l_v421_Attribute_0 = v421:GetAttribute("Trait");
    local l_v421_Attribute_1 = v421:GetAttribute("Trait2");
    if l_v421_Attribute_0 then
        l_v421_Attribute_0 = string.split(l_v421_Attribute_0, ",");
        l_v421_Attribute_0 = {
            Name = l_v421_Attribute_0[1], 
            Tier = tonumber(l_v421_Attribute_0[2])
        };
    end;
    if l_v421_Attribute_1 then
        l_v421_Attribute_1 = string.split(l_v421_Attribute_1, ",");
        l_v421_Attribute_1 = {
            Name = l_v421_Attribute_1[1], 
            Tier = tonumber(l_v421_Attribute_1[2])
        };
    end;
    return {
        l_v421_Attribute_0, 
        l_v421_Attribute_1
    };
end;
l_SurfaceGui_0._getStatReductionsFromModel = function(_, v425) --[[ Line: 2025 ]] --[[ Name: _getStatReductionsFromModel ]]
    -- upvalues: v25 (copy)
    local l_v425_Attribute_0 = v425:GetAttribute("PlacementCondition");
    if not l_v425_Attribute_0 then
        return;
    else
        local v427 = select(2, v25:GetConditionData(l_v425_Attribute_0));
        return v427 and v427.statReductions;
    end;
end;
l_SurfaceGui_0._toggleBuildSizeViewers = function(_, v429) --[[ Line: 2036 ]] --[[ Name: _toggleBuildSizeViewers ]]
    -- upvalues: v65 (ref)
    for _, v431 in v65:GetChildren() do
        local l_BuildSizeViewer_0 = v431:FindFirstChild("BuildSizeViewer");
        if l_BuildSizeViewer_0 then
            l_BuildSizeViewer_0.PrimaryPart.SurfaceGui.Enabled = v429;
        end;
    end;
end;
l_SurfaceGui_0._connectTowerAttacks = function(v433, v434) --[[ Line: 2047 ]] --[[ Name: _connectTowerAttacks ]]
    -- upvalues: v28 (copy), l_RunService_0 (copy), v19 (copy), v68 (copy), v13 (copy), v46 (ref), v29 (copy), v10 (copy), v31 (copy), v69 (copy), v70 (copy), v38 (ref), v20 (copy), v23 (copy), v25 (copy), v71 (copy)
    local v435 = Random.new();
    local l_Name_4 = v434.Name;
    local l_l_Name_4_0 = l_Name_4;
    local v438 = v434:HasTag("SpawnUnit");
    if v438 then
        l_l_Name_4_0 = v28:GetSpawnUnitValue(l_Name_4, "ParentName") or l_Name_4;
    end;
    local v439 = nil;
    if not v438 then
        v439 = v28:GetUnitValue(l_Name_4, "Type");
        if v439 == "Resource" then
            return;
        end;
    end;
    local v440 = v434:WaitForChild("VisualModel", 2);
    if not v440 or not v434.Parent then
        return;
    else
        local v441 = 0;
        local v442 = nil;
        repeat
            v442 = v440:FindFirstChild("Animator", true);
            v441 = v441 + l_RunService_0.Heartbeat:Wait();
        until v442 ~= nil or v441 >= 2;
        if not v442 or not v434.Parent then
            return;
        elseif not v19.Await(v434, "VFX/Attack", 4) or not v434.Parent then
            return;
        else
            local l_v434_Attribute_0 = v434:GetAttribute("Stars");
            local v444 = v433:_getTraitDataFromModel(v434);
            local l_v434_Attribute_1 = v434:GetAttribute("ShinyMega");
            l_v434_Attribute_1 = l_v434_Attribute_1 and string.split(l_v434_Attribute_1, ",");
            local v446 = v433:_getStatReductionsFromModel(v434);
            local l_v434_Attribute_2 = v434:GetAttribute("RangeOverride");
            local v448 = nil;
            v448 = v28[v438 and "GetSpawnUnitValue" or "GetUnitValue"](v28, l_Name_4, "AttackAnimationSpeed");
            local v449 = v68[l_Name_4];
            local v450 = v13.new();
            v450:AttachTo(v434);
            local v451 = {};
            local v452 = {
                level = v434:GetAttribute("Level"), 
                upgrade = v434:GetAttribute("Upgrade")
            };
            local function _() --[[ Line: 2130 ]] --[[ Name: compileUnitData ]]
                -- upvalues: v438 (copy), l_l_Name_4_0 (ref), l_Name_4 (copy), v452 (copy), l_v434_Attribute_0 (copy), v444 (copy), l_v434_Attribute_1 (ref)
                return {
                    Name = if v438 then l_l_Name_4_0 else l_Name_4, 
                    Level = v452.level, 
                    Stars = l_v434_Attribute_0, 
                    Trait = v444[1], 
                    Trait2 = v444[2], 
                    Shiny = l_v434_Attribute_1 and l_v434_Attribute_1[1], 
                    Mega = l_v434_Attribute_1 and l_v434_Attribute_1[2]
                };
            end;
            local function _() --[[ Line: 2142 ]] --[[ Name: calculateRange ]]
                -- upvalues: l_v434_Attribute_2 (copy), v28 (ref), v452 (copy), v446 (copy), v438 (copy), l_Name_4 (copy), v46 (ref)
                return l_v434_Attribute_2 or v28:GetRange(v452.unitData, v452.upgrade, {
                    Reductions = v446
                }, if v438 then l_Name_4 else nil, v46:GetEquippedPets());
            end;
            local function v456(v455) --[[ Line: 2152 ]] --[[ Name: getScaledEffectRange ]]
                -- upvalues: l_v434_Attribute_1 (ref), v29 (ref)
                if l_v434_Attribute_1 and l_v434_Attribute_1[2] then
                    return v455 * v29.TOWERS.MEGA_SCALE;
                else
                    return v455;
                end;
            end;
            v452.unitData = {
                Name = if v438 then l_l_Name_4_0 else l_Name_4, 
                Level = v452.level, 
                Stars = l_v434_Attribute_0, 
                Trait = v444[1], 
                Trait2 = v444[2], 
                Shiny = l_v434_Attribute_1 and l_v434_Attribute_1[1], 
                Mega = l_v434_Attribute_1 and l_v434_Attribute_1[2]
            };
            v452.range = l_v434_Attribute_2 or v28:GetRange(v452.unitData, v452.upgrade, {
                Reductions = v446
            }, if v438 then l_Name_4 else nil, v46:GetEquippedPets());
            if not v438 then
                v450:Add(v434:GetAttributeChangedSignal("Level"):Connect(function() --[[ Line: 2164 ]]
                    -- upvalues: v452 (copy), v434 (copy), v438 (copy), l_l_Name_4_0 (ref), l_Name_4 (copy), l_v434_Attribute_0 (copy), v444 (copy), l_v434_Attribute_1 (ref), l_v434_Attribute_2 (copy), v28 (ref), v446 (copy), v46 (ref)
                    v452.level = v434:GetAttribute("Level");
                    v452.unitData = {
                        Name = if v438 then l_l_Name_4_0 else l_Name_4, 
                        Level = v452.level, 
                        Stars = l_v434_Attribute_0, 
                        Trait = v444[1], 
                        Trait2 = v444[2], 
                        Shiny = l_v434_Attribute_1 and l_v434_Attribute_1[1], 
                        Mega = l_v434_Attribute_1 and l_v434_Attribute_1[2]
                    };
                    v452.range = l_v434_Attribute_2 or v28:GetRange(v452.unitData, v452.upgrade, {
                        Reductions = v446
                    }, if v438 then l_Name_4 else nil, v46:GetEquippedPets());
                end));
                v450:Add(v434:GetAttributeChangedSignal("Upgrade"):Connect(function() --[[ Line: 2170 ]]
                    -- upvalues: v452 (copy), v434 (copy), l_v434_Attribute_2 (copy), v28 (ref), v446 (copy), v438 (copy), l_Name_4 (copy), v46 (ref)
                    v452.upgrade = v434:GetAttribute("Upgrade");
                    v452.range = l_v434_Attribute_2 or v28:GetRange(v452.unitData, v452.upgrade, {
                        Reductions = v446
                    }, if v438 then l_Name_4 else nil, v46:GetEquippedPets());
                end));
                v450:Add(v28:OnUnitValueChanged(l_Name_4, "MinRange", function() --[[ Line: 2175 ]]
                    -- upvalues: v452 (copy), l_v434_Attribute_2 (copy), v28 (ref), v446 (copy), v438 (copy), l_Name_4 (copy), v46 (ref)
                    v452.range = l_v434_Attribute_2 or v28:GetRange(v452.unitData, v452.upgrade, {
                        Reductions = v446
                    }, if v438 then l_Name_4 else nil, v46:GetEquippedPets());
                end));
                v450:Add(v28:OnUnitValueChanged(l_Name_4, "MaxRange", function() --[[ Line: 2179 ]]
                    -- upvalues: v452 (copy), l_v434_Attribute_2 (copy), v28 (ref), v446 (copy), v438 (copy), l_Name_4 (copy), v46 (ref)
                    v452.range = l_v434_Attribute_2 or v28:GetRange(v452.unitData, v452.upgrade, {
                        Reductions = v446
                    }, if v438 then l_Name_4 else nil, v46:GetEquippedPets());
                end));
            end;
            local l_Attribute_0 = v10.Player:GetAttribute("Setting_VFX");
            v450:Add(v10.Player:GetAttributeChangedSignal("Setting_VFX"):Connect(function() --[[ Line: 2185 ]]
                -- upvalues: l_Attribute_0 (ref), v10 (ref)
                l_Attribute_0 = v10.Player:GetAttribute("Setting_VFX");
            end));
            v450:Add(function() --[[ Line: 2189 ]]
                -- upvalues: v452 (copy)
                table.clear(v452.unitData);
                table.clear(v452);
            end);
            local function v461(v458) --[[ Line: 2194 ]] --[[ Name: getAbilityAttack ]]
                -- upvalues: v31 (ref), l_Name_4 (copy)
                for _, v460 in v31[l_Name_4] do
                    if v458 and v460.AttackName == "Ability2" then
                        return v460;
                    elseif not v458 and v460.AttackName == "Ability" then
                        return v460;
                    end;
                end;
            end;
            local v462 = 0;
            local function v496(v463) --[[ Line: 2208 ]] --[[ Name: connectAnimationTrack ]]
                -- upvalues: v449 (copy), l_Attribute_0 (ref), v462 (ref), v69 (ref), v70 (ref), v434 (copy), v448 (ref), v38 (ref), v31 (ref), l_Name_4 (copy), v461 (copy), v20 (ref), v23 (ref), v450 (copy), v439 (ref), v452 (copy), v25 (ref), v435 (copy), v456 (copy), v71 (ref), v451 (copy)
                local l_AnimationId_0 = v463.Animation.AnimationId;
                if v449[l_AnimationId_0] then
                    return;
                elseif l_Attribute_0 == false then
                    return;
                else
                    v462 = v462 + 1;
                    local l_v462_0 = v462;
                    local v466 = false;
                    local v467 = false;
                    if v69[l_AnimationId_0] then
                        v466 = true;
                        if v70[l_AnimationId_0] and v70[l_AnimationId_0] == "Ability2" then
                            v467 = true;
                        end;
                    end;
                    local l_v434_Pivot_0 = v434:GetPivot();
                    local v469 = v448 * v38.GameSpeed:Get()[1];
                    if v462 ~= l_v462_0 then
                        return;
                    else
                        local v470 = v31[l_Name_4][1];
                        if v466 then
                            v470 = v461(v467);
                        end;
                        local v471 = nil;
                        local v472 = v20.Custom(function() --[[ Line: 2249 ]]
                            -- upvalues: v434 (ref)
                            return v434:GetAttribute("AttackPosition");
                        end, 1):catch(v23.EmptyPromiseCatch);
                        v450:AddPromise(v472);
                        v471 = select(2, v472:await());
                        if v462 ~= l_v462_0 then
                            return;
                        elseif not v471 then
                            return;
                        else
                            getHitPivot = function(v473) --[[ Line: 2266 ]] --[[ Name: getHitPivot ]]
                                -- upvalues: v439 (ref), v452 (ref), v25 (ref), l_v434_Pivot_0 (copy), v471 (ref)
                                if typeof(v473) == "Instance" then
                                    v473 = v473.CFrame;
                                end;
                                local v474 = nil;
                                v474 = if v439 ~= "Pierce" then math.min(v452.range, v25:Get2DDistance(l_v434_Pivot_0.Position, v471)) else v452.range;
                                local l_Position_3 = (l_v434_Pivot_0 * CFrame.new(0, 0, -v474)).Position;
                                l_Position_3 = Vector3.new(l_Position_3.X, v473.Y, l_Position_3.Z);
                                return v473.Rotation + l_Position_3, v474;
                            end;
                            v472 = function(v476, v477, v478) --[[ Line: 2289 ]] --[[ Name: pivotHitPart ]]
                                local v479, v480 = getHitPivot(v476);
                                local l_Weld_4 = v476:FindFirstChildOfClass("Weld");
                                l_Weld_4.C0 = v479:ToObjectSpace(v477.CFrame);
                                if v478 then
                                    l_Weld_4.C1 = v478;
                                end;
                                return v479, v480;
                            end;
                            local v482 = v450:Extend();
                            local v483 = {
                                model = v434, 
                                pivot = l_v434_Pivot_0, 
                                attackPosition = v471, 
                                rng = v435, 
                                range = v452.range, 
                                speedMultiplier = v469, 
                                attackInfo = v470, 
                                getScaledEffectRange = v456, 
                                getHitPivot = getHitPivot, 
                                pivotHitPart = v472, 
                                dumpster = v482
                            };
                            local v484 = v71[v470.Effect];
                            local v485 = v484 and v484(v483);
                            if not v485 then
                                return;
                            else
                                local v486 = v451[l_AnimationId_0];
                                if not v486 then
                                    v486 = v450:Extend();
                                    v451[l_AnimationId_0] = v486;
                                end;
                                local v487 = {};
                                for v488, v489 in v485 do
                                    local v490 = nil;
                                    if string.find(v488, "Stop") ~= nil then
                                        v490 = {
                                            callback = v489, 
                                            called = false
                                        };
                                        v487[v488] = v490;
                                    end;
                                    do
                                        local l_v490_0 = v490;
                                        v486:Add(v463:GetMarkerReachedSignal(v488):Connect(function() --[[ Line: 2347 ]]
                                            -- upvalues: l_v490_0 (ref), v489 (copy)
                                            if l_v490_0 then
                                                l_v490_0.called = true;
                                            end;
                                            v489();
                                        end));
                                    end;
                                end;
                                if not v463.IsPlaying then
                                    v486:Destroy();
                                    v482:Destroy();
                                    for _, v493 in v487 do
                                        if not v493.called then
                                            v493.callback();
                                        end;
                                    end;
                                end;
                                v486:Add(v463.Stopped:Once(function() --[[ Line: 2367 ]]
                                    -- upvalues: v486 (ref), v482 (copy), v487 (copy)
                                    v486:Destroy();
                                    v482:Destroy();
                                    for _, v495 in v487 do
                                        if not v495.called then
                                            v495.callback();
                                        end;
                                    end;
                                end));
                                return;
                            end;
                        end;
                    end;
                end;
            end;
            for _, v498 in v442:GetPlayingAnimationTracks() do
                v496(v498);
            end;
            v450:Add(v442.AnimationPlayed:Connect(v496));
            return;
        end;
    end;
end;
l_SurfaceGui_0._ConnectEntityDrops = function(_) --[[ Line: 2387 ]] --[[ Name: _ConnectEntityDrops ]]

end;
return l_SurfaceGui_0;