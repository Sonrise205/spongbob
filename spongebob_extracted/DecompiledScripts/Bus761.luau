local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(8) * 0.5);
    local v7 = {};
    local v8 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v9) --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy), v6 (copy)
        table.insert(v7, v9);
        v2:AdjustEmitter(v9, l_speedMultiplier_0, v6);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v10) --[[ Line: 25 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v6 (copy)
        table.insert(v8, v10);
        v2:AdjustEmitter(v10, l_speedMultiplier_0, v6);
    end);
    return {
        Charge = function() --[[ Line: 31 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Hit = function() --[[ Line: 35 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v8 (copy), v7 (copy)
            v2:JustEmit(v8);
            v2:ToggleEmitters(v7, false);
        end
    };
end;