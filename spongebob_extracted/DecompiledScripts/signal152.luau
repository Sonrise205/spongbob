local v0 = nil;
local function v3(v1, ...) --[[ Line: 44 ]] --[[ Name: acquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 55 ]] --[[ Name: runEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.Disconnect = function(v6) --[[ Line: 81 ]] --[[ Name: Disconnect ]]
    if not v6.Connected then
        return;
    else
        v6.Connected = false;
        if v6._signal._handlerListHead == v6 then
            v6._signal._handlerListHead = v6._next;
            return;
        else
            local l__handlerListHead_0 = v6._signal._handlerListHead;
            while l__handlerListHead_0 and l__handlerListHead_0._next ~= v6 do
                l__handlerListHead_0 = l__handlerListHead_0._next;
            end;
            if l__handlerListHead_0 then
                l__handlerListHead_0._next = v6._next;
            end;
            return;
        end;
    end;
end;
v5.Destroy = v5.Disconnect;
setmetatable(v5, {
    __index = function(_, v9) --[[ Line: 108 ]] --[[ Name: __index ]]
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(v9))), 2);
    end, 
    __newindex = function(_, v11, _) --[[ Line: 111 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(v11))), 2);
    end
});
local v13 = {};
v13.__index = v13;
v13.new = function() --[[ Line: 147 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    return (setmetatable({
        _handlerListHead = false, 
        _proxyHandler = nil, 
        _yieldedThreads = nil
    }, v13));
end;
v13.Wrap = function(v14) --[[ Line: 170 ]] --[[ Name: Wrap ]]
    -- upvalues: v13 (copy)
    assert(typeof(v14) == "RBXScriptSignal", "Argument #1 to Signal.Wrap must be a RBXScriptSignal; got " .. typeof(v14));
    local v15 = v13.new();
    v15._proxyHandler = v14:Connect(function(...) --[[ Line: 177 ]]
        -- upvalues: v15 (copy)
        v15:Fire(...);
    end);
    return v15;
end;
v13.Is = function(v16) --[[ Line: 190 ]] --[[ Name: Is ]]
    -- upvalues: v13 (copy)
    local v17 = false;
    if type(v16) == "table" then
        v17 = getmetatable(v16) == v13;
    end;
    return v17;
end;
v13.Connect = function(v18, v19) --[[ Line: 207 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    local v20 = setmetatable({
        Connected = true, 
        _signal = v18, 
        _fn = v19, 
        _next = false
    }, v5);
    if v18._handlerListHead then
        v20._next = v18._handlerListHead;
        v18._handlerListHead = v20;
        return v20;
    else
        v18._handlerListHead = v20;
        return v20;
    end;
end;
v13.ConnectOnce = function(v21, v22) --[[ Line: 230 ]] --[[ Name: ConnectOnce ]]
    return v21:Once(v22);
end;
v13.Once = function(v23, v24) --[[ Line: 249 ]] --[[ Name: Once ]]
    local v25 = nil;
    local v26 = false;
    v25 = v23:Connect(function(...) --[[ Line: 253 ]]
        -- upvalues: v26 (ref), v25 (ref), v24 (copy)
        if v26 then
            return;
        else
            v26 = true;
            v25:Disconnect();
            v24(...);
            return;
        end;
    end);
    return v25;
end;
v13.GetConnections = function(v27) --[[ Line: 266 ]] --[[ Name: GetConnections ]]
    local v28 = {};
    local l__handlerListHead_1 = v27._handlerListHead;
    while l__handlerListHead_1 do
        table.insert(v28, l__handlerListHead_1);
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
    return v28;
end;
v13.DisconnectAll = function(v30) --[[ Line: 286 ]] --[[ Name: DisconnectAll ]]
    local l__handlerListHead_2 = v30._handlerListHead;
    while l__handlerListHead_2 do
        l__handlerListHead_2.Connected = false;
        l__handlerListHead_2 = l__handlerListHead_2._next;
    end;
    v30._handlerListHead = false;
    local v32 = rawget(v30, "_yieldedThreads");
    if v32 then
        for v33 in v32 do
            if coroutine.status(v33) == "suspended" then
                warn(debug.traceback(v33, "signal disconnected; yielded thread cancelled", 2));
                task.cancel(v33);
            end;
        end;
        table.clear(v30._yieldedThreads);
    end;
end;
v13.Fire = function(v34, ...) --[[ Line: 321 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l__handlerListHead_3 = v34._handlerListHead;
    while l__handlerListHead_3 do
        if l__handlerListHead_3.Connected then
            if not v0 then
                v0 = coroutine.create(v4);
            end;
            task.spawn(v0, l__handlerListHead_3._fn, ...);
        end;
        l__handlerListHead_3 = l__handlerListHead_3._next;
    end;
end;
v13.FireDeferred = function(v36, ...) --[[ Line: 342 ]] --[[ Name: FireDeferred ]]
    local l__handlerListHead_4 = v36._handlerListHead;
    while l__handlerListHead_4 do
        local l_l__handlerListHead_4_0 = l__handlerListHead_4;
        task.defer(function(...) --[[ Line: 346 ]]
            -- upvalues: l_l__handlerListHead_4_0 (copy)
            if l_l__handlerListHead_4_0.Connected then
                l_l__handlerListHead_4_0._fn(...);
            end;
        end, ...);
        l__handlerListHead_4 = l__handlerListHead_4._next;
    end;
end;
v13.Wait = function(v39) --[[ Line: 370 ]] --[[ Name: Wait ]]
    local v40 = rawget(v39, "_yieldedThreads");
    if not v40 then
        v40 = {};
        rawset(v39, "_yieldedThreads", v40);
    end;
    local v41 = coroutine.running();
    v40[v41] = true;
    v39:Once(function(...) --[[ Line: 380 ]]
        -- upvalues: v40 (ref), v41 (copy)
        v40[v41] = nil;
        task.spawn(v41, ...);
    end);
    return coroutine.yield();
end;
v13.Destroy = function(v42) --[[ Line: 400 ]] --[[ Name: Destroy ]]
    v42:DisconnectAll();
    local v43 = rawget(v42, "_proxyHandler");
    if v43 then
        v43:Disconnect();
    end;
end;
setmetatable(v13, {
    __index = function(_, v45) --[[ Line: 411 ]] --[[ Name: __index ]]
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(v45))), 2);
    end, 
    __newindex = function(_, v47, _) --[[ Line: 414 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(v47))), 2);
    end
});
return table.freeze({
    new = v13.new, 
    Wrap = v13.Wrap, 
    Is = v13.Is
});