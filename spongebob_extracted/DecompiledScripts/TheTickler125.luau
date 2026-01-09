local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    local v7 = {};
    local v8 = {};
    local v9 = v3.getScaledEffectRange(23);
    local v10 = v3.range / (v9 * 0.5);
    local _ = v3.pivotHitPart(l_Attack_0.Hit, l_Attack_0.Primary);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 21 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v7, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v13) --[[ Line: 26 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v6, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v14) --[[ Line: 31 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v6, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v15) --[[ Line: 36 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v8, v15);
        v2:AdjustEmitter(v15, l_speedMultiplier_0, v10);
    end);
    return {
        Charge = function() --[[ Line: 42 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 46 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Hit = function() --[[ Line: 50 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopAttack = function() --[[ Line: 54 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, false);
        end, 
        StopHit = function() --[[ Line: 58 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v7 (copy), v8 (copy)
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;