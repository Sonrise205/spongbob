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
    local l_BeamStartAttachment_L_0 = l_PrimaryPart_0.BeamStartAttachment_L;
    local l_BeamEndAttachment_L_0 = l_PrimaryPart_0.BeamEndAttachment_L;
    local l_BeamStartAttachment_R_0 = l_PrimaryPart_0.BeamStartAttachment_R;
    local l_BeamEndAttachment_R_0 = l_PrimaryPart_0.BeamEndAttachment_R;
    local v14 = {};
    l_BeamEndAttachment_L_0.CFrame = l_BeamStartAttachment_L_0.CFrame;
    l_BeamEndAttachment_R_0.CFrame = l_BeamStartAttachment_R_0.CFrame;
    for _, v16 in l_PrimaryPart_0.Beams_Attack:GetChildren() do
        table.insert(v14, v16);
        v16.Enabled = false;
    end;
    local v17 = {};
    local v18 = {};
    local v19 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v20) --[[ Line: 38 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v21) --[[ Line: 43 ]]
        -- upvalues: v18 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v18, v21);
        v2:EmitterSpeedFromDistance(v21, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v22) --[[ Line: 48 ]]
        -- upvalues: v19 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v19, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 54 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true);
        end, 
        Attack = function() --[[ Line: 58 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v18 (copy), v14 (copy), l_speedMultiplier_0 (copy), l_BeamEndAttachment_L_0 (copy), l_Hit_0 (copy), l_BeamEndAttachment_R_0 (copy)
            v2:ToggleEmitters(v18, true, true);
            for _, v24 in v14 do
                v24.Enabled = true;
            end;
            local v25 = TweenInfo.new(0.25 / l_speedMultiplier_0);
            v2:Tween(l_BeamEndAttachment_L_0, v25, {
                WorldCFrame = l_Hit_0.CFrame
            });
            v2:Tween(l_BeamEndAttachment_R_0, v25, {
                WorldCFrame = l_Hit_0.CFrame
            });
        end, 
        Hit = function() --[[ Line: 70 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v19 (copy)
            v2:ToggleEmitters(v19, true, true);
        end, 
        StopAttack = function() --[[ Line: 74 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v18 (copy), l_speedMultiplier_0 (copy), l_BeamEndAttachment_L_0 (copy), l_BeamStartAttachment_L_0 (copy), v14 (copy), l_BeamEndAttachment_R_0 (copy), l_BeamStartAttachment_R_0 (copy)
            v2:ToggleEmitters(v18, false);
            local v26 = TweenInfo.new(0.5 / l_speedMultiplier_0);
            v2:Tween(l_BeamEndAttachment_L_0, v26, {
                CFrame = l_BeamStartAttachment_L_0.CFrame
            }, function() --[[ Line: 79 ]]
                -- upvalues: v14 (ref)
                for _, v28 in v14 do
                    v28.Enabled = false;
                end;
            end);
            v2:Tween(l_BeamEndAttachment_R_0, v26, {
                CFrame = l_BeamStartAttachment_R_0.CFrame
            });
        end, 
        StopHit = function() --[[ Line: 88 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v19 (copy), v17 (copy)
            v2:ToggleEmitters(v19, false);
            v2:ToggleEmitters(v17, false);
        end
    };
end;