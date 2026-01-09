local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local v10 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
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
local v36 = nil;
local v37 = nil;
local v38 = CFrame.Angles(0, 3.141592653589793, 0);
local v39 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v41 = v6.CreateController({
    Name = script.Name, 
    UnitGained = v10.new(), 
    TreasureAreaLoaded = v10.new(), 
    StopOpenAll = v10.new(), 
    _opening = false
});
v41.KnitInit = function(_) --[[ Line: 75 ]] --[[ Name: KnitInit ]]
    -- upvalues: v17 (ref), v6 (copy), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v25 (ref), v26 (ref)
    v17 = v6.GetController("DataController");
    v18 = v6.GetService("TreasureService");
    v19 = v6.GetController("CharacterController");
    v20 = v6.GetController("DeviceTypeController");
    v21 = v6.GetController("UIController");
    v22 = v6.GetController("UnitViewerController");
    v23 = v6.GetController("AudioController");
    v24 = v6.GetController("VDayGiftController");
    v25 = v6.GetController("CamShakeController");
    v26 = v6.GetController("PurchaseController");
end;
v41.KnitStart = function(v43) --[[ Line: 89 ]] --[[ Name: KnitStart ]]
    -- upvalues: v12 (copy), v27 (ref), v21 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v36 (ref), l_ReplicatedStorage_0 (copy), v37 (ref), v32 (ref), v33 (ref), v34 (ref), v35 (ref), l_CollectionService_0 (copy), v17 (ref), v6 (copy), v41 (copy)
    if not v12:IsHUB() then
        return;
    else
        v27 = v21:GetModuleAsync("TreasureOpen"):expect();
        v28 = v21:GetModuleAsync("Rewards"):expect();
        v29 = v21:GetModuleAsync("PromptOverlay"):expect();
        v30 = v21:GetModuleAsync("TreasureResults"):expect();
        v31 = v21:GetModuleAsync("Notification"):expect();
        v36 = l_ReplicatedStorage_0.Models.TreasureChest;
        v37 = l_ReplicatedStorage_0.Animations.TreasureChest;
        local function v45(v44) --[[ Line: 103 ]] --[[ Name: treasureAreaAdded ]]
            -- upvalues: v32 (ref), v33 (ref), v34 (ref), v35 (ref), v43 (copy)
            if not v44:IsDescendantOf(workspace) then
                return;
            else
                v32 = v44;
                v33 = v44:WaitForChild("TreasurePOV");
                v34 = v44:WaitForChild("TreasurePOV2");
                v35 = v44:WaitForChild("TreasureWall", 5);
                v33.Transparency = 1;
                v34.Transparency = 1;
                v43.TreasureAreaLoaded:Fire(v32, v33, v34, v35);
                return;
            end;
        end;
        for _, v47 in l_CollectionService_0:GetTagged("TreasureArea") do
            v45(v47);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("TreasureArea"):Connect(v45);
        v17:OnChanged(v6.Player, "Inventory", function(v48) --[[ Line: 125 ]]
            -- upvalues: v43 (copy)
            if not v43._chestName or not v43._openAll then
                return;
            else
                if not v48[v43._chestName] then
                    v43:ToggleOpenAll(false);
                end;
                return;
            end;
        end, true);
        v41.StopOpenAll:Connect(function() --[[ Line: 136 ]]
            -- upvalues: v43 (copy)
            v43:ToggleOpenAll(false);
        end);
        return;
    end;
end;
v41.IsOpening = function(v49) --[[ Line: 141 ]] --[[ Name: IsOpening ]]
    return v49._opening;
end;
v41.GetArea = function(_) --[[ Line: 145 ]] --[[ Name: GetArea ]]
    -- upvalues: v32 (ref), v33 (ref), v34 (ref), v35 (ref)
    return v32, v33, v34, v35;
