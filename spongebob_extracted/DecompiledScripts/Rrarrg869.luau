local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local _ = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local v9 = v3.getScaledEffectRange(42);
    local v10 = v3.range / (v9 * 0.5);
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v13) --[[ Line: 23 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v12, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v14) --[[ Line: 28 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v11, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v10);
    end);
    v2:ResizePart(l_Attack_0.Hit, v10);
    return {
        Charge = function() --[[ Line: 35 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        Hit = function() --[[ Line: 39 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true, true);
        end, 
        StopHit = function() --[[ Line: 43 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v11 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v11, false);
        end
    };
end;