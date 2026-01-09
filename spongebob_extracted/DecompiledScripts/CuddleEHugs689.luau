local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_HitAttack_0 = l_Attack_0.HitAttack;
    local l_Weld_0 = l_Attack_0.Hit2:FindFirstChildOfClass("Weld");
    local v9 = v3.attackInfo.AttackStyles[2].Size / (v3.getScaledEffectRange(48) * 0.5);
    local v10 = math.min(v9, 1);
    local v11 = (1 - v10) * 10;
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    v2:IterateClass(l_Attack_0.Charge, "Attachment", function(v17) --[[ Line: 32 ]]
        -- upvalues: l_PrimaryPart_0 (copy), v16 (copy)
        local v18 = l_PrimaryPart_0[("BeamTarget_%*"):format((string.match(v17.Name, "_([A-Za-z])$")))];
        local l_v17_Attribute_0 = v17:GetAttribute("Origin");
        if not l_v17_Attribute_0 then
            l_v17_Attribute_0 = v17.WorldPosition;
            v17:SetAttribute("Origin", l_v17_Attribute_0);
        end;
        v17.WorldPosition = l_v17_Attribute_0;
        v16[v17] = {
            start = l_v17_Attribute_0, 
            target = v18.WorldPosition
        };
    end);
    local v20 = {};
    v2:IterateClass(l_PrimaryPart_0, "Model", function(v21) --[[ Line: 52 ]]
        -- upvalues: v20 (copy)
        if not string.find(v21.Name, "Beam") then
            return;
        else
            local v22 = {};
            for _, v24 in v21:GetChildren() do
                table.insert(v22, v24);
                v24.Enabled = false;
            end;
            v20[string.match(v21.Name, "^(.-)Beams")] = v22;
            return;
        end;
    end, true);
    local v25 = nil;
    local v26 = nil;
    local v27 = select(2, v3.pivotHitPart(l_Attack_0.Hit1, l_PrimaryPart_0));
    v3.pivotHitPart(l_Attack_0.Hit2, l_PrimaryPart_0, CFrame.new(0, -v11, 0));
    v3.pivotHitPart(l_HitAttack_0, l_PrimaryPart_0);
    v25 = l_PrimaryPart_0.AttackBeamEnd;
    local l_AttackBeamStart_L_0 = l_PrimaryPart_0.AttackBeamStart_L;
    local l_v25_Attribute_0 = v25:GetAttribute("Origin");
    if not l_v25_Attribute_0 then
        l_v25_Attribute_0 = v25.Position;
        v25:SetAttribute("Origin", l_v25_Attribute_0);
    end;
    local v30 = Vector3.new(l_v25_Attribute_0.X, l_v25_Attribute_0.Y, l_AttackBeamStart_L_0.Position.Z);
    v25.Position = v30;
    v26 = {
        start = v30, 
        target = Vector3.new(l_v25_Attribute_0.X, l_v25_Attribute_0.Y, -v27)
    };
    v27 = l_HitAttack_0.BeamEndAttachment;
    l_AttackBeamStart_L_0 = v27:GetAttribute("Origin");
    if not l_AttackBeamStart_L_0 then
        l_AttackBeamStart_L_0 = v27.Position;
        v27:SetAttribute("Origin", l_AttackBeamStart_L_0);
    end;
    v27.Position = Vector3.new(l_AttackBeamStart_L_0.X, l_AttackBeamStart_L_0.Y - v11 * 1.25, l_AttackBeamStart_L_0.Z);
    l_AttackBeamStart_L_0 = {};
    for v31 = 1, 6 do
        local v32 = l_HitAttack_0[("BeamStartAttachment%*"):format(v31)];
        local v33 = l_HitAttack_0[("BeamEndAttachment%*"):format(v31)];
        local l_v32_Attribute_0 = v32:GetAttribute("Origin");
        if not l_v32_Attribute_0 then
            l_v32_Attribute_0 = v32.Position;
            v32:SetAttribute("Origin", l_v32_Attribute_0);
        end;
        v32.Position = l_v32_Attribute_0 * v9;
        v33.Position = v32.Position;
        l_AttackBeamStart_L_0[v33] = v32.Position;
    end;
    for v35 = 1, 6 do
        local v36 = l_HitAttack_0[("Attachment%*"):format(v35)];
        local l_v36_Attribute_0 = v36:GetAttribute("Origin");
        if not l_v36_Attribute_0 then
            l_v36_Attribute_0 = v36.Position;
            v36:SetAttribute("Origin", l_v36_Attribute_0);
        end;
        v36.Position = l_v36_Attribute_0 * v9;
    end;
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v38) --[[ Line: 144 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v38);
        v2:AdjustEmitterSpeed(v38, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v39) --[[ Line: 149 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v13, v39);
        v2:AdjustEmitterSpeed(v39, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit1, "ParticleEmitter", function(v40) --[[ Line: 155 ]]
        -- upvalues: v14 (copy), v2 (ref), v10 (copy), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v14, v40);
        if v40:GetAttribute("AdjustSpeedAndSizeMin") then
            v2:AdjustEmitterSpeedAndScale(v40, v10, l_speedMultiplier_0);
            return;
        elseif v40:GetAttribute("AdjustSpeedAndSize") then
            v2:AdjustEmitterSpeedAndScale(v40, v9, l_speedMultiplier_0);
            return;
        elseif v40:GetAttribute("AdjustSize") then
            v2:ScaleEmitterSize(v40, v9);
            v2:AdjustEmitterSpeed(v40, l_speedMultiplier_0);
            return;
        elseif v40:GetAttribute("AdjustSpeed") then
            v2:AdjustEmitterSpeedFromMultiplier(v40, v9, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v40, l_speedMultiplier_0);
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit1, v9);
    l_v25_Attribute_0 = l_Attack_0.Hit2;
    v30 = l_v25_Attribute_0.RottenFood;
    local l_Shockwave_0 = l_v25_Attribute_0.Attachment.Shockwave;
    table.insert(v15, v30);
    table.insert(v15, l_Shockwave_0);
    local v42 = v9 * 0.9;
    v30.Acceleration = v2:SetOriginalEmitterProps(v30).acceleration * v42;
    v2:AdjustEmitterSpeedFromMultiplier(v30, v42, l_speedMultiplier_0);
    v2:ScaleEmitterSize(l_Shockwave_0, v9);
    v2:IterateClass(l_HitAttack_0, "ParticleEmitter", function(v43) --[[ Line: 193 ]]
        -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v14, v43);
        v2:AdjustEmitterSpeed(v43, l_speedMultiplier_0);
        if v43:GetAttribute("AdjustSize") then
            v2:ScaleEmitterSize(v43, v9);
        end;
    end);
    v2:ResizePart(l_HitAttack_0, v9);
    return {
        Charge = function() --[[ Line: 207 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v12 (copy), v20 (copy), v16 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v12, true);
            v2:ToggleInstances(v20.Charge, true);
            for v44, v45 in v16 do
                v2:Tween(v44, TweenInfo.new(0.7 / l_speedMultiplier_0), {
                    WorldPosition = v45.target
                });
            end;
        end, 
        Attack = function() --[[ Line: 220 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v13 (copy), v20 (copy), v25 (ref), l_speedMultiplier_0 (copy), v26 (ref)
            v2:ToggleEmitters(v13, true, true);
            v2:ToggleInstances(v20.Attack, true);
            v2:Tween(v25, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = v26.target
            });
        end, 
        Hit = function() --[[ Line: 231 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v14 (copy), v20 (copy), l_AttackBeamStart_L_0 (copy), l_speedMultiplier_0 (copy), v27 (copy)
            v2:ToggleEmitters(v14, true, true);
            v2:ToggleInstances(v20.Hit, true);
            for v46 in l_AttackBeamStart_L_0 do
                v2:Tween(v46, TweenInfo.new(0.7 / l_speedMultiplier_0), {
                    Position = v27.Position
                });
            end;
        end, 
        Impact = function() --[[ Line: 244 ]] --[[ Name: Impact ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true, true);
        end, 
        StopHit = function() --[[ Line: 248 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v14 (copy), v15 (copy), v13 (copy), v16 (copy), l_speedMultiplier_0 (copy), v20 (copy), v12 (copy), v25 (ref), v26 (ref), l_AttackBeamStart_L_0 (copy), l_Weld_0 (copy)
            v2:ToggleEmitters(v14, false);
            v2:ToggleEmitters(v15, false);
            v2:ToggleEmitters(v13, false);
            local v47 = false;
            for v48, v49 in v16 do
                v2:Tween(v48, TweenInfo.new(1 / l_speedMultiplier_0), {
                    WorldPosition = v49.start
                }, function() --[[ Line: 259 ]]
                    -- upvalues: v47 (ref), v2 (ref), v20 (ref), v12 (ref)
                    if v47 then
                        return;
                    else
                        v47 = true;
                        v2:ToggleInstances(v20.Charge, false);
                        v2:ToggleEmitters(v12, false);
                        return;
                    end;
                end);
            end;
            v2:Tween(v25, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                Position = v26.start
            }, function() --[[ Line: 275 ]]
                -- upvalues: v2 (ref), v20 (ref)
                v2:ToggleInstances(v20.Attack, false);
            end);
            local v50 = false;
            for v51, v52 in l_AttackBeamStart_L_0 do
                v2:Tween(v51, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                    Position = v52
                }, function() --[[ Line: 286 ]]
                    -- upvalues: v50 (ref), v2 (ref), v20 (ref), l_Weld_0 (ref)
                    if v50 then
                        return;
                    else
                        v50 = true;
                        v2:ToggleInstances(v20.Hit, false);
                        l_Weld_0.C1 = CFrame.identity;
                        return;
                    end;
                end);
            end;
        end
    };
end;