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
    local v11 = l_PrimaryPart_0.CFrame * CFrame.new(0, 0, -v3.range);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v11);
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local l_CFrame_0 = l_BeamEndAttachment_0.CFrame;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v16) --[[ Line: 27 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 32 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v18) --[[ Line: 37 ]]
        -- upvalues: v8 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v8, v18);
        if v18:GetAttribute("AdjustSpeed") then
            v2:EmitterSpeedFromDistance(v18, l_v2_2DDistance_0, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
            return;
        end;
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams, "Beam", function(v19) --[[ Line: 47 ]]
        -- upvalues: v10 (copy)
        table.insert(v10, v19);
        v19.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 53 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 57 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_CFrame_0 (copy), v3 (copy), v8 (copy)
            v2:ToggleInstances(v10, true);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                CFrame = CFrame.new(l_CFrame_0.X, l_CFrame_0.Y, -v3.range)
            });
            v2:ToggleEmitters(v8, true, true);
        end, 
        Hit = function() --[[ Line: 71 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true, true);
        end, 
        StopAttack = function() --[[ Line: 75 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v10 (copy), v7 (copy)
            v2:ToggleEmitters(v8, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 80 ]]
                -- upvalues: v2 (ref), v10 (ref)
                v2:ToggleInstances(v10, false);
            end);
            task.wait(0.75 / l_speedMultiplier_0);
            v2:ToggleEmitters(v7, false);
        end
    };
end;