local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.depend);
local v4 = require(l_Parent_0.State.castToState);
local _ = require(l_Parent_0.State.For.ForTypes);
local v6 = require(l_Parent_0.Memory.doCleanup);
local v7 = require(l_Parent_0.Memory.deriveScope);
local v8 = require(l_Parent_0.Utility.nameOf);
local v9 = require(l_Parent_0.Utility.nicknames);
local v10 = {
    type = "Graph", 
    kind = "For.Disassembly", 
    timeliness = "lazy"
};
local v11 = table.freeze({
    __index = v10
});
local function v19(v12, v13, v14) --[[ Line: 44 ]] --[[ Name: Disassembly ]]
    -- upvalues: v11 (copy), v6 (copy), v9 (copy)
    local v15 = setmetatable({
        createdAt = os.clock(), 
        dependencySet = {}, 
        dependentSet = {}, 
        scope = v12, 
        validity = "invalid", 
        _inputTable = v13, 
        _constructor = v14, 
        _subObjects = {}
    }, v11);
    local function v18() --[[ Line: 68 ]]
        -- upvalues: v15 (copy), v6 (ref)
        v15.scope = nil;
        for v16 in pairs(v15.dependencySet) do
            v16.dependentSet[v15] = nil;
        end;
        for v17 in v15._subObjects do
            if v17.maybeScope ~= nil then
                v6(v17.maybeScope);
                v17.maybeScope = nil;
            end;
        end;
    end;
    v15.oldestChore = v18;
    v9[v15.oldestChore] = "For (internal disassembler)";
    table.insert(v12, v18);
    return v15;
end;
v10.populate = function(v20, v21, v22) --[[ Line: 87 ]] --[[ Name: populate ]]
    -- upvalues: v2 (copy)
    local v23 = 1e999;
    local v24 = -1e999;
    local v25 = false;
    for v26 in v20._subObjects do
        local v27, v28 = v26:useOutputPair(v21);
        if v27 == nil or v28 == nil then
            v25 = true;
        elseif v22[v27] ~= nil then
            v2.logErrorNonFatal("forKeyCollision", nil, (tostring(v27)));
        else
            v22[v27] = v28;
            if typeof(v27) == "number" then
                v23 = math.min(v23, v27);
                v24 = math.max(v24, v27);
            end;
        end;
    end;
    if v25 and v23 < v24 then
        local l_v23_0 = v23;
        for v30 = v23, v24 do
            local v31 = v22[v30];
            if v31 ~= nil then
                v22[v30] = nil;
                v22[l_v23_0] = v31;
                l_v23_0 = l_v23_0 + 1;
            end;
        end;
    end;
end;
v10._evaluate = function(v32) --[[ Line: 127 ]] --[[ Name: _evaluate ]]
    -- upvalues: v4 (copy), v2 (copy), v8 (copy), v3 (copy), v6 (copy), v7 (copy)
    local l_scope_0 = v32.scope;
    local v34 = v4(v32._inputTable);
    local v35 = nil;
    if v34 ~= nil then
        if v34.scope == nil then
            v2.logError("useAfterDestroy", nil, ("The input %*"):format((v8(v34, "table"))), "the For object that is watching it");
        end;
        v35 = v3(v32, v34);
    else
        v35 = v32._inputTable;
    end;
    local v36 = {};
    for v37, v38 in v35 do
        v36[v37] = v38;
    end;
    local v39 = {};
    local v40 = {};
    for v41 in v32._subObjects do
        local l_inputKey_0 = v41.inputKey;
        local l_inputValue_0 = v41.inputValue;
        local v44 = nil;
        local v45 = nil;
        if not v41.roamKeys and v36[l_inputKey_0] ~= nil then
            v44 = l_inputKey_0;
            v45 = v36[l_inputKey_0];
        elseif v41.roamValues then
            table.insert(v39, v41);
            continue;
        else
            for v46, v47 in v36 do
                if v47 == l_inputValue_0 then
                    v44 = v46;
                    v45 = v47;
                    break;
                end;
            end;
            if not v44 then
                table.insert(v39, v41);
                continue;
            end;
        end;
        v40[v41] = true;
        if v44 ~= l_inputKey_0 then
            v41.inputKey = v44;
            v41:invalidateInputKey();
        end;
        if v45 ~= l_inputValue_0 then
            v41.inputValue = v45;
            v41:invalidateInputValue();
        end;
        v36[v44] = nil;
    end;
    for _, v49 in v39 do
        local l_inputKey_1 = v49.inputKey;
        local l_inputValue_1 = v49.inputValue;
        local v52, v53 = next(v36);
        if v52 then
            v40[v49] = true;
            if v52 ~= l_inputKey_1 then
                v49.inputKey = v52;
                v49:invalidateInputKey();
            end;
            if v53 ~= l_inputValue_1 then
                v49.inputValue = v53;
                v49:invalidateInputValue();
            end;
            v36[v52] = nil;
        elseif v49.maybeScope ~= nil then
            v6(v49.maybeScope);
            v49.maybeScope = nil;
        end;
    end;
    for v54, v55 in v36 do
        v40[v32._constructor(v7(l_scope_0), v54, v55)] = true;
    end;
    v32._subObjects = v40;
    return true;
end;
table.freeze(v10);
return v19;