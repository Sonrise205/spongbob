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
    local v11 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v12) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 26 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v13);
        local v14 = v2:SetOriginalEmitterProps(v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0, v14);
        v13.Rate = math.max(v14.rate, v14.rate * v7);
    end);
    v2:ResizePart(l_Attack_0.Attack, v7);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v15) --[[ Line: 37 ]]
        -- upvalues: v2 (ref), l_speedMultiplier_0 (copy), v7 (copy), v11 (copy), v10 (copy)
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        if v15.Parent:IsA("Attachment") then
            v2:ScaleEmitterSize(v15, v7);
            table.insert(v11, v15);
            return;
        else
            table.insert(v10, v15);
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    return {
        Charge = function() --[[ Line: 52 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy), v11 (copy)
            v2:ToggleEmitters(v8, true, true);
            v2:ToggleEmitters(v11, true);
        end, 
        Hit = function() --[[ Line: 57 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        StopHit = function() --[[ Line: 61 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v11 (copy), v9 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v9, true);
        end, 
        StopAttack = function() --[[ Line: 66 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v9 (copy), v8 (copy)
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;