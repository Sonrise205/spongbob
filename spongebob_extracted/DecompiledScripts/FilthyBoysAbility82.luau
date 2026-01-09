local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(55);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Charge_Ultimate, "ParticleEmitter", function(v14) --[[ Line: 22 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v12, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.ChargeAttack_Ultimate, "ParticleEmitter", function(v15) --[[ Line: 27 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v13, v15);
        v2:AdjustEmitter(v15, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.Attack_Ultimate.Attachment1, "ParticleEmitter", function(v16) --[[ Line: 32 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v16);
        v2:AdjustEmitter(v16, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.Attack_Ultimate.Attachment2, "ParticleEmitter", function(v17) --[[ Line: 37 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v10, v17);
        v2:AdjustEmitter(v17, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.Attack_Ultimate, "ParticleEmitter", function(v18) --[[ Line: 42 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v11, v18);
        v2:AdjustEmitter(v18, l_speedMultiplier_0, v7);
    end, true);
    v2:ResizePart(l_Attack_0.Attack_Ultimate, v7);
    v2:IterateClass(l_Attack_0.Hit_Ultimate, "ParticleEmitter", function(v19) --[[ Line: 49 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v8, v19);
        v2:AdjustEmitter(v19, l_speedMultiplier_0, v7);
    end);
    v2:ResizePart(l_Attack_0.Hit_Ultimate, v7);
    return {
        Charge = function() --[[ Line: 57 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true);
        end, 
        ChargeAttack = function() --[[ Line: 61 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        Attack = function() --[[ Line: 65 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy), l_speedMultiplier_0 (copy), v10 (copy), v11 (copy)
            v2:ToggleEmitters(v9, true, true);
            task.wait(0.6 / l_speedMultiplier_0);
            v2:ToggleEmitters(v10, true, true);
            v2:JustEmit(v11);
            task.wait(1 / l_speedMultiplier_0);
            v2:ToggleEmitters(v9, false);
        end, 
        Hit = function() --[[ Line: 74 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopAttack = function() --[[ Line: 78 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end, 
        StopHit = function() --[[ Line: 82 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v13 (copy), v8 (copy), v12 (copy)
            v2:ToggleEmitters(v13, false);
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v12, false);
        end
    };
end;