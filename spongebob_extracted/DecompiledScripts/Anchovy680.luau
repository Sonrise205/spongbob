local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    local v7 = {};
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Weld_0 = l_Attack_1:FindFirstChildOfClass("Weld");
    local l_v2_2DDistance_0 = v2:Get2DDistance(v3.pivot.Position, l_Attack_1.Position);
    local v11 = math.clamp(v2:Get2DDistance(v3.pivot.Position, (v3.model:GetAttribute("AttackPosition"))) - l_v2_2DDistance_0, l_v2_2DDistance_0, v3.range);
    local l_C0_0 = l_Weld_0.C0;
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v13) --[[ Line: 28 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v6, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v14) --[[ Line: 33 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 39 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack = function() --[[ Line: 43 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v7 (copy), l_C0_0 (copy), v11 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v7, true, true);
            local v15 = l_C0_0 * CFrame.new(0, 0, v11 / 2);
            v2:Tween(l_Weld_0, TweenInfo.new(2.5 / l_speedMultiplier_0, Enum.EasingStyle.Linear), {
                C0 = v15
            }, function() --[[ Line: 47 ]]
                -- upvalues: l_Weld_0 (ref), l_C0_0 (ref)
                l_Weld_0.C0 = l_C0_0;
            end);
        end, 
        StopAttack = function() --[[ Line: 52 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v6 (copy), v7 (copy)
            v2:ToggleEmitters(v6, false);
            v2:ToggleEmitters(v7, false);
        end
    };
end;