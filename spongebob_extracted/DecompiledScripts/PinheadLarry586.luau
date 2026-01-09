local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8 = select(2, v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0));
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v14) --[[ Line: 23 ]]
        -- upvalues: v11 (copy), v2 (ref), v8 (copy), l_speedMultiplier_0 (copy)
        table.insert(v11, v14);
        v2:EmitterSpeedFromDistance(v14, v8, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.AttackShot1, "ParticleEmitter", function(v15) --[[ Line: 28 ]]
        -- upvalues: v11 (copy), v2 (ref), v8 (copy), l_speedMultiplier_0 (copy)
        table.insert(v11, v15);
        v2:EmitterSpeedFromDistance(v15, v8, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v16) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v2 (ref), v8 (copy), l_speedMultiplier_0 (copy)
        table.insert(v12, v16);
        v2:EmitterSpeedFromDistance(v16, v8, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.AttackShot2, "ParticleEmitter", function(v17) --[[ Line: 38 ]]
        -- upvalues: v12 (copy), v2 (ref), v8 (copy), l_speedMultiplier_0 (copy)
        table.insert(v12, v17);
        v2:EmitterSpeedFromDistance(v17, v8, l_speedMultiplier_0);
    end);
    for _, v19 in l_Attack_0.Charge:GetChildren() do
        if v19:IsA("ParticleEmitter") then
            table.insert(v9, v19);
            v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
        end;
    end;
    for _, v21 in l_Attack_0.Charge.Attachment:GetChildren() do
        if v21:IsA("ParticleEmitter") then
            table.insert(v10, v21);
            v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
        end;
    end;
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v22) --[[ Line: 57 ]]
        -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v13, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    return {
        Charge1 = function() --[[ Line: 63 ]] --[[ Name: Charge1 ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        Charge2 = function() --[[ Line: 67 ]] --[[ Name: Charge2 ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack1 = function() --[[ Line: 71 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v11 (copy), v12 (copy)
            v2:ToggleEmitters(v11, true);
            v2:ToggleEmitters(v12, false);
        end, 
        Attack2 = function() --[[ Line: 76 ]] --[[ Name: Attack2 ]]
            -- upvalues: v2 (ref), v12 (copy), v11 (copy)
            v2:ToggleEmitters(v12, true);
            v2:ToggleEmitters(v11, false);
        end, 
        StopAttack = function() --[[ Line: 81 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v11 (copy), v12 (copy)
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v12, false);
        end, 
        Hit = function() --[[ Line: 86 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        StopHit = function() --[[ Line: 90 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v13 (copy), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v13, false);
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;