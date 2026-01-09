local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v8 = v3.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    local l_v2_2DDistance_0 = v2:Get2DDistance(l_Attack_0.Attack.Position, v8.Position);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    for _, v14 in l_Attack_0:GetChildren() do
        if v14.Name == "Charge" then
            v2:IterateClass(v14, "ParticleEmitter", function(v15) --[[ Line: 24 ]]
                -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v10, v15);
                v2:AdjustEmitter(v15, l_speedMultiplier_0);
            end);
        elseif v14.Name == "Attack" then
            v2:IterateClass(v14, "ParticleEmitter", function(v16) --[[ Line: 30 ]]
                -- upvalues: v11 (copy), v2 (ref), l_v2_2DDistance_0 (copy), l_speedMultiplier_0 (copy)
                table.insert(v11, v16);
                v2:EmitterSpeedFromDistance(v16, l_v2_2DDistance_0, l_speedMultiplier_0);
            end);
        elseif v14.Name == "Hit" then
            v2:IterateClass(v14, "ParticleEmitter", function(v17) --[[ Line: 42 ]]
                -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v12, v17);
                v2:AdjustEmitter(v17, l_speedMultiplier_0);
            end);
        end;
    end;
    return {
        Charge = function() --[[ Line: 51 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 55 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true, true);
        end, 
        Hit = function() --[[ Line: 59 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopAttack = function() --[[ Line: 63 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, false);
        end, 
        StopHit = function() --[[ Line: 67 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v12 (copy), v10 (copy)
            v2:ToggleEmitters(v12, false);
            v2:ToggleEmitters(v10, false);
        end
    };
end;