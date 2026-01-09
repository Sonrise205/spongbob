local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Size_0 = v3.attackInfo.AttackStyles[1].Size;
    local v10 = v3.getScaledEffectRange(20);
    local v11 = l_Size_0 / (v10 * 0.5);
    local v12 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v12.Position);
    local v14 = l_v2_2DDistance_0 / 8;
    local v15 = {};
    local v16 = {};
    local v17 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v18) --[[ Line: 29 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v18);
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v19) --[[ Line: 34 ]]
        -- upvalues: v16 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy), v14 (copy)
        table.insert(v16, v19);
        v19.Acceleration = v2:EmitterSpeedFromDistance(v19, l_v2_2DDistance_0, l_speedMultiplier_0).acceleration * v14;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v20) --[[ Line: 40 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy), v10 (copy)
        table.insert(v17, v20);
        if v20.Parent:IsA("Attachment") then
            v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v20, v11);
            return;
        else
            v2:EmitterSpeedFromDistance(v20, v10, l_speedMultiplier_0);
            return;
        end;
    end);
    return {
        Charge = function() --[[ Line: 52 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true);
        end, 
        Attack = function() --[[ Line: 56 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true);
        end, 
        Hit = function() --[[ Line: 60 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v15 (copy), v17 (copy)
            v2:ToggleEmitters(v15, false);
            v2:ToggleEmitters(v17, true);
        end
    };
end;