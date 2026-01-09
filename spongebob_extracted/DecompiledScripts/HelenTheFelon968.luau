local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(45);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local _ = {};
    local v10 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v11) --[[ Line: 19 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v10, v11);
        v2:AdjustEmitter(v11, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v12) --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v8, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0, v7);
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    return {
        Charge = function() --[[ Line: 32 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Hit = function() --[[ Line: 36 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopHit = function() --[[ Line: 40 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy), v8 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;