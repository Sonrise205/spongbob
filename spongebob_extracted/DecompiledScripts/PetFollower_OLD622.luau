local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = require(l_LocalPlayer_0.PlayerScripts.Knit.Modules.ClientAnimator);
local v6 = require(l_ReplicatedStorage_0.Packages.Component);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.Signal);
local v9 = require(l_ReplicatedStorage_0.Packages.Knit);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_Pets_0 = l_ReplicatedStorage_0.Models.Pets;
local l_VFX_0 = l_ReplicatedStorage_0.VFX;
local l_Instance_0 = Instance;
l_Instance_0 = Instance.new("Part");
l_Instance_0.Name = "PET_CORE";
l_Instance_0.Size = Vector3.new(1, 1, 1, 0);
l_Instance_0.CanCollide = false;
l_Instance_0.CanQuery = false;
l_Instance_0.Anchored = false;
l_Instance_0.Massless = true;
l_Instance_0.Transparency = 1;
local v14 = v6.new({
    Tag = "PetFollower_OLD", 
    Ancestors = {
        workspace
    }
});
v14.Construct = function(v15) --[[ Line: 50 ]] --[[ Name: Construct ]]
    -- upvalues: l_Instance_0 (ref), v9 (copy), v7 (copy), v8 (copy)
    assert(v15.Instance:IsA("Model"), "'PetFollower' must be a [Model].");
    local v16 = l_Instance_0:Clone();
    v16.Color = BrickColor.random().Color;
    v16.Parent = v15.Instance;
    v15.Instance.PrimaryPart = v16;
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.Part0 = workspace.Terrain;
    l_Motor6D_0.Part1 = v16;
    l_Motor6D_0.Parent = v16;
    local v18 = RaycastParams.new();
    v18.FilterType = Enum.RaycastFilterType.Exclude;
    v18.FilterDescendantsInstances = {
        v15.Instance
    };
    v18.IgnoreWater = false;
    v15._audioController = v9.GetController("AudioController");
    v15._lastAttachmentCFrame = CFrame.new(0, 0, 0);
    v15._primaryPart = v16;
    v15._dumpster = v7.new();
    v15._rayParams = v18;
    v15._elapsedMovement = 0;
    v15._clientAnimator = nil;
    v15._isAirborne = false;
    v15._visualModel = nil;
    v15._mover = l_Motor6D_0;
    v15._currentState = "Idling";
    v15._stateChanged = v15._dumpster:Add(v8.new());
    v15._stateChanged:Connect(function(v19) --[[ Line: 82 ]]
        -- upvalues: v15 (copy)
        v15:_handleStateChanged(v19);
    end);
