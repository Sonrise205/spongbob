local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local _ = l_Attack_0.Hit;
    local _ = l_Attack_0.PrimaryPart;
    local v8 = v3.getScaledEffectRange(50);
    local v9 = v3.range / (v8 * 0.5);
    local v10 = {};
    local v11 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 24 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v11, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v13) --[[ Line: 29 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v10, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Impact, "ParticleEmitter", function(v14) --[[ Line: 34 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v10, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v9);
    end);
    v2:ResizePart(l_Attack_0.Hit, v9);
    v2:ResizePart(l_Attack_0.Impact, v9);
    return {
        Charge = function() --[[ Line: 43 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Hit = function() --[[ Line: 47 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true, true);
        end, 
        StopHit = function() --[[ Line: 51 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v11 (copy), v10 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;