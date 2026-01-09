local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local l_Hit1_0 = l_Attack_0.Hit1;
    local l_Hit2_0 = l_Attack_0.Hit2;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local _ = v4.pivotHitPart(l_Hit1_0, l_PrimaryPart_0);
    local _ = v4.pivotHitPart(l_Hit2_0, l_PrimaryPart_0);
    local l_Attack1_0 = l_Attack_0.Attack1;
    local l_Attack2_0 = l_Attack_0.Attack2;
    local l_Weld_0 = l_Attack1_0:FindFirstChildOfClass("Weld");
    local l_Weld_1 = l_Attack2_0:FindFirstChildOfClass("Weld");
    local v16 = v3:Get2DDistance(v4.pivot.Position, l_Attack1_0.Position) - 1;
    local v17 = math.clamp(v3:Get2DDistance(v4.pivot.Position, (v4.model:GetAttribute("AttackPosition"))) - v16, v16, v4.range);
    local v18 = math.clamp(v3:Get2DDistance(v4.pivot.Position, (v4.model:GetAttribute("AttackPosition"))) - v16, v16, v4.range);
    local l_C0_0 = l_Weld_0.C0;
    local l_C0_1 = l_Weld_1.C0;
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    v3:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v26) --[[ Line: 57 ]]
        -- upvalues: v21 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v21, v26);
        v3:AdjustEmitter(v26, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v27) --[[ Line: 62 ]]
        -- upvalues: v22 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v22, v27);
        v3:AdjustEmitter(v27, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v28) --[[ Line: 67 ]]
        -- upvalues: v24 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v24, v28);
        v3:AdjustEmitter(v28, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Hit1, "ParticleEmitter", function(v29) --[[ Line: 72 ]]
        -- upvalues: v23 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v23, v29);
        v3:AdjustEmitter(v29, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Hit2, "ParticleEmitter", function(v30) --[[ Line: 77 ]]
        -- upvalues: v25 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v25, v30);
        v3:AdjustEmitter(v30, l_speedMultiplier_0);
    end);
    local v31 = TweenInfo.new(0.35 / l_speedMultiplier_0);
    return {
        Charge = function() --[[ Line: 85 ]] --[[ Name: Charge ]]
            -- upvalues: v3 (ref), v21 (copy)
            v3:ToggleEmitters(v21, true);
        end, 
        Attack1 = function() --[[ Line: 90 ]] --[[ Name: Attack1 ]]
            -- upvalues: l_C0_0 (copy), v17 (copy), v3 (ref), v22 (copy), l_Weld_0 (copy), v31 (copy), l_speedMultiplier_0 (copy)
            local v32 = l_C0_0 * CFrame.new(0, 0, v17);
            v3:ToggleEmitters(v22, true, true);
            v3:Tween(l_Weld_0, v31, {
                C0 = v32
            }, function() --[[ Line: 96 ]]
                -- upvalues: l_Weld_0 (ref), l_C0_0 (ref)
                l_Weld_0.C0 = l_C0_0;
            end);
            task.wait(0.18 / l_speedMultiplier_0);
            v3:ToggleEmitters(v22, false);
        end, 
        Hit1 = function() --[[ Line: 104 ]] --[[ Name: Hit1 ]]
            -- upvalues: v3 (ref), v23 (copy)
            v3:JustEmit(v23);
        end, 
        Attack2 = function() --[[ Line: 109 ]] --[[ Name: Attack2 ]]
            -- upvalues: l_C0_1 (copy), v18 (copy), v3 (ref), v24 (copy), l_Weld_1 (copy), v31 (copy), l_speedMultiplier_0 (copy)
            local v33 = l_C0_1 * CFrame.new(0, 0, v18);
            v3:ToggleEmitters(v24, true, true);
            v3:Tween(l_Weld_1, v31, {
                C0 = v33
            }, function() --[[ Line: 115 ]]
                -- upvalues: l_Weld_1 (ref), l_C0_1 (ref)
                l_Weld_1.C0 = l_C0_1;
            end);
            task.wait(0.18 / l_speedMultiplier_0);
            v3:ToggleEmitters(v24, false);
        end, 
        Hit2 = function() --[[ Line: 123 ]] --[[ Name: Hit2 ]]
            -- upvalues: v3 (ref), v25 (copy)
            v3:JustEmit(v25);
        end, 
        StopCharge = function() --[[ Line: 127 ]] --[[ Name: StopCharge ]]
            -- upvalues: v3 (ref), v21 (copy)
            v3:ToggleEmitters(v21, false);
        end
    };
end;