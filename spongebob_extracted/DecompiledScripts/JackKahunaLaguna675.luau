local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(40) * 0.5);
    local v8 = math.min(v7, 1);
    local v9 = v3.pivotHitPart(l_Attack_0.Hit, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack_0.Impact, l_PrimaryPart_0);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v9.Position);
    local v15 = {};
    local l_BeamStartAttachment_Main_0 = l_PrimaryPart_0.BeamStartAttachment_Main;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local v18 = l_BeamEndAttachment_0.CFrame.Rotation + (l_BeamStartAttachment_Main_0.CFrame * CFrame.new(l_v2_2DDistance_0, 0, 0)).Position;
    local v19 = v18.Rotation + l_BeamStartAttachment_Main_0.Position;
    v2:IterateClass(l_PrimaryPart_0.Beams, "Beam", function(v20) --[[ Line: 34 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v20);
        v20.Enabled = false;
    end);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 39 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v21);
        v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v22) --[[ Line: 44 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Impact, "ParticleEmitter", function(v23) --[[ Line: 49 ]]
        -- upvalues: v12 (copy), v2 (ref), v8 (copy), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v12, v23);
        v2:ScaleEmitterSize(v23, v8);
        v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
        if v23.Parent:IsA("BasePart") then
            v23.Rate = v2:SetOriginalEmitterProps(v23).rate * v7;
        end;
    end);
    v2:ResizePart(l_Attack_0.Impact, v7);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v24) --[[ Line: 61 ]]
        -- upvalues: v13 (copy), v2 (ref), v7 (copy), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v13, v24);
        if v24:GetAttribute("AdjustSize") then
            v2:ScaleEmitterSize(v24, v7);
            v2:AdjustEmitterSpeed(v24, l_speedMultiplier_0);
        elseif v24:GetAttribute("AdjustSpeed") then
            v2:AdjustEmitterSpeedFromMultiplier(v24, v7, l_speedMultiplier_0);
        elseif v24:GetAttribute("AdjustSizeMin") then
            v2:ScaleEmitterSize(v24, v8);
            v2:AdjustEmitterSpeed(v24, l_speedMultiplier_0);
        end;
        if v24.Parent:IsA("BasePart") then
            v24.Rate = v2:SetOriginalEmitterProps(v24).rate * v7;
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    return {
        Charge = function() --[[ Line: 81 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 85 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy), v12 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_Main_0 (copy), v15 (copy), l_speedMultiplier_0 (copy), v18 (copy)
            v2:ToggleEmitters(v11, true, true);
            v2:ToggleEmitters(v12, true, true);
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_Main_0.CFrame;
            for _, v26 in v15 do
                v26.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.3 / l_speedMultiplier_0), {
                CFrame = v18
            });
        end, 
        Hit = function() --[[ Line: 101 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true, true);
        end, 
        StopHit = function() --[[ Line: 105 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy), v13 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), v19 (copy), v15 (copy), v12 (copy), v11 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v13, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = v19
            }, function() --[[ Line: 113 ]]
                -- upvalues: v15 (ref), v2 (ref), v12 (ref)
                for _, v28 in v15 do
                    v28.Enabled = false;
                end;
                v2:ToggleEmitters(v12, false);
            end);
            task.wait(0.4);
            v2:ToggleEmitters(v11, false);
        end
    };
end;