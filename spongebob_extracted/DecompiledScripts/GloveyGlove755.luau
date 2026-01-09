local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    local v7 = {};
    local v8 = {};
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Weld_0 = l_Attack_1:FindFirstChildOfClass("Weld");
    local l_v2_2DDistance_0 = v2:Get2DDistance(v3.pivot.Position, l_Attack_1.Position);
    local v12 = math.clamp(v2:Get2DDistance(v3.pivot.Position, (v3.model:GetAttribute("AttackPosition"))) - l_v2_2DDistance_0, l_v2_2DDistance_0, v3.range);
    local l_C0_0 = l_Weld_0.C0;
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 29 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v6, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v15) --[[ Line: 34 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v15);
        v2:AdjustEmitter(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Primary, "Trail", function(v16) --[[ Line: 39 ]]
        -- upvalues: v8 (copy)
        table.insert(v8, v16);
    end);
    local _ = function(v17) --[[ Line: 43 ]] --[[ Name: toggleTrails ]]
        -- upvalues: v8 (copy)
        for _, v19 in v8 do
            v19.Enabled = v17;
        end;
    end;
    return {
        Charge = function() --[[ Line: 50 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack = function() --[[ Line: 54 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v7 (copy), v8 (copy), l_C0_0 (copy), v12 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v7, true, true);
            for _, v22 in v8 do
                v22.Enabled = true;
            end;
            local v23 = l_C0_0 * CFrame.new(0, 0, v12);
            v2:Tween(l_Weld_0, TweenInfo.new(0.75 / l_speedMultiplier_0, Enum.EasingStyle.Linear), {
                C0 = v23
            }, function() --[[ Line: 59 ]]
                -- upvalues: l_speedMultiplier_0 (ref), l_Weld_0 (ref), l_C0_0 (ref)
                task.delay(0.5 / l_speedMultiplier_0, function() --[[ Line: 60 ]]
                    -- upvalues: l_Weld_0 (ref), l_C0_0 (ref)
                    l_Weld_0.C0 = l_C0_0;
                end);
            end);
        end, 
        StopAttack = function() --[[ Line: 66 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v6 (copy), v7 (copy), v8 (copy)
            v2:ToggleEmitters(v6, false);
            v2:ToggleEmitters(v7, false);
            for _, v25 in v8 do
                v25.Enabled = false;
            end;
        end
    };
end;