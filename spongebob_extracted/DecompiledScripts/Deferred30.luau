--!native
local v0 = {};
v0.__index = v0;
local v1 = {};
v1.__index = v1;
v0.new = function() --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _active = true, 
        _head = nil
    }, v0));
end;
v0.Is = function(v2) --[[ Line: 34 ]] --[[ Name: Is ]]
    -- upvalues: v0 (copy)
    local v3 = false;
    if typeof(v2) == "table" then
        v3 = getmetatable(v2) == v0;
    end;
    return v3;
end;
v0.IsActive = function(v4) --[[ Line: 39 ]] --[[ Name: IsActive ]]
    return v4._active == true;
end;
v0.Connect = function(v5, v6) --[[ Line: 43 ]] --[[ Name: Connect ]]
    -- upvalues: v1 (copy)
    assert(typeof(v6) == "function", "Must be function");
    if v5._active ~= true then
        return (setmetatable({
            Connected = false, 
            _node = nil
        }, v1));
    else
        local l__head_0 = v5._head;
        local v8 = {
            _signal = v5, 
            _connection = nil, 
            _handler = v6, 
            _next = l__head_0, 
            _prev = nil
        };
        if l__head_0 ~= nil then
            l__head_0._prev = v8;
        end;
        v5._head = v8;
        local v9 = setmetatable({
            Connected = true, 
            _node = v8
        }, v1);
        v8._connection = v9;
        return v9;
    end;
end;
v0.Once = function(v10, v11) --[[ Line: 83 ]] --[[ Name: Once ]]
    assert(typeof(v11) == "function", "Must be function");
    local v12 = nil;
    v12 = v10:Connect(function(...) --[[ Line: 90 ]]
        -- upvalues: v12 (ref), v11 (copy)
        if v12 == nil then
            return;
        else
            v12:Disconnect();
            v12 = nil;
            v11(...);
            return;
        end;
    end);
    return v12;
end;
v0.ConnectOnce = v0.Once;
v0.Wait = function(v13) --[[ Line: 105 ]] --[[ Name: Wait ]]
    local v14 = nil;
    v14 = coroutine.running();
    local v15 = nil;
    do
        local l_v15_0 = v15;
        l_v15_0 = v13:Connect(function(...) --[[ Line: 110 ]]
            -- upvalues: l_v15_0 (ref), v14 (ref)
            if l_v15_0 == nil then
                return;
            else
                l_v15_0:Disconnect();
                l_v15_0 = nil;
                if coroutine.status(v14) == "suspended" then
                    task.spawn(v14, ...);
                end;
                return;
            end;
        end);
    end;
    return coroutine.yield();
end;
v0.Fire = function(v17, ...) --[[ Line: 126 ]] --[[ Name: Fire ]]
    local l__head_1 = v17._head;
    while l__head_1 ~= nil do
        task.defer(l__head_1._handler, ...);
        l__head_1 = l__head_1._next;
    end;
end;
v0.DisconnectAll = function(v19) --[[ Line: 135 ]] --[[ Name: DisconnectAll ]]
    local l__head_2 = v19._head;
    while l__head_2 ~= nil do
        local l__connection_0 = l__head_2._connection;
        if l__connection_0 ~= nil then
            l__connection_0.Connected = false;
            l__connection_0._node = nil;
            l__head_2._connection = nil;
        end;
        l__head_2 = l__head_2._next;
    end;
    v19._head = nil;
end;
v0.Destroy = function(v22) --[[ Line: 152 ]] --[[ Name: Destroy ]]
    if v22._active ~= true then
        return;
    else
        v22:DisconnectAll();
        v22._active = false;
        return;
    end;
end;
v1.Disconnect = function(v23) --[[ Line: 161 ]] --[[ Name: Disconnect ]]
    if v23.Connected ~= true then
        return;
    else
        v23.Connected = false;
        local l__node_0 = v23._node;
        local l__prev_0 = l__node_0._prev;
        local l__next_0 = l__node_0._next;
        if l__next_0 ~= nil then
            l__next_0._prev = l__prev_0;
        end;
        if l__prev_0 ~= nil then
            l__prev_0._next = l__next_0;
        else
            l__node_0._signal._head = l__next_0;
        end;
        l__node_0._connection = nil;
        v23._node = nil;
        return;
    end;
end;
v1.Destroy = v1.Disconnect;
return v0;