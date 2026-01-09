local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Weld_0 = l_Attack_1:FindFirstChildOfClass("Weld");
    local l_Size_0 = l_Attack_1.Size;
    l_Attack_1.Size = l_Size_0 * Vector3.new(1, 1, 0, 0);
    local l_Weld_1 = l_Hit_0:FindFirstChildOfClass("Weld");
    local l_Size_1 = l_Hit_0.Size;
    l_Hit_0.Size = l_Size_1 * Vector3.new(1, 1, 0, 0);
    local v13 = l_Weld_0.C0 * CFrame.new(0, 0, -l_Size_0.Z / 2);
    l_Weld_0.C0 = v13;
    l_Weld_1.C0 = l_Weld_1.C0 * CFrame.new(0, 0, -l_Size_1.Z / 2);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_PrimaryPart_0.Position, l_Attack_1.Position);
    local l_v2_2DDistance_1 = v2:Get2DDistance(l_PrimaryPart_0.Position, l_Hit_0.Position);
    local v16 = math.clamp(v3.range - l_v2_2DDistance_0, 5, v3.range);
    local v17 = math.clamp(v3.range - l_v2_2DDistance_1, 5, v3.range);
    local v18 = {};
    local v19 = {};
    local v20 = {};
    local v21 = {};
    if l_Attack_0:FindFirstChild("Charge") then
        v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v22) --[[ Line: 55 ]]
            -- upvalues: v18 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v18, v22);
            v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
        end);
    end;
    if l_Attack_0:FindFirstChild("ChargeAttack") then
        v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v23) --[[ Line: 65 ]]
            -- upvalues: v19 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v19, v23);
            v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
        end);
    end;
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v24) --[[ Line: 72 ]]
        -- upvalues: v20 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v20, v24);
        v2:AdjustEmitterSpeed(v24, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v25) --[[ Line: 77 ]]
        -- upvalues: v21 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v21, v25);
        v2:AdjustEmitterSpeed(v25, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 83 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, true);
        end, 
        Attack = function() --[[ Line: 87 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v19 (copy)
            v2:ToggleEmitters(v19, true, true);
        end, 
        Hit = function() --[[ Line: 91 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v21 (copy), v20 (copy), v13 (copy), v16 (copy), l_Size_0 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy), l_Attack_1 (copy), v17 (copy), l_Size_1 (copy), l_Weld_1 (copy), l_Hit_0 (copy)
            v2:ToggleEmitters(v21, true);
            v2:ToggleEmitters(v20, true, true);
            local v26 = v13 * CFrame.new(0, 0, v16 / 2);
            local v27 = Vector3.new(l_Size_0.X, l_Size_0.Y, v16);
            v2:Tween(l_Weld_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                C0 = v26
            });
            v2:Tween(l_Attack_1, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                Size = v27
            });
            local v28 = v13 * CFrame.new(0, 0, v17 / 2);
            local v29 = Vector3.new(l_Size_1.X, l_Size_1.Y, v17);
            v2:Tween(l_Weld_1, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                C0 = v28
            });
            v2:Tween(l_Hit_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                Size = v29
            });
        end, 
        StopAttack = function() --[[ Line: 107 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v19 (copy)
            v2:ToggleEmitters(v19, false);
        end, 
        StopHit = function() --[[ Line: 111 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v18 (copy), v20 (copy), v21 (copy)
            v2:ToggleEmitters(v18, false);
            v2:ToggleEmitters(v20, false);
            v2:ToggleEmitters(v21, false);
        end
    };
end;