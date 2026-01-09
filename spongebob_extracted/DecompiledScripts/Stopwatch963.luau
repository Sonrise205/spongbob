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
local function v14(v9, v10) --[[ Line: 46 ]] --[[ Name: Stopwatch ]]
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
        _zeroFlag = true, 
        _timer = v10
    }, v8);
    local function v13() --[[ Line: 68 ]]
        -- upvalues: v12 (copy)
        v12.scope = nil;
    end;
    v12.oldestChore = v13;
    v6[v12.oldestChore] = "Stopwatch";
    table.insert(v9, v13);
    v2.bOutlivesA(v9, v12.oldestChore, v10.scope, v10.oldestChore, v2.formatters.parameter, "timer");
    v3(v12, v10);
    return v12;
end;
v7.zero = function(v15) --[[ Line: 84 ]] --[[ Name: zero ]]
    -- upvalues: v5 (copy), v4 (copy)
    v15._zeroFlag = true;
    v15._measureTimeSince = v5(v15._timer);
    v4(v15);
end;
v7.pause = function(v16) --[[ Line: 92 ]] --[[ Name: pause ]]
    -- upvalues: v4 (copy)
    if v16._playing == true then
        v16._playing = false;
        v4(v16);
    end;
end;
v7.unpause = function(v17) --[[ Line: 101 ]] --[[ Name: unpause ]]
    -- upvalues: v5 (copy), v4 (copy)
    if v17._playing == false then
        v17._playing = true;
        v17._measureTimeSince = v5(v17._timer) - (v17._zeroFlag and 0 or v17._EXTREMELY_DANGEROUS_usedAsValue);
        v4(v17);
    end;
end;
v7.isPlaying = function(v18) --[[ Line: 116 ]] --[[ Name: isPlaying ]]
    return v18._playing;
end;
v7._evaluate = function(v19) --[[ Line: 122 ]] --[[ Name: _evaluate ]]
    -- upvalues: v3 (copy)
    if v19._playing then
        v19._zeroFlag = false;
        local v20 = v3(v19, v19._timer);
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