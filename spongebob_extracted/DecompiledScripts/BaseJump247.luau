local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Platformer.Constants);
return {
    perform = function(v2) --[[ Line: 12 ]] --[[ Name: perform ]]
        -- upvalues: v1 (copy)
        local v3 = v2:isSeated() or v2:isGrounded() or v2:isSwimming() or v2:isClimbing();
        local v4 = v2:getTimeSinceGrounded() <= v1.JUMP_COYOTE_TIME;
        if v3 or v4 then
            v2:performAction("Jump");
            return;
        else
            v2:performAction("DoubleJump");
            return;
        end;
    end
};