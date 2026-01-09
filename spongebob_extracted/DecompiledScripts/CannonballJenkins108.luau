local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local _ = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Weld_0 = l_Attack_1:FindFirstChildOfClass("Weld");
    local l_v2_2DDistance_0 = v2:Get2DDistance(v3.pivot.Position, l_Attack_1.Position);
    local v12 = math.clamp(v2:Get2DDistance(v3.pivot.Position, (v3.model:GetAttribute("AttackPosition"))) - l_v2_2DDistance_0, l_v2_2DDistance_0, v3.range);
    local l_C0_0 = l_Weld_0.C0;
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v18) --[[ Line: 35 ]]
        -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v14, v18);
        v2:AdjustEmitter(v18, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v19) --[[ Line: 40 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v19);
        v2:AdjustEmitter(v19, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v20) --[[ Line: 45 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v20);
        v20.LockedToPart = true;
        v2:AdjustEmitter(v20, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v21) --[[ Line: 51 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v21);
        v2:AdjustEmitter(v21, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 57 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        Attack = function() --[[ Line: 61 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v15 (copy), v16 (copy), l_C0_0 (copy), v12 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy)
            v2:JustEmit(v15);
            v2:ToggleEmitters(v16, true, true);
            local v22 = l_C0_0 * CFrame.new(0, 0, v12);
            v2:Tween(l_Weld_0, TweenInfo.new(0.5 / l_speedMultiplier_0, Enum.EasingStyle.Linear), {
                C0 = v22
            }, function() --[[ Line: 68 ]]
                -- upvalues: l_speedMultiplier_0 (ref), l_Weld_0 (ref), l_C0_0 (ref)
                task.wait(0.5 / l_speedMultiplier_0);
                l_Weld_0.C0 = l_C0_0;
            end);
        end, 
        Hit = function() --[[ Line: 74 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v16 (copy), v17 (copy), l_speedMultiplier_0 (copy), v14 (copy)
            v2:ToggleEmitters(v16, false);
            v2:JustEmit(v17);
            task.wait(0.5 / l_speedMultiplier_0);
            v2:ToggleEmitters(v14, false);
        end
    };
end;