local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Throw_0 = l_Attack_0.Throw;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Impact_0 = l_Attack_0.Impact;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v11 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(15) * 0.5);
    local v12 = 1.5 / l_speedMultiplier_0;
    local v13 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local v14, v15 = v2:CalculateArc(v12, l_Throw_0.Position, v13.Position);
    v14 = NumberRange.new(v14);
    v12 = NumberRange.new(v12);
    v3.pivotHitPart(l_Attack_1, l_PrimaryPart_0);
    v3.pivotHitPart(l_Impact_0, l_PrimaryPart_0);
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local v19 = {};
    local v20 = {};
    if l_Attack_0:FindFirstChild("Charge") then
        v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 40 ]]
            -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v16, v21);
            v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
        end);
    end;
    v2:IterateClass(l_Throw_0, "ParticleEmitter", function(v22) --[[ Line: 46 ]]
        -- upvalues: v17 (copy), v14 (ref), v15 (copy), v12 (ref), v2 (ref), v11 (copy)
        table.insert(v17, v22);
        v22.Speed = v14;
        v22.Acceleration = v15;
        v22.Lifetime = v12;
        v2:ScaleEmitterSize(v22, v11);
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v23) --[[ Line: 55 ]]
        -- upvalues: v18 (copy), v2 (ref), v11 (copy), l_speedMultiplier_0 (copy)
        table.insert(v18, v23);
        if v23:GetAttribute("AdjustScaleAndSpeed") then
            v2:AdjustEmitterSpeedAndScale(v23, v11, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v23, v11);
            return;
        end;
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v24) --[[ Line: 65 ]]
        -- upvalues: v19 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v19, v24);
        v2:AdjustEmitterSpeed(v24, l_speedMultiplier_0);
    end);
    v2:ResizePart(l_Hit_0, v11);
    v2:IterateClass(l_Impact_0, "ParticleEmitter", function(v25) --[[ Line: 72 ]]
        -- upvalues: v20 (copy), v2 (ref), v3 (copy), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v20, v25);
        v2:EmitterSpeedFromDistance(v25, v3.range, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v25, v11);
    end);
    return {
        Charge = function() --[[ Line: 79 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true);
        end, 
        Attack = function() --[[ Line: 83 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true);
        end, 
        Hit = function() --[[ Line: 87 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v19 (copy), v20 (copy), v18 (copy)
            v2:ToggleEmitters(v19, true);
            v2:ToggleEmitters(v20, true);
            v2:ToggleEmitters(v18, true);
        end, 
        StopHit = function() --[[ Line: 93 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v16 (copy), v18 (copy)
            v2:ToggleEmitters(v16, false);
            v2:ToggleEmitters(v18, false);
        end
    };
end;