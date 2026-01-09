local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8 = select(2, v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0));
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {
        [1] = {}, 
        [2] = {}
    };
    local v13 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(43) * 0.5);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 29 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v15) --[[ Line: 34 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v16) --[[ Line: 40 ]]
        -- upvalues: v11 (copy), v2 (ref), v13 (copy), l_speedMultiplier_0 (copy)
        table.insert(v11, v16);
        if v16:GetAttribute("AdjustSize") then
            v2:ScaleEmitterSize(v16, v13);
            v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
        elseif v16:GetAttribute("AdjustSpeed") then
            v2:AdjustEmitterSpeedFromMultiplier(v16, v13, l_speedMultiplier_0);
        end;
        if v16.Parent:IsA("BasePart") then
            v16.Rate = v2:SetOriginalEmitterProps(v16).rate * v13;
        end;
    end);
    v2:ResizePart(l_Hit_0, v13);
    v2:IterateClass(l_PrimaryPart_0.Beams1, "Beam", function(v17) --[[ Line: 59 ]]
        -- upvalues: v12 (copy)
        table.insert(v12[1], v17);
        v17.Enabled = false;
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams2, "Beam", function(v18) --[[ Line: 64 ]]
        -- upvalues: v12 (copy)
        table.insert(v12[2], v18);
        v18.Enabled = false;
    end);
    local v19 = Vector3.new(l_PrimaryPart_0.BeamEndAttachment1.Position.X, 30, -v8 / 2);
    local v20 = Vector3.new(l_PrimaryPart_0.BeamStartAttachment2.Position.X, -1.9, -v8);
    l_PrimaryPart_0.BeamEndAttachment1.Position = l_PrimaryPart_0.BeamStartAttachment1.Position;
    l_PrimaryPart_0.BeamEndAttachment2.Position = Vector3.new(l_PrimaryPart_0.BeamEndAttachment2.Position.X, 30, -v8 / 2);
    l_PrimaryPart_0.BeamStartAttachment2.Position = l_PrimaryPart_0.BeamEndAttachment2.Position;
    return {
        Charge = function() --[[ Line: 77 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        StartAttack = function() --[[ Line: 81 ]] --[[ Name: StartAttack ]]
            -- upvalues: v2 (ref), v10 (copy), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v19 (copy), v12 (copy)
            v2:ToggleEmitters(v10, true);
            v2:Tween(l_PrimaryPart_0.BeamEndAttachment1, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                Position = v19
            });
            for _, v22 in v12[1] do
                v22.Enabled = true;
            end;
        end, 
        Attack = function() --[[ Line: 96 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v20 (copy), v12 (copy)
            v2:Tween(l_PrimaryPart_0.BeamEndAttachment2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = v20
            });
            for _, v24 in v12[2] do
                v24.Enabled = true;
            end;
        end, 
        Hit = function() --[[ Line: 110 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true, true);
        end, 
        StopHit = function() --[[ Line: 114 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v11 (copy), v10 (copy), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v12 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v10, false);
            v2:Tween(l_PrimaryPart_0.BeamEndAttachment2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = l_PrimaryPart_0.BeamStartAttachment2.Position
            }, function() --[[ Line: 122 ]]
                -- upvalues: v12 (ref)
                for _, v26 in v12[2] do
                    v26.Enabled = false;
                end;
            end);
        end, 
        StopAttack = function() --[[ Line: 130 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy), v12 (copy)
            v2:ToggleEmitters(v9, false);
            for _, v28 in v12[1] do
                v28.Enabled = false;
            end;
        end
    };
end;