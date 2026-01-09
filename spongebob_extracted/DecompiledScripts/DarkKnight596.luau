local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_Impact_0 = l_Attack_0.Impact;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v9 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local _ = v3.pivotHitPart(l_Impact_0, l_PrimaryPart_0);
    local _ = v2:Get2DDistance(l_Attack_0.Impact.Position, v9.Position);
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local v14 = {};
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    for _, v16 in l_PrimaryPart_0.Beams:GetChildren() do
        table.insert(v14, v16);
        v16.Enabled = false;
    end;
    local v17 = {};
    local _ = {};
    local v19 = {};
    local v20 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 36 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v21);
        v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v22) --[[ Line: 41 ]]
        -- upvalues: v19 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v19, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Impact, "ParticleEmitter", function(v23) --[[ Line: 46 ]]
        -- upvalues: v20 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v20, v23);
        v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 57 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true);
        end, 
        Attack = function() --[[ Line: 61 ]] --[[ Name: Attack ]]
            -- upvalues: v14 (copy), v2 (ref), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_Hit_0 (copy)
            for _, v25 in v14 do
                v25.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                WorldCFrame = l_Hit_0.CFrame
            });
        end, 
        Hit = function() --[[ Line: 71 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v19 (copy), v20 (copy)
            v2:ToggleEmitters(v19, true, true);
            v2:ToggleEmitters(v20, true, true);
        end, 
        StopAttack = function() --[[ Line: 76 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v17 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v14 (copy)
            v2:ToggleEmitters(v17, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 79 ]]
                -- upvalues: v14 (ref)
                for _, v27 in v14 do
                    v27.Enabled = false;
                end;
            end);
        end, 
        StopHit = function() --[[ Line: 86 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v19 (copy), v20 (copy)
            v2:ToggleEmitters(v19, false);
            v2:ToggleEmitters(v20, false);
        end
    };
end;