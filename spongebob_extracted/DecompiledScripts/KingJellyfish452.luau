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
    local v9 = {};
    local v10 = v3.getScaledEffectRange(75);
    local v11 = v3.range / (v10 * 0.5);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v6, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v14) --[[ Line: 30 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v15) --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v2 (ref), v11 (copy), l_speedMultiplier_0 (copy)
        table.insert(v9, v15);
        if v15:GetAttribute("AdjustSizeAndSpeed") then
            v2:AdjustEmitterSpeedAndScale(v15, v11, l_speedMultiplier_0);
            return;
        elseif v15:GetAttribute("AdjustSize") then
            v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v15, v11);
            return;
        elseif v15:GetAttribute("AdjustSpeed") then
            v2:AdjustEmitterSpeedFromMultiplier(v15, v11, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v11);
    return {
        Charge = function() --[[ Line: 53 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        ChargeAttack = function() --[[ Line: 57 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 61 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy), v6 (copy)
            v2:ToggleEmitters(v8, true);
            v2:ToggleEmitters(v6, false);
        end, 
        Hit = function() --[[ Line: 66 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, true, true);
        end, 
        StopHit = function() --[[ Line: 71 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, false);
        end
    };
end;