end;
v41.OpenTreasure = function(v51, v52, v53, v54) --[[ Line: 149 ]] --[[ Name: OpenTreasure ]]
    -- upvalues: v15 (copy), v7 (copy), v21 (ref), v20 (ref), v19 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v33 (ref), v36 (ref), v38 (copy), v37 (ref), v9 (copy), v23 (ref), l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy), l_UserInputService_0 (copy), v39 (copy)
    v51._opening = true;
    if not v15:GetByItemName(v52) then
        v51._opening = false;
        return;
    else
        v51._dump = v7.new();
        if not v51._allToggled then
            v51._allToggled = v21:ToggleAll(nil, false);
        end;
        v20:TogglePlayerControls(false);
        v19:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v53, "\nTreasure Gained:", v54);
        end;
        v51:_setRarityVisual(v53[1], 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v33.CFrame;
        local v55 = v36:Clone();
        v55:PivotTo(v33.CFrame * v38 + v33.CFrame.LookVector * 4.5);
        v55.Parent = workspace;
        v51._dump:Add(v55);
        if not v55:IsDescendantOf(workspace) then
            v55.AncestryChanged:Wait();
        end;
        local l_Chest_0 = v55.Chest;
        local l_Shell_0 = v55.Shell;
        local v58 = l_Shell_0 and l_Shell_0:WaitForChild("Shell");
        v58 = v58 and v58:WaitForChild("Root");
        local v60 = v51:PlayAnimation(l_Chest_0, v37.Chest.Open, {
            Looped = false
        }, {
            KeepOpen = function(v59) --[[ Line: 201 ]]
                v59:AdjustSpeed(0);
            end
        });
        local v63 = v51:PlayAnimation(l_Shell_0, v37.Shell.Intro, {
            Looped = false
        }, {
            CameraUp = function() --[[ Line: 207 ]]
                -- upvalues: l_RunService_0 (ref), l_CurrentCamera_0 (ref), l_Shell_0 (copy)
                l_RunService_0:BindToRenderStep("ShellFollow", Enum.RenderPriority.Camera.Value, function() --[[ Line: 208 ]]
                    -- upvalues: l_CurrentCamera_0 (ref), l_Shell_0 (ref)
                    local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
                    local l_Position_1 = l_Shell_0.PrimaryPart.Root.TransformedWorldCFrame.Position;
                    l_CurrentCamera_0.CFrame = CFrame.new(l_Position_0.X, l_Position_1.Y, l_Position_0.Z) * l_CurrentCamera_0.CFrame.Rotation;
                end);
            end, 
            CameraFinished = function() --[[ Line: 216 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("ShellFollow");
            end
        });
        local v64 = 2;
        if v51._openAll then
            v64 = v64 * 5;
        end;
        v60:AdjustSpeed(v64);
        v63:AdjustSpeed(v64);
        local v65 = {
            v9.fromEvent(v63:GetMarkerReachedSignal("CameraFinished")), 
            v9.fromEvent(v60:GetMarkerReachedSignal("KeepOpen"))
        };
        v23:FadeMusicVolume(0, 0.5);
        v23:PlaySound({
            name = "TreasureChest.Opening", 
            soundGroup = "Master.SFX.UI"
        });
        v9.allSettled(v65):await();
        l_Chest_0:PivotTo(CFrame.new(0, 1000000000, 0));
        local l_TransformedWorldCFrame_0 = l_Shell_0.PrimaryPart.Root.TransformedWorldCFrame;
        v63:Stop(0);
        v51._dump:Add(v63);
        l_RunService_0.PreSimulation:Once(function() --[[ Line: 252 ]]
            -- upvalues: l_Shell_0 (copy), l_TransformedWorldCFrame_0 (copy)
            l_Shell_0.PrimaryPart.Root.WorldCFrame = l_TransformedWorldCFrame_0;
        end);
        local v67 = v51:PlayAnimation(l_Shell_0, v37.Shell.Idle, {
            Looped = true
        }, nil, false);
        v67.Priority = Enum.AnimationPriority.Action2;
        v67:Play(0);
        v51._dump:Add(v67);
        local v68 = v51:PlayAnimation(l_Shell_0, v37.Shell.Open, {
            Looped = false
        }, nil, false);
        v68.Priority = Enum.AnimationPriority.Action4;
        v51._dump:Add(v68);
        local v69 = l_ReplicatedStorage_0.VFX.TreasureShellExplosion:Clone();
        v69.Anchored = true;
        v69.CFrame = l_TransformedWorldCFrame_0;
        v69.Parent = workspace;
        v51._dump:Add(v69);
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.2), {
            CFrame = CFrame.new(l_CurrentCamera_0.CFrame.Position.X, v69.Position.Y, l_CurrentCamera_0.CFrame.Position.Z) * l_CurrentCamera_0.CFrame.Rotation
        }):Play();
        for _, v71 in v69:GetDescendants() do
            if v71:IsA("ParticleEmitter") then
                v71.Lifetime = NumberRange.new(v71.Lifetime.Min * 0.75, v71.Lifetime.Max * 0.75);
            end;
        end;
        local v72 = 1;
        local v73 = #v53;
        v21:Toggle("TreasureOpen", true);
        local function v77() --[[ Line: 293 ]] --[[ Name: doTap ]]
            -- upvalues: v72 (ref), v73 (copy), v21 (ref), v51 (copy), v54 (copy), v53 (copy), v52 (copy), v69 (copy), v23 (ref), v68 (copy)
            v72 = v72 + 1;
            if v72 > v73 + 1 then
                v21:Toggle("TreasureOpen", false);
                v51:RevealItem(v54, v53[#v53], v52);
                return;
            else
                for _, v75 in v69:GetDescendants() do
                    if v75:IsA("ParticleEmitter") then
                        v75:Emit(v75:GetAttribute("EmitCount") or 0);
                    end;
                end;
                local v76 = v53[math.clamp(v72 - 1, 1, #v53)];
                if v76 then
                    v51:_setRarityVisual(v76, v72);
                end;
                if v72 <= v73 + 1 then
                    v23:PlaySound({
                        name = ("TreasureChest.Upgrade%*"):format(v72 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                    v68:Play();
                    v68:AdjustSpeed(1.75);
                end;
                return;
            end;
        end;
        v51._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v78, v79) --[[ Line: 329 ]]
            -- upvalues: v39 (ref), v77 (copy)
            if v79 or not table.find(v39, v78.UserInputType) then
                return;
            else
                v77();
                return;
            end;
        end));
        v51._dump:Add(v20.GamepadButtonPressed:Connect(v77));
        return;
    end;
end;
v41.Open50Treasure = function(v80, v81, v82, v83) --[[ Line: 340 ]] --[[ Name: Open50Treasure ]]
    -- upvalues: v15 (copy), v7 (copy), v21 (ref), v20 (ref), v19 (ref), l_RunService_0 (copy), v16 (copy), l_CurrentCamera_0 (copy), v33 (ref), v36 (ref), v38 (copy), v37 (ref), v9 (copy), v23 (ref), l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy), l_UserInputService_0 (copy), v39 (copy)
    v80._opening = true;
    if not v15:GetByItemName(v81) then
        v80._opening = false;
        return;
    else
        v80._dump = v7.new();
        if not v80._allToggled then
            v80._allToggled = v21:ToggleAll(nil, false);
        end;
        v20:TogglePlayerControls(false);
        v19:ToggleHideAll(true);
        if l_RunService_0:IsStudio() then
            warn("Taps:", v82, "\nTreasure Gained:", v83);
        end;
        local v84 = v82[1][1];
        local v85 = nil;
        for _, v87 in v82 do
            local v88 = v87[#v87];
            if not v85 then
                v85 = v88;
            elseif v88 ~= v85 and v16.RARITIES_FROM_NAME[v88] > v16.RARITIES_FROM_NAME[v85] then
                v85 = v88;
            end;
        end;
        v80:_setRarityVisual(v84, 1);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CurrentCamera_0.CFrame = v33.CFrame;
        local v89 = v36:Clone();
        v89:PivotTo(v33.CFrame * v38 + v33.CFrame.LookVector * 4.5);
        v89.Parent = workspace;
        v80._dump:Add(v89);
        if not v89:IsDescendantOf(workspace) then
            v89.AncestryChanged:Wait();
        end;
        local l_Chest_1 = v89.Chest;
        local l_Shell_1 = v89.Shell;
        local v92 = l_Shell_1 and l_Shell_1:WaitForChild("Shell");
        v92 = v92 and v92:WaitForChild("Root");
        local v94 = v80:PlayAnimation(l_Chest_1, v37.Chest.Open, {
            Looped = false
        }, {
            KeepOpen = function(v93) --[[ Line: 414 ]]
                v93:AdjustSpeed(0);
            end
        });
        local v97 = v80:PlayAnimation(l_Shell_1, v37.Shell.Intro, {
            Looped = false
        }, {
            CameraUp = function() --[[ Line: 420 ]]
                -- upvalues: l_RunService_0 (ref), l_CurrentCamera_0 (ref), l_Shell_1 (copy)
                l_RunService_0:BindToRenderStep("ShellFollow", Enum.RenderPriority.Camera.Value, function() --[[ Line: 421 ]]
                    -- upvalues: l_CurrentCamera_0 (ref), l_Shell_1 (ref)
                    local l_Position_2 = l_CurrentCamera_0.CFrame.Position;
                    local l_Position_3 = l_Shell_1.PrimaryPart.Root.TransformedWorldCFrame.Position;
                    l_CurrentCamera_0.CFrame = CFrame.new(l_Position_2.X, l_Position_3.Y, l_Position_2.Z) * l_CurrentCamera_0.CFrame.Rotation;
                end);
            end, 
            CameraFinished = function() --[[ Line: 429 ]]
                -- upvalues: l_RunService_0 (ref)
                l_RunService_0:UnbindFromRenderStep("ShellFollow");
            end
        });
        local v98 = 2;
        if v80._openAll then
            v98 = v98 * 5;
        end;
        v94:AdjustSpeed(v98);
        v97:AdjustSpeed(v98);
        local v99 = {
            v9.fromEvent(v97:GetMarkerReachedSignal("CameraFinished")), 
            v9.fromEvent(v94:GetMarkerReachedSignal("KeepOpen"))
        };
        v23:FadeMusicVolume(0, 0.5);
        v23:PlaySound({
            name = "TreasureChest.Opening", 
            soundGroup = "Master.SFX.UI"
        });
        v9.allSettled(v99):await();
        l_Chest_1:PivotTo(CFrame.new(0, 1000000000, 0));
        local l_TransformedWorldCFrame_1 = l_Shell_1.PrimaryPart.Root.TransformedWorldCFrame;
        v97:Stop(0);
        v80._dump:Add(v97);
        l_RunService_0.PreSimulation:Once(function() --[[ Line: 465 ]]
            -- upvalues: l_Shell_1 (copy), l_TransformedWorldCFrame_1 (copy)
            l_Shell_1.PrimaryPart.Root.WorldCFrame = l_TransformedWorldCFrame_1;
        end);
        local v101 = v80:PlayAnimation(l_Shell_1, v37.Shell.Idle, {
            Looped = true
        }, nil, false);
        v101.Priority = Enum.AnimationPriority.Action2;
        v101:Play(0);
        v80._dump:Add(v101);
        local v102 = v80:PlayAnimation(l_Shell_1, v37.Shell.Open, {
            Looped = false
        }, nil, false);
        v102.Priority = Enum.AnimationPriority.Action4;
        v80._dump:Add(v102);
        local v103 = l_ReplicatedStorage_0.VFX.TreasureShellExplosion:Clone();
        v103.Anchored = true;
        v103.CFrame = l_TransformedWorldCFrame_1;
        v103.Parent = workspace;
        v80._dump:Add(v103);
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.2), {
            CFrame = CFrame.new(l_CurrentCamera_0.CFrame.Position.X, v103.Position.Y, l_CurrentCamera_0.CFrame.Position.Z) * l_CurrentCamera_0.CFrame.Rotation
        }):Play();
        for _, v105 in v103:GetDescendants() do
            if v105:IsA("ParticleEmitter") then
                v105.Lifetime = NumberRange.new(v105.Lifetime.Min * 0.75, v105.Lifetime.Max * 0.75);
            end;
        end;
        local v106 = 1;
        local v107 = #v82[1];
        v21:Toggle("TreasureOpen", true);
        local function v111() --[[ Line: 506 ]] --[[ Name: doTap ]]
            -- upvalues: v106 (ref), v107 (copy), v21 (ref), v80 (copy), v83 (copy), v82 (copy), v81 (copy), v103 (copy), v85 (ref), v23 (ref), v102 (copy)
            v106 = v106 + 1;
            if v106 > v107 + 1 then
                v21:Toggle("TreasureOpen", false);
                v80:RevealItemsOpened(v83, v82, v81);
                return;
            else
                for _, v109 in v103:GetDescendants() do
                    if v109:IsA("ParticleEmitter") then
                        v109:Emit(v109:GetAttribute("EmitCount") or 0);
                    end;
                end;
                local v110 = v82[1][math.clamp(v106 - 1, 1, #v82[1])];
                if v106 - 1 >= v107 then
                    v110 = v85;
                end;
                if v110 then
                    v80:_setRarityVisual(v110, v106);
                end;
                if v106 <= v107 + 1 then
                    v23:PlaySound({
                        name = ("TreasureChest.Upgrade%*"):format(v106 - 1), 
                        soundGroup = "Master.SFX.UI"
                    });
                    v102:Play();
                    v102:AdjustSpeed(1.75);
                end;
                return;
            end;
        end;
        v80._dump:Add(l_UserInputService_0.InputBegan:Connect(function(v112, v113) --[[ Line: 547 ]]
            -- upvalues: v39 (ref), v111 (copy)
            if v113 or not table.find(v39, v112.UserInputType) then
                return;
            else
                v111();
                return;
            end;
        end));
        v80._dump:Add(v20.GamepadButtonPressed:Connect(v111));
        return;
    end;
end;
v41.RevealItem = function(v114, v115, _, v117) --[[ Line: 558 ]] --[[ Name: RevealItem ]]
    -- upvalues: v21 (ref), l_RunService_0 (copy), v22 (ref), v28 (ref), v23 (ref)
    v114._dump:Clean();
    v114._dump:Add(function() --[[ Line: 561 ]]
        -- upvalues: v114 (copy)
        v114._dump = nil;
        if not v114._openAll then
            v114._allToggled = nil;
        end;
        v114._opening = false;
    end);
    v21:Toggle("TreasureOpen", false):await();
    if v114._allToggled then
        v114._allToggled.TreasureOpen = nil;
    end;
    local function v118() --[[ Line: 589 ]] --[[ Name: handleFinished ]]
        -- upvalues: v118 (ref), v114 (copy), l_RunService_0 (ref), v117 (copy)
        v118 = nil;
        v114._dump:Destroy();
        l_RunService_0.RenderStepped:Wait();
        if v114._openAll then
            v114:AttemptOpen(v117, v114._openAll, 1);
        end;
    end;
    if v115.type == "RandomUnit" or v115.type == "Unit" then
        v114._dump:Add(v22.QueueCompleted:Once(v118));
        v114.UnitGained:Fire({
            v115.unitData
        }, {
            fromNPE = false, 
            fromTreasureOpenAll = v114._openAll or false
        }, table.clone(v114._allToggled));
        return;
    else
        v114._dump:Add(v28.Finished:Once(v118));
        v23:PlaySound({
            name = "TreasureChest.Reward", 
            soundGroup = "Master.SFX.UI"
        });
        v28:QueueRewards(v115, table.clone(v114._allToggled), v114._openAll);
        task.delay(3.4, function() --[[ Line: 622 ]]
            -- upvalues: v23 (ref)
            v23:FadeMusicVolume(1, 0.5);
        end);
        return;
    end;
end;
v41.RevealItemsOpened = function(v119, v120, _, _) --[[ Line: 629 ]] --[[ Name: RevealItemsOpened ]]
    -- upvalues: v21 (ref), v30 (ref)
    v119._dump:Clean();
    v119._dump = nil;
    v119._opening = false;
    v21:Toggle("TreasureOpen", false):await();
    if v119._allToggled then
        v119._allToggled.TreasureOpen = nil;
    end;
    v30:ShowResults(v120, table.clone(v119._allToggled));
    v119._allToggled = nil;
end;
v41.PlayAnimation = function(_, v124, v125, v126, v127, v128) --[[ Line: 657 ]] --[[ Name: PlayAnimation ]]
    if not v124 or not v125 then
        return;
    else
        if v128 == nil then
            v128 = true;
        end;
        v126 = v126 or {};
        local l_AnimationController_0 = v124:FindFirstChildOfClass("AnimationController");
        l_AnimationController_0 = l_AnimationController_0 and l_AnimationController_0:FindFirstChildOfClass("Animator");
        if not l_AnimationController_0 then
            return;
        else
            local v130 = l_AnimationController_0:LoadAnimation(v125);
            for v131, v132 in v126 do
                v130[v131] = v132;
            end;
            if v127 then
                for v133, v134 in v127 do
                    v130:GetMarkerReachedSignal(v133):Once(function(...) --[[ Line: 683 ]]
                        -- upvalues: v134 (copy), v130 (copy)
                        v134(v130, ...);
                    end);
                end;
            end;
            if v128 then
                v130:Play();
            end;
            return v130;
        end;
    end;
end;
v41.AttemptOpen = function(v135, v136, v137, v138) --[[ Line: 696 ]] --[[ Name: AttemptOpen ]]
    -- upvalues: v24 (ref), v29 (ref), v18 (ref), v21 (ref), v31 (ref)
    if not v136 or v135:IsOpening() then
        return;
    elseif v24:IsOpening() then
        return;
    else
        v138 = v138 or 1;
        v137 = v138 <= 1;
        v135._chestName = v136;
        v135:ToggleOpenAll(v137 or false);
        local v139 = nil;
        v139 = task.delay(0.5, function() --[[ Line: 721 ]]
            -- upvalues: v139 (ref), v29 (ref)
            v139 = nil;
            v29:Toggle(true);
        end);
        if v138 and v138 > 1 then
            v18:OpenCustomChestAmount(v136, v138):andThen(function(v140, v141) --[[ Line: 727 ]]
                -- upvalues: v21 (ref), v31 (ref), v138 (ref), v135 (copy), v136 (copy)
                if not v140 or not v141 then
                    v21:Toggle("Items", true);
                    v31:Notify({
                        message = ("You do not have enough of this item to open %*"):format(v138), 
                        isPositive = false, 
                        duration = 4
                    });
                    return;
                else
                    v135:Open50Treasure(v136, v140, v141);
                    return;
                end;
            end):finally(function() --[[ Line: 740 ]]
                -- upvalues: v29 (ref), v139 (ref)
                v29:Toggle(false);
                if v139 then
                    task.cancel(v139);
                end;
            end);
            return;
        else
            v18:Open(v136):andThen(function(v142, v143) --[[ Line: 750 ]]
                -- upvalues: v21 (ref), v135 (copy), v29 (ref), v139 (ref), v136 (copy)
                if not v142 or not v143 then
                    v21:Toggle("Items", true);
                    if v135._openAll then
                        v135:OpenAllFailed(1);
                    end;
                    v135:ToggleOpenAll(false);
                    return;
                else
                    v29:Toggle(false);
                    if v139 then
                        task.cancel(v139);
                    end;
                    v135:OpenTreasure(v136, v142, v143);
                    return;
                end;
            end):catch(function(v144) --[[ Line: 772 ]]
                -- upvalues: v21 (ref), v135 (copy)
                warn("caught err", v144);
                v21:Toggle("Items", true);
                if v135._openAll then
                    v135:OpenAllFailed(2);
                end;
                v135:ToggleOpenAll(false);
            end):finally(function() --[[ Line: 782 ]]
                -- upvalues: v29 (ref), v139 (ref)
                v29:Toggle(false);
                if v139 then
                    task.cancel(v139);
                end;
            end);
            return;
        end;
    end;
end;
v41.OpenAllFailed = function(v145, v146) --[[ Line: 792 ]] --[[ Name: OpenAllFailed ]]
    -- upvalues: v21 (ref), v20 (ref), v19 (ref), l_CurrentCamera_0 (copy)
    warn((("[%*]: Open All Failed! Fail Id: (%*)"):format(script.Name, v146)));
    v145:ToggleOpenAll(false);
    if v145._allToggled then
        v21:RevertFromToggleAll(v145._allToggled);
        v145._allToggled = nil;
    end;
    v20:TogglePlayerControls(true);
    v19:ToggleHideAll(false);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
end;
v41.ToggleOpenAll = function(v147, v148) --[[ Line: 808 ]] --[[ Name: ToggleOpenAll ]]
    -- upvalues: v27 (ref)
    v147._openAll = v148;
    v27:ReportOpenAll(v148);
end;
v41._setRarityVisual = function(_, v150, v151) --[[ Line: 813 ]] --[[ Name: _setRarityVisual ]]
    -- upvalues: v35 (ref), v14 (copy), v27 (ref)
    v151 = v151 or 1;
    if v35 then
        v35.SurfaceGui.ImageLabel.UIGradient.Color = v14.Gradient[v150];
        v35.SurfaceGui.Spotlight.UIGradient.Color = v14.Gradient[v150];
    end;
    v27:SetIndex(v150, v151);
end;
return v41;