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
    local v10 = v3.getScaledEffectRange(45);
    local v11 = v3.range / (v10 * 0.5);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v6, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0, v11);
    end);
    v2:ResizePart(l_Attack_0.Charge, v11);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v13) --[[ Line: 26 ]]
        -- upvalues: v7 (copy), v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        if v13.Parent:IsA("Attachment") then
            table.insert(v7, v13);
        else
            table.insert(v9, v13);
        end;
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v11);
    end);
    v2:ResizePart(l_Attack_0.Hit, v11);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v14) --[[ Line: 37 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v8, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v11);
    end);
    v2:ResizePart(l_Attack_0.Attack, v11);
    return {
        Charge = function() --[[ Line: 44 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        ChargeAttack = function() --[[ Line: 48 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true, true);
        end, 
        Attack = function() --[[ Line: 52 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Hit = function() --[[ Line: 56 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7, true, true);
        end, 
        StopAttack = function() --[[ Line: 60 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), v6 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v6, false);
        end, 
        StopHit = function() --[[ Line: 65 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v9 (copy), v7 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v7, false);
        end
    };
end;