local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8, v9 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v8.Position);
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    local v13 = {};
    local v14 = {};
    local v15 = {};
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v16) --[[ Line: 27 ]]
        -- upvalues: v13 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v13, v16);
        v2:EmitterSpeedFromDistance(v16, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 32 ]]
        -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy), l_v2_2DDistance_0 (copy), v3 (copy)
        table.insert(v14, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v17, (math.clamp(l_v2_2DDistance_0 / v3.range, 0.4, 1)));
    end);
    for _, v19 in l_PrimaryPart_0.Beams:GetChildren() do
        table.insert(v15, v19);
        v19.Enabled = false;
    end;
    return {
        Attack = function() --[[ Line: 44 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v13 (copy), v15 (copy), l_BeamStartAttachment_0 (copy), v9 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v13, true);
            for _, v21 in v15 do
                v21.Enabled = true;
            end;
            local v22 = l_BeamStartAttachment_0.CFrame + Vector3.new(0, 0, -v9);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.275 / l_speedMultiplier_0), {
                CFrame = v22
            });
        end, 
        Hit = function() --[[ Line: 55 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        StopAttack = function() --[[ Line: 59 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v13 (copy), v14 (copy), v15 (copy)
            v2:ToggleEmitters(v13, false);
            v2:ToggleEmitters(v14, false);
            for _, v24 in v15 do
                v24.Enabled = false;
            end;
        end
    };
end;