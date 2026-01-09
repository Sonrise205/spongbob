local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Logging.formatError);
local _ = require(l_Parent_0.Types);
local v3 = {
    safetyTimerMultiplier = 1
};
local v4 = {};
local v5 = nil;
local v6 = 0;
v3.setExternalProvider = function(v7) --[[ Line: 36 ]] --[[ Name: setExternalProvider ]]
    -- upvalues: v5 (ref)
    local l_v5_0 = v5;
    if l_v5_0 ~= nil then
        l_v5_0.stopScheduler();
    end;
    v5 = v7;
    if v7 ~= nil then
        v7.startScheduler();
    end;
    return l_v5_0;
end;
v3.isTimeCritical = function() --[[ Line: 53 ]] --[[ Name: isTimeCritical ]]
    return false;
end;
v3.doTaskImmediate = function(v9) --[[ Line: 60 ]] --[[ Name: doTaskImmediate ]]
    -- upvalues: v5 (ref), v3 (copy)
    if v5 == nil then
        v3.logError("noTaskScheduler");
        return;
    else
        v5.doTaskImmediate(v9);
        return;
    end;
end;
v3.doTaskDeferred = function(v10) --[[ Line: 73 ]] --[[ Name: doTaskDeferred ]]
    -- upvalues: v5 (ref), v3 (copy)
    if v5 == nil then
        v3.logError("noTaskScheduler");
        return;
    else
        v5.doTaskDeferred(v10);
        return;
    end;
end;
v3.logError = function(v11, v12, ...) --[[ Line: 86 ]] --[[ Name: logError ]]
    -- upvalues: v1 (copy), v5 (ref)
    error(v1(v5, v11, v12, ...), 0);
end;
v3.logErrorNonFatal = function(v13, v14, ...) --[[ Line: 97 ]] --[[ Name: logErrorNonFatal ]]
    -- upvalues: v1 (copy), v5 (ref)
    local v15 = v1(v5, v13, v14, ...);
    if v5 ~= nil then
        v5.logErrorNonFatal(v15);
        return;
    else
        print(v15);
        return;
    end;
end;
v3.logWarn = function(v16, ...) --[[ Line: 113 ]] --[[ Name: logWarn ]]
    -- upvalues: v1 (copy), v5 (ref)
    local v17 = v1(v5, v16, debug.traceback(nil, 2), ...);
    if v5 ~= nil then
        v5.logWarn(v17);
        return;
    else
        print(v17);
        return;
    end;
end;
v3.bindToUpdateStep = function(v18) --[[ Line: 135 ]] --[[ Name: bindToUpdateStep ]]
    -- upvalues: v4 (copy)
    local v19 = {};
    v4[v19] = v18;
    return function() --[[ Line: 142 ]]
        -- upvalues: v4 (ref), v19 (copy)
        v4[v19] = nil;
    end;
end;
v3.performUpdateStep = function(v20) --[[ Line: 152 ]] --[[ Name: performUpdateStep ]]
    -- upvalues: v6 (ref), v4 (copy)
    v6 = v20;
    for _, v22 in v4 do
        v22(v20);
    end;
end;
v3.lastUpdateStep = function() --[[ Line: 164 ]] --[[ Name: lastUpdateStep ]]
    -- upvalues: v6 (ref)
    return v6;
end;
return v3;