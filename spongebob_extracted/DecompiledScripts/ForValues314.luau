local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Dependencies.captureDependencies);
local v4 = require(l_Parent_0.Dependencies.initDependency);
local v5 = require(l_Parent_0.Dependencies.useDependency);
local v6 = require(l_Parent_0.Logging.parseError);
local v7 = require(l_Parent_0.Logging.logErrorNonFatal);
local v8 = require(l_Parent_0.Logging.logWarn);
local v9 = require(l_Parent_0.Utility.cleanup);
local v10 = require(l_Parent_0.Utility.needsDestruction);
local v11 = {};
local v12 = {
    __index = v11
};
local v13 = {
    __mode = "k"
};
v11.get = function(v14, v15) --[[ Line: 34 ]] --[[ Name: get ]]
    -- upvalues: v5 (copy)
    if v15 ~= false then
        v5(v14);
    end;
    return v14._outputTable;
end;
v11.update = function(v16) --[[ Line: 59 ]] --[[ Name: update ]]
    -- upvalues: v13 (copy), v3 (copy), v10 (copy), v8 (copy), v9 (copy), v6 (copy), v7 (copy)
    local l__inputIsState_0 = v16._inputIsState;
    local v18 = if l__inputIsState_0 then v16._inputTable:get(false) else v16._inputTable;
    local v19 = {};
    local v20 = false;
    local l__valueCache_0 = v16._valueCache;
    local l__oldValueCache_0 = v16._oldValueCache;
    v16._oldValueCache = l__valueCache_0;
    v16._valueCache = l__oldValueCache_0;
    l__valueCache_0 = v16._valueCache;
    l__oldValueCache_0 = v16._oldValueCache;
    table.clear(l__valueCache_0);
    for v23 in pairs(v16.dependencySet) do
        v23.dependentSet[v16] = nil;
    end;
    local l_dependencySet_0 = v16.dependencySet;
    local l__oldDependencySet_0 = v16._oldDependencySet;
    v16._oldDependencySet = l_dependencySet_0;
    v16.dependencySet = l__oldDependencySet_0;
    table.clear(v16.dependencySet);
    if l__inputIsState_0 then
        v16._inputTable.dependentSet[v16] = true;
        v16.dependencySet[v16._inputTable] = true;
    end;
    for v26, v27 in pairs(v18) do
        local v28 = l__oldValueCache_0[v27];
        local v29 = v28 == nil;
        local v30 = nil;
        local v31 = nil;
        local v32 = nil;
        if type(v28) == "table" and #v28 > 0 then
            local v33 = table.remove(v28, #v28);
            v30 = v33.value;
            v31 = v33.valueData;
            v32 = v33.meta;
            if #v28 <= 0 then
                l__oldValueCache_0[v27] = nil;
            end;
        elseif v28 ~= nil then
            l__oldValueCache_0[v27] = nil;
            v29 = true;
        end;
        if v31 == nil then
            v31 = {
                dependencySet = setmetatable({}, v13), 
                oldDependencySet = setmetatable({}, v13), 
                dependencyValues = setmetatable({}, v13)
            };
        end;
        if v29 == false then
            for v34, v35 in pairs(v31.dependencyValues) do
                if v35 ~= v34:get(false) then
                    v29 = true;
                    break;
                end;
            end;
        end;
        if v29 then
            local l_dependencySet_1 = v31.dependencySet;
            local l_oldDependencySet_0 = v31.oldDependencySet;
            v31.oldDependencySet = l_dependencySet_1;
            v31.dependencySet = l_oldDependencySet_0;
            table.clear(v31.dependencySet);
            local v38;
            l_dependencySet_1, l_oldDependencySet_0, v38 = v3(v31.dependencySet, v16._processor, v27);
            if l_dependencySet_1 then
                if v16._destructor == nil and (v10(l_oldDependencySet_0) or v10(v38)) then
                    v8("destructorNeededForValues");
                end;
                if v30 ~= nil then
                    local v39, v40 = xpcall(v16._destructor or v9, v6, v30, v32);
                    if not v39 then
                        v7("forValuesDestructorError", v40);
                    end;
                end;
                v30 = l_oldDependencySet_0;
                v32 = v38;
                v20 = true;
            else
                local l_dependencySet_2 = v31.dependencySet;
                local l_oldDependencySet_1 = v31.oldDependencySet;
                v31.oldDependencySet = l_dependencySet_2;
                v31.dependencySet = l_oldDependencySet_1;
                v7("forValuesProcessorError", l_oldDependencySet_0);
            end;
        end;
        local v43 = l__valueCache_0[v27];
        if v43 == nil then
            v43 = {};
            l__valueCache_0[v27] = v43;
        end;
        table.insert(v43, {
            value = v30, 
            valueData = v31, 
            meta = v32
        });
        v19[v26] = v30;
        for v44 in pairs(v31.dependencySet) do
            v31.dependencyValues[v44] = v44:get(false);
            v16.dependencySet[v44] = true;
            v44.dependentSet[v16] = true;
        end;
    end;
    for _, v46 in pairs(l__oldValueCache_0) do
        for _, v48 in ipairs(v46) do
            local l_value_0 = v48.value;
            local l_meta_0 = v48.meta;
            local v51, v52 = xpcall(v16._destructor or v9, v6, l_value_0, l_meta_0);
            if not v51 then
                v7("forValuesDestructorError", v52);
            end;
            v20 = true;
        end;
        table.clear(v46);
    end;
    v16._outputTable = v19;
    return v20;
end;
return function(v53, v54, v55) --[[ Line: 213 ]] --[[ Name: ForValues ]]
    -- upvalues: v13 (copy), v12 (copy), v4 (copy)
    local v56 = false;
    if v53.type == "State" then
        v56 = typeof(v53.get) == "function";
    end;
    local v57 = setmetatable({
        type = "State", 
        kind = "ForValues", 
        dependencySet = {}, 
        dependentSet = setmetatable({}, v13), 
        _oldDependencySet = {}, 
        _processor = v54, 
        _destructor = v55, 
        _inputIsState = v56, 
        _inputTable = v53, 
        _outputTable = {}, 
        _valueCache = {}, 
        _oldValueCache = {}
    }, v12);
    v4(v57);
    v57:update();
    return v57;
end;