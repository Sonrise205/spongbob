local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(30) * 0.5);
    v3.pivotHitPart(l_Attack_0.Attack, l_PrimaryPart_0);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v11) --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v11);
        v2:AdjustEmitterSpeed(v11, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v12) --[[ Line: 29 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v10, v12);
        v2:AdjustEmitterSpeed(v12, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v12, v7);
    end);
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v9, v13);
        v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
        if v13.Parent:IsA("Attachment") then
            v2:ScaleEmitterSize(v13, v7);
            return;
        else
            v2:ScaleEmitterSize(v13, (math.min(1, v7)));
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.Attack, v7);
    return {
        Charge = function() --[[ Line: 49 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true, true);
        end, 
        Hit = function() --[[ Line: 53 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v9, true, true);
            v2:ToggleEmitters(v10, true, true);
        end, 
        StopHit = function() --[[ Line: 58 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v8 (copy), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;