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
    local v9 = {
        [1] = {}, 
        [2] = {}
    };
    local v10 = {};
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local l_CFrame_0 = l_BeamEndAttachment_0.CFrame;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    local v14 = v3.getHitPivot(l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v14.Position);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v16) --[[ Line: 31 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v17) --[[ Line: 36 ]]
        -- upvalues: v8 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v8, v17);
        v2:EmitterSpeedFromDistance(v17, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit1, "ParticleEmitter", function(v18) --[[ Line: 41 ]]
        -- upvalues: v9 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v9[1], v18);
        v2:EmitterSpeedFromDistance(v18, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit2, "ParticleEmitter", function(v19) --[[ Line: 46 ]]
        -- upvalues: v9 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v9[2], v19);
        v2:EmitterSpeedFromDistance(v19, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_PrimaryPart_0, "Beam", function(v20) --[[ Line: 51 ]]
        -- upvalues: v10 (copy)
        table.insert(v10, v20);
        v20.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 57 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Hit1 = function() --[[ Line: 61 ]] --[[ Name: Hit1 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:JustEmit(v9[1]);
        end, 
        Hit2 = function() --[[ Line: 65 ]] --[[ Name: Hit2 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:JustEmit(v9[2]);
        end, 
        Attack = function() --[[ Line: 69 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy), v10 (copy), l_BeamEndAttachment_0 (copy), l_CFrame_0 (copy), v3 (copy)
            v2:ToggleEmitters(v8, true, true);
            v2:ToggleInstances(v10, true);
            l_BeamEndAttachment_0.CFrame = CFrame.new(l_CFrame_0.X, l_CFrame_0.Y, -v3.range);
        end, 
        StopAttack = function() --[[ Line: 80 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), v7 (copy), v10 (copy), l_BeamEndAttachment_0 (copy), l_CFrame_0 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v7, false);
            v2:ToggleInstances(v10, false);
            l_BeamEndAttachment_0.CFrame = l_CFrame_0;
        end
    };
end;