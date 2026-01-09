local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = v3.CreateController({
    Name = script.Name, 
    _travelLocations = {}
});
v11.KnitInit = function(_) --[[ Line: 37 ]] --[[ Name: KnitInit ]]
    -- upvalues: v8 (ref), v3 (copy), v9 (ref), v10 (ref)
    v8 = v3.GetController("DataController");
    v9 = v3.GetController("CharacterController");
    v10 = v3.GetService("FastTravelService");
end;
v11.KnitStart = function(v13) --[[ Line: 44 ]] --[[ Name: KnitStart ]]
    -- upvalues: v7 (copy), v10 (ref)
    if not v7:IsHUB() or v7:IsFactionWorld() then
        return;
    else
        local v14 = workspace:WaitForChild("FastTravelLocations", 10);
        if not v14 then
            return;
        else
            for _, v16 in v14:GetChildren() do
                v13._travelLocations[v16.Name] = v16;
            end;
            v14.ChildAdded:Connect(function(v17) --[[ Line: 59 ]]
                -- upvalues: v13 (copy)
                v13._travelLocations[v17.Name] = v17;
            end);
            v10.ResetCamera:Connect(function() --[[ Line: 63 ]]
                -- upvalues: v13 (copy)
                v13:ResetCamera();
            end);
            return;
        end;
    end;
end;
v11.Travel = function(v18, v19) --[[ Line: 69 ]] --[[ Name: Travel ]]
    -- upvalues: v7 (copy), v3 (copy)
    if v7:IsLobby() and v19 == "Play" and v3.Player:GetAttribute("Setting_AutoJoinEmptyQueue") == true and v18:_attemptTeleportToEmptyQueue() then
        return;
    elseif not v18._travelLocations[v19] then
        return;
    else
        local l_Character_0 = v3.Player.Character;
        if not l_Character_0 or not l_Character_0.Parent then
            return;
        else
            local l_l_Character_0_ExtentsSize_0 = l_Character_0:GetExtentsSize();
            l_Character_0:PivotTo(v18._travelLocations[v19].CFrame + Vector3.new(0, l_l_Character_0_ExtentsSize_0.Y / 2, 0));
            v18:ResetCamera();
            return;
        end;
    end;
end;
v11.ResetCamera = function(_) --[[ Line: 94 ]] --[[ Name: ResetCamera ]]
    -- upvalues: v9 (ref)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
    local l_v9_Humanoid_0 = v9:GetHumanoid();
    if not l_v9_Humanoid_0 then
        return;
    else
        l_CurrentCamera_0.CameraSubject = l_v9_Humanoid_0;
        l_CurrentCamera_0.CFrame = CFrame.lookAlong(l_CurrentCamera_0.CFrame.Position, (l_v9_Humanoid_0.RootPart.CFrame * CFrame.Angles(-0.2617993877991494, 0, 0)).LookVector);
        return;
    end;
end;
v11._attemptTeleportToEmptyQueue = function(_) --[[ Line: 113 ]] --[[ Name: _attemptTeleportToEmptyQueue ]]
    -- upvalues: l_CollectionService_0 (copy), v5 (copy), v3 (copy)
    local v26 = nil;
    local v27 = {};
    for _, v29 in l_CollectionService_0:GetTagged("Matchmaker") do
        if not v29:GetAttribute("OCCUPIED") then
            local l_v29_Attribute_0 = v29:GetAttribute("Mode");
            if not l_v29_Attribute_0 or l_v29_Attribute_0 == "Story" then
                table.insert(v27, v29);
            end;
        end;
    end;
    v26 = v5.Shuffle(v27)[1];
    table.clear(v27);
    v27 = nil;
    if not v26 then
        return false;
    else
        local l_Character_1 = v3.Player.Character;
        if not l_Character_1 or not l_Character_1.Parent then
            return false;
        else
            local l_l_Character_1_ExtentsSize_0 = l_Character_1:GetExtentsSize();
            l_Character_1:PivotTo(v26.Open.CFrame * CFrame.Angles(0, -1.5707963267948966, 0) + Vector3.new(0, l_l_Character_1_ExtentsSize_0.Y + 2, 0));
            return true;
        end;
    end;
end;
return v11;