end;
v14.Start = function(v20) --[[ Line: 87 ]] --[[ Name: Start ]]
    -- upvalues: l_RunService_0 (copy), v10 (copy)
    v20._dumpster:Add(v20.Instance:GetAttributeChangedSignal("PetType"):Connect(function() --[[ Line: 88 ]]
        -- upvalues: v20 (copy)
        v20:_setupVisualModel();
    end));
    v20:_setupVisualModel();
    v20._followSpeed = v20._visualModel:GetAttribute("FollowSpeed") or 6;
    v20._dumpster:Add(v20._visualModel:GetAttributeChangedSignal("FollowSpeed"):Connect(function() --[[ Line: 96 ]]
        -- upvalues: v20 (copy)
        v20._followSpeed = v20._visualModel:GetAttribute("FollowSpeed") or 6;
    end));
    local v21 = v20._visualModel:GetAttribute("Grounded") or false;
    v20._dumpster:Add(l_RunService_0.PreSimulation:Connect(function(v22) --[[ Line: 102 ]]
        -- upvalues: v20 (copy), v21 (copy), v10 (ref)
        local l_v20_SlotAttachment_0 = v20:GetSlotAttachment();
        if not l_v20_SlotAttachment_0 then
            return;
        elseif v20._currentState == "Attacking" then
            return;
        else
            local l_WorldCFrame_0 = l_v20_SlotAttachment_0.WorldCFrame;
            local l_Position_0 = l_WorldCFrame_0.Position;
            local v26 = if v20._isAirborne then l_Position_0 else v20:_getGroundPosition();
            local v27 = if v26 then v26.Y else l_Position_0.Y;
            l_WorldCFrame_0 = l_WorldCFrame_0.Rotation + Vector3.new(l_Position_0.X, v27, l_Position_0.Z);
            local l_Magnitude_0 = (l_WorldCFrame_0.Position - v20._lastAttachmentCFrame.Position).Magnitude;
            local v29 = 0;
            local l_v20_0 = v20;
            l_v20_0._elapsedMovement = l_v20_0._elapsedMovement + l_Magnitude_0 * v22 * 10;
            if l_Magnitude_0 > 0.1 and not v21 then
                v29 = math.max(math.abs(math.sin(v20._elapsedMovement) * 4) - 2, 0);
            end;
            l_v20_0 = v20._mover.Transform;
            local v31 = l_WorldCFrame_0 * CFrame.new(0, v29, 0);
            local v32 = l_v20_0:Lerp(v31, v20._followSpeed * v22);
            local l_Magnitude_1 = (v31.Position - l_v20_0.Position).Magnitude;
            local l_v10_2DDistance_0 = v10:Get2DDistance(v20._lastAttachmentCFrame.Position, l_WorldCFrame_0.Position);
            v20._lastAttachmentCFrame = l_WorldCFrame_0;
            if l_Magnitude_1 > 0.5 then
                v20:SetState("Following");
            else
                v20:SetState("Idling");
            end;
            if l_v10_2DDistance_0 > 45 then
                v20._mover.Transform = v31;
                return;
            else
                v20._mover.Transform = v32;
                return;
            end;
        end;
    end));
    v20._dumpster:Add(v20.Instance:GetAttributeChangedSignal("Attacking"):Connect(function() --[[ Line: 149 ]]
        -- upvalues: v20 (copy)
        if v20.Instance:GetAttribute("Attacking") == true then
            v20:SetState("Attacking");
            return;
        else
            v20:SetState("Idling");
            return;
        end;
    end));
end;
v14.Stop = function(v35) --[[ Line: 160 ]] --[[ Name: Stop ]]
    v35._dumpster:Destroy();
end;
v14.SetState = function(v36, v37) --[[ Line: 165 ]] --[[ Name: SetState ]]
    if v37 == v36._currentState then
        return;
    else
        v36._currentState = v37;
        v36._stateChanged:Fire(v37);
        return;
    end;
end;
v14.GetOwnerRootPart = function(v38) --[[ Line: 174 ]] --[[ Name: GetOwnerRootPart ]]
    -- upvalues: l_Players_0 (copy)
    local l_Attribute_0 = v38.Instance:GetAttribute("OwnerId");
    if not l_Attribute_0 then
        return nil;
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(l_Attribute_0);
        if not l_l_Players_0_PlayerByUserId_0 or not l_l_Players_0_PlayerByUserId_0.Character then
            return nil;
        else
            return l_l_Players_0_PlayerByUserId_0.Character:FindFirstChild("HumanoidRootPart");
        end;
    end;
end;
v14.GetSlotAttachment = function(v41) --[[ Line: 188 ]] --[[ Name: GetSlotAttachment ]]
    local l_Attribute_1 = v41.Instance:GetAttribute("EquippedSlot");
    if not l_Attribute_1 then
        return nil;
    else
        local l_v41_OwnerRootPart_0 = v41:GetOwnerRootPart();
        if not l_v41_OwnerRootPart_0 then
            return nil;
        else
            return l_v41_OwnerRootPart_0:FindFirstChild("PET_SLOT_" .. l_Attribute_1);
        end;
    end;
