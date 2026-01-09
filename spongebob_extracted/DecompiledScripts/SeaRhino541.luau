local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = {};
    local v8 = {};
    local v9 = math.max(1, select(2, v3.getHitPivot(l_PrimaryPart_0)) - v2:Get2DDistance(v3.pivot.Position, l_Attack_0.Attack.Position)) * 0.75;
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v10) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v2 (ref), v9 (copy), l_speedMultiplier_0 (copy)
        table.insert(v8, v10);
        v2:EmitterSpeedFromDistance(v10, v9, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v11) --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 31 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true);
        end, 
        Attack = function() --[[ Line: 35 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopAttack = function() --[[ Line: 39 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v7 (copy), v8 (copy)
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;