local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local _ = l_Attack_0.PrimaryPart;
    local v7 = {};
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 27 ]]
        -- upvalues: v11 (copy), v2 (ref), v3 (copy), l_speedMultiplier_0 (copy)
        table.insert(v11, v13);
        v2:EmitterSpeedFromDistance(v13, v3.range, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v14) --[[ Line: 32 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v15) --[[ Line: 37 ]]
        -- upvalues: v8 (copy), v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        if v15.Parent.ClassName == "Attachment" then
            table.insert(v8, v15);
        else
            table.insert(v7, v15);
        end;
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v16) --[[ Line: 47 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.ChargeHit, "ParticleEmitter", function(v17) --[[ Line: 52 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 58 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        ChargeAttack = function() --[[ Line: 62 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Hit = function() --[[ Line: 66 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy), v9 (copy)
            v2:ToggleEmitters(v12, true, true);
            v2:ToggleEmitters(v9, true, true);
        end, 
        Attack = function() --[[ Line: 71 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v10, true, true);
            v2:ToggleEmitters(v11, true, true);
        end, 
        StopAttack = function() --[[ Line: 76 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v12 (copy), v11 (copy), v10 (copy), l_speedMultiplier_0 (copy), v7 (copy), v8 (copy), v9 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v10, false);
            task.wait(0.12 / l_speedMultiplier_0);
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;