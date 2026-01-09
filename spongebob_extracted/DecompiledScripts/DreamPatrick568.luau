local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v8.Position);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 23 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v15) --[[ Line: 28 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v16) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v12, v16);
        v2:EmitterSpeedFromDistance(v16, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 38 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v13, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 44 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, true);
            v2:ToggleEmitters(v11, true);
        end, 
        StopCharge = function() --[[ Line: 49 ]] --[[ Name: StopCharge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, false);
        end, 
        Attack = function() --[[ Line: 53 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        Hit = function() --[[ Line: 57 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true, true);
        end, 
        StopAttack = function() --[[ Line: 61 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, false);
        end, 
        StopHit = function() --[[ Line: 65 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy), v13 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v13, false);
        end
    };
end;