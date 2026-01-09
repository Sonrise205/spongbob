local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Signal);
local _ = require(script.Parent.Parent.NetWireTypes);
local v4 = {
    Function = "RF", 
    Event = "RE", 
    Property = "RP"
};
local v5 = {
    ClassName = "FakeRemote"
};
v5.__index = v5;
v5.__call = function(v6, ...) --[[ Line: 35 ]]
    -- upvalues: v1 (copy), v4 (copy)
    if not v6._Type then
        return v1.reject("Remote is not ready");
    else
        if v6._Type ~= v4.Function then
            error("Attempted to call a non-function Remote");
        end;
        return v6._Remote(...);
    end;
end;
v5.is = function(v7) --[[ Line: 44 ]] --[[ Name: is ]]
    -- upvalues: v5 (copy)
    local v8 = false;
    if typeof(v7) == "table" then
        v8 = getmetatable(v7) == v5;
    end;
    return v8;
end;
v5.new = function() --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v5 (copy)
    return (setmetatable({
        Test = "A", 
        _Type = nil, 
        _Remote = nil, 
        _ExpectedType = nil, 
        Changed = v2.new()
    }, v5));
end;
v5.Destroy = function(v9) --[[ Line: 60 ]] --[[ Name: Destroy ]]
    if v9._TempSig then
        v9._TempSig:Destroy();
    end;
    if typeof(v9._Remote) == "table" and v9._Remote.Destroy then
        v9._Remote:Destroy();
    end;
end;
v5._SetRemote = function(v10, v11, v12) --[[ Line: 69 ]] --[[ Name: _SetRemote ]]
    -- upvalues: v4 (copy)
    assert(not v10._Remote, "Remote already set");
    v10._Remote = v11;
    v10._Type = v12;
    assert(not v10._ExpectedType or v10._Type == v10._ExpectedType, "Remote type mismatch");
    if v10._Type == v4.Event then
        v10._Remote:Connect(function(...) --[[ Line: 76 ]]
            -- upvalues: v10 (copy)
            v10.Changed:Fire(...);
        end);
    end;
    if v10._RegisterSig then
        v10._RegisterSig:Fire();
    end;
end;
v5.Connect = function(v13, v14) --[[ Line: 89 ]] --[[ Name: Connect ]]
    -- upvalues: v4 (copy)
    v13._ExpectedType = v4.Event;
    if not v13._Type then
        return v13.Changed:Connect(v14);
    else
        assert(v13._Type == v4.Event, "Attempted to connect to a non-event Remote");
        return v13._Remote:Connect(v14);
    end;
end;
v5.Fire = function(v15, ...) --[[ Line: 98 ]] --[[ Name: Fire ]]
    -- upvalues: v4 (copy)
    if not v15._Type then
        return warn("Remote is not ready, discarding :Fire request.");
    else
        assert(v15._Type == v4.Event, "Attempted to fire a non-event Remote");
        return v15._Remote:Fire(...);
    end;
end;
v5.IsReady = function(v16) --[[ Line: 109 ]] --[[ Name: IsReady ]]
    -- upvalues: v4 (copy)
    v16._ExpectedType = v4.Property;
    if v16.Type == nil then
        return false;
    else
        assert(v16._Type == v4.Property, "Attempted to check if a non-property Remote is ready");
        return v16._Remote:IsReady();
    end;
end;
v5.OnReady = function(v17) --[[ Line: 118 ]] --[[ Name: OnReady ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy)
    v17._ExpectedType = v4.Property;
    if v17._Type == nil then
        if not v17._RegisterSig then
            v17._RegisterSig = v2.new();
        end;
        return v1.fromEvent(v17._RegisterSig):andThen(function() --[[ Line: 124 ]]
            -- upvalues: v17 (copy)
            return v17._Remote:OnReady();
        end);
    else
        assert(v17._Type == v4.Property, "Attempted to check if a non-property Remote is ready");
        return v17._Remote:OnReady();
    end;
end;
v5.Get = function(v18) --[[ Line: 132 ]] --[[ Name: Get ]]
    -- upvalues: v4 (copy)
    v18._ExpectedType = v4.Property;
    if not v18._Type then
        warn("Remote is not ready, returning nil.");
        return nil;
    else
        assert(v18._Type == v4.Property, "Attempted to Get a non-property Remote");
        return v18._Remote:Get();
    end;
end;
v5.Observe = function(v19, v20) --[[ Line: 142 ]] --[[ Name: Observe ]]
    -- upvalues: v4 (copy), v2 (copy)
    v19._ExpectedType = v4.Property;
    if not v19._Type then
        if not v19._RegisterSig then
            v19._RegisterSig = v2.new();
        end;
        local v21 = nil;
        v21 = v19._RegisterSig:Once(function() --[[ Line: 149 ]]
            -- upvalues: v21 (ref), v19 (copy), v20 (copy)
            v21 = v19._Remote:Observe(v20);
        end);
        local v22 = {
            Connected = true
        };
        v22.Disconnect = function() --[[ Line: 155 ]]
            -- upvalues: v21 (ref), v22 (copy)
            v21:Disconnect();
            v22.Connected = false;
        end;
        return v22;
    else
        assert(v19._Type == v4.Property, "Attempted to Get a non-property Remote");
        return v19._Remote:Observe(v20);
    end;
end;
return v5;