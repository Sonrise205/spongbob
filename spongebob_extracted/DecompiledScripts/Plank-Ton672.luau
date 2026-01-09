local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(50) * 0.5);
    local v8 = v3.pivotHitPart(l_Attack_0.Hit, l_PrimaryPart_0);
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v13);
        v2:AdjustEmitter(v13, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.Attack.Attachment1, "ParticleEmitter", function(v14) --[[ Line: 30 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0);
    end);
    table.insert(v11, l_Attack_0.Attack.Attachment2.Rocks);
    v2:AdjustEmitter(l_Attack_0.Attack.Attachment2.Rocks, l_speedMultiplier_0);
    local v15 = nil;
    local l_BoulderAttachment_0 = l_Attack_0.Attack.BoulderAttachment;
    v15 = l_BoulderAttachment_0.Boulder;
    local v17 = 1.35 / l_speedMultiplier_0;
    local v18, v19 = v2:CalculateArc(v17, l_BoulderAttachment_0.WorldPosition, v8.Position, 1.1868238913561442);
    v18 = NumberRange.new(v18);
    v17 = NumberRange.new(v17);
    v15.Speed = v18;
    v15.Acceleration = v19;
    v15.Lifetime = v17;
    v2:ScaleEmitterSize(v15, v7, true);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v20) --[[ Line: 61 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v12, v20);
        v2:AdjustEmitter(v20, l_speedMultiplier_0, v7);
    end);
    return {
        Charge = function() --[[ Line: 67 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true);
        end, 
        ChargeAttack = function() --[[ Line: 71 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 75 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v10 (copy), v11 (copy), v15 (ref)
            v2:JustEmit(v10);
            v2:ToggleEmitters(v11, true);
            v2:JustEmit({
                v15
            });
        end, 
        StopAttack = function() --[[ Line: 81 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end, 
        Hit = function() --[[ Line: 85 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopHit = function() --[[ Line: 89 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v9 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v9, false);
        end
    };
end;