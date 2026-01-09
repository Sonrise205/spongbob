local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = 1.5 / l_speedMultiplier_0;
    local v7 = v3.pivotHitPart(l_Attack_0.Hit, l_Attack_0.PrimaryPart);
    local v8, v9 = v2:CalculateArc(v6, l_Attack_0.Attack.Position, v7.Position);
    v8 = NumberRange.new(v8);
    v6 = NumberRange.new(v6);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local l_Sparkles_0 = l_Attack_0.Charge.Sparkles;
    v2:AdjustEmitterSpeed(l_Sparkles_0, l_speedMultiplier_0);
    v2:IterateClass(l_Attack_0.Charge.Attachment, "ParticleEmitter", function(v14) --[[ Line: 26 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v15) --[[ Line: 31 ]]
        -- upvalues: v11 (copy), v8 (ref), v9 (copy), v6 (ref)
        table.insert(v11, v15);
        v15.Speed = v8;
        v15.Acceleration = v9;
        v15.Lifetime = v6;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v16) --[[ Line: 38 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 44 ]] --[[ Name: Charge ]]
            -- upvalues: l_Sparkles_0 (copy), v2 (ref), v10 (copy)
            l_Sparkles_0:Emit(3);
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 49 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Hit = function() --[[ Line: 53 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        StopAttack = function() --[[ Line: 57 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v11, false);
        end, 
        StopHit = function() --[[ Line: 62 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, false);
        end
    };
end;