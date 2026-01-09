local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Signal);
local v3 = {
    Function = "RF", 
    Event = "RE", 
    Property = "RP"
};
local v4 = {
    ClassName = "FakeRemote"
};
v4.__index = v4;
v4.__call = function(v5, ...) --[[ Line: 28 ]]
    -- upvalues: v1 (copy), v3 (copy)
    if not v5._Type then
        return v1.reject("Remote is not ready");
    else
        if v5._Type ~= v3.Function then
            error("Attempted to call a non-function Remote");
        end;
        return v5._Remote(...);
    end;
end;
v4.is = function(v6) --[[ Line: 37 ]] --[[ Name: is ]]
    -- upvalues: v4 (copy)
    local v7 = false;
    if typeof(v6) == "table" then
        v7 = getmetatable(v6) == v4;
    end;
    return v7;
end;
v4.new = function() --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v4 (copy)
    return (setmetatable({
        Test = "A", 
        _Type = nil, 
        _Remote = nil, 
        _ExpectedType = nil, 
        Changed = v2.new()
    }, v4));
end;
v4.Destroy = function(v8) --[[ Line: 53 ]] --[[ Name: Destroy ]]
    if v8._TempSig then
        v8._TempSig:Destroy();
    end;
    if typeof(v8._Remote) == "table" and v8._Remote.Destroy then
        v8._Remote:Destroy();
    end;
end;
v4._SetRemote = function(v9, v10, v11) --[[ Line: 62 ]] --[[ Name: _SetRemote ]]
    -- upvalues: v3 (copy)
    assert(not v9._Remote, "Remote already set");
    v9._Remote = v10;
    v9._Type = v11;
    assert(not v9._ExpectedType or v9._Type == v9._ExpectedType, "Remote type mismatch");
    if v9._Type == v3.Event then
        v9._Remote:Connect(function(...) --[[ Line: 69 ]]
            -- upvalues: v9 (copy)
            v9.Changed:Fire(...);
        end);
    end;
    if v9._RegisterSig then
        v9._RegisterSig:Fire();
    end;
end;
v4.Connect = function(v12, v13) --[[ Line: 82 ]] --[[ Name: Connect ]]
    -- upvalues: v3 (copy)
    v12._ExpectedType = v3.Event;
    if not v12._Type then
        return v12.Changed:Connect(v13);
    else
        assert(v12._Type == v3.Event, "Attempted to connect to a non-event Remote");
        return v12._Remote:Connect(v13);
    end;
end;
v4.Fire = function(v14, ...) --[[ Line: 91 ]] --[[ Name: Fire ]]
    -- upvalues: v3 (copy)
    if not v14._Type then
        return warn("Remote is not ready, discarding :Fire request.");
    else
        assert(v14._Type == v3.Event, "Attempted to fire a non-event Remote");
        return v14._Remote:Fire(...);
    end;
end;
v4.IsReady = function(v15) --[[ Line: 102 ]] --[[ Name: IsReady ]]
    -- upvalues: v3 (copy)
    v15._ExpectedType = v3.Property;
    if v15.Type == nil then
        return false;
    else
        assert(v15._Type == v3.Property, "Attempted to check if a non-property Remote is ready");
        return v15._Remote:IsReady();
    end;
end;
v4.OnReady = function(v16) --[[ Line: 111 ]] --[[ Name: OnReady ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    v16._ExpectedType = v3.Property;
    if v16._Type == nil then
        if not v16._RegisterSig then
            v16._RegisterSig = v2.new();
        end;
        return v1.fromEvent(v16._RegisterSig):andThen(function() --[[ Line: 117 ]]
            -- upvalues: v16 (copy)
            return v16._Remote:OnReady();
        end);
    else
        assert(v16._Type == v3.Property, "Attempted to check if a non-property Remote is ready");
        return v16._Remote:OnReady();
    end;
end;
v4.Get = function(v17) --[[ Line: 125 ]] --[[ Name: Get ]]
    -- upvalues: v3 (copy)
    v17._ExpectedType = v3.Property;
    if not v17._Type then
        warn("Remote is not ready, returning nil.");
        return nil;
    else
        assert(v17._Type == v3.Property, "Attempted to Get a non-property Remote");
        return v17._Remote:Get();
    end;
end;
v4.Observe = function(v18, v19) --[[ Line: 135 ]] --[[ Name: Observe ]]
    -- upvalues: v3 (copy), v2 (copy)
    v18._ExpectedType = v3.Property;
    if not v18._Type then
        if not v18._RegisterSig then
            v18._RegisterSig = v2.new();
        end;
        local v20 = nil;
        v20 = v18._RegisterSig:Once(function() --[[ Line: 142 ]]
            -- upvalues: v20 (ref), v18 (copy), v19 (copy)
            v20 = v18._Remote:Observe(v19);
        end);
        local v21 = {
            Connected = true
        };
        v21.Disconnect = function() --[[ Line: 148 ]]
            -- upvalues: v20 (ref), v21 (copy)
            v20:Disconnect();
            v21.Connected = false;
        end;
        return v21;
    else
        assert(v18._Type == v3.Property, "Attempted to Get a non-property Remote");
        return v18._Remote:Observe(v19);
    end;
end;
return v4;