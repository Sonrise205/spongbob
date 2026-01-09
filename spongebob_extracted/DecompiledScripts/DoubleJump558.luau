local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Platformer.Constants);
local l_Utility_0 = l_ReplicatedStorage_0.Platformer.Utility;
local v3 = require(l_Utility_0.calculateVelocityForHeight);
local v4 = require(l_Utility_0.setVerticalVelocity);
return {
    clearOnGrounded = true, 
    animation = "DoubleJump", 
    effect = "Jump", 
    sound = "DoubleJump", 
    perform = function(v5) --[[ Line: 20 ]] --[[ Name: perform ]]
        -- upvalues: v1 (copy), v3 (copy), v4 (copy)
        if not v5.character:GetAttribute(v1.CAN_DOUBLE_JUMP_ATTRIBUTE) then
            return;
        elseif v5:getTimeSinceAction("Dash") < v1.DASH_TIME then
            return;
        else
            v5.character:SetAttribute(v1.CAN_DOUBLE_JUMP_ATTRIBUTE, false);
            v5:setAction("DoubleJump");
            local v6 = v3(v1.DOUBLE_JUMP_HEIGHT);
            v4(v5.root, v6);
            return;
        end;
    end
};