local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(35);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v8, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v12, v7);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
        if v13.Parent:IsA("Attachment") then
            v2:ScaleEmitterSize(v13, v7);
            return;
        else
            v2:ScaleEmitterSize(v13, (math.min(v7, 1)));
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Attack, v7);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v14) --[[ Line: 41 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v14, (math.min(v7, 1)));
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    v2:IterateClass(l_Attack_0.Impact, "ParticleEmitter", function(v15) --[[ Line: 51 ]]
        -- upvalues: v11 (copy), v2 (ref), v3 (copy), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v11, v15);
        if v15.Parent:IsA("Attachment") then
            v2:EmitterSpeedFromDistance(v15, v3.range, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v15, v7);
            return;
        else
            v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Impact, v7);
    return {
        Charge = function() --[[ Line: 66 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 70 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy), v11 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, true, true);
            v2:ToggleEmitters(v11, true, true);
        end, 
        Hit = function() --[[ Line: 76 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v11 (copy), v10 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v10, true);
        end, 
        StopAttack = function() --[[ Line: 81 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, false);
        end, 
        StopHit = function() --[[ Line: 85 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end
    };
end;