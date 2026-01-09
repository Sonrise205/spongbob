local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local v9 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v9.Position);
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 22 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_1.Attachment, "ParticleEmitter", function(v15) --[[ Line: 27 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v16) --[[ Line: 32 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v13, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    local l_Zap_0 = l_Attack_1.Zap.Zap;
    table.insert(v12, l_Zap_0);
    v2:EmitterSpeedFromDistance(l_Zap_0, l_v2_2DDistance_0, l_speedMultiplier_0);
    return {
        Charge = function() --[[ Line: 43 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 47 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        Hit = function() --[[ Line: 51 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        StopAttack = function() --[[ Line: 55 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, false);
        end
    };
end;