local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = {};
    local v8 = {};
    local v9 = {};
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local l_CFrame_0 = l_BeamEndAttachment_0.CFrame;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    local v13 = v3.getHitPivot(l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v13.Position);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v15) --[[ Line: 26 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v16) --[[ Line: 31 ]]
        -- upvalues: v8 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v8, v16);
        v2:EmitterSpeedFromDistance(v16, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_PrimaryPart_0, "Beam", function(v17) --[[ Line: 36 ]]
        -- upvalues: v9 (copy)
        table.insert(v9, v17);
        v17.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 42 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 46 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_CFrame_0 (copy), v3 (copy)
            v2:ToggleEmitters(v8, true, true);
            v2:ToggleInstances(v9, true);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                CFrame = CFrame.new(l_CFrame_0.X, l_CFrame_0.Y, -v3.range)
            });
        end, 
        StopAttack = function() --[[ Line: 59 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), v7 (copy), v9 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_CFrame_0 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v7, false);
            v2:ToggleInstances(v9, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = l_CFrame_0
            });
        end
    };
end;