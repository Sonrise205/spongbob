local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local v7 = nil;
    local v8 = v3.getScaledEffectRange(55);
    v7 = v3.range / (v8 * 0.5);
    v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    v2:IterateClass(l_Attack_0.Charge1, "ParticleEmitter", function(v12) --[[ Line: 23 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge2, "ParticleEmitter", function(v13) --[[ Line: 28 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v14) --[[ Line: 33 ]]
        -- upvalues: v10 (copy), v2 (ref), v7 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v14);
        local v15 = v2:SetOriginalEmitterProps(v14);
        v15.rate = v15.rate * v7;
        v15.drag = v15.drag * v7;
        v15.speed = NumberRange.new(v15.speed.Min * v7, v15.speed.Max * v7);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0, v15);
        v2:ScaleEmitterSize(v14, v7, true);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v16) --[[ Line: 49 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (ref)
        table.insert(v11, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v16, v7);
    end);
    local l_l_Hit_0_Attribute_0 = l_Hit_0:GetAttribute("OriginalSize");
    if not l_l_Hit_0_Attribute_0 then
        l_l_Hit_0_Attribute_0 = l_Hit_0.Size;
        l_Hit_0:SetAttribute("OriginalSize", l_l_Hit_0_Attribute_0);
    end;
    l_Hit_0.Size = l_l_Hit_0_Attribute_0 * Vector3.new(1, v7, v7);
    return {
        Charge1 = function() --[[ Line: 65 ]] --[[ Name: Charge1 ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Charge2 = function() --[[ Line: 69 ]] --[[ Name: Charge2 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Attack = function() --[[ Line: 73 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), v8 (copy)
            v2:ToggleEmitters(v10, true);
            v2:ToggleEmitters(v8, false);
        end, 
        Hit = function() --[[ Line: 78 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        StopAttack = function() --[[ Line: 82 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
        end, 
        StopHit = function() --[[ Line: 87 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, false);
        end
    };
end;