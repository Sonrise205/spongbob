local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local v7 = v3.getScaledEffectRange(36.538);
    local v8 = v3.range / (v7 * 0.5);
    local v9 = v3.range / v7;
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 22 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v15) --[[ Line: 27 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v11, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v15, v8);
    end);
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v16) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v2 (ref), v9 (copy), v8 (copy), l_speedMultiplier_0 (copy)
        table.insert(v12, v16);
        local v17 = v2:SetOriginalEmitterProps(v16);
        v17.rate = v17.rate * v9;
        v17.drag = v17.drag * v8;
        v17.speed = NumberRange.new(v17.speed.Min * v9, v17.speed.Max * v9);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0, v17);
        v2:ScaleEmitterSize(v16, v8, true);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v18) --[[ Line: 49 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v13, v18);
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v18, v8);
    end);
    local l_l_Hit_0_Attribute_0 = l_Hit_0:GetAttribute("OriginalSize");
    if not l_l_Hit_0_Attribute_0 then
        l_l_Hit_0_Attribute_0 = l_Hit_0.Size;
        l_Hit_0:SetAttribute("OriginalSize", l_l_Hit_0_Attribute_0);
    end;
    l_Hit_0.Size = l_l_Hit_0_Attribute_0 * Vector3.new(1, v8, v8);
    return {
        Charge = function() --[[ Line: 65 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack1 = function() --[[ Line: 69 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack2 = function() --[[ Line: 73 ]] --[[ Name: Attack2 ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        Hit = function() --[[ Line: 77 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        StopAttack = function() --[[ Line: 81 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy), v12 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v12, false);
        end, 
        StopHit = function() --[[ Line: 87 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, false);
        end
    };
end;