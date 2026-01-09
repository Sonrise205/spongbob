local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    local v7 = {};
    local v8 = v3.getScaledEffectRange(32);
    local v9 = v3.range / (v8 * 0.5);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v10) --[[ Line: 18 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v6, v10);
        v2:AdjustEmitter(v10, l_speedMultiplier_0, v9);
    end);
    v2:ResizePart(l_Attack_0.Charge, v9);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v11) --[[ Line: 24 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v7, v11);
        v2:AdjustEmitter(v11, l_speedMultiplier_0, v9);
    end);
    v2:ResizePart(l_Attack_0.Attack, v9);
    return {
        Charge = function() --[[ Line: 31 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack = function() --[[ Line: 35 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        StopAttack = function() --[[ Line: 39 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, false);
        end, 
        StopCharge = function() --[[ Line: 43 ]] --[[ Name: StopCharge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, false);
        end
    };
end;