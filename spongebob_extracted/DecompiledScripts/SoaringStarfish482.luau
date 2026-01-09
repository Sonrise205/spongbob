local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(5) * 0.5);
    local v7 = {};
    local v8 = {};
    for _, v10 in l_Attack_0:GetChildren() do
        if string.find(string.lower(v10.Name), "throw") then
            local v11 = tonumber(string.match(v10.Name, "%d+"));
            if v11 then
                local v12 = v7[v11];
                if not v12 then
                    v12 = {};
                    v7[v11] = v12;
                end;
                do
                    local l_v12_0 = v12;
                    v2:IterateClass(v10, "ParticleEmitter", function(v14) --[[ Line: 33 ]]
                        -- upvalues: l_v12_0 (ref), v2 (ref), l_speedMultiplier_0 (copy)
                        table.insert(l_v12_0, v14);
                        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
                    end);
                end;
            end;
        end;
    end;
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v15) --[[ Line: 40 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v6 (copy)
        table.insert(v8, v15);
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v15, v6);
    end);
    return {
        Attack1 = function() --[[ Line: 47 ]] --[[ Name: Attack1 ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7[1], true);
        end, 
        Attack2 = function() --[[ Line: 51 ]] --[[ Name: Attack2 ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7[2], true);
        end, 
        Attack3 = function() --[[ Line: 55 ]] --[[ Name: Attack3 ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7[3], true);
        end, 
        Attack4 = function() --[[ Line: 59 ]] --[[ Name: Attack4 ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2:ToggleEmitters(v7[4], true);
        end, 
        Hit = function() --[[ Line: 63 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end
    };
end;