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
    local v11 = l_Weld_0.C0 * CFrame.new(0, 0, -l_Size_0.Z / 2);
    l_Weld_0.C0 = v11;
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_PrimaryPart_0.Position, l_Attack_1.Position);
    local v13 = math.clamp(v2:Get2DDistance(v3.pivot.Position, v3.attackPosition) - l_v2_2DDistance_0, 5, v3.range);
    local v14 = {};
    local v15 = {};
    local v16 = {};
    if l_Attack_0:FindFirstChild("Charge") then
        v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v17) --[[ Line: 42 ]]
            -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            table.insert(v14, v17);
            v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
        end);
    end;
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v18) --[[ Line: 49 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v18);
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v19) --[[ Line: 54 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v19);
        v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 60 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        Attack = function() --[[ Line: 64 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v16 (copy), v15 (copy), v11 (copy), v13 (copy), l_Size_0 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy), l_Attack_1 (copy)
            v2:ToggleEmitters(v16, true);
            v2:ToggleEmitters(v15, true);
            local v20 = v11 * CFrame.new(0, 0, v13 / 2);
            local v21 = Vector3.new(l_Size_0.X, l_Size_0.Y, v13);
            v2:Tween(l_Weld_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                C0 = v20
            });
            v2:Tween(l_Attack_1, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                Size = v21
            });
        end, 
        Hit = function() --[[ Line: 75 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, false);
        end, 
        StopAttack = function() --[[ Line: 79 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v15 (copy), v16 (copy)
            v2:ToggleEmitters(v15, false);
            v2:ToggleEmitters(v16, false);
        end
    };
end;