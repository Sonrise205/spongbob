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
    local v9 = v3.getScaledEffectRange(30);
    local v10 = v3.range / (v9 * 0.5);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v11) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v6, v11);
        v2:AdjustEmitter(v11, l_speedMultiplier_0, v10);
    end);
    v2:ResizePart(l_Attack_0.Charge, v10);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v12) --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v7, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0, v10);
    end);
    v2:ResizePart(l_Attack_0.Hit, v10);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 31 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v8, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v10);
    end);
    v2:ResizePart(l_Attack_0.Attack, v10);
    return {
        Charge = function() --[[ Line: 38 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack = function() --[[ Line: 42 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:JustEmit(v8);
        end, 
        Hit = function() --[[ Line: 46 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true, true);
        end, 
        StopHit = function() --[[ Line: 50 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v7 (copy), v6 (copy)
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v6, false);
        end
    };
end;