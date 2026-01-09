local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Remotes_0 = script.Parent:FindFirstChild("Remotes");
local l_Parent_0 = script.Parent.Parent;
local l_ServerComm_0 = require(l_Parent_0.Comm).ServerComm;
local v5 = require(l_Parent_0.Symbol);
local v6 = require(script.Parent.ServerPromiseConversionMiddleware);
local v7 = v5("NAME");
local v8 = v5("COMM");
local v9 = v5("SIGNAL_MARKER");
local v10 = v5("UNRELIABLE_SIGNAL_MARKER");
local v11 = v5("PROPERTY_MARKER");
local v12 = {};
local v13 = {};
local v14 = {
    ClassName = "ServerNetWire"
};
v14.__index = v14;
v14.__newindex = function(v15, v16, v17) --[[ Line: 173 ]]
    if not v15:AutoRegister(v16, v17) then
        warn("Attempted to set unexpected Value in ServerNetWire table:", v17, "at key:", v16);
        rawset(v15, v16, v17);
    end;
end;
v14.new = function(v18) --[[ Line: 195 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), l_RunService_0 (copy), v12 (copy), v7 (copy), v8 (copy), l_ServerComm_0 (copy), l_Remotes_0 (copy)
    if typeof(v18) == "table" then
        return v14.fromService(v18);
    else
        assert(l_RunService_0:IsServer(), "ServerNetWire.new can only be called from the server");
        assert(type(v18) == "string", "ServerNetWire.new expects a string for the nameSpace parameter");
        if v12[v18] then
            return v12[v18];
        else
            local v19 = {
                [v7] = v18, 
                [v8] = l_ServerComm_0.new(l_Remotes_0, v18)
            };
            setmetatable(v19, v14);
            v12[v18] = v19;
            return v19;
        end;
    end;
end;
v14.setupServiceNetworking = function(v20) --[[ Line: 260 ]] --[[ Name: setupServiceNetworking ]]
    -- upvalues: l_RunService_0 (copy), l_ReplicatedStorage_0 (copy), v12 (copy), v14 (copy)
    assert(l_RunService_0:IsServer(), "ServerNetWire.fromService can only be called from the server");
    assert(typeof(v20.Client) == "table", "ServerNetWire.fromService expects a table for the service parameter with a Client key");
    local l_Name_0 = v20.Name;
    if not l_Name_0 then
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Roam", true);
        if l_l_ReplicatedStorage_0_FirstChild_0 then
            l_Name_0 = require(l_l_ReplicatedStorage_0_FirstChild_0).getNameFromService(v20);
        end;
    end;
    assert(typeof(l_Name_0) == "string", "ServerNetWire.fromService expects a string for the service parameter with a Name key");
    if v12[l_Name_0] then
        return v12[l_Name_0];
    else
        local v23 = v14.new(l_Name_0);
        v23:SetServer(v20);
        v23:Parse(v20.Client);
        v20.Client = v23;
        return v23;
    end;
end;
v14.fromService = v14.setupServiceNetworking;
v14.Destroy = function(v24) --[[ Line: 294 ]] --[[ Name: Destroy ]]
    -- upvalues: v12 (copy), v7 (copy), v8 (copy)
    v12[v24[v7]] = nil;
    v24[v8]:Destroy();
end;
v14.Parse = function(v25, v26) --[[ Line: 304 ]] --[[ Name: Parse ]]
    for v27, v28 in pairs(v26) do
        if not v25:AutoRegister(v27, v28) then
            warn("Unsupported Value in table:", v28, "at key:", v27, "\n", debug.traceback());
        end;
    end;
end;
v14.AutoRegister = function(v29, v30, v31) --[[ Line: 318 ]] --[[ Name: AutoRegister ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy)
    if type(v31) == "function" then
        v29:RegisterMethod(v30, v31);
    elseif type(v31) == "table" then
        local v32 = v31[1];
        if v32 == v9 then
            v29:RegisterEvent(v30, false, table.unpack(v31, 2));
        elseif v32 == v10 then
            v29:RegisterEvent(v30, true, table.unpack(v31, 2));
        elseif v32 == v11 then
            v29:RegisterProperty(v30, table.unpack(v31, 2));
        else
            return false;
        end;
    else
        return false;
    end;
    return true;
end;
v14.SetServer = function(v33, v34) --[[ Line: 343 ]] --[[ Name: SetServer ]]
    rawset(v33, "Server", v34);
end;
v14.RegisterEvent = function(v35, v36, v37, v38, v39) --[[ Line: 379 ]] --[[ Name: RegisterEvent ]]
    -- upvalues: v8 (copy)
    assert(type(v36) == "string", "ServerNetWire:RegisterEvent expects a string for the eventName parameter");
    assert(not rawget(v35, v36), "ServerNetWire:RegisterEvent expects the eventName to not already exist");
    rawset(v35, v36, v35[v8]:CreateSignal(v36, v37, v38, v39));
end;
v14.RegisterProperty = function(v40, v41, v42, _, _) --[[ Line: 410 ]] --[[ Name: RegisterProperty ]]
    -- upvalues: v8 (copy)
    assert(type(v41) == "string", "ServerNetWire:RegisterProperty expects a string for the propertyName parameter");
    assert(not rawget(v40, v41), "ServerNetWire:RegisterProperty expects the propertyName to not already exist");
    rawset(v40, v41, v40[v8]:CreateProperty(v41, v42));
end;
v14.RegisterMethod = function(v45, v46, v47, v48, v49, v50) --[[ Line: 441 ]] --[[ Name: RegisterMethod ]]
    -- upvalues: v6 (copy), v8 (copy)
    assert(type(v46) == "string", "ServerNetWire:RegisterFunction expects a string for the functionName parameter");
    assert(type(v47) == "function", "ServerNetWire:RegisterFunction expects a function for the callback parameter");
    assert(not rawget(v45, v46), "ServerNetWire:RegisterFunction expects the functionName to not already exist");
    local v51 = v48 or v45;
    rawset(v51, v46, v47);
    v50 = v50 or {};
    assert(typeof(v50) == "table", "ServerNetWire:RegisterFunction expects a table for the outboundMiddleware parameter");
    table.insert(v50, v6);
    v45[v8]:WrapMethod(v51, v46, v49, v50);
end;
v13.Server = v14;
v13.PromiseConversionMiddleware = v6;
v13.setupServiceNetworking = v14.setupServiceNetworking;
v13.__call = function(_, ...) --[[ Line: 461 ]]
    -- upvalues: v14 (copy)
    return v14.new(...);
end;
setmetatable(v14, v13);
local v55 = {
    __index = function(_, v54) --[[ Line: 467 ]] --[[ Name: __index ]]
        error("Attempted to access an uninitialized NetWire object with key: " .. tostring(v54) .. ". | Ensure you have initialized the NetWire object prior to accessing this.");
    end
};
v13.createEvent = function(v56, v57) --[[ Line: 497 ]] --[[ Name: createEvent ]]
    -- upvalues: v9 (copy), v55 (copy)
    return (setmetatable({
        v9, 
        v56, 
        v57
    }, v55));
end;
v13.createUnreliableEvent = function(v58, v59) --[[ Line: 520 ]] --[[ Name: createUnreliableEvent ]]
    -- upvalues: v10 (copy), v55 (copy)
    return (setmetatable({
        v10, 
        v58, 
        v59
    }, v55));
end;
v13.createProperty = function(v60, v61, v62) --[[ Line: 540 ]] --[[ Name: createProperty ]]
    -- upvalues: v11 (copy), v55 (copy)
    return (setmetatable({
        v11, 
        v60, 
        v61, 
        v62
    }, v55));
end;
v13.getServer = function(v63) --[[ Line: 553 ]] --[[ Name: getServer ]]
    -- upvalues: v12 (copy)
    return v12[v63];
end;
return v13;