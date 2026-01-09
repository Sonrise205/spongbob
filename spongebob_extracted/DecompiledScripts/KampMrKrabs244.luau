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
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v11, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0, v7);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v10 (copy), v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        if v13.Parent:IsA("Attachment") then
            table.insert(v10, v13);
        else
            table.insert(v9, v13);
        end;
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v7);
    end);
    v2:ResizePart(l_Attack_0.Attack, v7);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v14) --[[ Line: 37 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v8, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v7);
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    return {
        Charge = function() --[[ Line: 45 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 49 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Hit = function() --[[ Line: 53 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy), v8 (copy)
            v2:ToggleEmitters(v10, true);
            v2:ToggleEmitters(v8, true, true);
        end, 
        StopHit = function() --[[ Line: 58 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v9 (copy), v11 (copy), v8 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;