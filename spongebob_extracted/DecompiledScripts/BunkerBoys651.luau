local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Attack2_0 = l_Attack_0.Attack2;
    local l_Hit2_0 = l_Attack_0.Hit2;
    local v9 = v3.pivotHitPart(l_Attack_0.Hit1, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack1.Position, v9.Position);
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = math.min(v3.range, v2:Get2DDistance(l_Attack2_0.Position, v3.attackPosition));
    local l_Position_0 = (l_Attack2_0.CFrame * CFrame.new(0, -v15, 0)).Position;
    l_Position_0 = Vector3.new(l_Position_0.X, l_Hit2_0.Position.Y, l_Position_0.Z);
    v14 = l_Hit2_0.CFrame.Rotation + l_Position_0;
    l_Hit2_0:FindFirstChildOfClass("Weld").C0 = v14:ToObjectSpace(l_PrimaryPart_0.CFrame);
    v11 = 1.2 / l_speedMultiplier_0;
    v15, l_Position_0 = v2:CalculateArc(v11, l_Attack2_0.Position, v14.Position);
    v12 = v15;
    v13 = l_Position_0;
    v12 = NumberRange.new(v12);
    v11 = NumberRange.new(v11);
    v14 = nil;
    v14 = v3.attackInfo.AttackLookup.Mayo.Size / (v3.getScaledEffectRange(16) * 0.5);
    v15 = {};
    l_Position_0 = {};
    local v17 = {};
    local v18 = {};
    local v19 = {};
    local v20 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 60 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v21);
        v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v22) --[[ Line: 65 ]]
        -- upvalues: l_Position_0 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(l_Position_0, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v23) --[[ Line: 70 ]]
        -- upvalues: v17 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v17, v23);
        if v23:GetAttribute("AdjustDistance") then
            v2:EmitterSpeedFromDistance(v23, l_v2_2DDistance_0, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
            return;
        end;
    end);
    v2:IterateClass(l_Attack2_0, "ParticleEmitter", function(v24) --[[ Line: 79 ]]
        -- upvalues: v18 (copy), v12 (ref), v13 (ref), v11 (ref)
        table.insert(v18, v24);
        v24.Speed = v12;
        v24.Acceleration = v13;
        v24.Lifetime = v11;
    end);
    v2:IterateClass(l_Attack_0.Hit1, "ParticleEmitter", function(v25) --[[ Line: 86 ]]
        -- upvalues: v19 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v19, v25);
        v2:AdjustEmitterSpeed(v25, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit2_0, "ParticleEmitter", function(v26) --[[ Line: 91 ]]
        -- upvalues: v20 (copy), v2 (ref), v14 (ref), l_speedMultiplier_0 (copy)
        table.insert(v20, v26);
        if v26:GetAttribute("AdjustDistance") then
            v2:AdjustEmitterSpeedFromMultiplier(v26, v14, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v26, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v26, v14);
            return;
        end;
    end);
    return {
        Charge = function() --[[ Line: 102 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v15 (copy), l_Position_0 (copy)
            v2:ToggleEmitters(v15, true);
            v2:ToggleEmitters(l_Position_0, true);
        end, 
        Attack1 = function() --[[ Line: 107 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true);
        end, 
        Hit1 = function() --[[ Line: 111 ]] --[[ Name: Hit1 ]]
            -- upvalues: v2 (ref), v19 (copy), l_Position_0 (copy)
            v2:ToggleEmitters(v19, true, true);
            v2:ToggleEmitters(l_Position_0, false);
        end, 
        Attack2 = function() --[[ Line: 116 ]] --[[ Name: Attack2 ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, true);
        end, 
        Hit2 = function() --[[ Line: 120 ]] --[[ Name: Hit2 ]]
            -- upvalues: v2 (ref), v20 (copy)
            v2:ToggleEmitters(v20, true);
        end, 
        StopAttack1 = function() --[[ Line: 124 ]] --[[ Name: StopAttack1 ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, false);
        end, 
        StopHit = function() --[[ Line: 128 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v19 (copy), v20 (copy), v15 (copy)
            v2:ToggleEmitters(v19, false);
            v2:ToggleEmitters(v20, false);
            v2:ToggleEmitters(v15, false);
        end
    };
end;