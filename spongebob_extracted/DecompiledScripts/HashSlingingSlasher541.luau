local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(68);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge1, "ParticleEmitter", function(v13) --[[ Line: 21 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge2, "ParticleEmitter", function(v14) --[[ Line: 26 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v15) --[[ Line: 31 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit1, "ParticleEmitter", function(v16) --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit2, "ParticleEmitter", function(v17) --[[ Line: 41 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v12, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v17, v7);
    end);
    return {
        Charge1 = function() --[[ Line: 48 ]] --[[ Name: Charge1 ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 52 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, true);
            v2:ToggleEmitters(v11, true);
        end, 
        Charge2 = function() --[[ Line: 57 ]] --[[ Name: Charge2 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Hit = function() --[[ Line: 61 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopHit = function() --[[ Line: 65 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy), v12 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v12, false);
        end
    };
end;