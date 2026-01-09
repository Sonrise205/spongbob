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
    v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack_1, l_PrimaryPart_0);
    local v9 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(57) * 0.5);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v13) --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v14) --[[ Line: 33 ]]
        -- upvalues: v11 (copy), v2 (ref), v9 (copy), l_speedMultiplier_0 (copy)
        table.insert(v11, v14);
        local v15 = v2:SetOriginalEmitterProps(v14);
        v15.rate = v15.rate * v9;
        v15.acceleration = v15.acceleration * v9;
        v15.speed = NumberRange.new(v15.speed.Min * v9, v15.speed.Max * v9);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0, v15);
        v2:ScaleEmitterSize(v14, v9, true);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v16) --[[ Line: 49 ]]
        -- upvalues: v12 (copy), l_Hit_0 (copy), v2 (ref), v9 (copy), l_speedMultiplier_0 (copy)
        table.insert(v12, v16);
        if l_Hit_0.Parent:IsA("Attachment") then
            if l_Hit_0.Name == "Smoke" then
                v2:AdjustEmitterSpeedAndScale(v16, v9, l_speedMultiplier_0);
                return;
            else
                v2:ScaleEmitterSize(v16, v9);
                return;
            end;
        else
            v2:AdjustEmitterSpeedFromMultiplier(v16, v9, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v16, math.min(1, v9), true);
            return;
        end;
    end);
    return {
        Charge = function() --[[ Line: 65 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 69 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true, true);
        end, 
        StopAttack = function() --[[ Line: 73 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v11, false);
        end, 
        Hit = function() --[[ Line: 78 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopHit = function() --[[ Line: 82 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v10 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;