local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.Parent.Parent.Signal);
local _ = require(script.Parent.Parent.Types);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6, v7, v8) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v9 = setmetatable({}, v3);
    v9._re = if v6 == true then Instance.new("UnreliableRemoteEvent") else Instance.new("RemoteEvent");
    v9._re.Name = v5;
    v9._re.Parent = v4;
    if v8 and #v8 > 0 then
        v9._hasOutbound = true;
        v9._outbound = v8;
    else
        v9._hasOutbound = false;
    end;
    if v7 and #v7 > 0 then
        v9._directConnect = false;
        v9._signal = v1.new();
        v9._re.OnServerEvent:Connect(function(v10, ...) --[[ Line: 47 ]]
            -- upvalues: v7 (copy), v9 (copy)
            local v11 = table.pack(...);
            for _, v13 in v7 do
                if not table.pack(v13(v10, v11))[1] then
                    return;
                else
                    v11.n = #v11;
                end;
            end;
            v9._signal:Fire(v10, table.unpack(v11, 1, v11.n));
        end);
        return v9;
    else
        v9._directConnect = true;
        return v9;
    end;
end;
v3.IsUnreliable = function(v14) --[[ Line: 69 ]] --[[ Name: IsUnreliable ]]
    return v14._re:IsA("UnreliableRemoteEvent");
end;
v3.Connect = function(v15, v16) --[[ Line: 80 ]] --[[ Name: Connect ]]
    if v15._directConnect then
        return v15._re.OnServerEvent:Connect(v16);
    else
        return v15._signal:Connect(v16);
    end;
end;
v3._processOutboundMiddleware = function(v17, v18, ...) --[[ Line: 88 ]] --[[ Name: _processOutboundMiddleware ]]
    if not v17._hasOutbound then
        return ...;
    else
        local v19 = table.pack(...);
        for _, v21 in v17._outbound do
            local v22 = table.pack(v21(v18, v19));
            if not v22[1] then
                return table.unpack(v22, 2, v22.n);
            else
                v19.n = #v19;
            end;
        end;
        return table.unpack(v19, 1, v19.n);
    end;
end;
v3.Fire = function(v23, v24, ...) --[[ Line: 113 ]] --[[ Name: Fire ]]
    v23._re:FireClient(v24, v23:_processOutboundMiddleware(v24, ...));
end;
v3.FireAll = function(v25, ...) --[[ Line: 126 ]] --[[ Name: FireAll ]]
    v25._re:FireAllClients(v25:_processOutboundMiddleware(nil, ...));
end;
v3.FireExcept = function(v26, v27, ...) --[[ Line: 141 ]] --[[ Name: FireExcept ]]
    v26:FireFilter(function(v28) --[[ Line: 142 ]]
        -- upvalues: v27 (copy)
        return v28 ~= v27;
    end, ...);
end;
v3.FireFilter = function(v29, v30, ...) --[[ Line: 171 ]] --[[ Name: FireFilter ]]
    -- upvalues: l_Players_0 (copy)
    for _, v32 in l_Players_0:GetPlayers() do
        if v30(v32, ...) then
            v29._re:FireClient(v32, v29:_processOutboundMiddleware(nil, ...));
        end;
    end;
end;
v3.FireFor = function(v33, v34, ...) --[[ Line: 195 ]] --[[ Name: FireFor ]]
    for _, v36 in v34 do
        v33._re:FireClient(v36, v33:_processOutboundMiddleware(nil, ...));
    end;
end;
v3.Destroy = function(v37) --[[ Line: 204 ]] --[[ Name: Destroy ]]
    v37._re:Destroy();
    if v37._signal then
        v37._signal:Destroy();
    end;
end;
return v3;