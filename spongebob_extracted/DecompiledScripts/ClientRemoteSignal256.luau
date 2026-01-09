local v0 = require(script.Parent.Parent.Parent.Signal);
local _ = require(script.Parent.Parent.Types);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v6 = setmetatable({}, v2);
    v6._re = v3;
    if v5 and #v5 > 0 then
        v6._hasOutbound = true;
        v6._outbound = v5;
    else
        v6._hasOutbound = false;
    end;
    if v4 and #v4 > 0 then
        v6._directConnect = false;
        v6._signal = v0.new();
        v6._reConn = v6._re.OnClientEvent:Connect(function(...) --[[ Line: 40 ]]
            -- upvalues: v4 (copy), v6 (copy)
            local v7 = table.pack(...);
            for _, v9 in v4 do
                if not table.pack(v9(v7))[1] then
                    return;
                else
                    v7.n = #v7;
                end;
            end;
            v6._signal:Fire(table.unpack(v7, 1, v7.n));
        end);
        return v6;
    else
        v6._directConnect = true;
        return v6;
    end;
end;
v2._processOutboundMiddleware = function(v10, ...) --[[ Line: 57 ]] --[[ Name: _processOutboundMiddleware ]]
    local v11 = table.pack(...);
    for _, v13 in v10._outbound do
        local v14 = table.pack(v13(v11));
        if not v14[1] then
            return table.unpack(v14, 2, v14.n);
        else
            v11.n = #v11;
        end;
    end;
    return table.unpack(v11, 1, v11.n);
end;
v2.Connect = function(v15, v16) --[[ Line: 76 ]] --[[ Name: Connect ]]
    if v15._directConnect then
        return v15._re.OnClientEvent:Connect(v16);
    else
        return v15._signal:Connect(v16);
    end;
end;
v2.Fire = function(v17, ...) --[[ Line: 92 ]] --[[ Name: Fire ]]
    if v17._hasOutbound then
        v17._re:FireServer(v17:_processOutboundMiddleware(...));
        return;
    else
        v17._re:FireServer(...);
        return;
    end;
end;
v2.Destroy = function(v18) --[[ Line: 103 ]] --[[ Name: Destroy ]]
    if v18._signal then
        v18._signal:Destroy();
    end;
end;
return v2;