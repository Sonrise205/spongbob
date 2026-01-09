local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.checkLifetime);
local v4 = require(l_Parent_0.Graph.depend);
local v5 = require(l_Parent_0.Graph.change);
local v6 = require(l_Parent_0.Graph.evaluate);
local v7 = require(l_Parent_0.State.castToState);
local v8 = require(l_Parent_0.State.peek);
local v9 = require(l_Parent_0.Animation.ExternalTime);
local v10 = require(l_Parent_0.Animation.Stopwatch);
local v11 = require(l_Parent_0.Animation.packType);
local v12 = require(l_Parent_0.Animation.unpackType);
local v13 = require(l_Parent_0.Animation.springCoefficients);
local v14 = require(l_Parent_0.Utility.nicknames);
local v15 = {
    type = "State", 
    kind = "Spring", 
    timeliness = "eager"
};
local v16 = table.freeze({
    __index = v15
});
local function v31(v17, v18, v19, v20) --[[ Line: 60 ]] --[[ Name: Spring ]]
    -- upvalues: v7 (copy), v2 (copy), v10 (copy), v9 (copy), v8 (copy), v16 (copy), v14 (copy), v3 (copy), v6 (copy)
    local v21 = os.clock();
    if typeof(v17) ~= "table" or v7(v17) ~= nil then
        v2.logError("scopeMissing", nil, "Springs", "myScope:Spring(goalState, speed, damping)");
    end;
    local v22 = v7(v18);
    local v23 = nil;
    if v22 ~= nil then
        v23 = v10(v17, v9(v17));
        v23:unpause();
    end;
    local v24 = v19 or 10;
    local v25 = v20 or 1;
    local v26 = setmetatable({
        createdAt = v21, 
        dependencySet = {}, 
        dependentSet = {}, 
        lastChange = nil, 
        scope = v17, 
        validity = "invalid", 
        _activeDamping = -1, 
        _activeGoal = nil, 
        _activeLatestP = {}, 
        _activeLatestV = {}, 
        _activeNumSprings = 0, 
        _activeSpeed = -1, 
        _activeStartP = {}, 
        _activeStartV = {}, 
        _activeTargetP = {}, 
        _activeType = "", 
        _damping = v25, 
        _EXTREMELY_DANGEROUS_usedAsValue = v8(v18), 
        _goal = v18, 
        _speed = v24, 
        _stopwatch = v23
    }, v16);
    local function v28() --[[ Line: 107 ]]
        -- upvalues: v26 (copy)
        v26.scope = nil;
        for v27 in pairs(v26.dependencySet) do
            v27.dependentSet[v26] = nil;
        end;
    end;
    v26.oldestTask = v28;
    v14[v26.oldestTask] = "Spring";
    table.insert(v17, v28);
    if v22 ~= nil then
        v3.bOutlivesA(v17, v26.oldestTask, v22.scope, v22.oldestTask, v3.formatters.animationGoal);
    end;
    local v29 = v7(v24);
    if v29 ~= nil then
        v3.bOutlivesA(v17, v26.oldestTask, v29.scope, v29.oldestTask, v3.formatters.parameter, "speed");
    end;
    local v30 = v7(v25);
    if v30 ~= nil then
        v3.bOutlivesA(v17, v26.oldestTask, v30.scope, v30.oldestTask, v3.formatters.parameter, "damping");
    end;
    v6(v26, true);
    return v26;
end;
v15.addVelocity = function(v32, v33) --[[ Line: 148 ]] --[[ Name: addVelocity ]]
    -- upvalues: v6 (copy), v2 (copy), v12 (copy), v5 (copy)
    v6(v32, false);
    local v34 = typeof(v33);
    if v34 ~= v32._activeType then
        v2.logError("springTypeMismatch", nil, v34, v32._activeType);
    end;
    local v35 = v12(v33, v34);
    for v36, v37 in v32._activeLatestV do
        v35[v36] = v35[v36] + v37;
    end;
    v32._activeStartP = table.clone(v32._activeLatestP);
    v32._activeStartV = v35;
    v32._stopwatch:zero();
    v32._stopwatch:unpause();
    v5(v32);
