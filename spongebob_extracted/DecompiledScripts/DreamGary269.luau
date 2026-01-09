local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Attack1_0 = l_Attack_0.Attack1;
    local l_Attack2_0 = l_Attack_0.Attack2;
    local v9 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(20) * 0.5);
    v3.pivotHitPart(l_Attack1_0, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack2_0, l_PrimaryPart_0);
    local v10 = {};
    local v11 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 26 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack1_0, "ParticleEmitter", function(v13) --[[ Line: 31 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v11, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v13, v9);
    end);
    v2:IterateClass(l_Attack2_0, "ParticleEmitter", function(v14) --[[ Line: 37 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v11, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v14, v9);
    end);
    return {
        Charge = function() --[[ Line: 44 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 48 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        StopAttack = function() --[[ Line: 52 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v11, false);
        end
    };
end;