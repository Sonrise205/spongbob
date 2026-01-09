local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(40);
    local v7 = v3.range / (v6 * 0.45);
    local v8 = {};
    local v9 = {};
    for _, v11 in l_Attack_0:GetChildren() do
        if v11.Name == "Attack1" or v11.Name == "Attack2" then
            v2:IterateClass(v11, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
                -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
                table.insert(v8, v12);
                v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
                v2:ScaleEmitterSize(v12, v7);
            end);
        elseif v11.Name == "Attack3" then
            v2:IterateClass(v11, "ParticleEmitter", function(v13) --[[ Line: 26 ]]
                -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
                table.insert(v9, v13);
                v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
                v2:ScaleEmitterSize(v13, v7);
            end);
        end;
    end;
    return {
        Attack1 = function() --[[ Line: 35 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack2 = function() --[[ Line: 39 ]] --[[ Name: Attack2 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        StopAttack1 = function() --[[ Line: 43 ]] --[[ Name: StopAttack1 ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, false);
        end, 
        StopAttack2 = function() --[[ Line: 47 ]] --[[ Name: StopAttack2 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, false);
        end
    };
end;