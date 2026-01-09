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
    local v10 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(14) * 0.5);
    local v11 = {};
    local v12 = {
        [1] = {
            beamStart = l_PrimaryPart_0.BeamStartAttachment1, 
            beamEnd = l_PrimaryPart_0.BeamEndAttachment1, 
            beams = l_PrimaryPart_0.Beams1:GetChildren(), 
            attackPart = l_Attack_0.Attack1, 
            attackEmitters = {}, 
            hitPart = l_Attack_0.Hit1, 
            hitEmitters = {}
        }, 
        [2] = {
            beamStart = l_PrimaryPart_0.BeamStartAttachment2, 
            beamEnd = l_PrimaryPart_0.BeamEndAttachment2, 
            beams = l_PrimaryPart_0.Beams2:GetChildren(), 
            attackPart = l_Attack_0.Attack2, 
            attackEmitters = {}, 
            hitPart = l_Attack_0.Hit2, 
            hitEmitters = {}
        }, 
        [3] = {
            beamStart = l_PrimaryPart_0.BeamStartAttachment3, 
            beamEnd = l_PrimaryPart_0.BeamEndAttachment3, 
            beams = l_PrimaryPart_0.Beams3:GetChildren(), 
            attackPart = l_Attack_0.Attack3, 
            attackEmitters = {}, 
            hitPart = l_Attack_0.Hit3, 
            hitEmitters = {}
        }
    };
    for _, v14 in v12 do
        if not v14.beamEnd:GetAttribute("OriginalPivot") then
            local l_CFrame_0 = v14.beamEnd.CFrame;
            v14.beamEnd:SetAttribute("OriginalPivot", l_CFrame_0);
        end;
        local l_Attribute_0 = v14.beamStart:GetAttribute("OriginalPivot");
        if not l_Attribute_0 then
            l_Attribute_0 = v14.beamStart.CFrame;
            v14.beamStart:SetAttribute("OriginalPivot", l_Attribute_0);
        end;
        v14.beamStart.CFrame = l_Attribute_0;
        v14.beamEnd.CFrame = v14.beamStart.CFrame;
        for _, v18 in v14.beams do
            v18.Enabled = false;
        end;
    end;
    v2:IterateClass(l_Attack_0.Charge2, "ParticleEmitter", function(v19) --[[ Line: 78 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v19);
        v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
    end);
    for _, v21 in v12 do
        v2:IterateClass(v21.attackPart, "ParticleEmitter", function(v22) --[[ Line: 84 ]]
            -- upvalues: v21 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
            table.insert(v21.attackEmitters, v22);
            v2:EmitterSpeedFromDistance(v22, l_v2_2DDistance_0, l_speedMultiplier_0);
        end);
        v2:IterateClass(v21.hitPart, "ParticleEmitter", function(v23) --[[ Line: 89 ]]
            -- upvalues: v21 (copy), v2 (ref), v10 (copy), l_speedMultiplier_0 (copy)
            table.insert(v21.hitEmitters, v23);
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
        v2:ResizePart(v21.hitPart, v10);
    end;
    return {
        Charge = function() --[[ Line: 107 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 111 ]] --[[ Name: Attack ]]
            -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            for _, v25 in v12 do
                v2:ToggleEmitters(v25.attackEmitters, true);
                v25.beamEndPivot = v25.hitPart.CFrame;
                for _, v27 in v25.beams do
                    v27.Enabled = true;
                end;
                v2:Tween(v25.beamEnd, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                    WorldCFrame = v25.beamEndPivot
                }, function() --[[ Line: 121 ]]
                    -- upvalues: v25 (copy)
                    v25.beamEnd.WorldCFrame = v25.beamEndPivot;
                end);
            end;
        end, 
        Hit = function() --[[ Line: 127 ]] --[[ Name: Hit ]]
            -- upvalues: v12 (copy), v2 (ref)
            for _, v29 in v12 do
                v2:ToggleEmitters(v29.attackEmitters, true);
                v2:ToggleEmitters(v29.hitEmitters, true, true);
            end;
        end, 
        StopAttack = function() --[[ Line: 134 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v11 (copy), v12 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v11, false);
            for _, v31 in v12 do
                v2:ToggleEmitters(v31.hitEmitters, false);
                v2:ToggleEmitters(v31.attackEmitters, false);
                v2:Tween(v31.beamStart, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                    CFrame = v31.beamEnd.CFrame
                }, function() --[[ Line: 141 ]]
                    -- upvalues: v31 (copy)
                    for _, v33 in v31.beams do
                        v33.Enabled = false;
                    end;
                end);
            end;
        end
    };
end;