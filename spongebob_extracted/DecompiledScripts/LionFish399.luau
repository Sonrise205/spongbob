local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v3 = Random.new();
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local v7 = {};
    local v8 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v9) --[[ Line: 17 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v9);
        v2:AdjustEmitterSpeed(v9, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v10) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v10);
        v2:AdjustEmitterSpeed(v10, l_speedMultiplier_0);
    end);
    local _ = function(v11) --[[ Line: 27 ]] --[[ Name: emitHitParticles ]]
        -- upvalues: v8 (copy)
        for _, v13 in v8 do
            v13:Emit(v11);
        end;
    end;
    return {
        Charge = function() --[[ Line: 34 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true, true);
        end, 
        Hit = function() --[[ Line: 38 ]] --[[ Name: Hit ]]
            -- upvalues: v3 (ref), v8 (copy)
            local v15 = v3:NextInteger(10, 15);
            for _, v17 in v8 do
                v17:Emit(v15);
            end;
        end, 
        StopAttack = function() --[[ Line: 42 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, false);
        end
    };
end;