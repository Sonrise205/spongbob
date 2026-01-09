local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Remotes_0 = script.Parent:FindFirstChild("Remotes");
local l_Parent_0 = script.Parent.Parent;
local l_ServerComm_0 = require(l_Parent_0.Comm).ServerComm;
local v5 = require(script.Parent.Markers);
local _ = require(script.Parent.NetWireTypes);
local v7 = require(script.Parent.Shared);
local v8 = require(script.Parent.Utils.ServerPromiseConversionMiddleware);
local l_NAME_KEY_0 = v7.NAME_KEY;
local l_COMM_KEY_0 = v7.COMM_KEY;
local l__SIGNAL_MARKER_0 = v5._SIGNAL_MARKER;
local l__UNRELIABLE_SIGNAL_MARKER_0 = v5._UNRELIABLE_SIGNAL_MARKER;
local l__PROPERTY_MARKER_0 = v5._PROPERTY_MARKER;
local v14 = {};
local function v19(v15, v16, v17) --[[ Line: 169 ]] --[[ Name: autoRegister ]]
    -- upvalues: l__SIGNAL_MARKER_0 (copy), l__UNRELIABLE_SIGNAL_MARKER_0 (copy), l__PROPERTY_MARKER_0 (copy)
    if type(v17) == "function" then
        v15:RegisterMethod(v16, v17);
    elseif type(v17) == "table" then
        local v18 = v17[1];
        if v18 == l__SIGNAL_MARKER_0 then
            v15:RegisterEvent(v16, false, table.unpack(v17, 2));
        elseif v18 == l__UNRELIABLE_SIGNAL_MARKER_0 then
            v15:RegisterEvent(v16, true, table.unpack(v17, 2));
        elseif v18 == l__PROPERTY_MARKER_0 then
            v15:RegisterProperty(v16, table.unpack(v17, 2));
        else
            return false;
        end;
    else
        return false;
    end;
    return true;
end;
local function v24(v20, v21) --[[ Line: 192 ]] --[[ Name: parseTable ]]
    -- upvalues: v19 (copy)
    for v22, v23 in pairs(v21) do
        if not v19(v20, v22, v23) then
            warn("Unsupported Value in table:", v23, "at key:", v22, "\n", debug.traceback());
        end;
    end;
end;
local function _(v25, v26) --[[ Line: 204 ]] --[[ Name: setServer ]]
    rawset(v25, "Server", v26);
end;
local v28 = {
    ClassName = "ServerNetWire"
};
local v29 = {};
local v33 = {
    __index = v29, 
    __newindex = function(v30, v31, v32) --[[ Line: 231 ]]
        -- upvalues: v19 (copy)
        if not v19(v30, v31, v32) then
            warn("Attempted to set unexpected Value in ServerNetWire table:", v32, "at key:", v31);
            rawset(v30, v31, v32);
        end;
        return v32;
    end
};
table.freeze(v33);
v29.ClassName = "ServerNetWire";
v28.new = function(v34) --[[ Line: 260 ]] --[[ Name: new ]]
    -- upvalues: v28 (copy), l_RunService_0 (copy), v14 (copy), l_NAME_KEY_0 (copy), l_COMM_KEY_0 (copy), l_ServerComm_0 (copy), l_Remotes_0 (copy), v33 (copy)
    if typeof(v34) == "table" then
        return v28.setupServiceNetworking(v34);
    else
        assert(l_RunService_0:IsServer(), "ServerNetWire.new can only be called from the server");
        assert(type(v34) == "string", "ServerNetWire.new expects a string for the nameSpace parameter");
        if v14[v34] then
            return v14[v34];
        else
            local v35 = {
                Server = nil, 
                [""] = nil, 
                [l_NAME_KEY_0] = v34, 
                [l_COMM_KEY_0] = l_ServerComm_0.new(l_Remotes_0, v34)
            };
            setmetatable(v35, v33);
            v14[v34] = v35;
            return v35;
        end;
    end;
