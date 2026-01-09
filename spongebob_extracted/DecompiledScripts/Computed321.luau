local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Dependencies.captureDependencies);
local v3 = require(l_Parent_0.Dependencies.initDependency);
local v4 = require(l_Parent_0.Dependencies.useDependency);
local v5 = require(l_Parent_0.Logging.logErrorNonFatal);
local v6 = require(l_Parent_0.Logging.logWarn);
local v7 = require(l_Parent_0.Utility.isSimilar);
local v8 = require(l_Parent_0.Utility.needsDestruction);
local v9 = {};
local v10 = {
    __index = v9
};
local v11 = {
    __mode = "k"
};
v9.get = function(v12, v13) --[[ Line: 28 ]] --[[ Name: get ]]
    -- upvalues: v4 (copy)
    if v13 ~= false then
        v4(v12);
    end;
    return v12._value;
end;
v9.update = function(v14) --[[ Line: 39 ]] --[[ Name: update ]]
    -- upvalues: v2 (copy), v8 (copy), v6 (copy), v7 (copy), v5 (copy)
    for v15 in pairs(v14.dependencySet) do
        v15.dependentSet[v14] = nil;
    end;
    local l_dependencySet_0 = v14.dependencySet;
    local l__oldDependencySet_0 = v14._oldDependencySet;
    v14._oldDependencySet = l_dependencySet_0;
    v14.dependencySet = l__oldDependencySet_0;
    table.clear(v14.dependencySet);
    local v18;
    l_dependencySet_0, l__oldDependencySet_0, v18 = v2(v14.dependencySet, v14._processor);
    if l_dependencySet_0 then
        if v14._destructor == nil and v8(l__oldDependencySet_0) then
            v6("destructorNeededComputed");
        end;
        if v18 ~= nil then
            v6("multiReturnComputed");
        end;
        local l__value_0 = v14._value;
        local v20 = v7(l__value_0, l__oldDependencySet_0);
        if v14._destructor ~= nil then
            v14._destructor(l__value_0);
        end;
        v14._value = l__oldDependencySet_0;
        for v21 in pairs(v14.dependencySet) do
            v21.dependentSet[v14] = true;
        end;
        return not v20;
    else
        v5("computedCallbackError", l__oldDependencySet_0);
        local l_dependencySet_1 = v14.dependencySet;
        local l__oldDependencySet_1 = v14._oldDependencySet;
        v14._oldDependencySet = l_dependencySet_1;
        v14.dependencySet = l__oldDependencySet_1;
        for v24 in pairs(v14.dependencySet) do
            v24.dependentSet[v14] = true;
        end;
        return false;
    end;
end;
return function(v25, v26) --[[ Line: 93 ]] --[[ Name: Computed ]]
    -- upvalues: v11 (copy), v10 (copy), v3 (copy)
    local v27 = setmetatable({
        type = "State", 
        kind = "Computed", 
        dependencySet = {}, 
        dependentSet = setmetatable({}, v11), 
        _oldDependencySet = {}, 
        _processor = v25, 
        _destructor = v26, 
        _value = nil
    }, v10);
    v3(v27);
    v27:update();
    return v27;
end;