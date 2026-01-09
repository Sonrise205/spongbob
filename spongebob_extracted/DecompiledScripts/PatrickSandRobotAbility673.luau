local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Weld_0 = l_Attack_1:FindFirstChildOfClass("Weld");
    local l_Size_0 = l_Attack_1.Size;
    l_Attack_1.Size = l_Size_0 * Vector3.new(1, 1, 0, 0);
    local v10 = l_Weld_0.C0 * CFrame.new(0, 0, -l_Size_0.Z / 2);
    l_Weld_0.C0 = v10;
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_PrimaryPart_0.Position, l_Attack_1.Position);
    local v12 = math.clamp(v2:Get2DDistance(v3.pivot.Position, v3.attackPosition) - l_v2_2DDistance_0, 5, v3.range);
    v3.pivotHitPart(l_Attack_0.Hit2, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack_0.Impact, l_PrimaryPart_0);
    local v13 = v3.attackInfo.AttackStyles[2].Size / (v3.getScaledEffectRange(45) * 0.5);
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    local v18 = {};
    v2:IterateClass(l_Attack_0.Charge2, "ParticleEmitter", function(v19) --[[ Line: 48 ]]
        -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v14, v19);
        v2:AdjustEmitter(v19, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v20) --[[ Line: 53 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v20);
        v2:AdjustEmitter(v20, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v21) --[[ Line: 58 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v21);
        v2:AdjustEmitter(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit2, "ParticleEmitter", function(v22) --[[ Line: 63 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy), v13 (copy)
        table.insert(v17, v22);
        v2:AdjustEmitter(v22, l_speedMultiplier_0, v13);
    end);
    v2:IterateClass(l_Attack_0.Impact, "ParticleEmitter", function(v23) --[[ Line: 68 ]]
        -- upvalues: v18 (copy), v2 (ref), l_speedMultiplier_0 (copy), v13 (copy)
        table.insert(v18, v23);
        v2:AdjustEmitter(v23, l_speedMultiplier_0, v13);
    end);
    v2:ResizePart(l_Attack_0.Impact, v13);
    return {
        Charge = function() --[[ Line: 76 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        ChargeAttack = function() --[[ Line: 80 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true, true);
        end, 
        Attack = function() --[[ Line: 84 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v15 (copy), v16 (copy), v10 (copy), v12 (copy), l_Size_0 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy), l_Attack_1 (copy)
            v2:ToggleEmitters(v15, true, true);
            v2:ToggleEmitters(v16, false);
            local v24 = v10 * CFrame.new(0, 0, v12 / 2);
            local v25 = Vector3.new(l_Size_0.X, l_Size_0.Y, v12);
            v2:Tween(l_Weld_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                C0 = v24
            });
            v2:Tween(l_Attack_1, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                Size = v25
            });
        end, 
        Hit = function() --[[ Line: 95 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true, true);
        end, 
        StopAttack = function() --[[ Line: 99 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v18 (copy), v15 (copy)
            v2:ToggleEmitters(v18, true);
            v2:ToggleEmitters(v15, false);
        end, 
        StopHit = function() --[[ Line: 104 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v14 (copy), v17 (copy), v18 (copy)
            v2:ToggleEmitters(v14, false);
            v2:ToggleEmitters(v17, false);
            v2:ToggleEmitters(v18, false);
        end
    };
end;