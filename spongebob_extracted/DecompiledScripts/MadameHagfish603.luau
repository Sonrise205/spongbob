local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = {};
    local _ = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local l_CFrame_0 = l_BeamEndAttachment_0.CFrame;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v15) --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v2 (ref), v3 (copy), l_speedMultiplier_0 (copy)
        table.insert(v9, v15);
        v2:EmitterSpeedFromDistance(v15, v3.range, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v16) --[[ Line: 30 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v17) --[[ Line: 35 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v18) --[[ Line: 40 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v18);
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams, "Beam", function(v19) --[[ Line: 45 ]]
        -- upvalues: v11 (copy)
        table.insert(v11, v19);
        v19.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 51 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Hit = function() --[[ Line: 55 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v9, true);
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 60 ]] --[[ Name: Attack ]]
            -- upvalues: l_BeamEndAttachment_0 (copy), l_CFrame_0 (copy), v3 (copy), v2 (ref), v11 (copy), v9 (copy)
            l_BeamEndAttachment_0.CFrame = CFrame.new(l_CFrame_0.X, l_CFrame_0.Y, -v3.range);
            v2:ToggleInstances(v11, true);
            v2:ToggleEmitters(v9, true, true);
        end, 
        StopAttack = function() --[[ Line: 71 ]] --[[ Name: StopAttack ]]
            -- upvalues: l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), v2 (ref), v11 (copy), v10 (copy), v7 (copy), v9 (copy)
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
            v2:ToggleInstances(v11, false);
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;