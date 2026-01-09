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
    local l_Beam_0 = l_PrimaryPart_0.Beam;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    l_Beam_0.Enabled = false;
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    v2:IterateClass(l_Attack_0.Charge1, "ParticleEmitter", function(v18) --[[ Line: 30 ]]
        -- upvalues: v14 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v14, v18);
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge2, "ParticleEmitter", function(v19) --[[ Line: 35 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v19);
        v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v20) --[[ Line: 40 ]]
        -- upvalues: v16 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v16, v20);
        v2:EmitterSpeedFromDistance(v20, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v21) --[[ Line: 45 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v21);
        v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
    end);
    return {
        Charge1 = function() --[[ Line: 51 ]] --[[ Name: Charge1 ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, true);
        end, 
        Charge2 = function() --[[ Line: 55 ]] --[[ Name: Charge2 ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true);
        end, 
        StopCharge = function() --[[ Line: 59 ]] --[[ Name: StopCharge ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, false);
        end, 
        Attack = function() --[[ Line: 63 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v16 (copy), l_Beam_0 (copy), l_BeamStartAttachment_0 (copy), v9 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy)
            v2:ToggleEmitters(v16, true);
            l_Beam_0.Enabled = true;
            local v22 = l_BeamStartAttachment_0.CFrame + Vector3.new(0, 0, -v9);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.7 / l_speedMultiplier_0), {
                CFrame = v22
            });
        end, 
        Hit = function() --[[ Line: 71 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true);
        end, 
        StopAttack = function() --[[ Line: 75 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v14 (copy), v16 (copy), v17 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), l_Beam_0 (copy)
            v2:ToggleEmitters(v14, false);
            v2:ToggleEmitters(v16, false);
            v2:ToggleEmitters(v17, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.7 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 80 ]]
                -- upvalues: l_Beam_0 (ref)
                l_Beam_0.Enabled = false;
            end);
        end
    };
end;