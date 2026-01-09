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
    v2:IterateClass(l_PrimaryPart_0, "Beam", function(v14) --[[ Line: 33 ]]
        -- upvalues: v11 (copy)
        table.insert(v11, v14);
        v14.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 39 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Attack = function() --[[ Line: 43 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), l_PrimaryPart_0 (copy), v8 (copy), v11 (copy)
            v2:ToggleEmitters(v10, true);
            l_PrimaryPart_0.BeamEnd1.Position = Vector3.new(l_PrimaryPart_0.BeamEnd1.Position.X, 30, -v8 / 2);
            l_PrimaryPart_0.BeamEnd2.Position = Vector3.new(l_PrimaryPart_0.BeamEnd2.Position.X, 30, -v8 / 2);
            l_PrimaryPart_0.BeamStart2.Position = Vector3.new(l_PrimaryPart_0.BeamStart2.Position.X, -1.9, -v8);
            for _, v16 in v11 do
                v16.Enabled = true;
            end;
        end, 
        StopAttack = function() --[[ Line: 55 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
            for _, v18 in v11 do
                v18.Enabled = false;
            end;
        end
    };
end;