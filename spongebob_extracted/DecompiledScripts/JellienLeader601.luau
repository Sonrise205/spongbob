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
    local _ = v2:Get2DDistance(l_Attack_0.Attack.Position, v8.Position);
    local l_BeamStartAttachment_L_0 = l_PrimaryPart_0.BeamStartAttachment_L;
    local l_BeamEndAttachment_L_0 = l_PrimaryPart_0.BeamEndAttachment_L;
    local l_BeamStartAttachment_R_0 = l_PrimaryPart_0.BeamStartAttachment_R;
    local l_BeamEndAttachment_R_0 = l_PrimaryPart_0.BeamEndAttachment_R;
    local v14 = {};
    local v15 = {};
    l_BeamEndAttachment_L_0.CFrame = l_BeamStartAttachment_L_0.CFrame;
    l_BeamEndAttachment_R_0.CFrame = l_BeamStartAttachment_R_0.CFrame;
    for _, v17 in l_PrimaryPart_0.Beams:GetChildren() do
        v17.Enabled = false;
        if string.find(v17.Name, "_L") ~= nil then
            table.insert(v14, v17);
        else
            table.insert(v15, v17);
        end;
    end;
    local v18 = {};
    local v19 = {};
    local v20 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 44 ]]
        -- upvalues: v18 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v18, v21);
        v2:AdjustEmitter(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v22) --[[ Line: 49 ]]
        -- upvalues: v19 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v19, v22);
        v2:AdjustEmitter(v22, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v23) --[[ Line: 54 ]]
        -- upvalues: v20 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v20, v23);
        v2:AdjustEmitter(v23, l_speedMultiplier_0);
    end);
    local _ = function(v24, v25) --[[ Line: 59 ]] --[[ Name: toggleBeams ]]
        for _, v27 in v25 do
            v27.Enabled = v24;
        end;
    end;
    return {
        Charge = function() --[[ Line: 66 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, true);
        end, 
        Attack = function() --[[ Line: 70 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v19 (copy), v14 (copy), v15 (copy), l_speedMultiplier_0 (copy), l_BeamEndAttachment_L_0 (copy), l_Hit_0 (copy), l_BeamEndAttachment_R_0 (copy)
            v2:ToggleEmitters(v19, true);
            for _, v30 in v14 do
                v30.Enabled = true;
            end;
            for _, v32 in v15 do
                v32.Enabled = true;
            end;
            local v33 = TweenInfo.new(0.5 / l_speedMultiplier_0);
            v2:Tween(l_BeamEndAttachment_L_0, v33, {
                WorldCFrame = l_Hit_0.CFrame
            });
            v2:Tween(l_BeamEndAttachment_R_0, v33, {
                WorldCFrame = l_Hit_0.CFrame
            });
        end, 
        StopAttack = function() --[[ Line: 90 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v18 (copy), v19 (copy), v20 (copy), l_speedMultiplier_0 (copy), l_BeamEndAttachment_L_0 (copy), l_BeamStartAttachment_L_0 (copy), v14 (copy), l_BeamEndAttachment_R_0 (copy), l_BeamStartAttachment_R_0 (copy), v15 (copy)
            v2:ToggleEmitters(v18, false);
            v2:ToggleEmitters(v19, false);
            v2:ToggleEmitters(v20, false);
            local v34 = TweenInfo.new(0.5 / l_speedMultiplier_0);
            v2:Tween(l_BeamEndAttachment_L_0, v34, {
                CFrame = l_BeamStartAttachment_L_0.CFrame
            }, function() --[[ Line: 101 ]]
                -- upvalues: v14 (ref)
                for _, v36 in v14 do
                    v36.Enabled = false;
                end;
            end);
            v2:Tween(l_BeamEndAttachment_R_0, v34, {
                CFrame = l_BeamStartAttachment_R_0.CFrame
            }, function() --[[ Line: 110 ]]
                -- upvalues: v15 (ref)
                for _, v38 in v15 do
                    v38.Enabled = false;
                end;
            end);
        end
    };
end;