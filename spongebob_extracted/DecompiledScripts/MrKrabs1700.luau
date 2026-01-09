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
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    v4.pivotHitPart(l_Hit_0, l_PrimaryPart_0);
    l_Attack_1:FindFirstChildOfClass("Weld").C0 = v4.getHitPivot(l_Attack_1):ToObjectSpace(l_PrimaryPart_0.CFrame);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    v3:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v16) --[[ Line: 32 ]]
        -- upvalues: v10 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v16);
        v3:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_1, "ParticleEmitter", function(v17) --[[ Line: 37 ]]
        -- upvalues: v11 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v11, v17);
        v3:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v18) --[[ Line: 42 ]]
        -- upvalues: v12 (copy), v3 (ref), l_speedMultiplier_0 (copy)
        table.insert(v12, v18);
        v3:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
    end);
    v3:IterateClass(l_Hit_0, "Beam", function(v19) --[[ Line: 47 ]]
        -- upvalues: v13 (copy)
        table.insert(v13, v19);
        v19.Enabled = false;
    end);
    for _, v21 in l_Hit_0:GetChildren() do
        if v21.Name == "StartAttachment" then
            table.insert(v14, v21);
        elseif v21.Name == "EndAttachment" then
            table.insert(v15, v21);
        end;
    end;
    return {
        Charge = function() --[[ Line: 61 ]] --[[ Name: Charge ]]
            -- upvalues: v3 (ref), v10 (copy)
            v3:ToggleEmitters(v10, true);
        end, 
        Attack = function() --[[ Line: 65 ]] --[[ Name: Attack ]]
            -- upvalues: v15 (copy), v3 (ref), l_speedMultiplier_0 (copy), v13 (copy)
            for _, v23 in v15 do
                local l_Position_0 = v23.Position;
                local v25 = Vector3.new(l_Position_0.X, -9.865, l_Position_0.Z);
                v23.Position = Vector3.new(l_Position_0.X, 87.872, l_Position_0.Z);
                v3:Tween(v23, TweenInfo.new(0.25 / l_speedMultiplier_0), {
                    Position = v25
                });
            end;
            for _, v27 in v13 do
                v27.Enabled = true;
            end;
        end, 
        Hit = function() --[[ Line: 79 ]] --[[ Name: Hit ]]
            -- upvalues: v3 (ref), v11 (copy), v12 (copy)
            v3:ToggleEmitters(v11, true);
            v3:ToggleEmitters(v12, true);
        end, 
        StopAttack = function() --[[ Line: 84 ]] --[[ Name: StopAttack ]]
            -- upvalues: v3 (ref), v10 (copy), v11 (copy), v12 (copy), v14 (copy), v1 (ref), l_speedMultiplier_0 (copy), v13 (copy)
            v3:ToggleEmitters(v10, false);
            v3:ToggleEmitters(v11, false);
            v3:ToggleEmitters(v12, false);
            local v28 = {};
            for _, v30 in v14 do
                local l_Position_1 = v30.Position;
                local v32 = Vector3.new(l_Position_1.X, -9.865, l_Position_1.Z);
                table.insert(v28, v1.new(function(v33) --[[ Line: 95 ]]
                    -- upvalues: v3 (ref), v30 (copy), l_speedMultiplier_0 (ref), v32 (copy), l_Position_1 (copy)
                    v3:Tween(v30, TweenInfo.new(0.35 / l_speedMultiplier_0), {
                        Position = v32
                    }, function() --[[ Line: 96 ]]
                        -- upvalues: v30 (ref), l_Position_1 (ref), v33 (copy)
                        v30.Position = l_Position_1;
                        v33();
                    end);
                end));
            end;
            v1.allSettled(v28):andThen(function() --[[ Line: 103 ]]
                -- upvalues: v13 (ref)
                for _, v35 in v13 do
                    v35.Enabled = false;
                end;
            end);
        end
    };
end;