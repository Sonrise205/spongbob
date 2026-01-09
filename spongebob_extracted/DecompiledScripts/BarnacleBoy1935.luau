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
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v9) --[[ Line: 16 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v6, v9);
        v2:AdjustEmitterSpeed(v9, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v10) --[[ Line: 21 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v10);
        v2:AdjustEmitterSpeed(v10, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack3, "ParticleEmitter", function(v11) --[[ Line: 26 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
    end);
    return {
        Attack1 = function() --[[ Line: 32 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack2 = function() --[[ Line: 36 ]] --[[ Name: Attack2 ]]
            -- upvalues: v7 (copy), v3 (copy), v2 (ref), v8 (copy)
            for _, v13 in v7 do
                v13:Emit(v3.rng:NextInteger(4, 7));
            end;
            v2:ToggleEmitters(v8, true);
        end, 
        StopAttack = function() --[[ Line: 44 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v6 (copy), v8 (copy)
            v2:ToggleEmitters(v6, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;