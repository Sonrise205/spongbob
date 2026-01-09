local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Throw_0 = l_Attack_0.Throw;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v9 = 1.5 / l_speedMultiplier_0;
    local v10 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local v11, v12 = v2:CalculateArc(v9, l_Throw_0.Position, v10.Position);
    v11 = NumberRange.new(v11);
    v9 = NumberRange.new(v9);
    local v13 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(12) * 0.5);
    local v14 = {};
    local v15 = {};
    v2:IterateClass(l_Throw_0, "ParticleEmitter", function(v16) --[[ Line: 30 ]]
        -- upvalues: v14 (copy), v11 (ref), v12 (copy), v9 (ref)
        table.insert(v14, v16);
        v16.Speed = v11;
        v16.Acceleration = v12;
        v16.Lifetime = v9;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 37 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy), v13 (copy)
        table.insert(v15, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v17, v13);
    end);
    return {
        Throw = function() --[[ Line: 44 ]] --[[ Name: Throw ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true, true);
        end, 
        StopThrow = function() --[[ Line: 48 ]] --[[ Name: StopThrow ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, false);
        end, 
        Hit = function() --[[ Line: 52 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true, true);
        end, 
        StopHit = function() --[[ Line: 56 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, false);
        end
    };
end;