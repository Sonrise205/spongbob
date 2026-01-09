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
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 26 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v12, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v15) --[[ Line: 31 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v13, v15);
        v2:AdjustEmitter(v15, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v16) --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v11, v16);
        v2:AdjustEmitter(v16, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 41 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v10, v17);
        v2:AdjustEmitter(v17, l_speedMultiplier_0, v9);
    end);
    v2:ResizePart(l_Attack_0.Hit, v9);
    v2:ResizePart(l_Attack_0.Attack, v9);
    return {
        Charge = function() --[[ Line: 50 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        Attack = function() --[[ Line: 54 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        Hit = function() --[[ Line: 58 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, true, true);
            v2:ToggleEmitters(v11, true, true);
        end, 
        StopHit = function() --[[ Line: 63 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v13 (copy), v11 (copy), v10 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v13, false);
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;