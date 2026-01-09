local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_HitRegular_0 = l_Attack_0.HitRegular;
    local v8 = v3.attackInfo.AttackStyles[2].Size / (v3.getScaledEffectRange(14) * 0.5);
    local v9 = v3.pivotHitPart(l_HitRegular_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.AttackT1.Position, v9.Position);
    local l_v2_2DDistance_1 = v2:Get2DDistance(l_Attack_0.AttackT2.Position, v9.Position);
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {
        [1] = {}, 
        [2] = {}
    };
    v2:IterateClass(l_Attack_0.ChargeRegular, "ParticleEmitter", function(v17) --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v17);
        v2:AdjustEmitter(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeT1, "ParticleEmitter", function(v18) --[[ Line: 35 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v13, v18);
        v2:AdjustEmitter(v18, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeT2, "ParticleEmitter", function(v19) --[[ Line: 40 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v13, v19);
        v2:AdjustEmitter(v19, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.AttackT1, "ParticleEmitter", function(v20) --[[ Line: 45 ]]
        -- upvalues: v14 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v14, v20);
        v2:EmitterSpeedFromDistance(v20, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.AttackT2, "ParticleEmitter", function(v21) --[[ Line: 50 ]]
        -- upvalues: v14 (copy), v2 (ref), l_v2_2DDistance_1 (copy), l_speedMultiplier_0 (copy)
        table.insert(v14, v21);
        v2:EmitterSpeedFromDistance(v21, l_v2_2DDistance_1, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_HitRegular_0, "ParticleEmitter", function(v22) --[[ Line: 55 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v15, v22);
        v2:AdjustEmitter(v22, l_speedMultiplier_0, v8);
    end);
    v2:ResizePart(l_HitRegular_0, v8);
    v2:IterateClass(l_PrimaryPart_0.Beams_L, "Beam", function(v23) --[[ Line: 62 ]]
        -- upvalues: v16 (copy)
        table.insert(v16[1], v23);
        v23.Enabled = false;
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams_R, "Beam", function(v24) --[[ Line: 67 ]]
        -- upvalues: v16 (copy)
        table.insert(v16[2], v24);
        v24.Enabled = false;
    end);
    local l_BeamStartAttachment_0 = l_PrimaryPart_0.BeamStartAttachment;
    local l_BeamEndAttachment_L_0 = l_PrimaryPart_0.BeamEndAttachment_L;
    local l_BeamEndAttachment_R_0 = l_PrimaryPart_0.BeamEndAttachment_R;
    local l_Position_0 = l_BeamStartAttachment_0.Position;
    local v29 = {
        l_BeamEndAttachment_L_0.Position, 
        l_BeamEndAttachment_R_0.Position
    };
    l_BeamEndAttachment_L_0.Position = l_Position_0;
    l_BeamEndAttachment_R_0.Position = l_Position_0;
    return {
        Charge = function() --[[ Line: 83 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        ChargeAttack = function() --[[ Line: 87 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v3 (copy), v2 (ref), l_BeamEndAttachment_L_0 (copy), l_speedMultiplier_0 (copy), v29 (copy), l_BeamEndAttachment_R_0 (copy), v16 (copy), v13 (copy)
            v3.dumpster:Add(task.spawn(function() --[[ Line: 88 ]]
                -- upvalues: v2 (ref), l_BeamEndAttachment_L_0 (ref), l_speedMultiplier_0 (ref), v29 (ref), l_BeamEndAttachment_R_0 (ref), v16 (ref), v13 (ref)
                v2:Tween(l_BeamEndAttachment_L_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                    Position = v29[1]
                });
                v2:Tween(l_BeamEndAttachment_R_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                    Position = v29[2]
                });
                for _, v31 in v16 do
                    for _, v33 in v31 do
                        v33.Enabled = true;
                    end;
                end;
                task.wait(0.2 / l_speedMultiplier_0);
                v2:ToggleEmitters(v13, true, true);
            end));
        end, 
        Attack = function() --[[ Line: 113 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v14 (copy), l_BeamEndAttachment_L_0 (copy), l_speedMultiplier_0 (copy), l_Position_0 (copy), v29 (copy), v16 (copy), l_BeamEndAttachment_R_0 (copy)
            v2:ToggleEmitters(v14, true, true);
            v2:Tween(l_BeamEndAttachment_L_0, TweenInfo.new(0.4 / l_speedMultiplier_0), {
                Position = l_Position_0
            }, function() --[[ Line: 120 ]]
                -- upvalues: l_BeamEndAttachment_L_0 (ref), v29 (ref), v16 (ref)
                l_BeamEndAttachment_L_0.Position = v29[1];
                for _, v35 in v16[1] do
                    v35.Enabled = false;
                end;
            end);
            v2:Tween(l_BeamEndAttachment_R_0, TweenInfo.new(0.4 / l_speedMultiplier_0), {
                Position = l_Position_0
            }, function() --[[ Line: 133 ]]
                -- upvalues: l_BeamEndAttachment_R_0 (ref), v29 (ref), v16 (ref)
                l_BeamEndAttachment_R_0.Position = v29[2];
                for _, v37 in v16[2] do
                    v37.Enabled = false;
                end;
            end);
        end, 
        Hit = function() --[[ Line: 143 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v15 (copy)
            v2:ToggleEmitters(v15, true, true);
        end, 
        StopAttack = function() --[[ Line: 147 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:ToggleEmitters(v14, false);
        end, 
        StopHit = function() --[[ Line: 151 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v15 (copy), v12 (copy), v13 (copy)
            v2:ToggleEmitters(v15, false);
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v13, false);
        end
    };
end;