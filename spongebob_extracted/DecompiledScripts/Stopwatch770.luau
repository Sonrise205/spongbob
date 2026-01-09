local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Memory.checkLifetime);
local v3 = require(l_Parent_0.Graph.depend);
local v4 = require(l_Parent_0.Graph.change);
local v5 = require(l_Parent_0.State.peek);
local v6 = require(l_Parent_0.Utility.nicknames);
local v7 = {
    type = "State", 
    kind = "Stopwatch", 
    timeliness = "lazy"
};
local v8 = table.freeze({
    __index = v7
});
local function v14(v9, v10) --[[ Line: 44 ]] --[[ Name: Stopwatch ]]
    -- upvalues: v8 (copy), v6 (copy), v2 (copy), v3 (copy)
    local v11 = os.clock();
    local v12 = setmetatable({
        awake = true, 
        createdAt = v11, 
        dependencySet = {}, 
        dependentSet = {}, 
        lastChange = nil, 
        scope = v9, 
        validity = "invalid", 
        _EXTREMELY_DANGEROUS_usedAsValue = 0, 
        _measureTimeSince = 0, 
        _playing = false, 
        _timer = v10
    }, v8);
    local function v13() --[[ Line: 65 ]]
        -- upvalues: v12 (copy)
        v12.scope = nil;
    end;
    v12.oldestTask = v13;
    v6[v12.oldestTask] = "Stopwatch";
    table.insert(v9, v13);
    v2.bOutlivesA(v9, v12.oldestTask, v10.scope, v10.oldestTask, v2.formatters.parameter, "timer");
    v3(v12, v10);
    return v12;
end;
v7.zero = function(v15) --[[ Line: 81 ]] --[[ Name: zero ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v16 = v5(v15._timer);
    if v16 ~= v15._measureTimeSince then
        v15._measureTimeSince = v16;
        v15._EXTREMELY_DANGEROUS_usedAsValue = 0;
        v4(v15);
    end;
end;
v7.pause = function(v17) --[[ Line: 92 ]] --[[ Name: pause ]]
    -- upvalues: v4 (copy)
    if v17._playing == true then
        v17._playing = false;
        v4(v17);
    end;
end;
v7.unpause = function(v18) --[[ Line: 101 ]] --[[ Name: unpause ]]
    -- upvalues: v5 (copy), v4 (copy)
    if v18._playing == false then
        v18._playing = true;
        v18._measureTimeSince = v5(v18._timer) - v18._EXTREMELY_DANGEROUS_usedAsValue;
        v4(v18);
    end;
end;
v7._evaluate = function(v19) --[[ Line: 111 ]] --[[ Name: _evaluate ]]
    -- upvalues: v3 (copy), v5 (copy)
    if v19._playing then
        v3(v19, v19._timer);
        local v20 = v5(v19._timer);
        local l__EXTREMELY_DANGEROUS_usedAsValue_0 = v19._EXTREMELY_DANGEROUS_usedAsValue;
        local v22 = v20 - v19._measureTimeSince;
        v19._EXTREMELY_DANGEROUS_usedAsValue = v22;
        return l__EXTREMELY_DANGEROUS_usedAsValue_0 ~= v22;
    else
        return false;
    end;
end;
table.freeze(v7);
return v14;