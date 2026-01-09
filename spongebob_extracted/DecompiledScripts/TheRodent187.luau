local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local _ = v3.sizeMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v7 = {};
    local v8 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v9) --[[ Line: 16 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v7, v9);
        v2:AdjustEmitter(v9, l_speedMultiplier_0);
    end);
    for v10 = 1, 9 do
        local l_FirstChild_0 = l_Attack_0.Hit:FindFirstChild("Punch0" .. v10);
        if l_FirstChild_0 then
            v8[v10] = {};
            v2:IterateClass(l_FirstChild_0, "ParticleEmitter", function(v12) --[[ Line: 30 ]]
                -- upvalues: v8 (copy), v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v8[v10], v12);
                v2:AdjustEmitter(v12, l_speedMultiplier_0);
            end, true);
        end;
    end;
    local v13 = {
        Charge = function() --[[ Line: 37 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v7 (copy), v8 (copy)
            v2:ToggleEmitters(v7, true);
            v2:ToggleEmitters(v8[9], true);
        end, 
        StopAttack = function() --[[ Line: 42 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v7 (copy), v8 (copy)
            v2:ToggleEmitters(v7, false);
            v2:ToggleEmitters(v8[9], false);
        end
    };
    for v14 = 1, 8 do
        v13["Hit" .. v14] = function() --[[ Line: 49 ]]
            -- upvalues: v2 (ref), v8 (copy), v14 (copy)
            v2:JustEmit(v8[v14]);
        end;
    end;
    return v13;
end;