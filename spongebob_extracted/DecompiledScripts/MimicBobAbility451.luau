local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit1_0 = l_Attack_0.Hit1;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_PrimaryPart_1 = v3.model.VisualModel.PrimaryPart;
    v3.pivotHitPart(l_Hit1_0, l_PrimaryPart_0);
    local v9 = v3.attackInfo.AttackStyles[2].Size / (v3.getScaledEffectRange(10) * 0.5);
    local l_BeamStartAttachment_0 = l_PrimaryPart_1.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_PrimaryPart_1.BeamEndAttachment;
    local v12 = {};
    l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
    for _, v14 in l_PrimaryPart_1.Beams:GetChildren() do
        table.insert(v12, v14);
        v14.Enabled = false;
    end;
    local v15 = {};
    local v16 = {};
    v2:IterateClass(l_Attack_0.Charge1, "ParticleEmitter", function(v17) --[[ Line: 38 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit1_0, "ParticleEmitter", function(v18) --[[ Line: 43 ]]
        -- upvalues: v16 (copy), v2 (ref), v9 (copy), l_speedMultiplier_0 (copy)
        table.insert(v16, v18);
        local v19 = nil;
        if v18.Parent:IsA("BasePart") then
            v19 = v2:SetOriginalEmitterProps(v18);
            v19.rate = v19.rate * v9;
        end;
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0, v19);
    end);
    v2:ResizePart(l_Hit1_0, v9);
    local _ = function(v20) --[[ Line: 57 ]] --[[ Name: toggleBeams ]]
        -- upvalues: v12 (copy)
        for _, v22 in v12 do
            v22.Enabled = v20;
        end;
    end;
    return {
        Charge = function() --[[ Line: 64 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true);
        end, 
        Attack = function() --[[ Line: 68 ]] --[[ Name: Attack ]]
            -- upvalues: v12 (copy), v2 (ref), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_Hit1_0 (copy)
            for _, v25 in v12 do
                v25.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.17 / l_speedMultiplier_0), {
                WorldCFrame = l_Hit1_0.CFrame
            });
        end, 
        Hit = function() --[[ Line: 73 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true, true);
        end, 
        StopAttack = function() --[[ Line: 77 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v15 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v12 (copy)
            v2:ToggleEmitters(v15, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 80 ]]
                -- upvalues: v12 (ref)
                for _, v27 in v12 do
                    v27.Enabled = false;
                end;
            end);
        end, 
        StopHit = function() --[[ Line: 85 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, false);
        end
    };
end;