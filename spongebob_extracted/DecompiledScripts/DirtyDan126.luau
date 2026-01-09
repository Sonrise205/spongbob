local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local v9 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(12) * 0.5);
    v3.pivotHitPart(l_Attack_1, l_PrimaryPart_0);
    v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v13) --[[ Line: 27 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v14) --[[ Line: 32 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v11, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v14, v9);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v15) --[[ Line: 38 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v12, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v15, v9);
    end);
    return {
        Attack = function() --[[ Line: 45 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, true);
            v2:ToggleEmitters(v11, true);
        end, 
        Hit = function() --[[ Line: 50 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        StopHit = function() --[[ Line: 54 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v11 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v11, false);
        end, 
        StopAttack = function() --[[ Line: 59 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end
    };
end;