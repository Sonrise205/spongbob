local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(29);
    local v7 = v3.range / (v6 * 0.55);
    local v8 = {};
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v9) --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v8, v9);
        v2:AdjustEmitterSpeed(v9, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v9, v7);
    end);
    return {
        Attack = function() --[[ Line: 24 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        StopAttack = function() --[[ Line: 28 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, false);
        end
    };
end;