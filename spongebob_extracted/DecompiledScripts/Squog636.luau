local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    local v7 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v8) --[[ Line: 15 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v6, v8);
        v2:AdjustEmitterSpeed(v8, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v9) --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v9);
        v2:AdjustEmitterSpeed(v9, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 26 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Hit = function() --[[ Line: 30 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        StopAttack = function() --[[ Line: 34 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, false);
        end
    };
end;