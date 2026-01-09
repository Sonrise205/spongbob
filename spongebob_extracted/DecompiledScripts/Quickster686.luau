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
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v10) --[[ Line: 18 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v8, v10);
        v2:AdjustEmitterSpeed(v10, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v10, v7);
    end);
    for _, v12 in l_Attack_0:GetChildren() do
        if v12:IsA("BasePart") and string.find(string.lower(v12.Name), "hit") then
            local v13 = tonumber(string.match(v12.Name, "%d+"));
            if v13 then
                local v14 = v9[v13];
                if not v14 then
                    v14 = {};
                    v9[v13] = v14;
                end;
                do
                    local l_v14_0 = v14;
                    v2:IterateClass(v12, "ParticleEmitter", function(v16) --[[ Line: 37 ]]
                        -- upvalues: l_v14_0 (ref), v2 (ref), l_speedMultiplier_0 (copy)
                        table.insert(l_v14_0, v16);
                        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
                    end);
                end;
            end;
        end;
    end;
    local _ = function(v17) --[[ Line: 44 ]] --[[ Name: emitHitParticles ]]
        -- upvalues: v9 (copy)
        local v18 = v9[v17];
        if not v18 then
            return;
        else
            for _, v20 in v18 do
                v20:Emit(2);
            end;
            return;
        end;
    end;
    return {
        Attack = function() --[[ Line: 56 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Hit1 = function() --[[ Line: 60 ]] --[[ Name: Hit1 ]]
            -- upvalues: v9 (copy)
            local v22 = v9[1];
            if not v22 then
                return;
            else
                for _, v24 in v22 do
                    v24:Emit(2);
                end;
                return;
            end;
        end, 
        Hit2 = function() --[[ Line: 64 ]] --[[ Name: Hit2 ]]
            -- upvalues: v9 (copy)
            local v25 = v9[2];
            if not v25 then
                return;
            else
                for _, v27 in v25 do
                    v27:Emit(2);
                end;
                return;
            end;
        end, 
        Hit3 = function() --[[ Line: 68 ]] --[[ Name: Hit3 ]]
            -- upvalues: v9 (copy)
            local v28 = v9[3];
            if not v28 then
                return;
            else
                for _, v30 in v28 do
                    v30:Emit(2);
                end;
                return;
            end;
        end, 
        Hit4 = function() --[[ Line: 72 ]] --[[ Name: Hit4 ]]
            -- upvalues: v9 (copy)
            local v31 = v9[4];
            if not v31 then
                return;
            else
                for _, v33 in v31 do
                    v33:Emit(2);
                end;
                return;
            end;
        end, 
        StopAttack = function() --[[ Line: 76 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, false);
        end
    };
end;