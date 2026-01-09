local l_HttpService_0 = game:GetService("HttpService");
local l_Heartbeat_0 = game:GetService("RunService").Heartbeat;
local v2 = {};
v2.__index = v2;
v2.ClassName = "Signal";
v2.totalConnections = 0;
v2.new = function(v3) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = setmetatable({}, v2);
    if v3 then
        v4.connectionsChanged = v2.new();
    end;
    v4.connections = {};
    v4.totalConnections = 0;
    v4.waiting = {};
    v4.totalWaiting = 0;
    return v4;
end;
v2.Fire = function(v5, ...) --[[ Line: 30 ]] --[[ Name: Fire ]]
    for _, v7 in pairs(v5.connections) do
        task.spawn(v7.Handler, ...);
    end;
    if v5.totalWaiting > 0 then
        local v8 = table.pack(...);
        for v9, _ in pairs(v5.waiting) do
            v5.waiting[v9] = v8;
        end;
    end;
end;
v2.fire = v2.Fire;
v2.Connect = function(v11, v12) --[[ Line: 44 ]] --[[ Name: Connect ]]
    -- upvalues: l_HttpService_0 (copy)
    if type(v12) ~= "function" then
        error(("connect(%s)"):format((typeof(v12))), 2);
    end;
    local v13 = l_HttpService_0:GenerateGUID(false);
    local v14 = {
        Connected = true, 
        ConnectionId = v13, 
        Handler = v12
    };
    v11.connections[v13] = v14;
    v14.Disconnect = function(_) --[[ Line: 57 ]] --[[ Name: Disconnect ]]
        -- upvalues: v11 (copy), v13 (copy), v14 (copy)
        v11.connections[v13] = nil;
        v14.Connected = false;
        local l_v11_0 = v11;
        l_v11_0.totalConnections = l_v11_0.totalConnections - 1;
        if v11.connectionsChanged then
            v11.connectionsChanged:Fire(-1);
        end;
    end;
    v14.Destroy = v14.Disconnect;
    v14.destroy = v14.Disconnect;
    v14.disconnect = v14.Disconnect;
    v11.totalConnections = v11.totalConnections + 1;
    if v11.connectionsChanged then
        v11.connectionsChanged:Fire(1);
    end;
    return v14;
end;
v2.connect = v2.Connect;
v2.Wait = function(v17) --[[ Line: 77 ]] --[[ Name: Wait ]]
    -- upvalues: l_HttpService_0 (copy), l_Heartbeat_0 (copy)
    local v18 = l_HttpService_0:GenerateGUID(false);
    v17.waiting[v18] = true;
    v17.totalWaiting = v17.totalWaiting + 1;
    repeat
        l_Heartbeat_0:Wait();
    until v17.waiting[v18] ~= true;
    v17.totalWaiting = v17.totalWaiting - 1;
    local v19 = v17.waiting[v18];
    v17.waiting[v18] = nil;
    return unpack(v19);
end;
v2.wait = v2.Wait;
v2.Destroy = function(v20) --[[ Line: 89 ]] --[[ Name: Destroy ]]
    if v20.bindableEvent then
        v20.bindableEvent:Destroy();
        v20.bindableEvent = nil;
    end;
    if v20.connectionsChanged then
        v20.connectionsChanged:Fire(-v20.totalConnections);
        v20.connectionsChanged:Destroy();
        v20.connectionsChanged = nil;
    end;
    v20.totalConnections = 0;
    for v21, _ in pairs(v20.connections) do
        v20.connections[v21] = nil;
    end;
end;
v2.destroy = v2.Destroy;
v2.Disconnect = v2.Destroy;
v2.disconnect = v2.Destroy;
return v2;