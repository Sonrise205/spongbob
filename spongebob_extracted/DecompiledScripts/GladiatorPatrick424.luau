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
    if l_Attack_0:FindFirstChild("Impact") then
        v3.pivotHitPart(l_Attack_0.Impact, l_PrimaryPart_0);
    end;
    v11 = NumberRange.new(v11);
    v9 = NumberRange.new(v9);
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    local _ = {};
    if l_Attack_0:FindFirstChild("Charge") then
        v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v19) --[[ Line: 35 ]]
            -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v13, v19);
            v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
        end);
    end;
    v2:IterateClass(l_Throw_0, "ParticleEmitter", function(v20) --[[ Line: 41 ]]
        -- upvalues: v14 (copy), v11 (ref), v12 (copy), v9 (ref)
        table.insert(v14, v20);
        v20.Speed = v11;
        v20.Acceleration = v12;
        v20.Lifetime = v9;
    end);
    if l_Attack_0:FindFirstChild("Trail") then
        v2:IterateClass(l_Attack_0.Trail, "ParticleEmitter", function(v21) --[[ Line: 49 ]]
            -- upvalues: v15 (copy), v11 (ref), v12 (copy), v9 (ref)
            table.insert(v15, v21);
            v21.Speed = v11;
            v21.Acceleration = v12;
            v21.Lifetime = v9;
        end);
    end;
    if l_Attack_0:FindFirstChild("Impact") then
        v2:IterateClass(l_Attack_0.Impact, "ParticleEmitter", function(v22) --[[ Line: 58 ]]
            -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v17, v22);
            v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
        end);
    end;
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v23) --[[ Line: 64 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v23);
        v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 70 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        Attack = function() --[[ Line: 74 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        Hit = function() --[[ Line: 79 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v16 (copy), v17 (copy)
            v2:ToggleEmitters(v16, true, true);
            v2:ToggleEmitters(v17, true);
        end, 
        StopHit = function() --[[ Line: 84 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v13 (copy), v16 (copy), v14 (copy)
            v2:ToggleEmitters(v13, false);
            v2:ToggleEmitters(v16, false);
            v2:ToggleEmitters(v14, false);
        end
    };
end;