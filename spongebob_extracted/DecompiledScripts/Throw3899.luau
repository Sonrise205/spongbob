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
    local v13 = v3.getScaledEffectRange(10);
    local v14 = v3.range / (v13 * 0.5);
    local v15 = {};
    local v16 = {};
    local v17 = {};
    local v18 = {};
    if l_Attack_0:FindFirstChild("Charge") then
        v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v19) --[[ Line: 31 ]]
            -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v15, v19);
            v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
        end);
    end;
    v2:IterateClass(l_Throw_0, "ParticleEmitter", function(v20) --[[ Line: 37 ]]
        -- upvalues: v16 (copy), v11 (ref), v12 (copy), v9 (ref)
        table.insert(v16, v20);
        v20.Speed = v11;
        v20.Acceleration = v12;
        v20.Lifetime = v9;
    end);
    if l_Attack_0:FindFirstChild("Trail") then
        v2:IterateClass(l_Attack_0.Trail, "ParticleEmitter", function(v21) --[[ Line: 45 ]]
            -- upvalues: v17 (copy), v11 (ref), v12 (copy), v9 (ref)
            table.insert(v17, v21);
            v21.Speed = v11;
            v21.Acceleration = v12;
            v21.Lifetime = v9;
        end);
    end;
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v22) --[[ Line: 53 ]]
        -- upvalues: v18 (copy), v2 (ref), l_speedMultiplier_0 (copy), v14 (copy)
        table.insert(v18, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v22, v14);
    end);
    return {
        Charge = function() --[[ Line: 60 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true);
        end, 
        Throw = function() --[[ Line: 64 ]] --[[ Name: Throw ]]
            -- upvalues: v2 (ref), v16 (copy), v17 (copy)
            v2:ToggleEmitters(v16, true);
            v2:ToggleEmitters(v17, true);
        end, 
        Stop = function() --[[ Line: 69 ]] --[[ Name: Stop ]]
            -- upvalues: v2 (ref), v15 (copy), v17 (copy)
            v2:ToggleEmitters(v15, false);
            v2:ToggleEmitters(v17, false);
        end, 
        Hit = function() --[[ Line: 74 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, true);
        end, 
        StopHit = function() --[[ Line: 78 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, false);
        end
    };
end;