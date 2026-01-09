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
    local v9 = v3.getScaledEffectRange(55);
    local v10 = v3.range / (v9 * 0.5);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v11) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v6, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v12) --[[ Line: 24 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v13) --[[ Line: 29 ]]
        -- upvalues: v8 (copy), v2 (ref), v10 (copy), l_speedMultiplier_0 (copy)
        table.insert(v8, v13);
        if v13:GetAttribute("AdjustSizeAndSpeed") then
            v2:AdjustEmitterSpeedAndScale(v13, v10, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v13, v10);
            return;
        end;
    end);
    return {
        Charge = function() --[[ Line: 40 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack = function() --[[ Line: 44 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v7 (copy), v8 (copy)
            v2:ToggleEmitters(v7, true, true);
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopAttack = function() --[[ Line: 49 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, false);
        end, 
        StopHit = function() --[[ Line: 53 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v8 (copy), v6 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v6, false);
        end
    };
end;