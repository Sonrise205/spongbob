local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_ReplicatedStorage_0.Platformer.Constants);
local l_Utility_0 = l_ReplicatedStorage_0.Platformer.Utility;
local v6 = require(l_Utility_0.loadModules);
local v7 = require(l_Utility_0.disconnectAndClear);
local v8 = v6(script.Parent.Actions);
local l_SetAction_0 = l_ReplicatedStorage_0.Platformer.Remotes.SetAction;
local l_Humanoid_0 = l_StarterPlayer_0.Humanoid;
local v11 = if l_Humanoid_0 then l_Humanoid_0.WalkSpeed else l_StarterPlayer_0.CharacterWalkSpeed;
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v4 (copy), v12 (copy), l_Players_0 (copy)
    local l_Humanoid_1 = v13:WaitForChild("Humanoid");
    if not l_Humanoid_1 then
        return;
    else
        local l_HumanoidRootPart_0 = v13:WaitForChild("HumanoidRootPart");
        local v16 = {
            character = v13, 
            humanoid = l_Humanoid_1, 
            root = l_HumanoidRootPart_0, 
            inputDirection = Vector3.new(0, 0, 0, 0), 
            moveDirection = Vector3.new(0, 0, 0, 0), 
            sprinting = false, 
            originalWalkSpeed = v11, 
            connections = {}, 
            mountAttributes = {}, 
            actionChanged = v13:GetAttributeChangedSignal(v4.ACTION_ATTRIBUTE)
        };
        setmetatable(v16, v12);
        local l_Mounts_0 = workspace:WaitForChild("Mounts");
        for _, v19 in l_Mounts_0:GetChildren() do
            if v19:GetAttribute("Owner") == l_Players_0.LocalPlayer.UserId then
                v16.mount = v19;
            end;
        end;
        local function _() --[[ Line: 64 ]] --[[ Name: updateSpeed ]]
            -- upvalues: v16 (copy)
            if v16.sprinting then
                v16:toggleSprint(true, true);
                return;
            else
                if v16.sprintTween then
                    v16.sprintTween:Cancel();
                    v16.sprintTween:Destroy();
                    v16.sprintTween = nil;
                end;
                v16.humanoid.WalkSpeed = v16.originalWalkSpeed;
                return;
            end;
        end;
        table.insert(v16.connections, l_Mounts_0.ChildAdded:Connect(function(v21) --[[ Line: 78 ]]
            -- upvalues: l_Players_0 (ref), v16 (copy), v11 (ref)
            if v21:GetAttribute("Owner") ~= l_Players_0.LocalPlayer.UserId then
                return;
            else
                v16.mount = v21;
                v16.originalWalkSpeed = v11 * v21:GetAttribute("Speed");
                if v16.sprinting then
                    v16:toggleSprint(true, true);
                else
                    if v16.sprintTween then
                        v16.sprintTween:Cancel();
                        v16.sprintTween:Destroy();
                        v16.sprintTween = nil;
                    end;
                    v16.humanoid.WalkSpeed = v16.originalWalkSpeed;
                end;
                for v22, v23 in v21:GetAttributes() do
                    v16.mountAttributes[v22] = v23;
                end;
                return;
            end;
        end));
        table.insert(v16.connections, l_Mounts_0.ChildRemoved:Connect(function(v24) --[[ Line: 94 ]]
            -- upvalues: v16 (copy), v11 (ref)
            if v24 == v16.mount then
                v16.mount = nil;
                table.clear(v16.mountAttributes);
                v16.originalWalkSpeed = v11;
                if v16.sprinting then
                    v16:toggleSprint(true, true);
                    return;
                else
                    if v16.sprintTween then
                        v16.sprintTween:Cancel();
                        v16.sprintTween:Destroy();
                        v16.sprintTween = nil;
                    end;
                    v16.humanoid.WalkSpeed = v16.originalWalkSpeed;
                end;
            end;
        end));
        return v16;
    end;
end;
v12.setInputDirection = function(v25, v26) --[[ Line: 107 ]] --[[ Name: setInputDirection ]]
    if v26.Magnitude > 1 then
        v26 = v26.Unit;
    end;
    v25.inputDirection = v26;
end;
v12.isSwimming = function(v27) --[[ Line: 114 ]] --[[ Name: isSwimming ]]
    return v27.humanoid:GetState() == Enum.HumanoidStateType.Swimming;
end;
v12.isClimbing = function(v28) --[[ Line: 119 ]] --[[ Name: isClimbing ]]
    return v28.humanoid:GetState() == Enum.HumanoidStateType.Climbing;
end;
v12.isSeated = function(v29) --[[ Line: 124 ]] --[[ Name: isSeated ]]
    return v29.humanoid:GetState() == Enum.HumanoidStateType.Seated;
end;
v12.isGrounded = function(v30) --[[ Line: 129 ]] --[[ Name: isGrounded ]]
    return v30.humanoid.FloorMaterial ~= Enum.Material.Air;
end;
v12.getAction = function(v31) --[[ Line: 133 ]] --[[ Name: getAction ]]
    -- upvalues: v4 (copy)
    return v31.character:GetAttribute(v4.ACTION_ATTRIBUTE) or "None";
