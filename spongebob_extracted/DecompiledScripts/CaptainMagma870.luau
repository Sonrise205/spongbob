local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack_1, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack_0.Charge2, l_PrimaryPart_0);
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge1, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge2, "ParticleEmitter", function(v14) --[[ Line: 30 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v15) --[[ Line: 35 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v16) --[[ Line: 40 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    return {
        Charge1 = function() --[[ Line: 46 ]] --[[ Name: Charge1 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Charge2 = function() --[[ Line: 50 ]] --[[ Name: Charge2 ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 54 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Hit = function() --[[ Line: 58 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        StopAttack = function() --[[ Line: 62 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v11 (copy), v9 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v9, false);
        end, 
        StopHit = function() --[[ Line: 67 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v10 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;