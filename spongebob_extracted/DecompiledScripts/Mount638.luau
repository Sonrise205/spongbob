local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Component);
local v7 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.Lerp);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local l_Humanoid_0 = l_StarterPlayer_0:FindFirstChild("Humanoid");
local v11 = if l_Humanoid_0 then l_Humanoid_0.WalkSpeed else l_StarterPlayer_0.CharacterWalkSpeed;
local function v17(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: getRotationBetween ]]
    local v15 = v12:Dot(v13);
    local v16 = v12:Cross(v13);
    if v15 < -0.9 then
        return CFrame.fromAxisAngle(v14, 3.141592653589793);
    else
        return CFrame.new(0, 0, 0, v16.x, v16.y, v16.z, 1 + v15);
    end;
end;
local function v24(v18) --[[ Line: 38 ]] --[[ Name: getCharacterFromMount ]]
    -- upvalues: l_Players_0 (copy)
    local l_v18_Attribute_0 = v18:GetAttribute("Owner");
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(l_v18_Attribute_0);
    if not l_l_Players_0_PlayerByUserId_0 then
        return;
    else
        local l_Character_0 = l_l_Players_0_PlayerByUserId_0.Character;
        if not l_Character_0 or not l_Character_0.PrimaryPart then
            return;
        else
            local v22 = l_Character_0 and l_Character_0:FindFirstChild("LowerTorso");
            local v23 = v22 and v22:FindFirstChild("Root");
            if not v23 then
                return;
            else
                return l_Character_0, v22, v23;
            end;
        end;
    end;
end;
local v26 = v6.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v25) --[[ Line: 63 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v24 (copy)
                return select(3, v24(v25.Instance)) ~= nil;
            end
        }
    }
});
v26.Construct = function(v27) --[[ Line: 69 ]] --[[ Name: Construct ]]
    -- upvalues: v5 (copy), v7 (copy), v24 (copy), v11 (copy)
    v27.dumpster = v5.new();
    v27.mount = v27.Instance;
    local v28 = v7.PrimaryPart(v27.mount, 3);
    v27.dumpster:Add(v28);
    local v29, v30 = v28:await();
    if not v29 then
        return;
    else
        v27.mountPrimary = v30;
        v27.attach = v27.mount:FindFirstChild("Attach", true);
        v29 = v27.mount:GetAttribute("FollowBone") or "Root";
        for _, v32 in v27.mount:GetDescendants() do
            if v32:IsA("Motor6D") then
                if v32.Part0 == v27.mountPrimary then
                    v27.rootAnimationMotor = v32;
                end;
            elseif v32:IsA("Bone") and v32.Name == v29 then
                v27.rootAnimationMotor = v32;
            end;
        end;
        v30 = v27.mountPrimary.Size;
        v27.mountHalfSize = v30 * 0.5;
        v27.raycastSize = v30 * 0.3;
        v27.raycastDirection = Vector3.new(-0, -8, -0, -0);
        v27.raycastOriginOffset = Vector3.new(0, 1, 0, 0);
        v27.raycastParams = RaycastParams.new();
        v27.raycastParams.CollisionGroup = "Mount";
        v27.raycastParams.RespectCanCollide = true;
        local v33, v34, v35 = v24(v27.mount);
        v27.character = v33;
        v27.lowerTorso = v34;
        v27.rootMotor = v35;
        v27.humanoid = v27.character:FindFirstChildOfClass("Humanoid");
        v33 = v27.mount:GetAttribute("Speed");
        v34 = v27.mount:GetAttribute("SprintSpeed");
        v27.maxSpeed = v11 * v33 * v34;
        v27.lastSpeed = 0;
        v27.normalHistory = {};
        v27.lastRootTransform = v27.rootMotor.Transform;
        v27.airborne = v27.mount:GetAttribute("Airborne") == true;
        v27.initialized = false;
        return;
    end;
