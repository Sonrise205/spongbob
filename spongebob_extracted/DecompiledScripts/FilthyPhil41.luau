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
    local v11 = {
        [1] = {}, 
        [2] = {}
    };
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 23 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v13) --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_PrimaryPart_0.BeamStart1, "Beam", function(v14) --[[ Line: 33 ]]
        -- upvalues: v11 (copy)
        table.insert(v11[1], v14);
        v14.Enabled = false;
    end);
    v2:IterateClass(l_PrimaryPart_0.BeamStart2, "Beam", function(v15) --[[ Line: 38 ]]
        -- upvalues: v11 (copy)
        table.insert(v11[2], v15);
        v15.Enabled = false;
    end);
    local v16 = Vector3.new(l_PrimaryPart_0.BeamEnd1.Position.X, 14, -v8 / 2);
    local v17 = Vector3.new(l_PrimaryPart_0.BeamStart2.Position.X, -1.9, -v8);
    l_PrimaryPart_0.BeamEnd1.Position = l_PrimaryPart_0.BeamStart1.Position;
    l_PrimaryPart_0.BeamEnd2.Position = Vector3.new(l_PrimaryPart_0.BeamEnd2.Position.X, 14, -v8 / 2);
    l_PrimaryPart_0.BeamStart2.Position = l_PrimaryPart_0.BeamEnd2.Position;
    local function v20() --[[ Line: 50 ]] --[[ Name: startBeam1Effect ]]
        -- upvalues: v2 (ref), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v16 (copy), v11 (copy)
        v2:Tween(l_PrimaryPart_0.BeamEnd1, TweenInfo.new(0.35 / l_speedMultiplier_0), {
            Position = v16
        });
        for _, v19 in v11[1] do
            v19.Enabled = true;
        end;
    end;
    local function v23() --[[ Line: 62 ]] --[[ Name: startBeam2Effect ]]
        -- upvalues: v11 (copy), v2 (ref), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v17 (copy)
        for _, v22 in v11[2] do
            v22.Enabled = true;
        end;
        v2:Tween(l_PrimaryPart_0.BeamStart2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
            Position = v17
        });
    end;
    local function v26() --[[ Line: 74 ]] --[[ Name: stopBeam1Effect ]]
        -- upvalues: v2 (ref), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v11 (copy)
        v2:Tween(l_PrimaryPart_0.BeamEnd1, TweenInfo.new(0.25 / l_speedMultiplier_0), {
            Position = l_PrimaryPart_0.BeamStart1.Position
        }, function() --[[ Line: 79 ]]
            -- upvalues: v11 (ref)
            for _, v25 in v11[1] do
                v25.Enabled = false;
            end;
        end);
    end;
    local function v29() --[[ Line: 87 ]] --[[ Name: stopBeam2Effect ]]
        -- upvalues: v2 (ref), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v11 (copy)
        v2:Tween(l_PrimaryPart_0.BeamStart2, TweenInfo.new(0.25 / l_speedMultiplier_0), {
            Position = l_PrimaryPart_0.BeamEnd2.Position
        }, function() --[[ Line: 92 ]]
            -- upvalues: v11 (ref)
            for _, v28 in v11[2] do
                v28.Enabled = false;
            end;
        end);
    end;
    return {
        Charge = function() --[[ Line: 101 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Attack = function() --[[ Line: 105 ]] --[[ Name: Attack ]]
            -- upvalues: v20 (copy), l_speedMultiplier_0 (copy), v23 (copy)
            v20();
            task.wait(0.08 / l_speedMultiplier_0);
            v23();
        end, 
        Hit = function() --[[ Line: 111 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true, true);
        end, 
        StopAttack = function() --[[ Line: 115 ]] --[[ Name: StopAttack ]]
            -- upvalues: v29 (copy), l_speedMultiplier_0 (copy), v26 (copy)
            v29();
            task.wait(0.1 / l_speedMultiplier_0);
            v26();
        end, 
        StopHit = function() --[[ Line: 121 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy), v9 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;