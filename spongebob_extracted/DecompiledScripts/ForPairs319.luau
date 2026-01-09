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
v12.update = function(v17) --[[ Line: 61 ]] --[[ Name: update ]]
    -- upvalues: v14 (copy), v3 (copy), v11 (copy), v9 (copy), v8 (copy), v10 (copy), v6 (copy), v7 (copy)
    local l__inputIsState_0 = v17._inputIsState;
    local v19 = if l__inputIsState_0 then v17._inputTable:get(false) else v17._inputTable;
    local l__oldInputTable_0 = v17._oldInputTable;
    local l__keyIOMap_0 = v17._keyIOMap;
    local l__meta_0 = v17._meta;
    local v23 = false;
    for v24 in pairs(v17.dependencySet) do
        v24.dependentSet[v17] = nil;
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
    l_dependencySet_0 = v17._outputTable;
    l__oldDependencySet_0 = v17._oldOutputTable;
    v17._oldOutputTable = l_dependencySet_0;
    v17._outputTable = l__oldDependencySet_0;
    l_dependencySet_0 = v17._oldOutputTable;
    l__oldDependencySet_0 = v17._outputTable;
    table.clear(l__oldDependencySet_0);
    for v27, v28 in pairs(v19) do
        local v29 = v17._keyData[v27];
        if v29 == nil then
            v29 = {
                dependencySet = setmetatable({}, v14), 
                oldDependencySet = setmetatable({}, v14), 
                dependencyValues = setmetatable({}, v14)
            };
            v17._keyData[v27] = v29;
        end;
        local v30 = l__oldInputTable_0[v27] ~= v28;
        if v30 == false then
            for v31, v32 in pairs(v29.dependencyValues) do
                if v32 ~= v31:get(false) then
                    v30 = true;
                    break;
                end;
            end;
        end;
        if v30 then
            local l_dependencySet_1 = v29.dependencySet;
            local l_oldDependencySet_0 = v29.oldDependencySet;
            v29.oldDependencySet = l_dependencySet_1;
            v29.dependencySet = l_oldDependencySet_0;
            table.clear(v29.dependencySet);
            local v35, v36;
            l_dependencySet_1, l_oldDependencySet_0, v35, v36 = v3(v29.dependencySet, v17._processor, v27, v28);
            if l_dependencySet_1 then
                if v17._destructor == nil and (v11(l_oldDependencySet_0) or v11(v35) or v11(v36)) then
                    v9("destructorNeededForPairs");
                end;
                if l__oldDependencySet_0[l_oldDependencySet_0] ~= nil then
                    local v37 = nil;
                    local v38 = nil;
                    for v39, v40 in pairs(l__keyIOMap_0) do
                        if v40 == l_oldDependencySet_0 then
                            v38 = v19[v39];
                            if v38 ~= nil then
                                v37 = v39;
                                break;
                            end;
                        end;
                    end;
                    if v37 ~= nil then
                        v8("forPairsKeyCollision", nil, tostring(l_oldDependencySet_0), tostring(v37), tostring(v38), tostring(v27), (tostring(v28)));
                    end;
                end;
                local v41 = l_dependencySet_0[l_oldDependencySet_0];
                if v41 ~= v35 then
                    local v42 = l__meta_0[l_oldDependencySet_0];
                    if v41 ~= nil then
                        local v43, v44 = xpcall(v17._destructor or v10, v6, l_oldDependencySet_0, v41, v42);
                        if not v43 then
                            v7("forPairsDestructorError", v44);
                        end;
                    end;
                    l_dependencySet_0[l_oldDependencySet_0] = nil;
                end;
                l__oldInputTable_0[v27] = v28;
                l__keyIOMap_0[v27] = l_oldDependencySet_0;
                l__meta_0[l_oldDependencySet_0] = v36;
                l__oldDependencySet_0[l_oldDependencySet_0] = v35;
                v23 = true;
            else
                local l_dependencySet_2 = v29.dependencySet;
                local l_oldDependencySet_1 = v29.oldDependencySet;
                v29.oldDependencySet = l_dependencySet_2;
                v29.dependencySet = l_oldDependencySet_1;
                v7("forPairsProcessorError", l_oldDependencySet_0);
            end;
        else
            local v47 = l__keyIOMap_0[v27];
            if l__oldDependencySet_0[v47] ~= nil then
                local v48 = nil;
                local v49 = nil;
                for v50, v51 in pairs(l__keyIOMap_0) do
                    if v47 == v51 then
                        v49 = v19[v50];
                        if v49 ~= nil then
                            v48 = v50;
                            break;
                        end;
                    end;
                end;
                if v48 ~= nil then
                    v8("forPairsKeyCollision", nil, tostring(v47), tostring(v48), tostring(v49), tostring(v27), (tostring(v28)));
                end;
            end;
            l__oldDependencySet_0[v47] = l_dependencySet_0[v47];
        end;
        for v52 in pairs(v29.dependencySet) do
            v29.dependencyValues[v52] = v52:get(false);
            v17.dependencySet[v52] = true;
            v52.dependentSet[v17] = true;
        end;
    end;
    for v53, v54 in pairs(l_dependencySet_0) do
        if l__oldDependencySet_0[v53] ~= v54 then
            local v55 = l__meta_0[v53];
            if v54 ~= nil then
                local v56, v57 = xpcall(v17._destructor or v10, v6, v53, v54, v55);
                if not v56 then
                    v7("forPairsDestructorError", v57);
                end;
            end;
            if l__oldDependencySet_0[v53] == nil then
                l__meta_0[v53] = nil;
                v17._keyData[v53] = nil;
            end;
            v23 = true;
        end;
    end;
    for v58 in pairs(l__oldInputTable_0) do
        if v19[v58] == nil then
            l__oldInputTable_0[v58] = nil;
            l__keyIOMap_0[v58] = nil;
        end;
    end;
    return v23;
end;
return function(v59, v60, v61) --[[ Line: 273 ]] --[[ Name: ForPairs ]]
    -- upvalues: v14 (copy), v13 (copy), v4 (copy)
    local v62 = false;
    if v59.type == "State" then
        v62 = typeof(v59.get) == "function";
    end;
    local v63 = setmetatable({
        type = "State", 
        kind = "ForPairs", 
        dependencySet = {}, 
        dependentSet = setmetatable({}, v14), 
        _oldDependencySet = {}, 
        _processor = v60, 
        _destructor = v61, 
        _inputIsState = v62, 
        _inputTable = v59, 
        _oldInputTable = {}, 
        _outputTable = {}, 
        _oldOutputTable = {}, 
        _keyIOMap = {}, 
        _keyData = {}, 
        _meta = {}
    }, v13);
    v4(v63);
    v63:update();
    return v63;
end;