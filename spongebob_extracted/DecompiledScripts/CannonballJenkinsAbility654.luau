local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local _ = l_Attack_0.Hit;
    local _ = l_Attack_0.PrimaryPart;
    local v9 = v1.Find(v4.model.VisualModel, "RootPart/mixamorig:Hips/Attack");
    local v10 = v4.getScaledEffectRange(50);
    local v11 = v4.range / (v10 * 0.5);
    local v12 = {};
    local v13 = {};
    local v14 = {};
    v3:IterateClass(l_Attack_0.Charge_Ultimate, "ParticleEmitter", function(v15) --[[ Line: 28 ]]
        -- upvalues: v13 (copy), v3 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v13, v15);
        v3:AdjustEmitter(v15, l_speedMultiplier_0, v11);
    end);
    v3:IterateClass(v9, "ParticleEmitter", function(v16) --[[ Line: 33 ]]
        -- upvalues: v14 (copy)
        table.insert(v14, v16);
    end);
    v3:IterateClass(l_Attack_0.ChargeAttack_Ultimate, "ParticleEmitter", function(v17) --[[ Line: 38 ]]
        -- upvalues: v13 (copy), v3 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v13, v17);
        v3:AdjustEmitter(v17, l_speedMultiplier_0, v11);
    end);
    v3:IterateClass(l_Attack_0.Hit_Ultimate, "ParticleEmitter", function(v18) --[[ Line: 43 ]]
        -- upvalues: v12 (copy), v3 (ref), l_speedMultiplier_0 (copy), v11 (copy)
        table.insert(v12, v18);
        v3:AdjustEmitter(v18, l_speedMultiplier_0, v11);
    end);
    v3:ResizePart(l_Attack_0.Hit_Ultimate, v11);
    return {
        Charge = function() --[[ Line: 51 ]] --[[ Name: Charge ]]
            -- upvalues: v3 (ref), v13 (copy)
            v3:ToggleEmitters(v13, true);
        end, 
        Attack = function() --[[ Line: 55 ]] --[[ Name: Attack ]]
            -- upvalues: v3 (ref), v14 (copy)
            v3:ToggleEmitters(v14, true, true);
        end, 
        Hit = function() --[[ Line: 59 ]] --[[ Name: Hit ]]
            -- upvalues: v3 (ref), v14 (copy), v12 (copy)
            v3:ToggleEmitters(v14, false);
            v3:ToggleEmitters(v12, true, true);
        end, 
        StopHit = function() --[[ Line: 64 ]] --[[ Name: StopHit ]]
            -- upvalues: v3 (ref), v13 (copy), v12 (copy)
            v3:ToggleEmitters(v13, false);
            v3:ToggleEmitters(v12, false);
        end
    };
end;