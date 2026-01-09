local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.checkLifetime);
local v4 = require(l_Parent_0.Graph.castToGraph);
local v5 = require(l_Parent_0.Graph.depend);
local v6 = require(l_Parent_0.Graph.evaluate);
local v7 = require(l_Parent_0.Utility.nicknames);
local v8 = {
    type = "Observer", 
    timeliness = "eager", 
    dependentSet = table.freeze({})
};
local v9 = table.freeze({
    __index = v8
});
local function v16(v10, v11) --[[ Line: 36 ]] --[[ Name: Observer ]]
    -- upvalues: v2 (copy), v4 (copy), v9 (copy), v7 (copy), v3 (copy), v6 (copy)
    local v12 = os.clock();
    if v11 == nil then
        v2.logError("scopeMissing", nil, "Observers", "myScope:Observer(watching)");
    end;
    local v13 = setmetatable({
        scope = v10, 
        createdAt = v12, 
        dependencySet = {}, 
        lastChange = nil, 
        validity = "invalid", 
        _watchingGraph = v4(v11), 
        _changeListeners = {}
    }, v9);
    local function v15() --[[ Line: 57 ]]
        -- upvalues: v13 (copy)
        v13.scope = nil;
        for v14 in pairs(v13.dependencySet) do
            v14.dependentSet[v13] = nil;
        end;
    end;
    v13.oldestTask = v15;
    v7[v13.oldestTask] = "Observer";
    table.insert(v10, v15);
    if v13._watchingGraph ~= nil then
        v3.bOutlivesA(v10, v13.oldestTask, v13._watchingGraph.scope, v13._watchingGraph.oldestTask, v3.formatters.observer);
    end;
    v6(v13, true);
    return v13;
end;
v8.onBind = function(v17, v18) --[[ Line: 82 ]] --[[ Name: onBind ]]
    -- upvalues: v2 (copy)
    v2.doTaskImmediate(v18);
    return v17:onChange(v18);
end;
v8.onChange = function(v19, v20) --[[ Line: 90 ]] --[[ Name: onChange ]]
    local v21 = table.freeze({});
    v19._changeListeners[v21] = v20;
    return function() --[[ Line: 96 ]]
        -- upvalues: v19 (copy), v21 (copy)
        v19._changeListeners[v21] = nil;
    end;
end;
v8._evaluate = function(v22) --[[ Line: 101 ]] --[[ Name: _evaluate ]]
    -- upvalues: v5 (copy), v2 (copy)
    if v22._watchingGraph ~= nil then
        v5(v22, v22._watchingGraph);
    end;
    for _, v24 in v22._changeListeners do
        v2.doTaskImmediate(v24);
    end;
    return true;
end;
table.freeze(v8);
return v16;