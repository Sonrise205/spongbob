local l_CollectionService_0 = game:GetService("CollectionService");
local _ = game:GetService("GuiService");
local _ = game:GetService("Lighting");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TeleportService");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v9 = require(l_ReplicatedStorage_0.Packages.Knit);
local v10 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v11 = require(l_ReplicatedStorage_0.Packages.Signal);
local v12 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v17 = require(v9.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v20 = require(l_ReplicatedFirst_0.PlaceIds);
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local _ = v15.STARTER_UNITS;
local l_STARTER_TEAMS_0 = v15.STARTER_TEAMS;
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
local _ = {
    [1] = -5, 
    [2] = 5
};
local _ = {
    [1] = 15, 
    [2] = -15
};
local v33 = v9.CreateController({
    Name = script.Name, 
    _isInNPE = nil, 
    UnitSelected = v11.new(), 
    TeamSelected = v11.new(), 
    NPEHoverEntered = v11.new(), 
    NPEHoverLeft = v11.new(), 
    ConfirmationWindowClosed = v11.new(), 
    NPEFinished = v11.new(), 
    PressedPlayButton = v11.new()
});
v33.KnitInit = function(_) --[[ Line: 84 ]] --[[ Name: KnitInit ]]
    -- upvalues: v21 (ref), v9 (copy), v22 (ref), v23 (ref), v24 (ref), v25 (ref), v26 (ref), v27 (ref)
    v21 = v9.GetController("DataController");
    v22 = v9.GetController("UIController");
    v23 = v9.GetService("UnitService");
    v24 = v9.GetController("CharacterController");
    v25 = v9.GetController("BlurController");
    v26 = v9.GetController("DeviceTypeController");
    v27 = v9.GetService("NPEService");
end;
v33.KnitStart = function(v35) --[[ Line: 95 ]] --[[ Name: KnitStart ]]
    -- upvalues: v20 (copy), v27 (ref), v21 (ref), v9 (copy), v15 (copy)
    if v20:GetDestination() ~= "Lobby" then
        return;
    elseif v27.Disabled:OnReady():expect() then
        v35._isInNPE = false;
        return;
    else
        v35.npeStage = v21:Get(v9.Player, "NPEStage"):expect() or 1;
        local v36 = nil;
        local v37 = nil;
        v21:OnChanged(v9.Player, "NPEStage", function(v38) --[[ Line: 317 ]]
            -- upvalues: v35 (copy), v15 (ref), v36 (ref), v37 (ref)
            v35.npeStage = v38;
            v35._isInNPE = v38 < v15.NPE.FINISHED_STAGE;
            if v38 <= 2 then
                v36 = v35:_guideToQueue();
            elseif v36 then
                v36:Destroy();
            end;
            if v38 == 6 then
                v37 = v35:_guideToSummon();
                return;
            else
                if v37 then
                    v37:Destroy();
                end;
                return;
            end;
        end, true);
        return;
    end;
end;
v33.StartFirstUnitSelection = function(v39) --[[ Line: 352 ]] --[[ Name: StartFirstUnitSelection ]]
    -- upvalues: v22 (ref), v10 (copy), v25 (ref), v24 (ref), l_STARTER_TEAMS_0 (copy), l_Friendlies_0 (copy), v17 (copy), v26 (ref), l_GamepadService_0 (copy)
    if not v22.IsLoaded then
        v22.Loaded:Wait();
    end;
    local l_NPEUnitSelectionPOV_0 = workspace:WaitForChild("NPEUnitSelectionPOV");
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = l_NPEUnitSelectionPOV_0.CFrame;
    v39._uiToggled = v22:ToggleAll(nil, false);
    v39._selectionDump = v10.new();
    if not v25:IsLoaded() then
        v25.Loaded:Wait();
    end;
    v25:SetUnitDepthMode(true);
    v24:ToggleHideAll(true);
    v39._selectionDump:Add(function() --[[ Line: 374 ]]
        -- upvalues: v39 (copy)
        table.clear(v39._unitModels);
        v39._unitModels = nil;
        table.clear(v39._unitCFrames);
        v39._unitCFrames = nil;
        v39._selectionDump = nil;
    end);
    v22:Toggle("FirstUnitSelection2", true);
    local v42 = {
        [1] = {
            ["2"] = CFrame.new(1.4, -1, 3) * CFrame.Angles(0, 0.3490658503988659, 0), 
            ["3"] = CFrame.new(-1.5, 0, 9) * CFrame.Angles(0, 0.6981317007977318, 0)
        }, 
        [2] = {
            ["2"] = CFrame.new(2, 0, 3) * CFrame.Angles(0, 0.17453292519943295, 0), 
            ["3"] = CFrame.new(-2.25, 0, 4) * CFrame.Angles(0, -0.17453292519943295, 0)
        }
    };
    local v43 = {
        [1] = {
            zOffset = 1.7, 
            xOffset = -4.25, 
            angle = CFrame.Angles(0, 0.8726646259971648, 0)
        }, 
        [2] = {
            zOffset = 1.5, 
            xOffset = 5, 
            angle = CFrame.Angles(0, -0.7853981633974483, 0)
        }
    };
    for v44, v45 in l_STARTER_TEAMS_0 do
        local v46 = v45[1];
        local v47 = v43[v44];
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = v46 .. " Team";
        v39._selectionDump:Add(l_Model_0);
        local v49 = {};
        local v50 = l_Friendlies_0[v46]:Clone();
        local v51 = v39:PositionModelFlatAgainstCamera(v50, v47.zOffset, v47.xOffset);
        local _ = v39:PositionModelFlatAgainstCamera(v50, v47.zOffset - 0.2, v47.xOffset);
        v50.PrimaryPart.Anchored = true;
        v50:PivotTo(v51 * v47.angle);
        v50.Parent = l_Model_0;
        table.insert(v49, v50);
        for v53 = 2, #v45 do
            local v54 = l_Friendlies_0[v45[v53]]:Clone();
            v54.PrimaryPart.Anchored = true;
            v54:PivotTo(v50:GetPivot() * v42[v44][tostring(v53)]);
            v54.Parent = l_Model_0;
            table.insert(v49, v54);
        end;
        l_Model_0.PrimaryPart = v50.PrimaryPart;
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.Adornee = l_Model_0;
        l_Highlight_0.FillColor = Color3.new(0, 0, 0);
        l_Highlight_0.FillTransparency = 0;
        l_Highlight_0.OutlineColor = Color3.new(1, 1, 1);
        l_Highlight_0.OutlineTransparency = 1;
        l_Highlight_0.Parent = l_Model_0;
        if not v39._unitModels then
            v39._unitModels = {};
            v39._unitCFrames = {};
        end;
        v39._unitModels[v44] = l_Model_0;
        if not v39._unitSizes then
            v39._unitSizes = {};
        end;
        v39._unitSizes[v44] = {
            Unhovered = 1, 
            Hovered = 1.2
        };
        l_Model_0.Parent = l_CurrentCamera_0;
        task.defer(function() --[[ Line: 478 ]]
            -- upvalues: v49 (copy), v39 (copy), v17 (ref)
            for _, v57 in v49 do
                v39._selectionDump:Construct(v17, v57.Name, v57, "Friendlies"):Play("Idle");
            end;
        end);
    end;
    task.delay(1, function() --[[ Line: 486 ]]
        -- upvalues: v26 (ref), l_GamepadService_0 (ref)
        if v26:IsConsole() then
            l_GamepadService_0:EnableGamepadCursor(nil);
        end;
    end);
end;
v33.IsInNPE = function(v58) --[[ Line: 493 ]] --[[ Name: IsInNPE ]]
    -- upvalues: v20 (copy), v12 (copy)
    if v20:GetDestination() ~= "Lobby" then
        return false;
    else
        return v12.Custom(function() --[[ Line: 498 ]]
            -- upvalues: v58 (copy)
            return v58._isInNPE;
        end):expect();
    end;
end;
v33.EndNPE = function(v59) --[[ Line: 503 ]] --[[ Name: EndNPE ]]
    -- upvalues: v22 (ref)
    v59._isInNPE = false;
    v59.NPEFinished:Fire();
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
    if v59._uiToggled then
        v59._uiToggled.FirstUnitSelection2 = nil;
        v22:RevertFromToggleAll(v59._uiToggled);
        v22:Toggle("FirstUnitSelection2", false);
        v59._uiToggled = nil;
    end;
end;
v33.PositionModelFlatAgainstCamera = function(_, v61, v62, v63) --[[ Line: 517 ]] --[[ Name: PositionModelFlatAgainstCamera ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    v62 = v62 or 1;
    v63 = v63 or 0;
    local l_v61_ExtentsSize_0 = v61:GetExtentsSize();
    local v66 = l_v61_ExtentsSize_0.Magnitude * v62;
    local l_CFrame_0 = l_CurrentCamera_1.CFrame;
    local v68 = l_CFrame_0.Position + l_CFrame_0.LookVector * v66;
    local v69 = CFrame.new(v68) * (l_CFrame_0 - l_CFrame_0.Position) * CFrame.Angles(0, 3.141592653589793, 0);
    local v70 = l_v61_ExtentsSize_0.Y / 2;
    local l_RightVector_0 = l_CFrame_0.RightVector;
    return v69 * CFrame.new(0, -v70, 0) + l_RightVector_0 * v63;
end;
v33._guideToQueue = function(_) --[[ Line: 668 ]] --[[ Name: _guideToQueue ]]
    -- upvalues: v10 (copy), v9 (copy), l_CollectionService_0 (copy), v18 (copy)
    local v73 = v10.new();
    local l_Player_0 = v9.Player;
    local function v83(v75) --[[ Line: 672 ]] --[[ Name: guideToClosestQueue ]]
        -- upvalues: l_CollectionService_0 (ref), v18 (ref), v73 (copy)
        local v76 = v75:WaitForChild("HumanoidRootPart", 5);
        if v76 then
            local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged("Matchmaker");
            local v78 = nil;
            for _, v80 in l_l_CollectionService_0_Tagged_0 do
                if v80:FindFirstChild("Open") and v80:GetAttribute("Mode") == nil then
                    local l_Magnitude_0 = (v76.Position - v80.Open.Position).Magnitude;
                    if not v78 or l_Magnitude_0 < (v78.Open.Position - v76.Position).Magnitude then
                        v78 = v80;
                    end;
                end;
            end;
            if v78 then
                local l_v18_BeamBetweenInstances_0 = v18:CreateBeamBetweenInstances(v76, v78.Open);
                v73:Add(l_v18_BeamBetweenInstances_0, "QueueGuide");
            end;
        end;
    end;
    v73:Add(l_Player_0.CharacterAdded:Connect(v83));
    v73:Add(l_Player_0.CharacterRemoving:Connect(function(_) --[[ Line: 694 ]]
        -- upvalues: v73 (copy)
        v73:Remove("QueueGuide");
    end));
    v83(l_Player_0.Character or l_Player_0.CharacterAdded:Wait());
    return v73;
end;
v33._guideToSummon = function(_) --[[ Line: 701 ]] --[[ Name: _guideToSummon ]]
    -- upvalues: v10 (copy), v9 (copy), l_CollectionService_0 (copy), v18 (copy)
    local v86 = v10.new();
    local l_Player_1 = v9.Player;
    local function v93(v88) --[[ Line: 705 ]] --[[ Name: guideToClosestQueue ]]
        -- upvalues: l_CollectionService_0 (ref), v18 (ref), v86 (copy)
        local v89 = v88:WaitForChild("HumanoidRootPart", 5);
        if v89 then
            for _, v91 in (l_CollectionService_0:GetTagged("MenuZone")) do
                if v91.Name == "Summon" and v91:GetAttribute("SummonTab") == "Standard" then
                    local l_v18_BeamBetweenInstances_1 = v18:CreateBeamBetweenInstances(v89, v91);
                    v86:Add(l_v18_BeamBetweenInstances_1, "SummonGuide");
                    return;
                end;
            end;
        end;
    end;
    v86:Add(l_Player_1.CharacterAdded:Connect(v93));
    v86:Add(l_Player_1.CharacterRemoving:Connect(function(_) --[[ Line: 720 ]]
        -- upvalues: v86 (copy)
        v86:Remove("SummonGuide");
    end));
    v93(l_Player_1.Character or l_Player_1.CharacterAdded:Wait());
    return v86;
end;
return v33;