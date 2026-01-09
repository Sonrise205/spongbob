local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_Attack_1 = l_Attack_0.Attack;
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local _ = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(18) * 0.5);
    local v13 = 0.9 / l_speedMultiplier_0;
    local v14 = v3.getHitPivot(l_Hit_0);
    local v15 = l_PrimaryPart_0.CFrame * CFrame.new(0, 0, -v3.range);
    local _ = v2:Get2DDistance(l_Attack_0.Attack.Position, v15);
    local v17 = v14.Position - (v14.Position - l_Attack_1.Position) * Vector3.new(0.75, 0, 0.75, 0);
    local v18, v19 = v2:CalculateArc(v13, l_Attack_1.Position, v17, 0.2617993877991494);
    v18 = NumberRange.new(v18);
    local _ = l_Attack_1:FindFirstChildOfClass("Weld");
    local l_Size_0 = l_Attack_1.Size;
    l_Attack_1.Size = l_Size_0 * Vector3.new(1, 1, 0, 0);
    local l_Weld_1 = l_Hit_0:FindFirstChildOfClass("Weld");
    local l_Size_1 = l_Hit_0.Size;
    l_Hit_0.Size = l_Size_1 * Vector3.new(1, 1, 0, 0);
    local v24 = l_Weld_1.C0 * CFrame.new(0, l_Size_0.Y / 2, -l_Size_1.Z / 2);
    l_Weld_1.C0 = v24;
    local l_v2_2DDistance_1 = v2:Get2DDistance(l_PrimaryPart_0.Position, l_Attack_1.Position);
    local l_v2_2DDistance_2 = v2:Get2DDistance(l_PrimaryPart_0.Position, l_Hit_0.Position);
    local _ = math.clamp(v3.range - l_v2_2DDistance_1, 5, v3.range);
    local v28 = math.clamp(v3.range - l_v2_2DDistance_2, 5, v3.range);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v29) --[[ Line: 69 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v29);
        v2:AdjustEmitterSpeed(v29, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v30) --[[ Line: 74 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v24 (copy), v28 (copy), l_Size_1 (copy), l_Weld_1 (copy), l_Hit_0 (copy)
        v30:SetAttribute("EmitCount");
        table.insert(v9, v30);
        v2:AdjustEmitterSpeed(v30, l_speedMultiplier_0);
        local v31 = v24 * CFrame.new(0, 0, v28 / 2);
        local v32 = Vector3.new(l_Size_1.X, l_Size_1.Y, v28);
        v2:Tween(l_Weld_1, TweenInfo.new(0.5 / l_speedMultiplier_0), {
            C0 = v31
        });
        v2:Tween(l_Hit_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
            Size = v32
        });
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v33) --[[ Line: 88 ]]
        -- upvalues: v10 (copy), v13 (copy), v18 (ref), v19 (copy)
        table.insert(v10, v33);
        local v34 = if string.find(v33.Name, "Goo") then NumberRange.new(v13 * 2.7) else NumberRange.new(v13);
        v33.Speed = v18;
        v33.Acceleration = v19;
        v33.Lifetime = v34;
    end);
    return {
        Charge = function() --[[ Line: 101 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true, true);
        end, 
        Attack = function() --[[ Line: 105 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true, true);
        end, 
        Hit = function() --[[ Line: 109 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        StopAttack = function() --[[ Line: 113 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end, 
        StopHit = function() --[[ Line: 117 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v9 (copy), v11 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v11, false);
        end
    };
end;