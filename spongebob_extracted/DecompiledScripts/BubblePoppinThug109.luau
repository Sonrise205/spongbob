local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v8.Position);
    local v10 = {};
    local v11 = {};
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v11 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v11, v12);
        v2:EmitterSpeedFromDistance(v12, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0);
    end);
    return {
        Hit = function() --[[ Line: 31 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 35 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy), v10 (copy)
            v2:ToggleEmitters(v11, true);
            v2:ToggleEmitters(v10, false);
        end
    };
end;