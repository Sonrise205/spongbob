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
    -- upvalues: v7 (copy), v10 (copy), v9 (copy), v8 (copy), v16 (copy), v14 (copy), v3 (copy), v6 (copy)
    local v21 = os.clock();
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
    local function v28() --[[ Line: 104 ]]
        -- upvalues: v26 (copy)
        v26.scope = nil;
        for v27 in pairs(v26.dependencySet) do
            v27.dependentSet[v26] = nil;
        end;
    end;
    v26.oldestChore = v28;
    v14[v26.oldestChore] = "Spring";
    table.insert(v17, v28);
    if v22 ~= nil then
        v3.bOutlivesA(v17, v26.oldestChore, v22.scope, v22.oldestChore, v3.formatters.animationGoal);
    end;
    local v29 = v7(v24);
    if v29 ~= nil then
        v3.bOutlivesA(v17, v26.oldestChore, v29.scope, v29.oldestChore, v3.formatters.parameter, "speed");
    end;
    local v30 = v7(v25);
    if v30 ~= nil then
        v3.bOutlivesA(v17, v26.oldestChore, v30.scope, v30.oldestChore, v3.formatters.parameter, "damping");
    end;
    v6(v26, true);
    return v26;
end;
v15.addVelocity = function(v32, v33) --[[ Line: 145 ]] --[[ Name: addVelocity ]]
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
v15.setPosition = function(v38, v39) --[[ Line: 165 ]] --[[ Name: setPosition ]]
    -- upvalues: v6 (copy), v2 (copy), v12 (copy), v5 (copy)
    v6(v38, false);
    local v40 = typeof(v39);
    if v40 ~= v38._activeType then
        v2.logError("springTypeMismatch", nil, v40, v38._activeType);
    end;
    v38._activeStartP = v12(v39, v40);
    v38._activeStartV = table.clone(v38._activeLatestV);
    v38._stopwatch:zero();
    v38._stopwatch:unpause();
    v5(v38);
end;
v15.setVelocity = function(v41, v42) --[[ Line: 181 ]] --[[ Name: setVelocity ]]
    -- upvalues: v6 (copy), v2 (copy), v12 (copy), v5 (copy)
    v6(v41, false);
    if v42 then
        local v43 = typeof(v42);
        if v43 ~= v41._activeType then
            v2.logError("springTypeMismatch", nil, v43, v41._activeType);
        end;
        v41._activeStartV = v12(v42, v43);
    else
        v41._activeStartV = table.create(v41._activeNumSprings, 0);
    end;
    v41._activeStartP = table.clone(v41._activeLatestP);
    v41._stopwatch:zero();
    v41._stopwatch:unpause();
    v5(v41);
end;
v15._evaluate = function(v44) --[[ Line: 201 ]] --[[ Name: _evaluate ]]
    -- upvalues: v7 (copy), v4 (copy), v2 (copy), v13 (copy), v11 (copy), v8 (copy), v12 (copy)
    local v45 = v7(v44._goal);
    if v45 == nil then
        v44._EXTREMELY_DANGEROUS_usedAsValue = v44._goal;
        return false;
    else
        local v46 = v4(v44, v45);
        local l__stopwatch_0 = v44._stopwatch;
        local v48 = v4(v44, l__stopwatch_0);
        if v46 ~= v46 then
            v2.logWarn("springNanGoal");
            return false;
        else
            local v49 = typeof(v46);
            local v50 = v49 ~= v44._activeType;
            local v51 = nil;
            if v50 then
                v51 = v46;
            else
                local v52, v53, v54, v55 = v13(v48, v44._activeDamping, v44._activeSpeed);
                local v56 = false;
                for v57 = 1, v44._activeNumSprings do
                    local v58 = v44._activeStartP[v57];
                    local v59 = v44._activeTargetP[v57];
                    local v60 = v44._activeStartV[v57];
                    local v61 = v58 - v59;
                    local v62 = v61 * v52 + v60 * v53;
                    local v63 = v61 * v54 + v60 * v55;
                    if v62 ~= v62 or v63 ~= v63 then
                        v2.logWarn("springNanMotion");
                        v62 = 0;
                        v63 = 0;
                    end;
                    if math.abs(v62) < 1.0E-5 then
                        v62 = 0;
                    end;
                    if math.abs(v63) < 1.0E-5 then
                        v63 = 0;
                    end;
                    if math.abs(v62) > 1.0E-5 or math.abs(v63) > 1.0E-5 then
                        v56 = true;
                    end;
                    local v64 = v62 + v59;
                    v44._activeLatestP[v57] = v64;
                    v44._activeLatestV[v57] = v63;
                end;
                if not v56 and l__stopwatch_0:isPlaying() then
                    v44._activeLatestP = table.clone(v44._activeTargetP);
                    v44._activeLatestV = table.create(v44._activeNumSprings, 0);
                    v44._activeStartP = table.clone(v44._activeTargetP);
                    v44._activeStartV = table.create(v44._activeNumSprings, 0);
                    l__stopwatch_0:pause();
                    l__stopwatch_0:zero();
                end;
                v51 = v11(v44._activeLatestP, v44._activeType);
            end;
            local v65 = v8(v44._speed);
            local v66 = v8(v44._damping);
            if v50 or v46 ~= v44._activeGoal or v65 ~= v44._activeSpeed or v66 ~= v44._activeDamping then
                v44._activeTargetP = v12(v46, v49);
                v44._activeNumSprings = #v44._activeTargetP;
                if v50 then
                    v44._activeStartP = table.clone(v44._activeTargetP);
                    v44._activeLatestP = table.clone(v44._activeTargetP);
                    v44._activeStartV = table.create(v44._activeNumSprings, 0);
                    v44._activeLatestV = table.create(v44._activeNumSprings, 0);
                else
                    v44._activeStartP = table.clone(v44._activeLatestP);
                    v44._activeStartV = table.clone(v44._activeLatestV);
                end;
                v44._activeType = v49;
                v44._activeGoal = v46;
                v44._activeDamping = v66;
                v44._activeSpeed = v65;
                l__stopwatch_0:zero();
                l__stopwatch_0:unpause();
            end;
            local l__EXTREMELY_DANGEROUS_usedAsValue_0 = v44._EXTREMELY_DANGEROUS_usedAsValue;
            v44._EXTREMELY_DANGEROUS_usedAsValue = v51;
            return l__EXTREMELY_DANGEROUS_usedAsValue_0 ~= v51;
        end;
    end;
end;
table.freeze(v15);
return v31;