end;
v26.Start = function(v36) --[[ Line: 127 ]] --[[ Name: Start ]]
    -- upvalues: v7 (copy), v9 (copy)
    v36.dumpster:Add(v7.Child(v36.mountPrimary, "Engine", 2):andThen(function(v37) --[[ Line: 129 ]]
        -- upvalues: v36 (copy)
        v36.engineBasePlaybackSpeed = v37.PlaybackSpeed;
        v36.engineSound = v37;
        v36.originalEngineVolume = v36.engineSound.Volume;
        v36.playEngineSoundGrounded = v36.engineSound:GetAttribute("PlayGrounded");
    end):catch(v9.EmptyPromiseCatch));
    v36.driveVFX = {};
    for _, v39 in v36.mount:GetDescendants() do
        if v39:HasTag("DriveVFX") then
            table.insert(v36.driveVFX, v39);
        end;
    end;
    local v40 = v36.dumpster:Extend();
    local function v49(v41) --[[ Line: 146 ]] --[[ Name: updateOffsets ]]
        -- upvalues: v36 (copy), v40 (copy)
        local l_C0_0 = v36.rootMotor.C0;
        v40:Add(function() --[[ Line: 149 ]]
            -- upvalues: v36 (ref), l_C0_0 (copy)
            if v36.rootMotor and v36.rootMotor.Parent then
                v36.rootMotor.C0 = l_C0_0;
            end;
        end);
        local v43 = 0;
        local l_MountRigAttachment_0 = v36.character.PrimaryPart:FindFirstChild("MountRigAttachment");
        if v36.humanoid.HipHeight ~= 2.1 then
            v43 = v36.humanoid.HipHeight - 2.1;
            local l_rootMotor_0 = v36.rootMotor;
            l_rootMotor_0.C0 = l_rootMotor_0.C0 - Vector3.new(0, 1, 0, 0) * v43;
            if v41 then
                l_MountRigAttachment_0.Position = l_MountRigAttachment_0.Position - Vector3.new(0, 1, 0, 0) * v43;
            end;
        end;
        local v46 = v36.attach.CFrame.Y - (v36.humanoid.HipHeight - v36.mountHalfSize.Y) + v43;
        local l_rootMotor_1 = v36.rootMotor;
        l_rootMotor_1.C0 = l_rootMotor_1.C0 + Vector3.new(0, 1, 0, 0) * v46;
        if v41 then
            l_MountRigAttachment_0.Position = l_MountRigAttachment_0.Position + Vector3.new(0, 1, 0, 0) * v46;
        end;
        l_rootMotor_1 = v36.mount:GetAttribute("Offset");
        if l_rootMotor_1 then
            local l_rootMotor_2 = v36.rootMotor;
            l_rootMotor_2.C0 = l_rootMotor_2.C0 + l_rootMotor_1;
            if v41 then
                l_MountRigAttachment_0.Position = l_MountRigAttachment_0.Position + l_rootMotor_1;
            end;
        end;
    end;
    v49(true);
    v36.dumpster:Add(v36.mount:GetAttributeChangedSignal("Offset"):Connect(function() --[[ Line: 188 ]]
        -- upvalues: v49 (copy)
        v49(true);
    end));
    v36.dumpster:Add(v36.character.AncestryChanged:Connect(function(_, v51) --[[ Line: 192 ]]
        -- upvalues: v49 (copy), v40 (copy)
        if v51 == workspace then
            v49(false);
            return;
        else
            if v51 ~= nil then
                v40:Destroy();
            end;
            return;
        end;
    end));
end;
v26.Stop = function(v52) --[[ Line: 201 ]] --[[ Name: Stop ]]
    v52.dumpster:Destroy();