end;
v12.setAction = function(v32, v33) --[[ Line: 137 ]] --[[ Name: setAction ]]
    -- upvalues: v4 (copy), l_SetAction_0 (copy)
    local v34 = string.format(v4.LAST_TIME_FORMAT_STRING, v33);
    v32.character:SetAttribute(v34, os.clock());
    v32.character:SetAttribute(v4.ACTION_ATTRIBUTE, v33);
    l_SetAction_0:FireServer(v33);
end;
v12.getTimeSinceAction = function(v35, v36) --[[ Line: 146 ]] --[[ Name: getTimeSinceAction ]]
    -- upvalues: v4 (copy)
    local v37 = string.format(v4.LAST_TIME_FORMAT_STRING, v36);
    local v38 = v35.character:GetAttribute(v37) or 0;
    return os.clock() - v38;
end;
v12.getTimeSinceGrounded = function(v39) --[[ Line: 152 ]] --[[ Name: getTimeSinceGrounded ]]
    -- upvalues: v4 (copy)
    local v40 = v39.character:GetAttribute(v4.LAST_GROUNDED_ATTRIBUTE) or 0;
    return os.clock() - v40;
end;
v12.performAction = function(v41, v42, ...) --[[ Line: 157 ]] --[[ Name: performAction ]]
    -- upvalues: v8 (copy)
    local v43 = v8[v42];
    if not v43 then
        warn((("Invalid action: %*"):format(v42)));
        return;
    else
        v43.perform(v41, ...);
        return;
    end;
end;
v12.getAcceleration = function(v44) --[[ Line: 167 ]] --[[ Name: getAcceleration ]]
    -- upvalues: v8 (copy), v4 (copy)
    local v45 = v8[v44:getAction()];
    if v45 and v45.movementAcceleration then
        return v45.movementAcceleration;
    elseif v44:isClimbing() then
        return v4.LADDER_ACCELERATION;
    elseif v44:isSwimming() then
        return v4.WATER_ACCELERATION;
    elseif not v44:isGrounded() then
        return v4.AIR_ACCELERATION;
    else
        return v44:getMountAttribute("GroundAcceleration") or v4.GROUND_ACCELERATION;
    end;
end;
v12.getMountAttribute = function(v46, v47) --[[ Line: 186 ]] --[[ Name: getMountAttribute ]]
    return v46.mountAttributes[v47];
end;
v12.toggleSprint = function(v48, v49, v50) --[[ Line: 190 ]] --[[ Name: toggleSprint ]]
    -- upvalues: v4 (copy), l_TweenService_0 (copy)
    v48.sprinting = v49;
    local v51 = v48:getMountAttribute("SprintSpeed") or v4.SPRINT_SPEED_MULTIPLIER;
    local v52 = if v48.sprinting then v48.originalWalkSpeed * v51 else v48.originalWalkSpeed;
    if v48.sprintTween then
        v48.sprintTween:Cancel();
        v48.sprintTween:Destroy();
    end;
    if v50 then
        v48.humanoid.WalkSpeed = v52;
        return;
    else
        local v53 = l_TweenService_0:Create(v48.humanoid, v4.SPRINT_TWEEN_INFO, {
            WalkSpeed = v52
        });
        v48.sprintTween = v53;
        v53.Completed:Once(function(v54) --[[ Line: 215 ]]
            -- upvalues: v53 (copy), v48 (copy)
            v53:Destroy();
            if v54 == Enum.PlaybackState.Completed then
                v48.sprintTween = nil;
            end;
        end);
        v53:Play();
        return;
    end;
end;
v12.update = function(v55, v56) --[[ Line: 226 ]] --[[ Name: update ]]
    -- upvalues: v4 (copy)
    if not v55.humanoid.EvaluateStateMachine then
        return;
    else
        local v57 = v55:isGrounded();
        local v58 = v55:isSeated();
        if v57 or v58 or v55:isClimbing() or v55:isSwimming() then
            v55:tryClearGroundedAction();
            v55.character:SetAttribute(v4.CAN_DASH_ATTRIBUTE, true);
            v55.character:SetAttribute(v4.CAN_DOUBLE_JUMP_ATTRIBUTE, true);
        end;
        if v57 then
            v55.character:SetAttribute(v4.LAST_GROUNDED_ATTRIBUTE, os.clock());
        end;
        if v55.moveDirection ~= v55.inputDirection then
            local v59 = v55:getAcceleration();
            local v60 = v55.inputDirection - v55.moveDirection;
            local v61 = v59 * v56;
            if v60.Magnitude <= v61 then
                v55.moveDirection = v55.inputDirection;
            else
                v55.moveDirection = v55.moveDirection + v60.Unit * v61;
            end;
        end;
        v55.humanoid:Move(v55.moveDirection);
        return;
    end;
end;
v12.tryClearGroundedAction = function(v62) --[[ Line: 265 ]] --[[ Name: tryClearGroundedAction ]]
    -- upvalues: v8 (copy)
    local v63 = v62:getAction();
    local v64 = v8[v63];
    if v64 and v64.clearOnGrounded and (v64.minTimeInAction or 0) <= v62:getTimeSinceAction(v63) then
        v62:setAction("None");
    end;
end;
v12.destroy = function(v65) --[[ Line: 277 ]] --[[ Name: destroy ]]
    -- upvalues: v7 (copy)
    v7(v65.connections);
end;
return v12;