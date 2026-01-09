local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v6 = require(l_LocalPlayer_0.PlayerScripts.Knit.Modules.ClientAnimator);
local v7 = require(l_ReplicatedStorage_0.Packages.Component);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.Signal);
local v10 = require(l_ReplicatedStorage_0.Packages.Knit);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
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
local v16 = v7.new({
    Tag = "PetFollower", 
    Ancestors = {
        workspace
    }
});
v16.Construct = function(v17) --[[ Line: 53 ]] --[[ Name: Construct ]]
    -- upvalues: l_Instance_0 (ref), v10 (copy), v8 (copy), v9 (copy)
    assert(v17.Instance:IsA("Model"), "'PetFollower' must be a [Model].");
    local v18 = l_Instance_0:Clone();
    v18.Color = BrickColor.random().Color;
    v18.Parent = v17.Instance;
    v17.Instance.PrimaryPart = v18;
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.Part0 = workspace.Terrain;
    l_Motor6D_0.Part1 = v18;
    l_Motor6D_0.Parent = v18;
    local v20 = RaycastParams.new();
    v20.FilterType = Enum.RaycastFilterType.Exclude;
    v20.FilterDescendantsInstances = {
        v17.Instance
    };
    v20.IgnoreWater = false;
    v17._audioController = v10.GetController("AudioController");
    v17._lastAttachmentCFrame = CFrame.new(0, 0, 0);
    v17._primaryPart = v18;
    v17._dumpster = v8.new();
    v17._rayParams = v20;
    v17._elapsedMovement = 0;
    v17._clientAnimator = nil;
    v17._isAirborne = false;
    v17._visualModel = nil;
    v17._mover = l_Motor6D_0;
    v17._currentState = "Idling";
    v17._stateChanged = v17._dumpster:Add(v9.new());
    v17._stateChanged:Connect(function(v21) --[[ Line: 85 ]]
        -- upvalues: v17 (copy)
        v17:_handleStateChanged(v21);
    end);
end;
v16.Start = function(v22) --[[ Line: 90 ]] --[[ Name: Start ]]
    -- upvalues: l_RunService_0 (copy), v11 (copy)
    v22._dumpster:Add(v22.Instance:GetAttributeChangedSignal("PetType"):Connect(function() --[[ Line: 91 ]]
        -- upvalues: v22 (copy)
        v22:_setupVisualModel();
    end));
    v22:_setupVisualModel();
    v22._followSpeed = v22._visualModel:GetAttribute("FollowSpeed") or 6;
    v22._dumpster:Add(v22._visualModel:GetAttributeChangedSignal("FollowSpeed"):Connect(function() --[[ Line: 99 ]]
        -- upvalues: v22 (copy)
        v22._followSpeed = v22._visualModel:GetAttribute("FollowSpeed") or 6;
    end));
    local v23 = v22._visualModel:GetAttribute("Grounded") or false;
    v22._dumpster:Add(l_RunService_0.PreSimulation:Connect(function(v24) --[[ Line: 105 ]]
        -- upvalues: v22 (copy), v23 (copy), v11 (ref)
        local l_v22_SlotAttachment_0 = v22:GetSlotAttachment();
        if not l_v22_SlotAttachment_0 then
            return;
        elseif v22._currentState == "Attacking" then
            return;
        else
            local l_WorldCFrame_0 = l_v22_SlotAttachment_0.WorldCFrame;
            local l_Position_0 = l_WorldCFrame_0.Position;
            local v28 = if v22._isAirborne then l_Position_0 else v22:_getGroundPosition();
            local v29 = if v28 then v28.Y else l_Position_0.Y;
            l_WorldCFrame_0 = l_WorldCFrame_0.Rotation + Vector3.new(l_Position_0.X, v29, l_Position_0.Z);
            local l_Magnitude_0 = (l_WorldCFrame_0.Position - v22._lastAttachmentCFrame.Position).Magnitude;
            local v31 = 0;
            local l_v22_0 = v22;
            l_v22_0._elapsedMovement = l_v22_0._elapsedMovement + l_Magnitude_0 * v24 * 10;
            if l_Magnitude_0 > 0.1 and not v23 then
                v31 = math.max(math.abs(math.sin(v22._elapsedMovement) * 4) - 2, 0);
            end;
            l_v22_0 = v22._mover.Transform;
            local v33 = l_WorldCFrame_0 * CFrame.new(0, v31, 0);
            local v34 = l_v22_0:Lerp(v33, v22._followSpeed * v24);
            local l_Magnitude_1 = (v33.Position - l_v22_0.Position).Magnitude;
            local l_v11_2DDistance_0 = v11:Get2DDistance(v22._lastAttachmentCFrame.Position, l_WorldCFrame_0.Position);
            v22._lastAttachmentCFrame = l_WorldCFrame_0;
            if l_Magnitude_1 > 0.5 then
                v22:SetState("Following");
            else
                v22:SetState("Idling");
            end;
            if l_v11_2DDistance_0 > 45 then
                v22._mover.Transform = v33;
                return;
            else
                v22._mover.Transform = v34;
                return;
            end;
        end;
    end));
    v22._dumpster:Add(v22.Instance:GetAttributeChangedSignal("Attacking"):Connect(function() --[[ Line: 152 ]]
        -- upvalues: v22 (copy)
        if v22.Instance:GetAttribute("Attacking") == true then
            v22:SetState("Attacking");
            return;
        else
            v22:SetState("Idling");
            return;
        end;
    end));
