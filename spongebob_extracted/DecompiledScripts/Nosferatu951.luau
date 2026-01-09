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
        if v19.Name == "Bats" then
            v2:EmitterSpeedFromDistance(v19, l_v2_2DDistance_0, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
            return;
        end;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v20) --[[ Line: 48 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    local _ = function(v21) --[[ Line: 53 ]] --[[ Name: toggleBeams ]]
        -- upvalues: v12 (copy)
        for _, v23 in v12 do
            v23.Enabled = v21;
        end;
    end;
    return {
        Charge = function() --[[ Line: 60 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true);
        end, 
        Attack = function() --[[ Line: 64 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v16 (copy), v12 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_Hit_0 (copy)
            v2:ToggleEmitters(v16, true);
            for _, v26 in v12 do
                v26.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                WorldCFrame = l_Hit_0.CFrame
            });
        end, 
        Hit = function() --[[ Line: 75 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v17 (copy)
            v2:ToggleEmitters(v17, true, true);
        end, 
        StopAttack = function() --[[ Line: 79 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v15 (copy), v16 (copy), v17 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v12 (copy)
            v2:ToggleEmitters(v15, false);
            v2:ToggleEmitters(v16, false);
            v2:ToggleEmitters(v17, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 88 ]]
                -- upvalues: v12 (ref)
                for _, v28 in v12 do
                    v28.Enabled = false;
                end;
            end);
        end
    };
end;