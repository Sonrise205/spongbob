local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Animation.packType);
local v4 = require(l_Parent_0.Animation.springCoefficients);
local v5 = require(l_Parent_0.Dependencies.updateAll);
local v6 = {};
local v7 = {};
local v8 = os.clock();
v6.add = function(v9) --[[ Line: 24 ]] --[[ Name: add ]]
    -- upvalues: v8 (ref), v7 (copy)
    v9._lastSchedule = v8;
    v9._startDisplacements = {};
    v9._startVelocities = {};
    for v10, v11 in ipairs(v9._springGoals) do
        v9._startDisplacements[v10] = v9._springPositions[v10] - v11;
        v9._startVelocities[v10] = v9._springVelocities[v10];
    end;
    v7[v9] = true;
end;
v6.remove = function(v12) --[[ Line: 39 ]] --[[ Name: remove ]]
    -- upvalues: v7 (copy)
    v7[v12] = nil;
end;
local function v32() --[[ Line: 44 ]] --[[ Name: updateAllSprings ]]
    -- upvalues: v8 (ref), v7 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v13 = {};
    v8 = os.clock();
    for v14 in pairs(v7) do
        local v15, v16, v17, v18 = v4(v8 - v14._lastSchedule, v14._currentDamping, v14._currentSpeed);
        local l__springPositions_0 = v14._springPositions;
        local l__springVelocities_0 = v14._springVelocities;
        local l__startDisplacements_0 = v14._startDisplacements;
        local l__startVelocities_0 = v14._startVelocities;
        local v23 = false;
        for v24, v25 in ipairs(v14._springGoals) do
            local v26 = l__startDisplacements_0[v24];
            local v27 = l__startVelocities_0[v24];
            local v28 = v26 * v15 + v27 * v16;
            local v29 = v26 * v17 + v27 * v18;
            if math.abs(v28) > 1.0E-4 or math.abs(v29) > 1.0E-4 then
                v23 = true;
            end;
            l__springPositions_0[v24] = v28 + v25;
            l__springVelocities_0[v24] = v29;
        end;
        if not v23 then
            v13[v14] = true;
        end;
    end;
    for v30 in pairs(v7) do
        v30._currentValue = v3(v30._springPositions, v30._currentType);
        v5(v30);
    end;
    for v31 in pairs(v13) do
        v7[v31] = nil;
    end;
end;
l_RunService_0:BindToRenderStep("__FusionSpringScheduler", Enum.RenderPriority.First.Value, v32);
return v6;