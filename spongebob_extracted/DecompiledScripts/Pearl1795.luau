local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.range / (v3.getScaledEffectRange(58.997) * 0.5);
    local v7 = {};
    local v8 = {};
    local v9 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v10) --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v10);
        v2:AdjustEmitterSpeed(v10, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v11) --[[ Line: 25 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v6 (copy)
        table.insert(v8, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v11, v6);
    end);
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v12) --[[ Line: 31 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v6 (copy)
        table.insert(v9, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v12, v6);
    end);
    return {
        Charge = function() --[[ Line: 38 ]] --[[ Name: Charge ]]
            -- upvalues: v7 (copy), v3 (copy)
            for _, v14 in v7 do
                v14:Emit(v3.rng:NextInteger(40, 90));
            end;
        end, 
        Attack1 = function() --[[ Line: 44 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack2 = function() --[[ Line: 48 ]] --[[ Name: Attack2 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        StopAttack = function() --[[ Line: 52 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;