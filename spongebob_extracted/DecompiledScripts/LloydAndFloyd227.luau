local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_chairs_0 = v3.model.VisualModel.chairs;
    local v8 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(40) * 0.5);
    local _ = math.min(v8, 1);
    local v10 = v3.pivotHitPart(l_Attack_0.Hit, l_PrimaryPart_0);
    v3.pivotHitPart(l_Attack_0.Hit, l_PrimaryPart_0);
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v10.Position);
    local v15 = {};
    local l_BeamStartAttachment_Main_0 = l_chairs_0.BeamStartAttachment_Main;
    local l_BeamEndAttachment_0 = l_chairs_0.BeamEndAttachment;
    local v18 = l_BeamEndAttachment_0.CFrame.Rotation + (l_BeamStartAttachment_Main_0.CFrame * CFrame.new(l_v2_2DDistance_0, 0, 0)).Position;
    local v19 = v18.Rotation + l_BeamStartAttachment_Main_0.Position;
    v2:IterateClass(l_chairs_0.Beams, "Beam", function(v20) --[[ Line: 35 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v20);
        v20.Enabled = false;
    end);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 40 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v11, v21);
        v2:AdjustEmitter(v21, l_speedMultiplier_0, v8);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v22) --[[ Line: 46 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v12, v22);
        v2:AdjustEmitter(v22, l_speedMultiplier_0, v8);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v23) --[[ Line: 52 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v13, v23);
        v2:AdjustEmitter(v23, l_speedMultiplier_0, v8);
    end);
    v2:ResizePart(l_Attack_0.Hit, v8);
    return {
        Charge = function() --[[ Line: 73 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 77 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_Main_0 (copy), v15 (copy), l_speedMultiplier_0 (copy), v18 (copy)
            v2:ToggleEmitters(v12, true, true);
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_Main_0.CFrame;
            for _, v25 in v15 do
                v25.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.3 / l_speedMultiplier_0), {
                CFrame = v18
            });
        end, 
        Hit = function() --[[ Line: 92 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true, true);
        end, 
        StopHit = function() --[[ Line: 96 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v11 (copy), v13 (copy), l_speedMultiplier_0 (copy), l_BeamEndAttachment_0 (copy), v19 (copy), v15 (copy), v12 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v13, false);
            local v26 = 0.2 / l_speedMultiplier_0;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(v26), {
                CFrame = v19
            }, function() --[[ Line: 106 ]]
                -- upvalues: v15 (ref)
                for _, v28 in v15 do
                    v28.Enabled = false;
                end;
            end);
            task.wait(v26);
            v2:ToggleEmitters(v12, false);
        end
    };
end;