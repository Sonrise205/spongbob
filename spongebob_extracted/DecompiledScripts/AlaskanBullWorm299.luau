local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = v3.model.VisualModel.PrimaryPart;
    local l_Head_0 = l_PrimaryPart_0.Root.Spine1.Spine2.Neck.Head;
    local l_BeamStartAttachment_0 = l_Head_0.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_Head_0.BeamEndAttachment;
    local v10 = {};
    local v11 = math.min(v3.range, v2:Get2DDistance(l_Head_0.Position, v3.attackPosition)) * 0.75;
    local l_l_BeamEndAttachment_0_Attribute_0 = l_BeamEndAttachment_0:GetAttribute("OriginalPivot");
    if not l_l_BeamEndAttachment_0_Attribute_0 then
        l_l_BeamEndAttachment_0_Attribute_0 = l_BeamEndAttachment_0.CFrame;
        l_BeamEndAttachment_0:SetAttribute("OriginalPivot", l_l_BeamEndAttachment_0_Attribute_0);
    end;
    local v13 = l_l_BeamEndAttachment_0_Attribute_0.Rotation + Vector3.new(l_l_BeamEndAttachment_0_Attribute_0.X, l_l_BeamEndAttachment_0_Attribute_0.Y, -v11);
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    for _, v15 in l_PrimaryPart_0.Beams:GetChildren() do
        table.insert(v10, v15);
        v15.Enabled = false;
    end;
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local v19 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v20) --[[ Line: 51 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v20);
        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_BeamStartAttachment_0, "ParticleEmitter", function(v21) --[[ Line: 56 ]]
        -- upvalues: v17 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v17, v21);
        v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_BeamEndAttachment_0, "ParticleEmitter", function(v22) --[[ Line: 61 ]]
        -- upvalues: v18 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v18, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v23) --[[ Line: 66 ]]
        -- upvalues: v19 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v19, v23);
        v2:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 72 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true);
        end, 
        Attack1 = function() --[[ Line: 76 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v17 (copy), v18 (copy), v10 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), v13 (copy)
            v2:ToggleEmitters(v17, true);
            v2:ToggleEmitters(v18, true);
            for _, v25 in v10 do
                v25.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                CFrame = v13
            });
        end, 
        StopAttack1 = function() --[[ Line: 91 ]] --[[ Name: StopAttack1 ]]
            -- upvalues: v2 (ref), v17 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v10 (copy)
            v2:ToggleEmitters(v17, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 98 ]]
                -- upvalues: v10 (ref)
                for _, v27 in v10 do
                    v27.Enabled = false;
                end;
            end);
        end, 
        DamageEnd = function() --[[ Line: 106 ]] --[[ Name: DamageEnd ]]
            -- upvalues: v2 (ref), v18 (copy)
            v2:ToggleEmitters(v18, false);
        end, 
        Attack2 = function() --[[ Line: 110 ]] --[[ Name: Attack2 ]]
            -- upvalues: v2 (ref), v19 (copy), v16 (copy)
            v2:ToggleEmitters(v19, true);
            v2:ToggleEmitters(v16, false);
        end
    };
end;