end;
v14._getGroundPosition = function(v44) --[[ Line: 203 ]] --[[ Name: _getGroundPosition ]]
    local l_v44_SlotAttachment_0 = v44:GetSlotAttachment();
    if not l_v44_SlotAttachment_0 then
        return nil;
    else
        local v46 = l_v44_SlotAttachment_0.WorldCFrame.Position + Vector3.new(0, 10, 0, 0);
        local v47 = workspace:Raycast(v46, Vector3.new(-0, -100, -0, -0), v44._rayParams);
        if not v47 then
            return nil;
        else
            return v47.Position;
        end;
    end;
end;
v14._handleStateChanged = function(v48, v49) --[[ Line: 218 ]] --[[ Name: _handleStateChanged ]]
    local l__clientAnimator_0 = v48._clientAnimator;
    if not l__clientAnimator_0 then
        return;
    else
        if v48._trackDump then
            v48._trackDump:Destroy();
            v48._trackDump = nil;
            v48._track = nil;
        end;
        local v51 = ({
            Idling = "Idle", 
            Following = "Run", 
            Attacking = "Attack"
        })[v49];
        if not v51 then
            return;
        else
            local v52, v53 = l__clientAnimator_0:Play(v51, {
                stopPlayingTracks = true
            });
            v48._track = v52;
            v48._trackDump = v53;
            return;
        end;
    end;
end;
v14._setupVisualModel = function(v54) --[[ Line: 253 ]] --[[ Name: _setupVisualModel ]]
    -- upvalues: l_Pets_0 (copy), v5 (copy), l_VFX_0 (copy), l_Debris_0 (copy)
    if v54._visualModel then
        v54._visualModel:Destroy();
        v54._visualModel = nil;
    end;
    if v54._clientAnimator then
        v54._clientAnimator:Destroy();
        v54._clientAnimator = nil;
    end;
    local l_Attribute_2 = v54.Instance:GetAttribute("PetType");
    local l_l_Pets_0_FirstChild_0 = l_Pets_0:FindFirstChild(l_Attribute_2);
    if not l_l_Pets_0_FirstChild_0 then
        warn((("Model not found for pet type: %*."):format(l_Attribute_2)));
        return;
    else
        l_l_Pets_0_FirstChild_0 = l_l_Pets_0_FirstChild_0:Clone();
        l_l_Pets_0_FirstChild_0:PivotTo(v54.Instance:GetPivot());
        v54._isAirborne = l_l_Pets_0_FirstChild_0:GetAttribute("Airborne") == true;
        local l_PrimaryPart_0 = v54.Instance.PrimaryPart;
        for _, v59 in l_l_Pets_0_FirstChild_0:GetDescendants() do
            if v59:IsA("BasePart") then
                v59.CanCollide = false;
                v59.Anchored = false;
                v59.Massless = true;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = l_PrimaryPart_0;
                l_WeldConstraint_0.Part1 = v59;
                l_WeldConstraint_0.Parent = v59;
            end;
        end;
        local v61 = v5.new(l_Attribute_2, l_l_Pets_0_FirstChild_0, "Pets");
        v54._clientAnimator = v61;
        v54._dumpster:Add(v61);
        l_l_Pets_0_FirstChild_0.Name = "VisualModel";
        l_l_Pets_0_FirstChild_0:SetAttribute("ReferenceName", l_Attribute_2);
        l_l_Pets_0_FirstChild_0.Parent = v54.Instance;
        v54._visualModel = l_l_Pets_0_FirstChild_0;
        v54._dumpster:Add(l_l_Pets_0_FirstChild_0);
        local v62 = l_VFX_0.General.Poof:Clone();
        v62.Parent = v54.Instance.PrimaryPart;
        v62:Emit(25);
        l_Debris_0:AddItem(v62, v62.Lifetime.Max);
        return;
    end;
end;
return v14;