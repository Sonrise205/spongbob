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
    local v10 = v3.getScaledEffectRange(22);
    local v11 = l_Size_0 / (v10 * 0.5);
    local v12 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v12.Position);
    local v14 = v10 / l_v2_2DDistance_0;
    local v15 = math.max(0.6, l_v2_2DDistance_0 / v10);
    local v16 = {};
    local v17 = {};
    local v18 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v19) --[[ Line: 30 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v19);
        v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_1, "ParticleEmitter", function(v20) --[[ Line: 35 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy), v15 (copy), v11 (copy), v14 (copy)
        table.insert(v17, v20);
        if v20.Parent:IsA("Attachment") then
            v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
            return;
        else
            local v21 = v2:SetOriginalEmitterProps(v20);
            v21.rate = v21.rate * v15;
            v21.drag = v21.drag * v11;
            v21.speed = NumberRange.new(v21.speed.Min * v15, v21.speed.Max * v15);
            v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0, v21);
            local l_v20_Attribute_0 = v20:GetAttribute("OriginalSpread");
            if not l_v20_Attribute_0 then
                l_v20_Attribute_0 = v20.SpreadAngle;
                v20:SetAttribute("OriginalSpread", l_v20_Attribute_0);
            end;
            v20.SpreadAngle = Vector2.new(l_v20_Attribute_0.X * v14, l_v20_Attribute_0.Y * v14);
            return;
        end;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v23) --[[ Line: 65 ]]
        -- upvalues: v18 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v18, v23);
        local v24 = v2:SetOriginalEmitterProps(v23);
        v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0, v24);
        v23.Rate = math.max(v24.rate, v24.rate * v11);
    end);
    v2:ResizePart(l_Attack_0.Hit, v11);
    return {
        Charge = function() --[[ Line: 75 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true);
        end, 
        Attack = function() --[[ Line: 79 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:JustEmit(v17);
        end, 
        Hit = function() --[[ Line: 83 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, true, true);
        end, 
        StopHit = function() --[[ Line: 87 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v18 (copy), v16 (copy)
            v2:ToggleEmitters(v18, false);
            v2:ToggleEmitters(v16, false);
        end
    };
end;