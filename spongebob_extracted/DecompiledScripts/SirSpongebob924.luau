local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    local v7 = {};
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = v3.getScaledEffectRange(35);
    local v12 = v3.range / (v11 * 0.5);
    local l_v12_0 = v12 --[[ copy: 10 -> 11 ]];
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 23 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), l_v12_0 (copy), v7 (copy)
        table.insert(v6, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
        if v14.Parent:IsA("Attachment") then
            v2:ScaleEmitterSize(v14, l_v12_0);
            return;
        else
            table.insert(v7, v14);
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Charge, v12);
    v11 = v3.getScaledEffectRange(75);
    v12 = v3.range / (v11 * 0.5);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v15) --[[ Line: 40 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v12 (copy)
        table.insert(v8, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v15, v12);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v16) --[[ Line: 46 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v12 (copy)
        table.insert(v9, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v16, v12);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 52 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v12 (copy)
        table.insert(v10, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v17, v12);
    end);
    v2:ResizePart(l_Attack_0.Attack, v12);
    return {
        Charge = function() --[[ Line: 61 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Attack = function() --[[ Line: 65 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Hit = function() --[[ Line: 69 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v9, true, true);
            v2:ToggleEmitters(v10, true, true);
        end, 
        StopAttack = function() --[[ Line: 74 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        StopHit = function() --[[ Line: 78 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v6 (copy), v8 (copy), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v6, false);
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;