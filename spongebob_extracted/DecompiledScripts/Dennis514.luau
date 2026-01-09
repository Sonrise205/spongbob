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
    local v10 = v3.getScaledEffectRange(35);
    local v11 = v3.range / (v10 * 0.5);
    local l_v11_0 = v11 --[[ copy: 9 -> 10 ]];
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v13) --[[ Line: 21 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), l_v11_0 (copy), v7 (copy)
        table.insert(v6, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
        if v13.Parent:IsA("Attachment") then
            v2:ScaleEmitterSize(v13, l_v11_0);
            return;
        else
            table.insert(v7, v13);
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Charge, v11);
    v10 = v3.getScaledEffectRange(75);
    v11 = v3.range / (v10 * 0.5);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v14) --[[ Line: 38 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v8, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v14, v11);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v15) --[[ Line: 44 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v9, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v15, v11);
    end);
    v2:ResizePart(l_Attack_0.Attack, v11);
    return {
        Charge = function() --[[ Line: 53 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        ChargeAttack = function() --[[ Line: 57 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 61 ]] --[[ Name: Attack ]]
            -- upvalues: v7 (copy), v2 (ref), v9 (copy)
            for _, v17 in v7 do
                v17:Emit(20);
            end;
            v2:ToggleEmitters(v9, true, true);
        end, 
        StopAttack = function() --[[ Line: 69 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v6 (copy), v8 (copy), v9 (copy)
            v2:ToggleEmitters(v6, false);
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;