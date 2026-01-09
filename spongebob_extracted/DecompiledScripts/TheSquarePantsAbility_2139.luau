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
    local v12 = {};
    local v13 = {
        [1] = {
            beamStart = l_PrimaryPart_0.BeamStartAttachment_L_Ultimate2, 
            beamEnd = l_PrimaryPart_0.BeamEndAttachment_L_Ultimate2, 
            attackPart = l_Attack_0.Attack1_Ultimate2, 
            attackEmitters = {}, 
            hitPart = l_Attack_0.Hit1_Ultimate2, 
            hitEmitters = {}
        }, 
        [2] = {
            beamStart = l_PrimaryPart_0.BeamStartAttachment_R_Ultimate2, 
            beamEnd = l_PrimaryPart_0.BeamEndAttachment_R_Ultimate2, 
            attackPart = l_Attack_0.Attack2_Ultimate2, 
            attackEmitters = {}, 
            hitPart = l_Attack_0.Hit2_Ultimate2, 
            hitEmitters = {}
        }
    };
    v2:IterateClass(l_PrimaryPart_0.Beams_Ultimate2, "Beam", function(v14) --[[ Line: 50 ]]
        -- upvalues: v12 (copy)
        table.insert(v12, v14);
        v14.Enabled = false;
    end);
    for _, v16 in v13 do
        if not v16.beamEnd:GetAttribute("OriginalPivot") then
            local l_CFrame_0 = v16.beamEnd.CFrame;
            v16.beamEnd:SetAttribute("OriginalPivot", l_CFrame_0);
        end;
        local l_Attribute_0 = v16.beamStart:GetAttribute("OriginalPivot");
        if not l_Attribute_0 then
            l_Attribute_0 = v16.beamStart.CFrame;
            v16.beamStart:SetAttribute("OriginalPivot", l_Attribute_0);
        end;
        v16.beamStart.CFrame = l_Attribute_0;
        v16.beamEnd.CFrame = v16.beamStart.CFrame;
    end;
    v2:IterateClass(l_Attack_0.Charge_Ultimate2, "ParticleEmitter", function(v19) --[[ Line: 74 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v19);
        v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
    end);
    for _, v21 in v13 do
        v2:IterateClass(v21.attackPart, "ParticleEmitter", function(v22) --[[ Line: 80 ]]
            -- upvalues: v21 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
            table.insert(v21.attackEmitters, v22);
            v2:EmitterSpeedFromDistance(v22, l_v2_2DDistance_0, l_speedMultiplier_0);
        end);
        v2:IterateClass(v21.hitPart, "ParticleEmitter", function(v23) --[[ Line: 85 ]]
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
        Charge = function() --[[ Line: 103 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 107 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy), v13 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleInstances(v12, true);
            for _, v25 in v13 do
                v2:ToggleEmitters(v25.attackEmitters, true, true);
                v25.beamEndPivot = v25.hitPart.CFrame;
                v2:Tween(v25.beamEnd, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                    WorldCFrame = v25.beamEndPivot
                }, function() --[[ Line: 114 ]]
                    -- upvalues: v25 (copy)
                    v25.beamEnd.WorldCFrame = v25.beamEndPivot;
                end);
            end;
        end, 
        Hit = function() --[[ Line: 120 ]] --[[ Name: Hit ]]
            -- upvalues: v13 (copy), v2 (ref)
            for _, v27 in v13 do
                v2:ToggleEmitters(v27.attackEmitters, true);
                v2:ToggleEmitters(v27.hitEmitters, true, true);
            end;
        end, 
        StopAttack = function() --[[ Line: 127 ]] --[[ Name: StopAttack ]]
            -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v12 (copy)
            for _, v29 in v13 do
                v2:ToggleEmitters(v29.attackEmitters, false);
                v2:Tween(v29.beamStart, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                    CFrame = v29.beamEnd.CFrame
                }, function() --[[ Line: 131 ]]
                    -- upvalues: v2 (ref), v12 (ref)
                    v2:ToggleInstances(v12, false);
                end);
            end;
        end, 
        StopHit = function() --[[ Line: 137 ]] --[[ Name: StopHit ]]
            -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
            for _, v31 in v13 do
                v2:ToggleEmitters(v31.hitEmitters, false);
            end;
            task.wait(0.6 / l_speedMultiplier_0);
            v2:ToggleEmitters(v11, false);
        end
    };
end;