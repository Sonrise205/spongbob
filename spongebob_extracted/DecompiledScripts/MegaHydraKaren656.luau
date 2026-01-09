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
    if not l_BeamEndAttachment_0:GetAttribute("OriginalPivot") then
        l_BeamEndAttachment_0:SetAttribute("OriginalPivot", l_BeamEndAttachment_0.CFrame);
    end;
    local l_l_BeamStartAttachment_0_Attribute_0 = l_BeamStartAttachment_0:GetAttribute("OriginalPivot");
    if not l_l_BeamStartAttachment_0_Attribute_0 then
        l_l_BeamStartAttachment_0_Attribute_0 = l_BeamStartAttachment_0.CFrame;
        l_BeamStartAttachment_0:SetAttribute("OriginalPivot", l_l_BeamStartAttachment_0_Attribute_0);
    end;
    l_BeamStartAttachment_0.CFrame = l_l_BeamStartAttachment_0_Attribute_0;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    for _, v16 in l_PrimaryPart_0.Beams:GetChildren() do
        table.insert(v13, v16);
        v16.Enabled = false;
    end;
    local v17 = {};
    local v18 = {};
    local v19 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v20) --[[ Line: 53 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v21) --[[ Line: 58 ]]
        -- upvalues: v18 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v18, v21);
        v2:EmitterSpeedFromDistance(v21, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v22) --[[ Line: 63 ]]
        -- upvalues: v19 (copy), v2 (ref), v10 (copy), l_speedMultiplier_0 (copy)
        table.insert(v19, v22);
        if v22.Parent:IsA("Attachment") then
            if v22:GetAttribute("AdjustSize") then
                v2:ScaleEmitterSize(v22, v10);
                return;
            elseif v22:GetAttribute("AdjustScaleAndSpeed") then
                v2:AdjustEmitterSpeedAndScale(v22, v10, l_speedMultiplier_0);
                return;
            end;
        else
            v2:ScaleEmitterSize(v22, (math.min(1, v10)));
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v10);
    return {
        Charge = function() --[[ Line: 80 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true);
        end, 
        Attack = function() --[[ Line: 84 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v18 (copy), v13 (copy), l_Hit_0 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v18, true);
            for _, v24 in v13 do
                v24.Enabled = true;
            end;
            local l_CFrame_0 = l_Hit_0.CFrame;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.1 / l_speedMultiplier_0), {
                WorldCFrame = l_CFrame_0
            }, function() --[[ Line: 93 ]]
                -- upvalues: l_BeamEndAttachment_0 (ref), l_CFrame_0 (copy)
                l_BeamEndAttachment_0.WorldCFrame = l_CFrame_0;
            end);
        end, 
        Hit = function() --[[ Line: 98 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v19 (copy)
            v2:ToggleEmitters(v19, true, true);
        end, 
        StopAttack = function() --[[ Line: 102 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v18 (copy), v17 (copy), l_BeamStartAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamEndAttachment_0 (copy), v13 (copy)
            v2:ToggleEmitters(v18, false);
            v2:ToggleEmitters(v17, false);
            v2:Tween(l_BeamStartAttachment_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = l_BeamEndAttachment_0.CFrame
            }, function() --[[ Line: 106 ]]
                -- upvalues: v13 (ref)
                for _, v27 in v13 do
                    v27.Enabled = false;
                end;
            end);
        end, 
        StopHit = function() --[[ Line: 113 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v19 (copy)
            v2:ToggleEmitters(v19, false);
        end
    };
end;