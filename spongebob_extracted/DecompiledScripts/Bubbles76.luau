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
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local v12 = {};
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    for _, v14 in l_PrimaryPart_0.Beams:GetChildren() do
        table.insert(v12, v14);
        v14.Enabled = false;
    end;
    local v15 = {};
    local v16 = {};
    local v17 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v18) --[[ Line: 33 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v18);
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v19) --[[ Line: 38 ]]
        -- upvalues: v16 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v16, v19);
        v2:EmitterSpeedFromDistance(v19, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v20) --[[ Line: 43 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 49 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true);
        end, 
        Attack = function() --[[ Line: 53 ]] --[[ Name: Attack ]]
            -- upvalues: v12 (copy), v2 (ref), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), v8 (copy)
            for _, v22 in v12 do
                v22.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                WorldCFrame = v8
            });
        end, 
        Hit = function() --[[ Line: 61 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true);
        end, 
        StopAttack = function() --[[ Line: 65 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v16 (copy), v15 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v12 (copy)
            v2:ToggleEmitters(v16, false);
            v2:ToggleEmitters(v15, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 69 ]]
                -- upvalues: v12 (ref)
                for _, v24 in v12 do
                    v24.Enabled = false;
                end;
            end);
        end, 
        StopHit = function() --[[ Line: 76 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, false);
        end
    };
end;