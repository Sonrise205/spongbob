local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(20);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    for _, v14 in l_Attack_0.Attack1:GetDescendants() do
        if v14:IsA("ParticleEmitter") then
            table.insert(v9, v14);
            v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v14, v7);
        elseif v14:IsA("Beam") then
            table.insert(v11, v14);
            v14.Enabled = false;
        end;
    end;
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v15) --[[ Line: 36 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v10, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v15, v7);
    end);
    return {
        Charge = function() --[[ Line: 43 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 47 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy), v11 (copy)
            v2:ToggleEmitters(v9, true);
            v2:ToggleInstances(v11, true);
        end, 
        Hit = function() --[[ Line: 52 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        StopAttack = function() --[[ Line: 56 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), v11 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleInstances(v11, false);
        end, 
        StopHit = function() --[[ Line: 61 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;