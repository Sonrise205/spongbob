local v0 = {};
local v1 = nil;
local function v4(v2, ...) --[[ Line: 60 ]] --[[ Name: AcquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v1 (ref)
    local l_v1_0 = v1;
    v1 = nil;
    v2(...);
    v1 = l_v1_0;
end;
local function v5(...) --[[ Line: 68 ]] --[[ Name: RunEventHandlerInFreeThread ]]
    -- upvalues: v4 (copy)
    v4(...);
    while true do
        v4(coroutine.yield());
    end;
end;
local v10 = {
    Disconnect = function(v6) --[[ Line: 88 ]] --[[ Name: Disconnect ]]
        -- upvalues: v1 (ref), v5 (copy)
        local l__listener_0 = v6._listener;
        if l__listener_0 ~= nil then
            local l__listener_table_0 = v6._listener_table;
            local v9 = table.find(l__listener_table_0, l__listener_0);
            if v9 ~= nil then
                table.remove(l__listener_table_0, v9);
            end;
            v6._listener = nil;
        end;
        if v6._disconnect_listener ~= nil then
            if not v1 then
                v1 = coroutine.create(v5);
            end;
            task.spawn(v1, v6._disconnect_listener, v6._disconnect_param);
            v6._disconnect_listener = nil;
        end;
    end
};
v0.NewArrayScriptConnection = function(v11, v12, v13, v14) --[[ Line: 107 ]] --[[ Name: NewArrayScriptConnection ]]
    -- upvalues: v10 (copy)
    return {
        _listener = v12, 
        _listener_table = v11, 
        _disconnect_listener = v13, 
        _disconnect_param = v14, 
        Disconnect = v10.Disconnect
    };
end;
local v15 = {};
v15.__index = v15;
v15.Disconnect = function(v16) --[[ Line: 132 ]] --[[ Name: Disconnect ]]
    -- upvalues: v1 (ref), v5 (copy)
    if v16._is_connected == false then
        return;
    else
        v16._is_connected = false;
        local l__script_signal_0 = v16._script_signal;
        l__script_signal_0._listener_count = l__script_signal_0._listener_count - 1;
        if v16._script_signal._head == v16 then
            v16._script_signal._head = v16._next;
        else
            l__script_signal_0 = v16._script_signal._head;
            while l__script_signal_0 ~= nil and l__script_signal_0._next ~= v16 do
                l__script_signal_0 = l__script_signal_0._next;
            end;
            if l__script_signal_0 ~= nil then
                l__script_signal_0._next = v16._next;
            end;
        end;
        if v16._disconnect_listener ~= nil then
            if not v1 then
                v1 = coroutine.create(v5);
            end;
            task.spawn(v1, v16._disconnect_listener, v16._disconnect_param);
            v16._disconnect_listener = nil;
        end;
        return;
    end;
end;
local v18 = {};
v18.__index = v18;
v18.Connect = function(v19, v20, v21, v22) --[[ Line: 173 ]] --[[ Name: Connect ]]
    -- upvalues: v15 (copy)
    local v23 = {
        _listener = v20, 
        _script_signal = v19, 
        _disconnect_listener = v21, 
        _disconnect_param = v22, 
        _next = v19._head, 
        _is_connected = true
    };
    setmetatable(v23, v15);
    v19._head = v23;
    v19._listener_count = v19._listener_count + 1;
    return v23;
end;
v18.GetListenerCount = function(v24) --[[ Line: 193 ]] --[[ Name: GetListenerCount ]]
    return v24._listener_count;
end;
v18.Fire = function(v25, ...) --[[ Line: 197 ]] --[[ Name: Fire ]]
    -- upvalues: v1 (ref), v5 (copy)
    local l__head_0 = v25._head;
    while l__head_0 ~= nil do
        if l__head_0._is_connected == true then
            if not v1 then
                v1 = coroutine.create(v5);
            end;
            task.spawn(v1, l__head_0._listener, ...);
        end;
        l__head_0 = l__head_0._next;
    end;
end;
v18.FireUntil = function(v27, v28, ...) --[[ Line: 210 ]] --[[ Name: FireUntil ]]
    local l__head_1 = v27._head;
    while true do
        if l__head_1 ~= nil then
            if l__head_1._is_connected == true then
                l__head_1._listener(...);
                if v28() ~= true then
                    return;
                end;
            end;
            l__head_1 = l__head_1._next;
        else
            return;
        end;
    end;
end;
v0.NewScriptSignal = function() --[[ Line: 223 ]] --[[ Name: NewScriptSignal ]]
    -- upvalues: v18 (copy)
    return {
        _head = nil, 
        _listener_count = 0, 
        Connect = v18.Connect, 
        GetListenerCount = v18.GetListenerCount, 
        Fire = v18.Fire, 
        FireUntil = v18.FireUntil
    };
end;
return v0;