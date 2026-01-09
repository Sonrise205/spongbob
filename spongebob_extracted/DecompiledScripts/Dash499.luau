local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Platformer.Constants);
local v2 = require(l_ReplicatedStorage_0.Platformer.Utility.getOrCreateAttachment);
return {
    clearOnGrounded = true, 
    movementAcceleration = 4, 
    animation = "Dash", 
    effect = "Dash", 
    sound = "Dash", 
    perform = function(v3) --[[ Line: 19 ]] --[[ Name: perform ]]
        -- upvalues: v1 (copy), v2 (copy)
        if not v3.character:GetAttribute(v1.CAN_DASH_ATTRIBUTE) then
            return;
        else
            v3.character:SetAttribute(v1.CAN_DASH_ATTRIBUTE, false);
            v3:setAction("Dash");
            local v4 = v2(v3.root, "DashAttachment");
            local l_LinearVelocity_0 = Instance.new("LinearVelocity");
            l_LinearVelocity_0.Name = "DashVelocity";
            l_LinearVelocity_0.Attachment0 = v4;
            l_LinearVelocity_0.RelativeTo = Enum.ActuatorRelativeTo.Attachment0;
            l_LinearVelocity_0.MaxForce = (v3:getMountAttribute("DashForce") or v1.DASH_FORCE_FACTOR) * v3.root.AssemblyMass;
            l_LinearVelocity_0.VectorVelocity = Vector3.new(0, 0, -(v3:getMountAttribute("DashSpeed") or v1.DASH_SPEED));
            l_LinearVelocity_0.Parent = v3.root;
            task.delay(v1.DASH_TIME, l_LinearVelocity_0.Destroy, l_LinearVelocity_0);
            return;
        end;
    end
};