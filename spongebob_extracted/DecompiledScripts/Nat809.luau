local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local _ = v3.sizeMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v7 = {};
    local v8 = {};
    local v9 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v10) --[[ Line: 17 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v10);
        v2:AdjustEmitter(v10, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v11) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v11);
        v2:AdjustEmitter(v11, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v12) --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 33 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 37 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:JustEmit(v8);
        end, 
        Hit = function() --[[ Line: 41 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true, true);
        end, 
        StopHit = function() --[[ Line: 45 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v9 (copy), l_speedMultiplier_0 (copy), v7 (copy)
            v2:ToggleEmitters(v9, false);
            task.wait(0.5 / l_speedMultiplier_0);
            v2:ToggleEmitters(v7, false);
        end
    };
end;