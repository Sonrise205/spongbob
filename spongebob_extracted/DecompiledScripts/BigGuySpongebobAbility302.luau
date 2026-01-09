local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local _ = l_Attack_0.Hit;
    local _ = l_Attack_0.PrimaryPart;
    local v8 = v3.getScaledEffectRange(50);
    local v9 = v3.range / (v8 * 0.5);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge_Ultimate, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v10, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Attack_Ultimate, "ParticleEmitter", function(v14) --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        if v14.Parent.Name == "Attachment2" then
            table.insert(v12, v14);
        else
            table.insert(v11, v14);
        end;
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v9);
    end);
    v2:ResizePart(l_Attack_0.Attack_Ultimate, v9);
    return {
        Charge = function() --[[ Line: 43 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 47 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy), l_speedMultiplier_0 (copy), v12 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v11, true, true);
            task.wait(0.25 / l_speedMultiplier_0);
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopAttack = function() --[[ Line: 54 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v12 (copy), l_speedMultiplier_0 (copy), v11 (copy)
            v2:ToggleEmitters(v12, false);
            task.wait(0.6 / l_speedMultiplier_0);
            v2:ToggleEmitters(v11, false);
        end
    };
end;