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
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack1.Position, v8.Position);
    local v10 = v3.getScaledEffectRange(18);
    local v11 = v3.range / (v10 * 0.5);
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v16) --[[ Line: 26 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v13, v16);
        v2:AdjustEmitter(v16, l_speedMultiplier_0, v11);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 31 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v12, v17);
        v2:AdjustEmitter(v17, l_speedMultiplier_0, v11);
    end);
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v18) --[[ Line: 36 ]]
        -- upvalues: v14 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v14, v18);
        if v18:GetAttribute("AdjustDistance") then
            v2:EmitterSpeedFromDistance(v18, l_v2_2DDistance_0, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitter(v18, l_speedMultiplier_0, v11);
            return;
        end;
    end);
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v19) --[[ Line: 45 ]]
        -- upvalues: v15 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v15, v19);
        if v19:GetAttribute("AdjustDistance") then
            v2:EmitterSpeedFromDistance(v19, l_v2_2DDistance_0, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitter(v19, l_speedMultiplier_0, v11);
            return;
        end;
    end);
    return {
        Charge = function() --[[ Line: 58 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        Attack = function() --[[ Line: 62 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v14 (copy), v15 (copy)
            v2:ToggleEmitters(v14, true);
            v2:ToggleEmitters(v15, true);
        end, 
        Hit = function() --[[ Line: 67 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopAttack = function() --[[ Line: 71 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v13 (copy), v14 (copy), v15 (copy)
            v2:ToggleEmitters(v13, false);
            v2:ToggleEmitters(v14, false);
            v2:ToggleEmitters(v15, false);
        end, 
        StopHit = function() --[[ Line: 77 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, false);
        end
    };
end;