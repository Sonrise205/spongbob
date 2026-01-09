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
    local v10 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(11) * 0.5);
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 27 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v11, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v15) --[[ Line: 32 ]]
        -- upvalues: v12 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v12, v15);
        if v15:GetAttribute("AdjustDistance") then
            v2:EmitterSpeedFromDistance(v15, l_v2_2DDistance_0, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitter(v15, l_speedMultiplier_0, v10);
            return;
        end;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v16) --[[ Line: 41 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v13, v16);
        v2:AdjustEmitter(v16, l_speedMultiplier_0, v10);
    end);
    v2:ResizePart(l_Attack_0.Hit, v10);
    return {
        Charge = function() --[[ Line: 49 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 53 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        Hit = function() --[[ Line: 57 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true, true);
        end, 
        StopAttack = function() --[[ Line: 61 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v12 (copy), v11 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v11, false);
        end, 
        StopHit = function() --[[ Line: 66 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, false);
        end
    };
end;