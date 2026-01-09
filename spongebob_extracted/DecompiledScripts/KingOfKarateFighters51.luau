local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v7) --[[ Line: 14 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v6, v7);
        v2:AdjustEmitter(v7, l_speedMultiplier_0);
    end);
    return {
        Attack = function() --[[ Line: 20 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true, true);
        end, 
        StopAttack = function() --[[ Line: 24 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, false);
        end
    };
end;