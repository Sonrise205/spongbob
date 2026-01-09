local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local _ = l_Attack_0.PrimaryPart;
    local v7 = {};
    local v8 = {};
    local v9 = {};
    v2:IterateClass(l_Attack_0.Attack_Ultimate, "ParticleEmitter", function(v10) --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v2 (ref), v3 (copy), l_speedMultiplier_0 (copy)
        table.insert(v8, v10);
        v2:EmitterSpeedFromDistance(v10, v3.range, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit_Ultimate, "ParticleEmitter", function(v11) --[[ Line: 29 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge_Ultimate, "ParticleEmitter", function(v12) --[[ Line: 34 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 40 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Hit = function() --[[ Line: 44 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true, true);
        end, 
        Attack = function() --[[ Line: 48 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy), v8 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopAttack = function() --[[ Line: 52 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), l_speedMultiplier_0 (copy), v7 (copy)
            v2:ToggleEmitters(v8, false);
            task.wait(0.5 / l_speedMultiplier_0);
            v2:ToggleEmitters(v7, false);
        end
    };
end;