local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_Ultimate_0 = l_Attack_0.Hit_Ultimate;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8 = select(2, v3.pivotHitPart(l_Hit_Ultimate_0, l_PrimaryPart_0));
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {
        [1] = {}, 
        [2] = {}
    };
    local v14 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(43) * 0.5);
    v2:IterateClass(l_Attack_0.Charge_Ultimate, "ParticleEmitter", function(v15) --[[ Line: 30 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack_Ultimate, "ParticleEmitter", function(v16) --[[ Line: 35 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack_Ultimate, "ParticleEmitter", function(v17) --[[ Line: 40 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit_Ultimate_0, "ParticleEmitter", function(v18) --[[ Line: 46 ]]
        -- upvalues: v12 (copy), v2 (ref), v14 (copy), l_speedMultiplier_0 (copy)
        table.insert(v12, v18);
        if v18:GetAttribute("AdjustSize") then
            v2:ScaleEmitterSize(v18, v14);
            v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
        elseif v18:GetAttribute("AdjustSpeed") then
            v2:AdjustEmitterSpeedFromMultiplier(v18, v14, l_speedMultiplier_0);
        end;
        if v18.Parent:IsA("BasePart") then
            v18.Rate = v2:SetOriginalEmitterProps(v18).rate * v14;
        end;
    end);
    v2:ResizePart(l_Hit_Ultimate_0, v14);
    v2:IterateClass(l_PrimaryPart_0.Beams1, "Beam", function(v19) --[[ Line: 65 ]]
        -- upvalues: v13 (copy)
        table.insert(v13[1], v19);
        v19.Enabled = false;
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams2, "Beam", function(v20) --[[ Line: 70 ]]
        -- upvalues: v13 (copy)
        table.insert(v13[2], v20);
        v20.Enabled = false;
    end);
    local v21 = Vector3.new(l_PrimaryPart_0.BeamEndAttachment1.Position.X, 30, -v8 / 2);
    local v22 = Vector3.new(l_PrimaryPart_0.BeamStartAttachment2.Position.X, -1.9, -v8);
    l_PrimaryPart_0.BeamEndAttachment1.Position = l_PrimaryPart_0.BeamStartAttachment1.Position;
    l_PrimaryPart_0.BeamEndAttachment2.Position = Vector3.new(l_PrimaryPart_0.BeamEndAttachment2.Position.X, 30, -v8 / 2);
    l_PrimaryPart_0.BeamStartAttachment2.Position = l_PrimaryPart_0.BeamEndAttachment2.Position;
    return {
        Charge = function() --[[ Line: 83 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        ChargeAttack = function() --[[ Line: 87 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true, true);
        end, 
        Attack = function() --[[ Line: 91 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v21 (copy), v13 (copy), v22 (copy)
            v2:ToggleEmitters(v11, true, true);
            v2:Tween(l_PrimaryPart_0.BeamEndAttachment1, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                Position = v21
            });
            for _, v24 in v13[1] do
                v24.Enabled = true;
            end;
            task.wait(0.135 / l_speedMultiplier_0);
            v2:Tween(l_PrimaryPart_0.BeamEndAttachment2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = v22
            });
            for _, v26 in v13[2] do
                v26.Enabled = true;
            end;
        end, 
        Hit = function() --[[ Line: 117 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopHit = function() --[[ Line: 121 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v11 (copy), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v13 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v11, false);
            v2:Tween(l_PrimaryPart_0.BeamEndAttachment2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = l_PrimaryPart_0.BeamStartAttachment2.Position
            }, function() --[[ Line: 129 ]]
                -- upvalues: v13 (ref)
                for _, v28 in v13[2] do
                    v28.Enabled = false;
                end;
            end);
        end, 
        StopAttack = function() --[[ Line: 137 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy), v13 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
            for _, v30 in v13[1] do
                v30.Enabled = false;
            end;
        end
    };
end;