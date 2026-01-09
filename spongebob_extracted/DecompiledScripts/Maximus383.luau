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
    local v10 = l_PrimaryPart_0.CFrame * CFrame.new(0, 0, -v3.range);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v10);
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local l_CFrame_0 = l_BeamEndAttachment_0.CFrame;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v15) --[[ Line: 26 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v16) --[[ Line: 31 ]]
        -- upvalues: v8 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v8, v16);
        if v16:GetAttribute("AdjustSpeed") then
            v2:EmitterSpeedFromDistance(v16, l_v2_2DDistance_0, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
            return;
        end;
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams, "Beam", function(v17) --[[ Line: 41 ]]
        -- upvalues: v9 (copy)
        table.insert(v9, v17);
        v17.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 47 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 51 ]] --[[ Name: Attack ]]
            -- upvalues: l_BeamEndAttachment_0 (copy), l_CFrame_0 (copy), v3 (copy), v2 (ref), v9 (copy), v8 (copy)
            l_BeamEndAttachment_0.CFrame = CFrame.new(l_CFrame_0.X, l_CFrame_0.Y, -v3.range);
            v2:ToggleInstances(v9, true);
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopAttack = function() --[[ Line: 62 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy), v8 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy)
            v2:ToggleInstances(v9, false);
            v2:ToggleEmitters(v8, false);
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
        end, 
        StopCharge = function() --[[ Line: 68 ]] --[[ Name: StopCharge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, false);
        end
    };
end;