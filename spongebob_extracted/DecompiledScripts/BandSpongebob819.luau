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
    local v13 = {};
    for _, v15 in l_Attack_0:GetChildren() do
        if v15.Name == "Charge" then
            v2:IterateClass(v15, "ParticleEmitter", function(v16) --[[ Line: 25 ]]
                -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v10, v16);
                v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
            end);
        elseif v15.Name == "ChargeAttack" then
            v2:IterateClass(v15, "ParticleEmitter", function(v17) --[[ Line: 30 ]]
                -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v11, v17);
                v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
            end);
        elseif v15.Name == "Attack" then
            v2:IterateClass(v15, "ParticleEmitter", function(v18) --[[ Line: 35 ]]
                -- upvalues: v12 (copy), v15 (copy), v2 (ref), l_speedMultiplier_0 (copy), l_v2_2DDistance_0 (copy)
                table.insert(v12, v18);
                if v15:GetAttribute("KeepLifetime") then
                    v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
                    return;
                else
                    v2:EmitterSpeedFromDistance(v18, l_v2_2DDistance_0, l_speedMultiplier_0);
                    return;
                end;
            end);
        elseif v15.Name == "Hit" then
            v2:IterateClass(v15, "ParticleEmitter", function(v19) --[[ Line: 47 ]]
                -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v13, v19);
                v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
            end);
        end;
    end;
    return {
        Charge = function() --[[ Line: 55 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true);
        end, 
        ChargeAttack = function() --[[ Line: 59 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 63 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy), v11 (copy)
            v2:ToggleEmitters(v12, true);
            v2:ToggleEmitters(v11, false);
        end, 
        Hit = function() --[[ Line: 68 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        StopAttack = function() --[[ Line: 72 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy), v12 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v12, false);
        end, 
        StopHit = function() --[[ Line: 77 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, false);
        end
    };
end;