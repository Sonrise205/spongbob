local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Platformer.Constants);
return {
    minTimeInAction = 0.2, 
    clearOnGrounded = true, 
    sound = "Jump", 
    perform = function(v2) --[[ Line: 15 ]] --[[ Name: perform ]]
        -- upvalues: v1 (copy)
        if v2:getAction() ~= "None" then
            return;
        elseif v2:getTimeSinceAction("Jump") < v1.JUMP_COOLDOWN then
            return;
        else
            v2:setAction("Jump");
            v2.humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
            if v2:isClimbing() then
                local v3 = -v2.root.CFrame.LookVector * v1.LADDER_EJECT_SPEED;
                local l_root_0 = v2.root;
                l_root_0.AssemblyLinearVelocity = l_root_0.AssemblyLinearVelocity + v3;
            end;
            return;
        end;
    end
};