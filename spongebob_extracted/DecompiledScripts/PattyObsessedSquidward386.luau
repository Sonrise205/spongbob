local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(60);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v10) --[[ Line: 18 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v10);
        v2:AdjustEmitterSpeed(v10, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v11) --[[ Line: 23 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v11, v7);
    end);
    return {
        Charge = function() --[[ Line: 30 ]] --[[ Name: Charge ]]
            -- upvalues: v8 (copy), v3 (copy)
            for _, v13 in v8 do
                v13:Emit(v3.rng:NextInteger(40, 90));
            end;
        end, 
        Attack = function() --[[ Line: 36 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        StopAttack = function() --[[ Line: 40 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, false);
        end
    };
end;