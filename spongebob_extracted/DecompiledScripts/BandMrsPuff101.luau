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
    local v10 = {};
    local v11 = select(2, v3.getHitPivot(l_PrimaryPart_0));
    local v12 = math.max(1, v11 - v2:Get2DDistance(v3.pivot.Position, l_Attack_0.Attack1.Position)) * 0.8;
    local v13 = math.clamp(v12 / v3.getScaledEffectRange(14), 0.25, 1);
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local l_CFrame_0 = l_BeamEndAttachment_0.CFrame;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v17) --[[ Line: 31 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack2.Attack, "ParticleEmitter", function(v18) --[[ Line: 36 ]]
        -- upvalues: v9 (copy), v2 (ref), v12 (copy), l_speedMultiplier_0 (copy), v13 (copy)
        table.insert(v9, v18);
        v2:EmitterSpeedFromDistance(v18, v12, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v18, v13, true);
    end);
    v2:IterateClass(l_Attack_0.Attack2.Attachment, "ParticleEmitter", function(v19) --[[ Line: 42 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v19);
        v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v20) --[[ Line: 47 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v21) --[[ Line: 52 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v21);
        v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams, "Beam", function(v22) --[[ Line: 57 ]]
        -- upvalues: v10 (copy)
        table.insert(v10, v22);
        v22.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 63 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        ChargeAttack = function() --[[ Line: 67 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        StopChargeAttack = function() --[[ Line: 71 ]] --[[ Name: StopChargeAttack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, false);
        end, 
        Attack = function() --[[ Line: 75 ]] --[[ Name: Attack ]]
            -- upvalues: l_BeamEndAttachment_0 (copy), l_CFrame_0 (copy), v11 (copy), v2 (ref), v10 (copy), v9 (copy)
            l_BeamEndAttachment_0.CFrame = CFrame.new(l_CFrame_0.X, l_CFrame_0.Y, -v11);
            v2:ToggleInstances(v10, true);
            v2:ToggleEmitters(v9, true);
        end, 
        StopAttack = function() --[[ Line: 86 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), v7 (copy), v9 (copy)
            v2:ToggleInstances(v10, false);
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;