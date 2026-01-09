local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(65);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    for _, v11 in l_Attack_0:GetChildren() do
        if v11.Name == "Charge" then
            v2:IterateClass(v11, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
                -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v8, v12);
                v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
            end);
        end;
    end;
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v13, v7);
    end);
    return {
        Charge = function() --[[ Line: 34 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 38 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        StopAttack = function() --[[ Line: 42 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;