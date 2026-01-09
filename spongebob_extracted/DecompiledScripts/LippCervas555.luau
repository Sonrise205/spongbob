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
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v9) --[[ Line: 16 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v9);
        v2:AdjustEmitter(v9, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v10) --[[ Line: 21 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v10);
        v2:AdjustEmitter(v10, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 27 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Hit = function() --[[ Line: 31 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopHit = function() --[[ Line: 35 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, false);
        end, 
        StopCharge = function() --[[ Line: 39 ]] --[[ Name: StopCharge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, false);
        end
    };
end;