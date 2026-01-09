local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.BezierTweens);
local v2 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy)
    local l_speedMultiplier_0 = v5.speedMultiplier;
    local l_Attack_0 = v5.model.VFX.Attack;
    local l_VisualModel_0 = v5.model.VisualModel;
    local l_BeamStart_0 = l_VisualModel_0.RootPart["mixamorig:Hips"].BeamStart;
    local l_Body_0 = l_VisualModel_0.Body;
    local v11 = v5.getScaledEffectRange(55);
    local v12 = v5.range / (v11 * 0.5);
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    table.insert(v13, (l_BeamStart_0:FindFirstChildOfClass("ParticleEmitter")));
    local v17 = v5.getScaledEffectRange(25);
    v4:IterateClass(l_Body_0, "Attachment", function(v18) --[[ Line: 33 ]]
        -- upvalues: v13 (copy), v4 (ref), l_speedMultiplier_0 (copy), l_BeamStart_0 (copy), v17 (copy), v16 (copy)
        local v19 = tonumber(string.match(v18.Name, "%d+"));
        if not v19 then
            return;
        else
            local l_ParticleEmitter_0 = v18:FindFirstChildOfClass("ParticleEmitter");
            if not l_ParticleEmitter_0 then
                return;
            else
                table.insert(v13, l_ParticleEmitter_0);
                v4:AdjustEmitterSpeed(l_ParticleEmitter_0, l_speedMultiplier_0);
                local l_v18_Attribute_0 = v18:GetAttribute("Target");
                if not l_v18_Attribute_0 then
                    l_v18_Attribute_0 = v18.CFrame;
                    v18:SetAttribute("Target", l_v18_Attribute_0);
                end;
                local v22 = l_BeamStart_0.CFrame:Lerp(l_v18_Attribute_0, 0.5).Position + Vector3.new(0, 1, 0, 0) * v17;
                local v23 = {
                    l_BeamStart_0.Position, 
                    v22, 
                    l_v18_Attribute_0.Position
                };
                v18.Position = l_BeamStart_0.Position;
                v16[v19] = {
                    attachment = v18, 
                    waypoints = v23
                };
                return;
            end;
        end;
    end);
    local v24 = {};
    for _, v26 in l_Body_0.Beams:GetChildren() do
        local v27 = tonumber(string.match(v26.Name, "%d+"));
        if v27 then
            local l_v26_Attribute_0 = v26:GetAttribute("TargetCurve");
            if not l_v26_Attribute_0 then
                l_v26_Attribute_0 = v26.CurveSize0;
                v26:SetAttribute("TargetCurve", l_v26_Attribute_0);
            end;
            v24[v27] = {
                beam = v26, 
                curve = l_v26_Attribute_0
            };
            v26.Enabled = false;
            v26.CurveSize0 = 0;
            v26.CurveSize1 = 0;
        end;
    end;
    v4:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v29) --[[ Line: 95 ]]
        -- upvalues: v14 (copy), v4 (ref), l_speedMultiplier_0 (copy)
        table.insert(v14, v29);
        v4:AdjustEmitterSpeed(v29, l_speedMultiplier_0);
    end);
    v4:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v30) --[[ Line: 101 ]]
        -- upvalues: v15 (copy), v4 (ref), v12 (copy), l_speedMultiplier_0 (copy)
        table.insert(v15, v30);
        local v31 = v30.Parent:IsA("Attachment");
        if v30:GetAttribute("AdjustSpeedAndSize") then
            v4:AdjustEmitterSpeedAndScale(v30, v12, l_speedMultiplier_0);
            return;
        elseif v30:GetAttribute("AdjustSpeed") then
            v4:AdjustEmitterSpeedFromMultiplier(v30, v12, l_speedMultiplier_0);
            return;
        elseif v30:GetAttribute("AdjustSize") then
            local v32 = if v31 then v12 else math.min(v12, 1);
            v4:ScaleEmitterSize(v30, v32);
            return;
        else
            v4:AdjustEmitterSpeed(v30, l_speedMultiplier_0);
            return;
        end;
    end);
    v4:ResizePart(l_Attack_0.Hit, v12);
    return {
        Charge = function() --[[ Line: 124 ]] --[[ Name: Charge ]]
            -- upvalues: v4 (ref), v13 (copy), v16 (copy), v1 (ref), l_speedMultiplier_0 (copy), v24 (copy)
            v4:ToggleEmitters(v13, true);
            for _, v34 in v16 do
                v1.Create(v34.attachment, {
                    Waypoints = v34.waypoints, 
                    Time = 0.5 / l_speedMultiplier_0, 
                    EasingStyle = Enum.EasingStyle.Quad, 
                    EasingDirection = Enum.EasingDirection.Out
                }):Play();
            end;
            for _, v36 in v24 do
                v36.beam.Enabled = true;
                v4:Tween(v36.beam, TweenInfo.new(0.5 / l_speedMultiplier_0, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    CurveSize0 = v36.curve, 
                    CurveSize1 = v36.curve
                });
            end;
        end, 
        Attack = function() --[[ Line: 157 ]] --[[ Name: Attack ]]
            -- upvalues: v4 (ref), v14 (copy)
            v4:ToggleEmitters(v14, true);
        end, 
        Hit = function() --[[ Line: 161 ]] --[[ Name: Hit ]]
            -- upvalues: v4 (ref), v15 (copy)
            v4:ToggleEmitters(v15, true, true);
        end, 
        StopCharge = function() --[[ Line: 165 ]] --[[ Name: StopCharge ]]
            -- upvalues: v4 (ref), v13 (copy), v16 (copy), v1 (ref), v2 (ref), l_speedMultiplier_0 (copy), v24 (copy)
            v4:ToggleEmitters(v13, false);
            for _, v38 in v16 do
                v1.Create(v38.attachment, {
                    Waypoints = v2.Reverse(v38.waypoints), 
                    Time = 0.35 / l_speedMultiplier_0, 
                    EasingStyle = Enum.EasingStyle.Quad, 
                    EasingDirection = Enum.EasingDirection.In
                }):Play();
                for _, v40 in v24 do
                    v40.beam.Enabled = true;
                    v4:Tween(v40.beam, TweenInfo.new(0.35 / l_speedMultiplier_0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        CurveSize0 = 0, 
                        CurveSize1 = 0
                    }, function() --[[ Line: 193 ]]
                        -- upvalues: v40 (copy)
                        v40.beam.Enabled = false;
                    end);
                end;
            end;
        end, 
        StopHit = function() --[[ Line: 201 ]] --[[ Name: StopHit ]]
            -- upvalues: v4 (ref), v15 (copy)
            v4:ToggleEmitters(v15, false);
        end
    };
end;