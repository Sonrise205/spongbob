local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = {};
    local v8 = {};
    local v9 = {};
    local v10 = v3.getHitPivot(l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v10.Position);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v14) --[[ Line: 30 ]]
        -- upvalues: v9 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v9, v14);
        v2:EmitterSpeedFromDistance(v14, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 36 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy), v8 (copy)
            v2:ToggleEmitters(v7, true);
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 41 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, true);
        end, 
        StopAttack = function() --[[ Line: 46 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v7 (copy), v9 (copy)
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;