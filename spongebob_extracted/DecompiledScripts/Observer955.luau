local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.checkLifetime);
local v4 = require(l_Parent_0.Graph.castToGraph);
local v5 = require(l_Parent_0.Graph.depend);
local v6 = require(l_Parent_0.Graph.evaluate);
local v7 = require(l_Parent_0.State.peek);
local v8 = require(l_Parent_0.Utility.nicknames);
local v9 = {
    type = "Observer", 
    timeliness = "eager", 
    dependentSet = table.freeze({})
};
local v10 = table.freeze({
    __index = v9
});
local function v17(v11, v12) --[[ Line: 37 ]] --[[ Name: Observer ]]
    -- upvalues: v4 (copy), v10 (copy), v8 (copy), v3 (copy), v6 (copy)
    local v13 = os.clock();
    local v14 = setmetatable({
        scope = v11, 
        createdAt = v13, 
        dependencySet = {}, 
        lastChange = nil, 
        validity = "invalid", 
        _watchingGraph = v4(v12), 
        _changeListeners = {}
    }, v10);
    local function v16() --[[ Line: 55 ]]
        -- upvalues: v14 (copy)
        v14.scope = nil;
        for v15 in pairs(v14.dependencySet) do
            v15.dependentSet[v14] = nil;
        end;
    end;
    v14.oldestChore = v16;
    v8[v14.oldestChore] = "Observer";
    table.insert(v11, v16);
    if v14._watchingGraph ~= nil then
        v3.bOutlivesA(v11, v14.oldestChore, v14._watchingGraph.scope, v14._watchingGraph.oldestChore, v3.formatters.observer);
    end;
    v6(v14, true);
    return v14;
end;
v9.onBind = function(v18, v19) --[[ Line: 80 ]] --[[ Name: onBind ]]
    -- upvalues: v2 (copy), v7 (copy)
    v2.doChoreImmediate(v19, v7(v18._watchingGraph));
    return v18:onChange(v19);
end;
v9.onChange = function(v20, v21) --[[ Line: 88 ]] --[[ Name: onChange ]]
    local v22 = table.freeze({});
    v20._changeListeners[v22] = v21;
    return function() --[[ Line: 94 ]]
        -- upvalues: v20 (copy), v22 (copy)
        v20._changeListeners[v22] = nil;
    end;
end;
v9._evaluate = function(v23) --[[ Line: 99 ]] --[[ Name: _evaluate ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v24 = v5(v23, v23._watchingGraph);
    for _, v26 in v23._changeListeners do
        v2.doChoreImmediate(v26, v24);
    end;
    return true;
end;
table.freeze(v9);
return v17;