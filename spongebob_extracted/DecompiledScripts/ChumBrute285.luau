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
    v2:IterateClass(l_Attack_0.Hit1, "ParticleEmitter", function(v11) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v11);
        v2:AdjustEmitter(v11, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit2, "ParticleEmitter", function(v12) --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 33 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Hit1 = function() --[[ Line: 37 ]] --[[ Name: Hit1 ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:JustEmit(v8);
        end, 
        Hit2 = function() --[[ Line: 41 ]] --[[ Name: Hit2 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:JustEmit(v9);
        end, 
        StopCharge = function() --[[ Line: 45 ]] --[[ Name: StopCharge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, false);
        end
    };
end;