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
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v13) --[[ Line: 24 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v14) --[[ Line: 29 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v15) --[[ Line: 34 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_PrimaryPart_0.BeamStart1, "Beam", function(v16) --[[ Line: 39 ]]
        -- upvalues: v12 (copy)
        table.insert(v12[1], v16);
        v16.Enabled = false;
    end);
    v2:IterateClass(l_PrimaryPart_0.BeamStart2, "Beam", function(v17) --[[ Line: 44 ]]
        -- upvalues: v12 (copy)
        table.insert(v12[2], v17);
        v17.Enabled = false;
    end);
    local v18 = Vector3.new(l_PrimaryPart_0.BeamEnd1.Position.X, 20, -v8 / 2);
    local v19 = Vector3.new(l_PrimaryPart_0.BeamStart2.Position.X, -1.9, -v8);
    l_PrimaryPart_0.BeamEnd1.Position = l_PrimaryPart_0.BeamStart1.Position;
    l_PrimaryPart_0.BeamEnd2.Position = Vector3.new(l_PrimaryPart_0.BeamEnd2.Position.X, 20, -v8 / 2);
    l_PrimaryPart_0.BeamStart2.Position = l_PrimaryPart_0.BeamEnd2.Position;
    return {
        Charge = function() --[[ Line: 57 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Attack1 = function() --[[ Line: 61 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v10 (copy), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v18 (copy), v12 (copy)
            v2:ToggleEmitters(v10, true);
            v2:Tween(l_PrimaryPart_0.BeamEnd1, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                Position = v18
            });
            for _, v21 in v12[1] do
                v21.Enabled = true;
            end;
        end, 
        Attack2 = function() --[[ Line: 75 ]] --[[ Name: Attack2 ]]
            -- upvalues: v12 (copy), v2 (ref), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v19 (copy)
            for _, v23 in v12[2] do
                v23.Enabled = true;
            end;
            v2:Tween(l_PrimaryPart_0.BeamStart2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = v19
            });
        end, 
        Hit = function() --[[ Line: 87 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        StopAttack1 = function() --[[ Line: 91 ]] --[[ Name: StopAttack1 ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v12 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
            v2:Tween(l_PrimaryPart_0.BeamStart2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = l_PrimaryPart_0.BeamEnd2.Position
            }, function() --[[ Line: 99 ]]
                -- upvalues: v12 (ref)
                for _, v25 in v12[2] do
                    v25.Enabled = false;
                end;
            end);
        end, 
        StopAttack2 = function() --[[ Line: 107 ]] --[[ Name: StopAttack2 ]]
            -- upvalues: v2 (ref), v11 (copy), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v12 (copy)
            v2:ToggleEmitters(v11, false);
            v2:Tween(l_PrimaryPart_0.BeamEnd1, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                Position = l_PrimaryPart_0.BeamStart1.Position
            }, function() --[[ Line: 114 ]]
                -- upvalues: v12 (ref)
                for _, v27 in v12[1] do
                    v27.Enabled = false;
                end;
            end);
        end
    };
end;