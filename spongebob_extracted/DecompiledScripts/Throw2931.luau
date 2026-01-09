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
    local v9 = 1.5 / l_speedMultiplier_0;
    local v10 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local v11, v12 = v2:CalculateArc(v9, l_Attack_1.Position, v10.Position);
    v11 = NumberRange.new(v11);
    v9 = NumberRange.new(v9);
    local v13 = {};
    local v14 = {};
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v15) --[[ Line: 26 ]]
        -- upvalues: v13 (copy), v11 (ref), v12 (copy), v9 (ref)
        table.insert(v13, v15);
        v15.Speed = v11;
        v15.Acceleration = v12;
        v15.Lifetime = v9;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v16) --[[ Line: 33 ]]
        -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v14, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    return {
        Attack = function() --[[ Line: 39 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        StopAttack = function() --[[ Line: 43 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, false);
        end, 
        Hit = function() --[[ Line: 47 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        StopHit = function() --[[ Line: 51 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, false);
        end
    };
end;