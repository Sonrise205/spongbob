local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v3 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local v7 = {};
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local l_CFrame_0 = l_Attack_0.PrimaryPart.BeamStartAttachment.CFrame;
    local l_Weld_0 = l_Attack_0.Attack:FindFirstChildOfClass("Weld");
    local l_C0_0 = l_Weld_0.C0;
    for _, v17 in l_Attack_0.PrimaryPart.Beams:GetChildren() do
        table.insert(v11, v17);
    end;
    v2:IterateClass(l_Attack_0.Attack, "Attachment", function(v18) --[[ Line: 32 ]]
        -- upvalues: l_CFrame_0 (copy), v4 (copy), v12 (copy), v9 (copy), v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        local l_v18_Attribute_0 = v18:GetAttribute("Origin");
        if not l_v18_Attribute_0 then
            l_v18_Attribute_0 = v18.CFrame;
            v18:SetAttribute("Origin", l_v18_Attribute_0);
        end;
        v12[v18] = (l_v18_Attribute_0.Rotation + l_CFrame_0.Position) * CFrame.new(0, 0, v4.range) * CFrame.Angles(-1.5707963267948966, 0, 0);
        v18.CFrame = l_v18_Attribute_0.Rotation + l_CFrame_0.Position;
        for _, v21 in v18:GetChildren() do
            if v21.Name == "Finger" then
                table.insert(v9, v21);
                v21.LockedToPart = true;
                v21.Lifetime = NumberRange.new(30);
                v21:SetAttribute("EmitCount", 1);
            else
                table.insert(v8, v21);
                v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
            end;
        end;
    end, true);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v22) --[[ Line: 62 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    local v23 = v4.getScaledEffectRange(42);
    local v24 = v4.range / (v23 * 0.5);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v25) --[[ Line: 71 ]]
        -- upvalues: v10 (copy), v2 (ref), v24 (copy), l_speedMultiplier_0 (copy)
        table.insert(v10, v25);
        if v25.Parent:IsA("Attachment") then
            v2:AdjustEmitterSpeedFromMultiplier(v25, v24, l_speedMultiplier_0);
            return;
        else
            local v26 = v2:SetOriginalEmitterProps(v25);
            v26.rate = v26.rate * v24;
            v2:AdjustEmitterSpeed(v25, l_speedMultiplier_0, v26);
            v2:ScaleEmitterSize(v25, (math.clamp(v24, 0.5, 1)));
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v24);
    return {
        Charge = function() --[[ Line: 88 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 92 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy), v11 (copy), v12 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v8, true);
            v2:ToggleEmitters(v9, true);
            for _, v28 in v11 do
                v28.Enabled = true;
            end;
            for v29, v30 in v12 do
                v2:Tween(v29, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                    CFrame = v30
                });
            end;
        end, 
        Hit = function() --[[ Line: 109 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy), v7 (copy), v3 (ref), l_speedMultiplier_0 (copy), l_Weld_0 (copy), l_C0_0 (copy)
            v2:ToggleEmitters(v10, true, true);
            v2:ToggleEmitters(v7, false);
            v3("NumberValue", 0, TweenInfo.new(2 / l_speedMultiplier_0, Enum.EasingStyle.Linear), {
                Value = -12.566370614359172
            }, function(v31) --[[ Line: 121 ]]
                -- upvalues: l_Weld_0 (ref), l_C0_0 (ref)
                v31 = v31 % 6.283185307179586;
                l_Weld_0.C0 = l_C0_0 * CFrame.Angles(0, v31, 0);
            end):Add(function() --[[ Line: 125 ]]
                -- upvalues: l_Weld_0 (ref), l_C0_0 (ref)
                l_Weld_0.C0 = l_C0_0;
            end);
        end, 
        StopHit = function() --[[ Line: 130 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy), v8 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v8, false);
        end, 
        StopAttack = function() --[[ Line: 135 ]] --[[ Name: StopAttack ]]
            -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), l_CFrame_0 (copy), v11 (copy), v9 (copy)
            for v32 in v12 do
                v2:Tween(v32, TweenInfo.new(0.5 / l_speedMultiplier_0, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    CFrame = l_CFrame_0
                }, function() --[[ Line: 145 ]]
                    -- upvalues: v11 (ref), v9 (ref)
                    for _, v34 in v11 do
                        v34.Enabled = false;
                    end;
                    for _, v36 in v9 do
                        v36:Clear();
                    end;
                end);
            end;
        end
    };
end;