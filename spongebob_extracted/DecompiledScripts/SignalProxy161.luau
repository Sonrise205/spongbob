local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Janitor);
local v2 = require(l_Parent_0.Parent.Signal);
local v3 = {
    ClassName = "SignalProxy"
};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v5 = setmetatable({}, v3);
    v5._Janitor = v1.new();
    v5._ProxySignal = v5._Janitor:Add(v2.new());
    for _, v7 in v4 do
        v5._Janitor:Add(v7:Connect(function(...) --[[ Line: 67 ]]
            -- upvalues: v5 (copy)
            v5._ProxySignal:Fire(...);
        end));
    end;
    return v5;
end;
v3.Destroy = function(v8) --[[ Line: 78 ]] --[[ Name: Destroy ]]
    v8._Janitor:Destroy();
end;
v3.GetConnections = function(v9) --[[ Line: 85 ]] --[[ Name: GetConnections ]]
    return v9._ProxySignal:GetConnections();
end;
v3.DisconnectAll = function(v10) --[[ Line: 92 ]] --[[ Name: DisconnectAll ]]
    return v10._ProxySignal:DisconnectAll();
end;
v3.Connect = function(v11, v12) --[[ Line: 101 ]] --[[ Name: Connect ]]
    return v11._ProxySignal:Connect(v12);
end;
v3.Once = function(v13, v14) --[[ Line: 110 ]] --[[ Name: Once ]]
    return v13._ProxySignal:Connect(v14);
end;
v3.Wait = function(v15) --[[ Line: 118 ]] --[[ Name: Wait ]]
    return v15._ProxySignal:Wait();
end;
return v3;