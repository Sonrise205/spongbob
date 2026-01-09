local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_speedMultiplier_0 = v4.speedMultiplier;
    local l_Attack_0 = v4.model.VFX.Attack;
    local v7 = v4.getScaledEffectRange(55);
    local v8 = v4.range / (v7 * 0.5);
    local v9 = {
        start = TweenInfo.new(0.5 / l_speedMultiplier_0, Enum.EasingStyle.Quart, Enum.EasingDirection.In), 
        target = TweenInfo.new(1 / l_speedMultiplier_0, Enum.EasingStyle.Quart)
    };
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {
        start = {}, 
        target = {}
    };
    local l_Beams_0 = l_Attack_0.PrimaryPart.Beams;
    local l_1_0 = l_Beams_0:FindFirstChild("1");
    local l_Charge1_0 = l_Attack_0.Charge1;
    local l_Charge2_0 = l_Attack_0.Charge2;
    local l_Charge3_0 = l_Attack_0.Charge3;
    local v21 = {
        pivot = l_1_0.CFrame, 
        size = l_1_0.Size
    };
    for _, v23 in l_Attack_0:GetChildren() do
        if v23:IsA("BasePart") and string.find(v23.Name, "Attack") then
            v3:IterateClass(v23, "ParticleEmitter", function(v24) --[[ Line: 65 ]]
                -- upvalues: v10 (copy), v3 (ref), l_speedMultiplier_0 (copy), v8 (copy)
                table.insert(v10, v24);
                v3:AdjustEmitterSpeed(v24, l_speedMultiplier_0);
                v3:ScaleEmitterSize(v24, v8);
            end);
        end;
    end;
    v3:IterateClass(l_Charge1_0, "ParticleEmitter", function(v25) --[[ Line: 72 ]]
        -- upvalues: v11 (copy), v3 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v11, v25);
        v3:AdjustEmitterSpeed(v25, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v25, v8);
    end);
    v3:IterateClass(l_Charge2_0, "ParticleEmitter", function(v26) --[[ Line: 78 ]]
        -- upvalues: v12 (copy), v3 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v12, v26);
        v3:AdjustEmitterSpeed(v26, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v26, v8);
    end);
    v3:IterateClass(l_Charge3_0, "ParticleEmitter", function(v27) --[[ Line: 84 ]]
        -- upvalues: v13 (copy), v3 (ref), l_speedMultiplier_0 (copy), v8 (copy)
        table.insert(v13, v27);
        v3:AdjustEmitterSpeed(v27, l_speedMultiplier_0);
        v3:ScaleEmitterSize(v27, v8);
    end);
    for _, v29 in l_Beams_0:GetChildren() do
        local v30 = tonumber(v29.Name);
        if v30 and v30 ~= 1 then
            local v31 = {};
            local v32 = {};
            v15.start[v29] = {
                pivot = v21.pivot, 
                positions = v31
            };
            v15.target[v29] = {
                pivot = v29.CFrame, 
                positions = v32
            };
            v29.CFrame = v21.pivot;
            local v33 = v21.size / v29.Size;
            for _, v35 in v29:GetChildren() do
                v32[v35] = v35.Position;
                local v36 = v35.Position * v33;
                v31[v35] = v36;
                v35.Position = v36;
                for _, v38 in v35:GetChildren() do
                    table.insert(v14, v38);
                end;
            end;
        end;
    end;
    local function v57(v39) --[[ Line: 129 ]] --[[ Name: tweenBeams ]]
        -- upvalues: v15 (copy), v9 (copy), v1 (ref), v3 (ref), v14 (copy)
        local v40 = {};
        local v41 = if v39 then v15.target else v15.start;
        local v42 = if v39 then v9.target else v9.start;
        for v43, v44 in v41 do
            table.insert(v40, v1.new(function(v45) --[[ Line: 136 ]]
                -- upvalues: v3 (ref), v43 (copy), v42 (copy), v44 (copy)
                v3:Tween(v43, v42, {
                    CFrame = v44.pivot
                }, v45);
            end));
            for v46, v47 in v44.positions do
                table.insert(v40, v1.new(function(v48) --[[ Line: 141 ]]
                    -- upvalues: v3 (ref), v46 (copy), v42 (copy), v47 (copy)
                    v3:Tween(v46, v42, {
                        Position = v47
                    }, v48);
                end));
            end;
        end;
        if v39 then
            for _, v50 in v14 do
                v50.Enabled = true;
            end;
        else
            v1.allSettled(v40):andThen(function() --[[ Line: 152 ]]
                -- upvalues: v14 (ref), v41 (ref), v15 (ref)
                for _, v52 in v14 do
                    v52.Enabled = false;
                end;
                v41 = v15.target;
                for v53, v54 in v41 do
                    v53.CFrame = v54.pivot;
                    for v55, v56 in v54.positions do
                        v55.Position = v56;
                    end;
                end;
            end);
        end;
    end;
    return {
        Charge1 = function() --[[ Line: 171 ]] --[[ Name: Charge1 ]]
            -- upvalues: v3 (ref), v11 (copy)
            v3:ToggleEmitters(v11, true);
        end, 
        Charge2 = function() --[[ Line: 175 ]] --[[ Name: Charge2 ]]
            -- upvalues: v3 (ref), v12 (copy)
            v3:ToggleEmitters(v12, true);
        end, 
        Charge3 = function() --[[ Line: 179 ]] --[[ Name: Charge3 ]]
            -- upvalues: v3 (ref), v13 (copy)
            v3:ToggleEmitters(v13, true);
        end, 
        Attack = function() --[[ Line: 183 ]] --[[ Name: Attack ]]
            -- upvalues: v57 (copy), v3 (ref), v10 (copy), v11 (copy)
            v57(true);
            v3:ToggleEmitters(v10, true);
            v3:ToggleEmitters(v11, false);
        end, 
        StopAttack = function() --[[ Line: 189 ]] --[[ Name: StopAttack ]]
            -- upvalues: v57 (copy), v3 (ref), v12 (copy), v13 (copy), v10 (copy)
            v57(false);
            v3:ToggleEmitters(v12, false);
            v3:ToggleEmitters(v13, false);
            v3:ToggleEmitters(v10, false);
        end
    };
end;