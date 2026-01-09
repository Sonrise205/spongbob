local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(48);
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
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v13) --[[ Line: 25 ]]
        -- upvalues: v9 (copy), v2 (ref), v7 (copy), l_speedMultiplier_0 (copy)
        table.insert(v9, v13);
        if v13:GetAttribute("AdjustScaleAndSpeed") then
            v2:AdjustEmitterSpeedAndScale(v13, v7, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v13, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v13, v7);
            return;
        end;
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v14) --[[ Line: 35 ]]
        -- upvalues: v10 (copy), v2 (ref), v7 (copy), l_speedMultiplier_0 (copy)
        table.insert(v10, v14);
        if v14:GetAttribute("AdjustScaleAndSpeed") then
            v2:AdjustEmitterSpeedAndScale(v14, v7, l_speedMultiplier_0);
            return;
        else
            v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
            v2:ScaleEmitterSize(v14, v7);
            return;
        end;
    end);
    for _, v16 in l_Attack_0:GetChildren() do
        if v16:IsA("BasePart") and string.find(string.lower(v16.Name), "hit") then
            local v17 = tonumber(string.match(v16.Name, "%d+"));
            if v17 then
                local v18 = v11[v17];
                if not v18 then
                    v18 = {};
                    v11[v17] = v18;
                end;
                do
                    local l_v18_0 = v18;
                    v2:IterateClass(v16, "ParticleEmitter", function(v20) --[[ Line: 58 ]]
                        -- upvalues: l_v18_0 (ref), v2 (ref), l_speedMultiplier_0 (copy)
                        table.insert(l_v18_0, v20);
                        v2:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
                    end);
                end;
            end;
        end;
    end;
    local function _(v21) --[[ Line: 65 ]] --[[ Name: toggleHitParticles ]]
        -- upvalues: v11 (copy), v2 (ref)
        local v22 = v11[v21];
        if not v22 then
            return;
        else
            v2:ToggleEmitters(v22, true);
            return;
        end;
    end;
    return {
        Charge = function() --[[ Line: 75 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy)
            v2:ToggleEmitters(v8, true);
        end, 
        Attack = function() --[[ Line: 79 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v9 (copy), v10 (copy)
            v2:ToggleEmitters(v9, true);
            v2:ToggleEmitters(v10, true, true);
        end, 
        Hit1 = function() --[[ Line: 84 ]] --[[ Name: Hit1 ]]
            -- upvalues: v11 (copy), v2 (ref)
            local v24 = v11[1];
            if not v24 then
                return;
            else
                v2:ToggleEmitters(v24, true);
                return;
            end;
        end, 
        Hit2 = function() --[[ Line: 88 ]] --[[ Name: Hit2 ]]
            -- upvalues: v11 (copy), v2 (ref)
            local v25 = v11[2];
            if not v25 then
                return;
            else
                v2:ToggleEmitters(v25, true);
                return;
            end;
        end, 
        Hit3 = function() --[[ Line: 92 ]] --[[ Name: Hit3 ]]
            -- upvalues: v11 (copy), v2 (ref)
            local v26 = v11[3];
            if not v26 then
                return;
            else
                v2:ToggleEmitters(v26, true);
                return;
            end;
        end, 
        Hit4 = function() --[[ Line: 96 ]] --[[ Name: Hit4 ]]
            -- upvalues: v11 (copy), v2 (ref)
            local v27 = v11[4];
            if not v27 then
                return;
            else
                v2:ToggleEmitters(v27, true);
                return;
            end;
        end, 
        StopAttack = function() --[[ Line: 100 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end
    };
end;