end;
v28.setupServiceNetworking = function(v36) --[[ Line: 349 ]] --[[ Name: setupServiceNetworking ]]
    -- upvalues: l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v14 (copy), v28 (copy), v24 (copy)
    assert(l_RunService_0:IsServer(), "ServerNetWire.fromService can only be called from the server");
    assert(typeof(v36.Client) == "table", "ServerNetWire.fromService expects a table for the service parameter with a Client key");
    local l_Name_0 = v36.Name;
    if not l_Name_0 then
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Roam", true);
        if l_l_ReplicatedStorage_0_FirstChild_0 then
            l_Name_0 = require(l_l_ReplicatedStorage_0_FirstChild_0).getNameFromService(v36);
        end;
    end;
    assert(typeof(l_Name_0) == "string", "ServerNetWire.fromService expects a string for the service parameter with a Name key");
    if v14[l_Name_0] then
        return v14[l_Name_0];
    else
        local v39 = v28.new(l_Name_0);
        rawset(v39, "Server", v36);
        v24(v39, v36.Client);
        v36.Client = v39;
        return v39;
    end;
end;
v28.fromService = v28.setupServiceNetworking;
v29.Destroy = function(v40) --[[ Line: 395 ]] --[[ Name: Destroy ]]
    -- upvalues: v14 (copy), l_NAME_KEY_0 (copy), l_COMM_KEY_0 (copy)
    v14[v40[l_NAME_KEY_0]] = nil;
    v40[l_COMM_KEY_0]:Destroy();
end;
v29.RegisterEvent = function(v41, v42, v43, v44, v45) --[[ Line: 433 ]] --[[ Name: RegisterEvent ]]
    -- upvalues: l_COMM_KEY_0 (copy)
    assert(type(v42) == "string", "ServerNetWire:RegisterEvent expects a string for the eventName parameter");
    assert(not rawget(v41, v42), "ServerNetWire:RegisterEvent expects the eventName to not already exist");
    rawset(v41, v42, v41[l_COMM_KEY_0]:CreateSignal(v42, v43, v44, v45));
end;
v29.RegisterProperty = function(v46, v47, v48, v49, v50) --[[ Line: 470 ]] --[[ Name: RegisterProperty ]]
    -- upvalues: l_COMM_KEY_0 (copy)
    assert(type(v47) == "string", "ServerNetWire:RegisterProperty expects a string for the propertyName parameter");
    assert(not rawget(v46, v47), "ServerNetWire:RegisterProperty expects the propertyName to not already exist");
    rawset(v46, v47, v46[l_COMM_KEY_0]:CreateProperty(v47, v48, v49, v50));
end;
v29.RegisterMethod = function(v51, v52, v53, v54, v55, v56) --[[ Line: 517 ]] --[[ Name: RegisterMethod ]]
    -- upvalues: v8 (copy), l_COMM_KEY_0 (copy)
    assert(type(v52) == "string", "ServerNetWire:RegisterFunction expects a string for the functionName parameter");
    assert(type(v53) == "function", "ServerNetWire:RegisterFunction expects a function for the callback parameter");
    assert(not rawget(v51, v52), "ServerNetWire:RegisterFunction expects the functionName to not already exist");
    local v57 = v54 or v51;
    rawset(v57, v52, v53);
    v56 = v56 or {};
    assert(typeof(v56) == "table", "ServerNetWire:RegisterFunction expects a table for the outboundMiddleware parameter");
    table.insert(v56, v8);
    v51[l_COMM_KEY_0]:WrapMethod(v57, v52, v55, v56);
end;
v28.createEvent = v5.createEvent;
v28.createUnreliableEvent = v5.createUnreliableEvent;
v28.createProperty = v5.createProperty;
setmetatable(v28, {
    __call = function(_, ...) --[[ Line: 557 ]] --[[ Name: __call ]]
        -- upvalues: v28 (copy)
        return v28.new(...);
    end, 
    __metatable = v28
});
v28.Server = setmetatable({}, {
    __call = function(_, ...) --[[ Line: 568 ]] --[[ Name: __call ]]
        -- upvalues: v28 (copy)
        return v28.new(...);
    end, 
    __index = v28, 
    __metatable = v28
});
return v28;