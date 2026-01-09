local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(35);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    v2:IterateClass(l_Attack_0.Charge1, "ParticleEmitter", function(v10) --[[ Line: 18 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v10);
        v2:AdjustEmitter(v10, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit1, "ParticleEmitter", function(v11) --[[ Line: 23 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v11);
        v2:AdjustEmitter(v11, l_speedMultiplier_0, v7);
    end);
    return {
        Charge = function() --[[ Line: 29 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Hit = function() --[[ Line: 33 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true, true);
        end, 
        StopHit = function() --[[ Line: 37 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v9 (copy), v8 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;