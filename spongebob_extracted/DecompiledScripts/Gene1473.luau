local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_Attack1_0 = l_Attack_0.Attack1;
    local l_Attack2_0 = l_Attack_0.Attack2;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v10, v11 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack1_0.Position, v10.Position);
    l_Attack2_0:FindFirstChildOfClass("Weld").C0 = v3.getHitPivot(l_Attack2_0):ToObjectSpace(l_PrimaryPart_0.CFrame);
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local l_StartAttachment_0 = l_Attack1_0.StartAttachment;
    local l_EndAttachment_0 = l_Attack1_0.EndAttachment;
    local l_StartAttachment_1 = l_Attack2_0.StartAttachment;
    local l_EndAttachment_1 = l_Attack2_0.EndAttachment;
    local l_Beam_0 = l_Attack1_0.Beam;
    local l_Beam_1 = l_Attack2_0.Beam;
    local l_CFrame_0 = l_StartAttachment_0.CFrame;
    local l_CFrame_1 = l_StartAttachment_1.CFrame;
    local v25 = nil;
    local v26 = nil;
    l_Beam_0.Enabled = false;
    l_Beam_1.Enabled = false;
    v2:IterateClass(l_Attack1_0, "ParticleEmitter", function(v27) --[[ Line: 44 ]]
        -- upvalues: v13 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v13, v27);
        v2:EmitterSpeedFromDistance(v27, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack2_0, "ParticleEmitter", function(v28) --[[ Line: 49 ]]
        -- upvalues: v14 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v14, v28);
        v2:EmitterSpeedFromDistance(v28, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack3, "ParticleEmitter", function(v29) --[[ Line: 54 ]]
        -- upvalues: v15 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
        table.insert(v15, v29);
        v2:EmitterSpeedFromDistance(v29, l_v2_2DDistance_0, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v30) --[[ Line: 59 ]]
        -- upvalues: v16 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v16, v30);
        v2:AdjustEmitterSpeed(v30, l_speedMultiplier_0);
    end);
    return {
        Attack1 = function() --[[ Line: 65 ]] --[[ Name: Attack1 ]]
            -- upvalues: v13 (copy), v3 (copy), l_EndAttachment_0 (copy), l_StartAttachment_0 (copy), l_Beam_0 (copy), v25 (ref), v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            for _, v32 in v13 do
                v32:Emit(v3.rng:NextInteger(5, 10));
                v32.Enabled = true;
            end;
            l_EndAttachment_0.CFrame = l_StartAttachment_0.CFrame;
            l_Beam_0.Enabled = true;
            v25 = l_StartAttachment_0.CFrame + Vector3.new(-v11, 0, 0);
            v2:Tween(l_EndAttachment_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = v25
            });
        end, 
        StopAttack1 = function() --[[ Line: 78 ]] --[[ Name: StopAttack1 ]]
            -- upvalues: v2 (ref), v13 (copy), l_StartAttachment_0 (copy), l_speedMultiplier_0 (copy), v25 (ref), l_Beam_0 (copy), l_CFrame_0 (copy)
            v2:ToggleEmitters(v13, false);
            v2:Tween(l_StartAttachment_0, TweenInfo.new(0.7 / l_speedMultiplier_0), {
                CFrame = v25
            }, function() --[[ Line: 81 ]]
                -- upvalues: l_Beam_0 (ref), l_StartAttachment_0 (ref), l_CFrame_0 (ref)
                l_Beam_0.Enabled = false;
                l_StartAttachment_0.CFrame = l_CFrame_0;
            end);
        end, 
        Hit = function() --[[ Line: 87 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v16 (copy)
            v2:ToggleEmitters(v16, true);
        end, 
        Attack2 = function() --[[ Line: 91 ]] --[[ Name: Attack2 ]]
            -- upvalues: v14 (copy), v3 (copy), l_EndAttachment_1 (copy), l_StartAttachment_1 (copy), l_Beam_1 (copy), v26 (ref), v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
            for _, v34 in v14 do
                v34:Emit(v3.rng:NextInteger(5, 10));
                v34.Enabled = true;
            end;
            l_EndAttachment_1.CFrame = l_StartAttachment_1.CFrame;
            l_Beam_1.Enabled = true;
            v26 = l_StartAttachment_1.CFrame + Vector3.new(-v11, 0, 0);
            v2:Tween(l_EndAttachment_1, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = v26
            });
        end, 
        StopAttack2 = function() --[[ Line: 104 ]] --[[ Name: StopAttack2 ]]
            -- upvalues: v2 (ref), v14 (copy), v16 (copy), l_StartAttachment_1 (copy), l_speedMultiplier_0 (copy), v26 (ref), l_Beam_1 (copy), l_CFrame_1 (copy)
            v2:ToggleEmitters(v14, false);
            v2:ToggleEmitters(v16, false);
            v2:Tween(l_StartAttachment_1, TweenInfo.new(0.7 / l_speedMultiplier_0), {
                CFrame = v26
            }, function() --[[ Line: 108 ]]
                -- upvalues: l_Beam_1 (ref), l_StartAttachment_1 (ref), l_CFrame_1 (ref)
                l_Beam_1.Enabled = false;
                l_StartAttachment_1.CFrame = l_CFrame_1;
            end);
        end, 
        Attack3 = function() --[[ Line: 114 ]] --[[ Name: Attack3 ]]
            -- upvalues: v15 (copy), v3 (copy)
            for _, v36 in v15 do
                v36:Emit(v3.rng:NextInteger(3, 6));
            end;
        end
    };
end;