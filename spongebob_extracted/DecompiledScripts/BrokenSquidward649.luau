local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Size_0 = v3.attackInfo.AttackStyles[2].Size;
    local v9 = v3.getScaledEffectRange(18);
    local v10 = l_Size_0 / (v9 * 0.5);
    local _ = l_Size_0 / v9;
    local v12 = 1 / l_speedMultiplier_0;
    local v13 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local v14, v15 = v2:CalculateArc(v12, l_Attack_0.Attack.Position, v13.Position, 0.3490658503988659);
    v14 = NumberRange.new(v14);
    v12 = NumberRange.new(v12);
    local v16 = {};
    local v17 = {};
    local v18 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v19) --[[ Line: 32 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v19);
        v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v20) --[[ Line: 37 ]]
        -- upvalues: v17 (copy), v14 (ref), v15 (copy), v12 (ref), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v17, v20);
        v20.Speed = v14;
        v20.Acceleration = v15;
        v20.Lifetime = v12;
        v2:AdjustEmitter(v20, l_speedMultiplier_0, v10);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v21) --[[ Line: 47 ]]
        -- upvalues: v18 (copy), v2 (ref), v10 (copy), l_speedMultiplier_0 (copy)
        table.insert(v18, v21);
        if v21.Parent:IsA("Attachment") then
            if v21:GetAttribute("AdjustScale") then
                v2:ScaleEmitterSize(v21, v10);
                return;
            elseif v21:GetAttribute("AdjustScaleAndSpeed") then
                v2:AdjustEmitterSpeedAndScale(v21, v10, l_speedMultiplier_0);
                return;
            end;
        else
            v2:ScaleEmitterSize(v21, (math.min(1, v10)));
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v10);
    return {
        Charge = function() --[[ Line: 64 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true);
        end, 
        Attack = function() --[[ Line: 68 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true, true);
        end, 
        Hit = function() --[[ Line: 72 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, true, true);
        end, 
        StopAttack = function() --[[ Line: 76 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, false);
        end, 
        StopHit = function() --[[ Line: 80 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v16 (copy), v18 (copy)
            v2:ToggleEmitters(v16, false);
            v2:ToggleEmitters(v18, false);
        end
    };
end;