end;
v16.Stop = function(v37) --[[ Line: 163 ]] --[[ Name: Stop ]]
    v37._dumpster:Destroy();
end;
v16.SetState = function(v38, v39) --[[ Line: 168 ]] --[[ Name: SetState ]]
    if v39 == v38._currentState then
        return;
    else
        v38._currentState = v39;
        v38._stateChanged:Fire(v39);
        return;
    end;
end;
v16.GetOwnerRootPart = function(v40) --[[ Line: 177 ]] --[[ Name: GetOwnerRootPart ]]
    -- upvalues: l_Players_0 (copy)
    local l_Attribute_0 = v40.Instance:GetAttribute("OwnerId");
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
v16.GetSlotAttachment = function(v43) --[[ Line: 191 ]] --[[ Name: GetSlotAttachment ]]
    local l_Attribute_1 = v43.Instance:GetAttribute("EquippedSlot");
    if not l_Attribute_1 then
        return nil;
    else
        local l_v43_OwnerRootPart_0 = v43:GetOwnerRootPart();
        if not l_v43_OwnerRootPart_0 then
            return nil;
        else
            return l_v43_OwnerRootPart_0:FindFirstChild("PET_SLOT_" .. l_Attribute_1);
        end;
    end;
end;
v16._getGroundPosition = function(v46) --[[ Line: 206 ]] --[[ Name: _getGroundPosition ]]
    local l_v46_SlotAttachment_0 = v46:GetSlotAttachment();
    if not l_v46_SlotAttachment_0 then
        return nil;
    else
        local v48 = l_v46_SlotAttachment_0.WorldCFrame.Position + Vector3.new(0, 10, 0, 0);
        local v49 = workspace:Raycast(v48, Vector3.new(-0, -100, -0, -0), v46._rayParams);
        if not v49 then
            return nil;
        else
            return v49.Position;
        end;
    end;
end;
v16._handleStateChanged = function(v50, v51) --[[ Line: 221 ]] --[[ Name: _handleStateChanged ]]
    -- upvalues: v12 (copy), v10 (copy)
    local l__clientAnimator_0 = v50._clientAnimator;
    if not l__clientAnimator_0 then
        return;
    else
        if v50._trackDump then
            v50._trackDump:Destroy();
            v50._trackDump = nil;
            v50._track = nil;
        end;
        local v53 = ({
            Idling = "Idle", 
            Following = "Run", 
            Attacking = "Attack"
        })[v51];
        if not v53 then
            return;
        else
            local v54 = 1;
            if v12:IsGame() and v51 == "Attacking" then
                v54 = v10.GetService("GameService").GameSpeed:Get()[1] or 1;
            end;
            local v55, v56 = l__clientAnimator_0:Play(v53, {
                props = {
                    speed = v54
                }, 
                stopPlayingTracks = true
            });
            v50._track = v55;
            v50._trackDump = v56;
            return;
        end;
    end;
end;
v16._setupVisualModel = function(v57) --[[ Line: 266 ]] --[[ Name: _setupVisualModel ]]
    -- upvalues: l_Pets_0 (copy), v6 (copy), l_VFX_0 (copy), l_Debris_0 (copy)
    if v57._visualModel then
        v57._visualModel:Destroy();
        v57._visualModel = nil;
    end;
    if v57._clientAnimator then
        v57._clientAnimator:Destroy();
        v57._clientAnimator = nil;
    end;
    local l_Attribute_2 = v57.Instance:GetAttribute("PetType");
    local l_l_Pets_0_FirstChild_0 = l_Pets_0:FindFirstChild(l_Attribute_2);
    if not l_l_Pets_0_FirstChild_0 then
        warn((("Model not found for pet type: %*."):format(l_Attribute_2)));
        return;
    else
        l_l_Pets_0_FirstChild_0 = l_l_Pets_0_FirstChild_0:Clone();
        l_l_Pets_0_FirstChild_0:PivotTo(v57.Instance:GetPivot());
        v57._isAirborne = l_l_Pets_0_FirstChild_0:GetAttribute("Airborne") == true;
        local l_PrimaryPart_0 = v57.Instance.PrimaryPart;
        for _, v62 in l_l_Pets_0_FirstChild_0:GetDescendants() do
            if v62:IsA("BasePart") then
                v62.CanCollide = false;
                v62.Anchored = false;
                v62.Massless = true;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = l_PrimaryPart_0;
                l_WeldConstraint_0.Part1 = v62;
                l_WeldConstraint_0.Parent = v62;
            end;
        end;
        local v64 = v6.new(l_Attribute_2, l_l_Pets_0_FirstChild_0, "Pets");
        v57._clientAnimator = v64;
        v57._dumpster:Add(v64);
        l_l_Pets_0_FirstChild_0.Name = "VisualModel";
        l_l_Pets_0_FirstChild_0:SetAttribute("ReferenceName", l_Attribute_2);
        l_l_Pets_0_FirstChild_0.Parent = v57.Instance;
        v57._visualModel = l_l_Pets_0_FirstChild_0;
        v57._dumpster:Add(l_l_Pets_0_FirstChild_0);
        local v65 = l_VFX_0.General.Poof:Clone();
        v65.Parent = v57.Instance.PrimaryPart;
        v65:Emit(25);
        l_Debris_0:AddItem(v65, v65.Lifetime.Max);
        return;
    end;
end;
return v16;