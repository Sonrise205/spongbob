local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(40) * 0.5);
    local _ = math.min(v7, 1);
    local v9 = v3.pivotHitPart(l_Attack_0.Hit, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack_0.Hit, l_PrimaryPart_0);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v9.Position);
    local v14 = {};
    local l_BeamStartAttachment_Main_0 = l_PrimaryPart_0.BeamStartAttachment_Main;
    local l_BeamEndAttachment_0 = l_PrimaryPart_0.BeamEndAttachment;
    local v17 = l_BeamEndAttachment_0.CFrame.Rotation + (l_BeamStartAttachment_Main_0.CFrame * CFrame.new(l_v2_2DDistance_0, 0, 0)).Position;
    local v18 = v17.Rotation + l_BeamStartAttachment_Main_0.Position;
    v2:IterateClass(l_PrimaryPart_0.Beams, "Beam", function(v19) --[[ Line: 35 ]]
        -- upvalues: v14 (copy)
        table.insert(v14, v19);
        v19.Enabled = false;
    end);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v20) --[[ Line: 40 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v10, v20);
        v2:AdjustEmitter(v20, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v21) --[[ Line: 45 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v11, v21);
        v2:AdjustEmitter(v21, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v22) --[[ Line: 50 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v12, v22);
        v2:AdjustEmitter(v22, l_speedMultiplier_0, v7);
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    return {
        Charge = function() --[[ Line: 58 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 62 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_Main_0 (copy), v14 (copy), l_speedMultiplier_0 (copy), v17 (copy)
            v2:ToggleEmitters(v11, true, true);
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_Main_0.CFrame;
            for _, v24 in v14 do
                v24.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.3 / l_speedMultiplier_0), {
                CFrame = v17
            });
        end, 
        Hit = function() --[[ Line: 77 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopHit = function() --[[ Line: 81 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v11 (copy), l_speedMultiplier_0 (copy), l_BeamEndAttachment_0 (copy), v18 (copy), v14 (copy), v12 (copy), v10 (copy)
            v2:ToggleEmitters(v11, false);
            local v25 = 0.2 / l_speedMultiplier_0;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(v25), {
                CFrame = v18
            }, function() --[[ Line: 90 ]]
                -- upvalues: v14 (ref)
                for _, v27 in v14 do
                    v27.Enabled = false;
                end;
            end);
            task.wait(0.18 / l_speedMultiplier_0);
            v2:JustEmit(v12);
            v2:ToggleEmitters(v12, false);
            task.wait(0.25 / l_speedMultiplier_0);
            v2:ToggleEmitters(v10, false);
        end
    };
end;