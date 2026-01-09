local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local _ = l_Attack_0.Hit;
    local _ = l_Attack_0.PrimaryPart;
    local v8 = v3.getScaledEffectRange(55);
    local v9 = v3.range / (v8 * 0.5);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge_Ultimate1, "ParticleEmitter", function(v13) --[[ Line: 22 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v11, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Attack_Ultimate1, "ParticleEmitter", function(v14) --[[ Line: 27 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v12, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Hit_Ultimate1, "ParticleEmitter", function(v15) --[[ Line: 32 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v10, v15);
        v2:AdjustEmitter(v15, l_speedMultiplier_0, v9);
    end);
    v2:ResizePart(l_Attack_0.Hit_Ultimate1, v9);
    return {
        Charge = function() --[[ Line: 40 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 44 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:JustEmit(v12);
        end, 
        Hit = function() --[[ Line: 48 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy), v10 (copy)
            v2:JustEmit(v12);
            v2:ToggleEmitters(v10, true, true);
        end, 
        StopHit = function() --[[ Line: 53 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy), l_speedMultiplier_0 (copy), v11 (copy)
            v2:ToggleEmitters(v10, false);
            task.wait(0.5 / l_speedMultiplier_0);
            v2:ToggleEmitters(v11, false);
        end
    };
end;