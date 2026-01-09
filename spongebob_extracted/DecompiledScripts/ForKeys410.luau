local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Dependencies.captureDependencies);
local v4 = require(l_Parent_0.Dependencies.initDependency);
local v5 = require(l_Parent_0.Dependencies.useDependency);
local v6 = require(l_Parent_0.Logging.parseError);
local v7 = require(l_Parent_0.Logging.logErrorNonFatal);
local v8 = require(l_Parent_0.Logging.logError);
local v9 = require(l_Parent_0.Logging.logWarn);
local v10 = require(l_Parent_0.Utility.cleanup);
local v11 = require(l_Parent_0.Utility.needsDestruction);
local v12 = {};
local v13 = {
    __index = v12
};
local v14 = {
    __mode = "k"
};
v12.get = function(v15, v16) --[[ Line: 36 ]] --[[ Name: get ]]
    -- upvalues: v5 (copy)
    if v16 ~= false then
        v5(v15);
    end;
    return v15._outputTable;
end;
v12.update = function(v17) --[[ Line: 62 ]] --[[ Name: update ]]
    -- upvalues: v14 (copy), v3 (copy), v11 (copy), v9 (copy), v8 (copy), v10 (copy), v6 (copy), v7 (copy)
    local l__inputIsState_0 = v17._inputIsState;
    local v19 = if l__inputIsState_0 then v17._inputTable:get(false) else v17._inputTable;
    local l__oldInputTable_0 = v17._oldInputTable;
    local l__outputTable_0 = v17._outputTable;
    local l__keyOIMap_0 = v17._keyOIMap;
    local l__keyIOMap_0 = v17._keyIOMap;
    local l__meta_0 = v17._meta;
    local v25 = false;
    for v26 in pairs(v17.dependencySet) do
        v26.dependentSet[v17] = nil;
    end;
    local l_dependencySet_0 = v17.dependencySet;
    local l__oldDependencySet_0 = v17._oldDependencySet;
    v17._oldDependencySet = l_dependencySet_0;
    v17.dependencySet = l__oldDependencySet_0;
    table.clear(v17.dependencySet);
    if l__inputIsState_0 then
        v17._inputTable.dependentSet[v17] = true;
        v17.dependencySet[v17._inputTable] = true;
    end;
    for v29, v30 in pairs(v19) do
        local v31 = v17._keyData[v29];
        if v31 == nil then
            v31 = {
                dependencySet = setmetatable({}, v14), 
                oldDependencySet = setmetatable({}, v14), 
                dependencyValues = setmetatable({}, v14)
            };
            v17._keyData[v29] = v31;
        end;
        local v32 = l__oldInputTable_0[v29] == nil;
        if v32 == false then
            for v33, v34 in pairs(v31.dependencyValues) do
                if v34 ~= v33:get(false) then
                    v32 = true;
                    break;
                end;
            end;
        end;
        if v32 then
            local l_dependencySet_1 = v31.dependencySet;
            local l_oldDependencySet_0 = v31.oldDependencySet;
            v31.oldDependencySet = l_dependencySet_1;
            v31.dependencySet = l_oldDependencySet_0;
            table.clear(v31.dependencySet);
            local v37;
            l_dependencySet_1, l_oldDependencySet_0, v37 = v3(v31.dependencySet, v17._processor, v29);
            if l_dependencySet_1 then
                if v17._destructor == nil and (v11(l_oldDependencySet_0) or v11(v37)) then
                    v9("destructorNeededForKeys");
                end;
                local v38 = l__keyOIMap_0[l_oldDependencySet_0];
                local v39 = l__keyIOMap_0[v29];
                if v38 ~= v29 and v19[v38] ~= nil then
                    v8("forKeysKeyCollision", nil, tostring(l_oldDependencySet_0), tostring(v38), (tostring(l_oldDependencySet_0)));
                end;
                if v39 ~= l_oldDependencySet_0 and l__keyOIMap_0[v39] == v29 then
                    local v40 = l__meta_0[v39];
                    local v41, v42 = xpcall(v17._destructor or v10, v6, v39, v40);
                    if not v41 then
                        v7("forKeysDestructorError", v42);
                    end;
                    l__keyOIMap_0[v39] = nil;
                    l__outputTable_0[v39] = nil;
                    l__meta_0[v39] = nil;
                end;
                l__oldInputTable_0[v29] = v30;
                l__meta_0[l_oldDependencySet_0] = v37;
                l__keyOIMap_0[l_oldDependencySet_0] = v29;
                l__keyIOMap_0[v29] = l_oldDependencySet_0;
                l__outputTable_0[l_oldDependencySet_0] = v30;
                v25 = true;
            else
                local l_dependencySet_2 = v31.dependencySet;
                local l_oldDependencySet_1 = v31.oldDependencySet;
                v31.oldDependencySet = l_dependencySet_2;
                v31.dependencySet = l_oldDependencySet_1;
                v7("forKeysProcessorError", l_oldDependencySet_0);
            end;
        end;
        for v45 in pairs(v31.dependencySet) do
            v31.dependencyValues[v45] = v45:get(false);
            v17.dependencySet[v45] = true;
            v45.dependentSet[v17] = true;
        end;
    end;
    for v46, v47 in pairs(l__keyOIMap_0) do
        if v19[v47] == nil then
            local v48 = l__meta_0[v46];
            local v49, v50 = xpcall(v17._destructor or v10, v6, v46, v48);
            if not v49 then
                v7("forKeysDestructorError", v50);
            end;
            l__oldInputTable_0[v47] = nil;
            l__meta_0[v46] = nil;
            l__keyOIMap_0[v46] = nil;
            l__keyIOMap_0[v47] = nil;
            l__outputTable_0[v46] = nil;
            v17._keyData[v47] = nil;
            v25 = true;
        end;
    end;
    return v25;
end;
return function(v51, v52, v53) --[[ Line: 212 ]] --[[ Name: ForKeys ]]
    -- upvalues: v14 (copy), v13 (copy), v4 (copy)
    local v54 = false;
    if v51.type == "State" then
        v54 = typeof(v51.get) == "function";
    end;
    local v55 = setmetatable({
        type = "State", 
        kind = "ForKeys", 
        dependencySet = {}, 
        dependentSet = setmetatable({}, v14), 
        _oldDependencySet = {}, 
        _processor = v52, 
        _destructor = v53, 
        _inputIsState = v54, 
        _inputTable = v51, 
        _oldInputTable = {}, 
        _outputTable = {}, 
        _keyOIMap = {}, 
        _keyIOMap = {}, 
        _keyData = {}, 
        _meta = {}
    }, v13);
    v4(v55);
    v55:update();
    return v55;
end;