local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local v9 = v4.getScaledEffectRange(21);
    local v10 = v4.range / (v9 * 0.5);
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    local v18 = {};
    v3:IterateClass(l_Attack_0.Charge1, "ParticleEmitter", function(v19) --[[ Line: 30 ]]
        -- upvalues: v11 (copy), v3 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v11, v19);
        v3:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v19, v10);
    end);
    v3:IterateClass(l_Attack_0.Charge2, "ParticleEmitter", function(v20) --[[ Line: 36 ]]
        -- upvalues: v12 (copy), v3 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v12, v20);
        v3:AdjustEmitterSpeed(v20, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v20, v10);
    end);
    v3:IterateClass(l_Attack_0.Charge3, "ParticleEmitter", function(v21) --[[ Line: 42 ]]
        -- upvalues: v13 (copy), v3 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v13, v21);
        v3:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v21, v10);
    end);
    v3:IterateClass(l_Attack_1, "ParticleEmitter", function(v22) --[[ Line: 48 ]]
        -- upvalues: v14 (copy), v3 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v14, v22);
        v3:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v22, v10);
    end);
    v3:IterateClass(l_Hit_0, "ParticleEmitter", function(v23) --[[ Line: 54 ]]
        -- upvalues: v15 (copy), v3 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v15, v23);
        v3:AdjustEmitterSpeed(v23, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v23, v10);
    end);
    v3:IterateClass(l_Attack_1, "Beam", function(v24) --[[ Line: 60 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v24);
        v24.Enabled = false;
    end);
    for _, v26 in l_Attack_1:GetChildren() do
        if v26.Name == "StartAttachment" then
            table.insert(v17, v26);
        elseif v26.Name == "EndAttachment" then
            table.insert(v18, v26);
        end;
    end;
    return {
        Charge1 = function() --[[ Line: 74 ]] --[[ Name: Charge1 ]]
            -- upvalues: v3 (ref), v11 (copy)
            v3:ToggleEmitters(v11, true);
        end, 
        Charge2 = function() --[[ Line: 78 ]] --[[ Name: Charge2 ]]
            -- upvalues: v3 (ref), v12 (copy)
            v3:ToggleEmitters(v12, true);
        end, 
        Charge3 = function() --[[ Line: 82 ]] --[[ Name: Charge3 ]]
            -- upvalues: v3 (ref), v13 (copy)
            v3:ToggleEmitters(v13, true);
        end, 
        Attack = function() --[[ Line: 86 ]] --[[ Name: Attack ]]
            -- upvalues: v3 (ref), v12 (copy), v13 (copy), v18 (copy), l_speedMultiplier_0 (copy), v16 (copy)
            v3:ToggleEmitters(v12, false);
            v3:ToggleEmitters(v13, false);
            for _, v28 in v18 do
                local l_Position_0 = v28.Position;
                local v30 = Vector3.new(l_Position_0.X, -9.865, l_Position_0.Z);
                v28.Position = Vector3.new(l_Position_0.X, 87.872, l_Position_0.Z);
                v3:Tween(v28, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                    Position = v30
                });
            end;
            for _, v32 in v16 do
                v32.Enabled = true;
            end;
        end, 
        Hit = function() --[[ Line: 103 ]] --[[ Name: Hit ]]
            -- upvalues: v3 (ref), v14 (copy), v15 (copy)
            v3:ToggleEmitters(v14, true);
            v3:ToggleEmitters(v15, true);
        end, 
        StopAttack = function() --[[ Line: 108 ]] --[[ Name: StopAttack ]]
            -- upvalues: v3 (ref), v11 (copy), v14 (copy), v15 (copy), v17 (copy), v1 (ref), l_speedMultiplier_0 (copy), v16 (copy)
            v3:ToggleEmitters(v11, false);
            v3:ToggleEmitters(v14, false);
            v3:ToggleEmitters(v15, false);
            local v33 = {};
            for _, v35 in v17 do
                local l_Position_1 = v35.Position;
                local v37 = Vector3.new(l_Position_1.X, -9.865, l_Position_1.Z);
                table.insert(v33, v1.new(function(v38) --[[ Line: 119 ]]
                    -- upvalues: v3 (ref), v35 (copy), l_speedMultiplier_0 (ref), v37 (copy), l_Position_1 (copy)
                    v3:Tween(v35, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                        Position = v37
                    }, function() --[[ Line: 120 ]]
                        -- upvalues: v35 (ref), l_Position_1 (ref), v38 (copy)
                        v35.Position = l_Position_1;
                        v38();
                    end);
                end));
            end;
            v1.allSettled(v33):andThen(function() --[[ Line: 127 ]]
                -- upvalues: v16 (ref)
                for _, v40 in v16 do
                    v40.Enabled = false;
                end;
            end);
        end
    };
end;