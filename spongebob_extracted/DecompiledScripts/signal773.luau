local v0 = nil;
local function v3(v1, ...) --[[ Line: 53 ]] --[[ Name: acquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 64 ]] --[[ Name: runEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 90 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        Connected = true, 
        _signal = v6, 
        _fn = v7, 
        _next = false
    }, v5));
end;
v5.Disconnect = function(v8) --[[ Line: 99 ]] --[[ Name: Disconnect ]]
    if not v8.Connected then
        return;
    else
        v8.Connected = false;
        if v8._signal._handlerListHead == v8 then
            v8._signal._handlerListHead = v8._next;
            return;
        else
            local l__handlerListHead_0 = v8._signal._handlerListHead;
            while l__handlerListHead_0 and l__handlerListHead_0._next ~= v8 do
                l__handlerListHead_0 = l__handlerListHead_0._next;
            end;
            if l__handlerListHead_0 then
                l__handlerListHead_0._next = v8._next;
            end;
            return;
        end;
    end;
end;
v5.Destroy = v5.Disconnect;
setmetatable(v5, {
    __index = function(_, v11) --[[ Line: 126 ]] --[[ Name: __index ]]
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(v11))), 2);
    end, 
    __newindex = function(_, v13, _) --[[ Line: 129 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(v13))), 2);
    end
});
local v15 = {};
v15.__index = v15;
v15.new = function() --[[ Line: 165 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    return (setmetatable({
        _handlerListHead = false, 
        _proxyHandler = nil
    }, v15));
end;
v15.Wrap = function(v16) --[[ Line: 186 ]] --[[ Name: Wrap ]]
    -- upvalues: v15 (copy)
    assert(typeof(v16) == "RBXScriptSignal", "Argument #1 to Signal.Wrap must be a RBXScriptSignal; got " .. typeof(v16));
    local v17 = v15.new();
    v17._proxyHandler = v16:Connect(function(...) --[[ Line: 192 ]]
        -- upvalues: v17 (copy)
        v17:Fire(...);
    end);
    return v17;
end;
v15.Is = function(v18) --[[ Line: 204 ]] --[[ Name: Is ]]
    -- upvalues: v15 (copy)
    local v19 = false;
    if type(v18) == "table" then
        v19 = getmetatable(v18) == v15;
    end;
    return v19;
end;
v15.Connect = function(v20, v21) --[[ Line: 221 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    local v22 = v5.new(v20, v21);
    if v20._handlerListHead then
        v22._next = v20._handlerListHead;
        v20._handlerListHead = v22;
        return v22;
    else
        v20._handlerListHead = v22;
        return v22;
    end;
end;
v15.ConnectOnce = function(v23, v24) --[[ Line: 237 ]] --[[ Name: ConnectOnce ]]
    return v23:Once(v24);
end;
v15.Once = function(v25, v26) --[[ Line: 256 ]] --[[ Name: Once ]]
    local v27 = nil;
    local v28 = false;
    v27 = v25:Connect(function(...) --[[ Line: 259 ]]
        -- upvalues: v28 (ref), v27 (ref), v26 (copy)
        if v28 then
            return;
        else
            v28 = true;
            v27:Disconnect();
            v26(...);
            return;
        end;
    end);
    return v27;
end;
v15.GetConnections = function(v29) --[[ Line: 270 ]] --[[ Name: GetConnections ]]
    local v30 = {};
    local l__handlerListHead_1 = v29._handlerListHead;
    while l__handlerListHead_1 do
        table.insert(v30, l__handlerListHead_1);
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
    return v30;
end;
v15.DisconnectAll = function(v32) --[[ Line: 288 ]] --[[ Name: DisconnectAll ]]
    local l__handlerListHead_2 = v32._handlerListHead;
    while l__handlerListHead_2 do
        l__handlerListHead_2.Connected = false;
        l__handlerListHead_2 = l__handlerListHead_2._next;
    end;
    v32._handlerListHead = false;
end;
v15.Fire = function(v34, ...) --[[ Line: 312 ]] --[[ Name: Fire ]]
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
v15.FireDeferred = function(v36, ...) --[[ Line: 333 ]] --[[ Name: FireDeferred ]]
    local l__handlerListHead_4 = v36._handlerListHead;
    while l__handlerListHead_4 do
        task.defer(l__handlerListHead_4._fn, ...);
        l__handlerListHead_4 = l__handlerListHead_4._next;
    end;
end;
v15.Wait = function(v38) --[[ Line: 356 ]] --[[ Name: Wait ]]
    local v39 = coroutine.running();
    local v40 = nil;
    local v41 = false;
    v40 = v38:Connect(function(...) --[[ Line: 360 ]]
        -- upvalues: v41 (ref), v40 (ref), v39 (copy)
        if v41 then
            return;
        else
            v41 = true;
            v40:Disconnect();
            task.spawn(v39, ...);
            return;
        end;
    end);
    return coroutine.yield();
end;
v15.Destroy = function(v42) --[[ Line: 383 ]] --[[ Name: Destroy ]]
    v42:DisconnectAll();
    local v43 = rawget(v42, "_proxyHandler");
    if v43 then
        v43:Disconnect();
    end;
end;
setmetatable(v15, {
    __index = function(_, v45) --[[ Line: 393 ]] --[[ Name: __index ]]
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(v45))), 2);
    end, 
    __newindex = function(_, v47, _) --[[ Line: 396 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(v47))), 2);
    end
});
return {
    new = v15.new, 
    Wrap = v15.Wrap, 
    Is = v15.Is
};