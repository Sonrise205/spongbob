local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(25);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v11) --[[ Line: 19 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v12) --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v12);
        local v13 = v2:SetOriginalEmitterProps(v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0, v13);
        v12.Rate = math.max(v13.rate, v13.rate * v7);
    end);
    v2:ResizePart(l_Attack_0.Attack, v7);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v14) --[[ Line: 36 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v10, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
        if v14.Parent:IsA("Attachment") then
            v2:ScaleEmitterSize(v14, v7);
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    return {
        Charge = function() --[[ Line: 49 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 53 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v9, true);
            v2:ToggleEmitters(v10, true);
        end, 
        StopHit = function() --[[ Line: 58 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end, 
        StopAttack = function() --[[ Line: 62 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;