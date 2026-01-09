local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v9 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(18) * 0.5);
    local v10 = 0.9 / l_speedMultiplier_0;
    local v11 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local v12, v13 = v2:CalculateArc(v10, l_Attack_1.Position, v11.Position, 0.2617993877991494);
    v12 = NumberRange.new(v12);
    local v14 = {};
    local v15 = {};
    local v16 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v17) --[[ Line: 31 ]]
        -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v14, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v18) --[[ Line: 36 ]]
        -- upvalues: v15 (copy), v10 (copy), v12 (ref), v13 (copy)
        table.insert(v15, v18);
        local v19 = if string.find(v18.Name, "Goo") then NumberRange.new(v10 * 2.7) else NumberRange.new(v10);
        v18.Speed = v12;
        v18.Acceleration = v13;
        v18.Lifetime = v19;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v20) --[[ Line: 48 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v16, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v20, v9);
    end);
    return {
        Charge = function() --[[ Line: 55 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        Attack = function() --[[ Line: 59 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v15 (copy), v14 (copy)
            v2:ToggleEmitters(v15, true);
            v2:ToggleEmitters(v14, false);
        end, 
        Hit = function() --[[ Line: 64 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true);
        end, 
        StopAttack = function() --[[ Line: 68 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, false);
        end, 
        StopHit = function() --[[ Line: 72 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, false);
        end
    };
end;