end;
v15.get = function(_) --[[ Line: 168 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy)
    return v2.logError("stateGetWasRemoved");
end;
v15.setPosition = function(v39, v40) --[[ Line: 174 ]] --[[ Name: setPosition ]]
    -- upvalues: v6 (copy), v2 (copy), v12 (copy), v5 (copy)
    v6(v39, false);
    local v41 = typeof(v40);
    if v41 ~= v39._activeType then
        v2.logError("springTypeMismatch", nil, v41, v39._activeType);
    end;
    v39._activeStartP = v12(v40, v41);
    v39._activeStartV = table.clone(v39._activeLatestV);
    v39._stopwatch:zero();
    v39._stopwatch:unpause();
    v5(v39);
end;
v15.setVelocity = function(v42, v43) --[[ Line: 190 ]] --[[ Name: setVelocity ]]
    -- upvalues: v6 (copy), v2 (copy), v12 (copy), v5 (copy)
    v6(v42, false);
    local v44 = typeof(v43);
    if v44 ~= v42._activeType then
        v2.logError("springTypeMismatch", nil, v44, v42._activeType);
    end;
    v42._activeStartP = table.clone(v42._activeLatestP);
    v42._activeStartV = v12(v43, v44);
    v42._stopwatch:zero();
    v42._stopwatch:unpause();
    v5(v42);
end;
v15._evaluate = function(v45) --[[ Line: 206 ]] --[[ Name: _evaluate ]]
    -- upvalues: v7 (copy), v8 (copy), v2 (copy), v4 (copy), v13 (copy), v11 (copy), v12 (copy)
    local v46 = v7(v45._goal);
    if v46 == nil then
        v45._EXTREMELY_DANGEROUS_usedAsValue = v45._goal;
        return false;
    else
        local v47 = v8(v46);
        if v47 ~= v47 then
            v2.logWarn("springNanGoal");
            return false;
        else
            local v48 = typeof(v47);
            local v49 = v48 ~= v45._activeType;
            local l__stopwatch_0 = v45._stopwatch;
            local v51 = v8(l__stopwatch_0);
            v4(v45, l__stopwatch_0);
            local l__EXTREMELY_DANGEROUS_usedAsValue_0 = v45._EXTREMELY_DANGEROUS_usedAsValue;
            local v53 = nil;
            if v49 then
                v53 = v47;
            elseif v51 <= 0 then
                v53 = l__EXTREMELY_DANGEROUS_usedAsValue_0;
            else
                local v54, v55, v56, v57 = v13(v51, v45._activeDamping, v45._activeSpeed);
                local v58 = false;
                for v59 = 1, v45._activeNumSprings do
                    local v60 = v45._activeStartP[v59];
                    local v61 = v45._activeTargetP[v59];
                    local v62 = v45._activeStartV[v59];
                    local v63 = v60 - v61;
                    local v64 = v63 * v54 + v62 * v55;
                    local v65 = v63 * v56 + v62 * v57;
                    if v64 ~= v64 or v65 ~= v65 then
                        v2.logWarn("springNanMotion");
                        v64 = 0;
                        v65 = 0;
                    end;
                    if math.abs(v64) > 1.0E-5 or math.abs(v65) > 1.0E-5 then
                        v58 = true;
                    end;
                    local v66 = v64 + v61;
                    v45._activeLatestP[v59] = v66;
                    v45._activeLatestV[v59] = v65;
                end;
                if not v58 then
                    for v67 = 1, v45._activeNumSprings do
                        v45._activeLatestP[v67] = v45._activeTargetP[v67];
                    end;
                end;
                v53 = v11(v45._activeLatestP, v45._activeType);
            end;
            local v68 = v8(v45._speed);
            local v69 = v8(v45._damping);
            if v49 or v47 ~= v45._activeGoal or v68 ~= v45._activeSpeed or v69 ~= v45._activeDamping then
                v45._activeTargetP = v12(v47, v48);
                v45._activeNumSprings = #v45._activeTargetP;
                if v49 then
                    v45._activeStartP = table.clone(v45._activeTargetP);
                    v45._activeLatestP = table.clone(v45._activeTargetP);
                    v45._activeStartV = table.create(v45._activeNumSprings, 0);
                    v45._activeLatestV = table.create(v45._activeNumSprings, 0);
                else
                    v45._activeStartP = table.clone(v45._activeLatestP);
                    v45._activeStartV = table.clone(v45._activeLatestV);
                end;
                v45._activeType = v48;
                v45._activeGoal = v47;
                v45._activeDamping = v69;
                v45._activeSpeed = v68;
                l__stopwatch_0:zero();
                l__stopwatch_0:unpause();
            end;
            v45._EXTREMELY_DANGEROUS_usedAsValue = v53;
            return l__EXTREMELY_DANGEROUS_usedAsValue_0 ~= v53;
        end;
    end;
end;
table.freeze(v15);
return v31;