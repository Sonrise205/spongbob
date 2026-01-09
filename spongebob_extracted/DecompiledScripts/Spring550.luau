local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Logging.logError);
local v4 = require(l_Parent_0.Logging.logErrorNonFatal);
local v5 = require(l_Parent_0.Animation.unpackType);
local v6 = require(l_Parent_0.Animation.SpringScheduler);
local v7 = require(l_Parent_0.Dependencies.useDependency);
local v8 = require(l_Parent_0.Dependencies.initDependency);
local v9 = require(l_Parent_0.Dependencies.updateAll);
local v10 = require(l_Parent_0.Utility.xtypeof);
local v11 = require(l_Parent_0.State.unwrap);
local v12 = {};
local v13 = {
    __index = v12
};
local v14 = {
    __mode = "k"
};
v12.get = function(v15, v16) --[[ Line: 30 ]] --[[ Name: get ]]
    -- upvalues: v7 (copy)
    if v16 ~= false then
        v7(v15);
    end;
    return v15._currentValue;
end;
v12.setPosition = function(v17, v18) --[[ Line: 44 ]] --[[ Name: setPosition ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy), v9 (copy)
    local v19 = typeof(v18);
    if v19 ~= v17._currentType then
        v3("springTypeMismatch", nil, v19, v17._currentType);
    end;
    v17._springPositions = v5(v18, v19);
    v17._currentValue = v18;
    v6.add(v17);
    v9(v17);
end;
v12.setVelocity = function(v20, v21) --[[ Line: 63 ]] --[[ Name: setVelocity ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy)
    local v22 = typeof(v21);
    if v22 ~= v20._currentType then
        v3("springTypeMismatch", nil, v22, v20._currentType);
    end;
    v20._springVelocities = v5(v21, v22);
    v6.add(v20);
end;
v12.addVelocity = function(v23, v24) --[[ Line: 80 ]] --[[ Name: addVelocity ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy)
    local v25 = typeof(v24);
    if v25 ~= v23._currentType then
        v3("springTypeMismatch", nil, v25, v23._currentType);
    end;
    local v26 = v5(v24, v25);
    for v27, v28 in ipairs(v26) do
        local l__springVelocities_0 = v23._springVelocities;
        l__springVelocities_0[v27] = l__springVelocities_0[v27] + v28;
    end;
    v6.add(v23);
end;
v12.update = function(v30) --[[ Line: 97 ]] --[[ Name: update ]]
    -- upvalues: v11 (copy), v4 (copy), v5 (copy), v6 (copy)
    local v31 = v30._goalState:get(false);
    if v31 == v30._goalValue then
        local v32 = v11(v30._damping);
        if typeof(v32) ~= "number" then
            v4("mistypedSpringDamping", nil, (typeof(v32)));
        elseif v32 < 0 then
            v4("invalidSpringDamping", nil, v32);
        else
            v30._currentDamping = v32;
        end;
        local v33 = v11(v30._speed);
        if typeof(v33) ~= "number" then
            v4("mistypedSpringSpeed", nil, (typeof(v33)));
        elseif v33 < 0 then
            v4("invalidSpringSpeed", nil, v33);
        else
            v30._currentSpeed = v33;
        end;
        return false;
    else
        v30._goalValue = v31;
        local l__currentType_0 = v30._currentType;
        local v35 = typeof(v31);
        v30._currentType = v35;
        local v36 = v5(v31, v35);
        local v37 = #v36;
        v30._springGoals = v36;
        if v35 ~= l__currentType_0 then
            v30._currentValue = v30._goalValue;
            local v38 = table.create(v37, 0);
            local v39 = table.create(v37, 0);
            for v40, v41 in ipairs(v36) do
                v38[v40] = v41;
            end;
            v30._springPositions = v38;
            v30._springVelocities = v39;
            v6.remove(v30);
            return true;
        elseif v37 == 0 then
            v30._currentValue = v30._goalValue;
            return true;
        else
            v6.add(v30);
            return false;
        end;
    end;
end;
return function(v42, v43, v44) --[[ Line: 165 ]] --[[ Name: Spring ]]
    -- upvalues: v10 (copy), v14 (copy), v11 (copy), v13 (copy), v8 (copy)
    if v43 == nil then
        v43 = 10;
    end;
    if v44 == nil then
        v44 = 1;
    end;
    local v45 = {
        [v42] = true
    };
    if v10(v43) == "State" then
        v45[v43] = true;
    end;
    if v10(v44) == "State" then
        v45[v44] = true;
    end;
    local v46 = setmetatable({
        type = "State", 
        kind = "Spring", 
        dependencySet = v45, 
        dependentSet = setmetatable({}, v14), 
        _speed = v43, 
        _damping = v44, 
        _goalState = v42, 
        _goalValue = nil, 
        _currentType = nil, 
        _currentValue = nil, 
        _currentSpeed = v11(v43), 
        _currentDamping = v11(v44), 
        _springPositions = nil, 
        _springGoals = nil, 
        _springVelocities = nil
    }, v13);
    v8(v46);
    v42.dependentSet[v46] = true;
    v46:update();
    return v46;
end;