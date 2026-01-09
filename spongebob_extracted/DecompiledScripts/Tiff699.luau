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
    local v10 = v3.attackInfo.AttackStyles[2].Size / (v3.getScaledEffectRange(14) * 0.5);
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local v13 = {};
    local l_l_BeamEndAttachment_0_Attribute_0 = l_BeamEndAttachment_0:GetAttribute("OriginalPivot");
    if not l_l_BeamEndAttachment_0_Attribute_0 then
        l_l_BeamEndAttachment_0_Attribute_0 = l_BeamEndAttachment_0.CFrame;
        l_BeamEndAttachment_0:SetAttribute("OriginalPivot", l_l_BeamEndAttachment_0_Attribute_0);
    end;
    local v15 = l_l_BeamEndAttachment_0_Attribute_0.Rotation + Vector3.new(l_l_BeamEndAttachment_0_Attribute_0.X, l_l_BeamEndAttachment_0_Attribute_0.Y, -l_v2_2DDistance_0);
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    for _, v17 in l_PrimaryPart_0.Beams:GetChildren() do
        table.insert(v13, v17);
        v17.Enabled = false;
    end;
    local v18 = {};
    local v19 = {};
    local v20 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 48 ]]
        -- upvalues: v18 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v18, v21);
        v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v22) --[[ Line: 53 ]]
        -- upvalues: v19 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v19, v22);
        v2:EmitterSpeedFromDistance(v22, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v23) --[[ Line: 58 ]]
        -- upvalues: v20 (copy), v2 (ref), v10 (copy), l_speedMultiplier_0 (copy)
        table.insert(v20, v23);
        if v23.Parent:IsA("Attachment") then
            if v23:GetAttribute("AdjustSize") then
                v2:ScaleEmitterSize(v23, v10);
                return;
            elseif v23:GetAttribute("AdjustScaleAndSpeed") then
                v2:AdjustEmitterSpeedAndScale(v23, v10, l_speedMultiplier_0);
                return;
            end;
        else
            v2:ScaleEmitterSize(v23, (math.min(1, v10)));
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v10);
    return {
        Charge = function() --[[ Line: 75 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, true);
        end, 
        Attack = function() --[[ Line: 79 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v19 (copy), v13 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), v15 (copy)
            v2:ToggleEmitters(v19, true);
            for _, v25 in v13 do
                v25.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.1 / l_speedMultiplier_0), {
                CFrame = v15
            });
        end, 
        StopAttack = function() --[[ Line: 90 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v19 (copy), v18 (copy), v20 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v13 (copy)
            v2:ToggleEmitters(v19, false);
            v2:ToggleEmitters(v18, false);
            v2:ToggleEmitters(v20, true, true);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 95 ]]
                -- upvalues: v13 (ref)
                for _, v27 in v13 do
                    v27.Enabled = false;
                end;
            end);
        end, 
        StopHit = function() --[[ Line: 102 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v20 (copy)
            v2:ToggleEmitters(v20, false);
        end
    };
end;