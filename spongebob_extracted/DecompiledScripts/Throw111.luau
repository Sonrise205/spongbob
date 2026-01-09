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
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    if l_Attack_0:FindFirstChild("Charge") then
        v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v17) --[[ Line: 29 ]]
            -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v13, v17);
            v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
        end);
    end;
    v2:IterateClass(l_Throw_0, "ParticleEmitter", function(v18) --[[ Line: 35 ]]
        -- upvalues: v14 (copy), v11 (ref), v12 (copy), v9 (ref)
        table.insert(v14, v18);
        v18.Speed = v11;
        v18.Acceleration = v12;
        v18.Lifetime = v9;
    end);
    if l_Attack_0:FindFirstChild("Trail") then
        v2:IterateClass(l_Attack_0.Trail, "ParticleEmitter", function(v19) --[[ Line: 43 ]]
            -- upvalues: v15 (copy), v11 (ref), v12 (copy), v9 (ref)
            table.insert(v15, v19);
            v19.Speed = v11;
            v19.Acceleration = v12;
            v19.Lifetime = v9;
        end);
    end;
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v20) --[[ Line: 51 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 57 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        Throw = function() --[[ Line: 61 ]] --[[ Name: Throw ]]
            -- upvalues: v14 (copy), v2 (ref), v15 (copy)
            for _, v22 in v14 do
                v22:Emit(1);
            end;
            v2:ToggleEmitters(v15, true);
        end, 
        Stop = function() --[[ Line: 69 ]] --[[ Name: Stop ]]
            -- upvalues: v2 (ref), v13 (copy), v15 (copy)
            v2:ToggleEmitters(v13, false);
            v2:ToggleEmitters(v15, false);
        end, 
        Hit = function() --[[ Line: 74 ]] --[[ Name: Hit ]]
            -- upvalues: v16 (copy)
            for _, v24 in v16 do
                v24:Emit(60);
            end;
        end
    };
end;