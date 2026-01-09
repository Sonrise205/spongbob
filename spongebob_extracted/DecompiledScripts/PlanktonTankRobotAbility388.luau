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
    local v9 = v3.getScaledEffectRange(32);
    local v10 = v3.range / (v9 * 0.5);
    local _ = l_Attack_0.Attack_Ultimate;
    local l_Hit_Ultimate_0 = l_Attack_0.Hit_Ultimate;
    local l_Primary_0 = l_Attack_0.Primary;
    local l_HitStart_0 = l_Attack_0.HitStart;
    local l_Weld_0 = l_Hit_Ultimate_0:FindFirstChildOfClass("Weld");
    local l_Size_0 = l_Hit_Ultimate_0.Size;
    l_Hit_Ultimate_0.Size = l_Size_0 * Vector3.new(1, 1, 0, 0);
    local v17 = l_Weld_0.C0 * CFrame.new(0, 0, -l_Size_0.Z / 2);
    l_Weld_0.C0 = v17;
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Primary_0.Position, l_HitStart_0.Position);
    local v19 = v3.range - l_v2_2DDistance_0;
    v2:IterateClass(l_Attack_0.Charge_Ultimate, "ParticleEmitter", function(v20) --[[ Line: 36 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v6, v20);
        v2:AdjustEmitter(v20, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Hit_Ultimate, "ParticleEmitter", function(v21) --[[ Line: 42 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v7, v21);
        v2:AdjustEmitter(v21, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Attack_Ultimate, "ParticleEmitter", function(v22) --[[ Line: 48 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v8, v22);
        v2:AdjustEmitter(v22, l_speedMultiplier_0, v10);
    end);
    return {
        Charge = function() --[[ Line: 56 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true, true);
        end, 
        ChargeAttack = function() --[[ Line: 60 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack = function() --[[ Line: 64 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy), v17 (copy), v19 (copy), l_Size_0 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy), l_Hit_Ultimate_0 (copy)
            v2:ToggleEmitters(v8, true, true);
            local v23 = v17 * CFrame.new(0, 0, v19 / 2);
            local v24 = Vector3.new(l_Size_0.X, l_Size_0.Y, v19);
            v2:Tween(l_Weld_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                C0 = v23
            });
            v2:Tween(l_Hit_Ultimate_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                Size = v24
            });
        end, 
        Hit = function() --[[ Line: 74 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true, true);
        end, 
        StopHit = function() --[[ Line: 78 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v8 (copy), v7 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v7, false);
        end, 
        StopCharge = function() --[[ Line: 83 ]] --[[ Name: StopCharge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, false);
        end
    };
end;