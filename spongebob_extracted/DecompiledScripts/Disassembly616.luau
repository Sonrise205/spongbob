local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.depend);
local v4 = require(l_Parent_0.State.peek);
local v5 = require(l_Parent_0.State.castToState);
local _ = require(l_Parent_0.State.For.ForTypes);
local v7 = require(l_Parent_0.Memory.doCleanup);
local v8 = require(l_Parent_0.Memory.deriveScope);
local v9 = require(l_Parent_0.Memory.scopePool);
local v10 = require(l_Parent_0.Utility.nameOf);
local v11 = require(l_Parent_0.Utility.nicknames);
local v12 = {
    type = "Graph", 
    kind = "For.Disassembly", 
    timeliness = "lazy"
};
local v13 = table.freeze({
    __index = v12
});
local function v21(v14, v15, v16) --[[ Line: 46 ]] --[[ Name: Disassembly ]]
    -- upvalues: v13 (copy), v7 (copy), v11 (copy)
    local v17 = setmetatable({
        createdAt = os.clock(), 
        dependencySet = {}, 
        dependentSet = {}, 
        scope = v14, 
        validity = "invalid", 
        _inputTable = v15, 
        _constructor = v16, 
        _subObjects = {}
    }, v13);
    local function v20() --[[ Line: 70 ]]
        -- upvalues: v17 (copy), v7 (ref)
        v17.scope = nil;
        for v18 in pairs(v17.dependencySet) do
            v18.dependentSet[v17] = nil;
        end;
        for v19 in v17._subObjects do
            if v19.maybeScope ~= nil then
                v7(v19.maybeScope);
                v19.maybeScope = nil;
            end;
        end;
    end;
    v17.oldestTask = v20;
    v11[v17.oldestTask] = "For (internal disassembler)";
    table.insert(v14, v20);
    return v17;
end;
v12.populate = function(v22, v23, v24) --[[ Line: 89 ]] --[[ Name: populate ]]
    -- upvalues: v2 (copy)
    local v25 = 1e999;
    local v26 = -1e999;
    local v27 = false;
    for v28 in v22._subObjects do
        local v29, v30 = v28:useOutputPair(v23);
        if v29 == nil or v30 == nil then
            v27 = true;
        elseif v24[v29] ~= nil then
            v2.logErrorNonFatal("forKeyCollision", nil, (tostring(v29)));
        else
            v24[v29] = v30;
            if typeof(v29) == "number" then
                v25 = math.min(v25, v29);
                v26 = math.max(v26, v29);
            end;
        end;
    end;
    if v27 and v25 < v26 then
        local l_v25_0 = v25;
        for v32 = v25, v26 do
            local v33 = v24[v32];
            if v33 ~= nil then
                v24[v32] = nil;
                v24[l_v25_0] = v33;
                l_v25_0 = l_v25_0 + 1;
            end;
        end;
    end;
end;
v12._evaluate = function(v34) --[[ Line: 129 ]] --[[ Name: _evaluate ]]
    -- upvalues: v5 (copy), v2 (copy), v10 (copy), v3 (copy), v4 (copy), v7 (copy), v8 (copy), v9 (copy)
    local l_scope_0 = v34.scope;
    local v36 = v5(v34._inputTable);
    if v36 ~= nil then
        if v36.scope == nil then
            v2.logError("useAfterDestroy", nil, ("The input %*"):format((v10(v36, "table"))), "the For object that is watching it");
        end;
        v3(v34, v36);
    end;
    local v37 = {};
    for v38, v39 in v4(v34._inputTable) do
        v37[v38] = v39;
    end;
    local v40 = {};
    for v41 in v34._subObjects do
        local v42 = false;
        local l_inputKey_0 = v41.inputKey;
        local l_inputValue_0 = v41.inputValue;
        local v45 = nil;
        if not v41.roamKeys and v37[l_inputKey_0] ~= nil then
            v42 = true;
            v45 = l_inputKey_0;
        else
            for v46, v47 in v37 do
                v42 = true;
                v45 = v46;
                if v41.roamValues or v47 == l_inputValue_0 then
                    break;
                end;
            end;
        end;
        if v42 then
            local v48 = v37[v45];
            v40[v41] = true;
            if v45 ~= l_inputKey_0 then
                v41.inputKey = v45;
                v41:invalidateInputKey();
            end;
            if v48 ~= l_inputValue_0 then
                v41.inputValue = v48;
                v41:invalidateInputValue();
            end;
            v37[v45] = nil;
        elseif v41.maybeScope ~= nil then
            v7(v41.maybeScope);
            v41.maybeScope = nil;
        end;
    end;
    for v49, v50 in v37 do
        local v51 = v34._constructor(v8(l_scope_0), v49, v50);
        if v51.maybeScope ~= nil then
            v51.maybeScope = v9.giveIfEmpty(v51.maybeScope);
        end;
        v40[v51] = true;
    end;
    v34._subObjects = v40;
    return true;
end;
table.freeze(v12);
return v21;