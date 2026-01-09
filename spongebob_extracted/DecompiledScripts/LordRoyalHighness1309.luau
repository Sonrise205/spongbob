local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8 = select(2, v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0)) * 0.6;
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    local v11 = {};
    local v12 = {};
    local v13 = {};
    for _, v15 in l_Attack_0:GetChildren() do
        if v15.Name == "Charge" then
            v2:IterateClass(v15, "ParticleEmitter", function(v16) --[[ Line: 29 ]]
                -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v11, v16);
                v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
            end);
        end;
    end;
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 36 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    for _, v19 in l_PrimaryPart_0.Beams:GetChildren() do
        table.insert(v13, v19);
        v19.Enabled = false;
    end;
    return {
        Charge = function() --[[ Line: 47 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 51 ]] --[[ Name: Attack ]]
            -- upvalues: v13 (copy), l_BeamStartAttachment_0 (copy), v8 (copy), v2 (ref), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy)
            for _, v21 in v13 do
                v21.Enabled = true;
            end;
            local v22 = l_BeamStartAttachment_0.CFrame + Vector3.new(0, 0, -v8);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                CFrame = v22
            });
        end, 
        Hit = function() --[[ Line: 60 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        StopAttack = function() --[[ Line: 64 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v11 (copy), v12 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v13 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v12, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 68 ]]
                -- upvalues: v13 (ref)
                for _, v24 in v13 do
                    v24.Enabled = false;
                end;
            end);
        end
    };
end;