end;
v26.SteppedUpdate = function(v53, v54) --[[ Line: 205 ]] --[[ Name: SteppedUpdate ]]
    -- upvalues: v17 (copy)
    local v55 = v53.humanoid.FloorMaterial ~= Enum.Material.Air;
    v53:_updateEffects(v54, v55);
    if v53.airborne then
        if not v53.rootAnimationMotor then
            return;
        else
            local l_Transform_0 = v53.rootAnimationMotor.Transform;
            local v57 = v53.rootMotor.Transform:ToObjectSpace(l_Transform_0);
            v53.rootMotor.Transform = v57;
            return;
        end;
    else
        local v58 = nil;
        local v59 = 20;
        if v53.humanoid and not v55 then
            v58 = Vector3.new(0, 1, 0, 0);
            v59 = 8;
        else
            v58 = v53:_getAverageNormal();
        end;
        local v60 = Vector3.new(0, 0, 0, 0);
        if v58 ~= Vector3.new(0, 1, 0, 0) then
            table.insert(v53.normalHistory, v58);
            if #v53.normalHistory > 8 then
                table.remove(v53.normalHistory, 1);
            end;
            for _, v62 in v53.normalHistory do
                v60 = v60 + v62;
            end;
            v60 = v60.Unit;
        else
            v60 = v58;
        end;
        local v63 = v59 * v54;
        local l_WorldCFrame_0 = v53.attach.WorldCFrame;
        local v65 = v17(Vector3.new(0, 1, 0, 0), v60, (Vector3.new(1, 0, 0, 0))) * l_WorldCFrame_0;
        local v66 = CFrame.new(v53.attach.Position) * v65:ToObjectSpace(l_WorldCFrame_0).Rotation;
        v53.attach.CFrame = if not v53.initialized then v66 else v53.attach.CFrame:Lerp(v66, v63);
        local v67 = v53.lowerTorso.CFrame * v53.rootMotor.C0;
        local v68 = v17(Vector3.new(0, 1, 0, 0), v60, (Vector3.new(1, 0, 0, 0))) * v67;
        local v69 = v53.rootMotor.Transform * v67:ToObjectSpace(v68).Rotation;
        if v53.rootAnimationMotor then
            v69 = v69 * v53.rootAnimationMotor.Transform;
        end;
        v53.rootMotor.Transform = if not v53.initialized then v69 else v53.lastRootTransform:Lerp(v69, v63);
        v53.lastRootTransform = v53.rootMotor.Transform.Rotation + v69.Position;
        v53.initialized = true;
        return;
    end;
end;
v26._updateEffects = function(v70, v71, v72) --[[ Line: 272 ]] --[[ Name: _updateEffects ]]
    -- upvalues: v8 (copy)
    local v73 = v70.mountPrimary.AssemblyLinearVelocity * Vector3.new(1, 0, 1, 0);
    local v74 = v72 and v73.Magnitude > 1;
    for _, v76 in v70.driveVFX do
        v76.Enabled = v74;
    end;
    if v70.engineSound then
        local v77 = math.round(v70.mountPrimary.AssemblyLinearVelocity.Magnitude);
        local v78 = if not not v72 or v70.airborne then v77 else 0;
        local v79 = v8(v70.lastSpeed, v78, v71 * 10);
        if v79 ~= v70.lastSpeed then
            v70.lastSpeed = v79;
            local v80 = math.clamp(v79 / v70.maxSpeed, 0, 1) * 0.5;
            v70.engineSound.PlaybackSpeed = v70.engineBasePlaybackSpeed + v80;
        end;
        if v70.playEngineSoundGrounded then
            local v81 = if v74 then v70.originalEngineVolume else 0;
            v70.engineSound.Volume = v8(v70.engineSound.Volume, v81, v71 * 10);
        end;
    end;
end;
v26._getAverageNormal = function(v82) --[[ Line: 301 ]] --[[ Name: _getAverageNormal ]]
    local l_CFrame_0 = v82.mountPrimary.CFrame;
    local v84 = {
        l_CFrame_0 * CFrame.new(-v82.raycastSize.X, 0, -v82.raycastSize.Z), 
        l_CFrame_0 * CFrame.new(v82.raycastSize.X, 0, -v82.raycastSize.Z), 
        l_CFrame_0 * CFrame.new(-v82.raycastSize.X, 0, v82.raycastSize.Z), 
        l_CFrame_0 * CFrame.new(v82.raycastSize.X, 0, v82.raycastSize.Z), 
        l_CFrame_0
    };
    local v85 = Vector3.new(0, 0, 0, 0);
    local v86 = 0;
    for _, v88 in v84 do
        local v89 = workspace:Raycast(v88.Position + v82.raycastOriginOffset, v82.raycastDirection, v82.raycastParams);
        if v89 then
            v85 = v85 + v89.Normal;
            v86 = v86 + 1;
        end;
    end;
    if v86 > 0 then
        return (v85 / v86).Unit;
    else
        return (Vector3.new(0, 1, 0, 0));
    end;
end;
return v26;