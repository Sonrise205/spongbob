local l_RunService_0 = game:GetService("RunService");
local l_Remotes_0 = script.Parent.Remotes;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Janitor);
local v5 = require(l_Parent_0.Signal);
local v6 = require(l_Parent_0.Symbol);
local l_ClientComm_0 = require(l_Parent_0.Comm).ClientComm;
local v8 = require(script.Parent.ClientRemoteProxy);
local v9 = require(script.Parent.ClientPromiseConversionMiddleware);
local v10 = v6("NAME");
local v11 = v6("COMM");
local v12 = v6("JANITOR");
local v13 = v6("NEW_IDX_SIG");
local v14 = {
    Function = "RF", 
    Event = "RE", 
    Property = "RP"
};
local v15 = {};
local v16 = v5.new();
local v17 = {
    PromiseConversionMiddleware = v9
};
v17.indexReady = function(v18, v19) --[[ Line: 106 ]] --[[ Name: indexReady ]]
    -- upvalues: v17 (copy), v3 (copy), v13 (copy)
    return v17.onReady(v18):andThen(function(v20) --[[ Line: 107 ]]
        -- upvalues: v19 (copy), v3 (ref), v13 (ref)
        if rawget(v20, v19) then
            return (rawget(v20, v19));
        else
            return v3.fromEvent(v20[v13], function(v21, _, _) --[[ Line: 111 ]]
                -- upvalues: v19 (ref)
                return v21 == v19;
            end):andThen(function(_, _, v26) --[[ Line: 113 ]]
                return v26;
            end);
        end;
    end);
end;
v17.promiseIndex = v17.indexReady;
v17.onReady = function(v27) --[[ Line: 128 ]] --[[ Name: onReady ]]
    -- upvalues: v3 (copy), v15 (copy), v16 (copy), v10 (copy), v17 (copy), v11 (copy)
    return v3.new(function(v28) --[[ Line: 129 ]]
        -- upvalues: v27 (ref), v15 (ref), v3 (ref), v16 (ref), v10 (ref)
        if typeof(v27) == "string" then
            v27 = v15[v27];
        end;
        if not v27 then
            v28(v3.fromEvent(v16, function(v29) --[[ Line: 134 ]]
                -- upvalues: v10 (ref), v27 (ref)
                return v29[v10] == v27;
            end));
        end;
        v28(v27);
    end):andThen(function(v30) --[[ Line: 139 ]]
        -- upvalues: v17 (ref), v11 (ref)
        if v17.isReady(v30) then
            return v30;
        else
            return v30[v11]:andThenReturn(v30);
        end;
    end);
end;
v17.promiseWire = v17.onReady;
v17.isReady = function(v31) --[[ Line: 156 ]] --[[ Name: isReady ]]
    -- upvalues: v15 (copy), v3 (copy), v11 (copy)
    if typeof(v31) == "string" then
        v31 = v15[v31];
        if not v31 then
            return false;
        end;
    end;
    assert(typeof(v31) == "table", "ClientNetWire must be a table");
    return not v3.is(v31[v11]);
end;
v17.destroy = function(v32) --[[ Line: 174 ]] --[[ Name: destroy ]]
    -- upvalues: v15 (copy), v10 (copy), v12 (copy), v11 (copy)
    if not v15[v32[v10]] then
        warn("Attempted to destroy an uncached ClientNetWire");
        return;
    else
        v15[v32[v10]] = nil;
        v32[v12]:Destroy();
        v32[v12] = nil;
        v32[v11] = nil;
        warn("Clearing NetWire cache for " .. v32[v10]);
        return;
    end;
end;
v17.getClient = function(v33) --[[ Line: 195 ]] --[[ Name: getClient ]]
    -- upvalues: v15 (copy)
    return v15[v33];
end;
local v40 = {
    ClassName = "ClientNetWire", 
    __index = function(v34, v35) --[[ Line: 205 ]]
        -- upvalues: v17 (copy), v8 (copy)
        if not v17.isReady(v34) then
            warn((("Attempted to index '%*' in a ClientNetWire that is not ready. Use NetWire.promiseWire to wait for the ClientNetWire to be ready. Also ensure the server side is actually being setup."):format(v35)));
        else
            warn((("Index '%*' is not yet initialized in this ClientNetWire. Use NetWire.promiseIndex to wait for the index."):format(v35)));
        end;
        local v36 = v8.new();
        rawset(v34, v35, v36);
        return v36;
    end, 
    __newindex = function(_, v38, v39) --[[ Line: 215 ]]
        error((("Attempted to set index '%*' to '%*' in a ClientNetWire. ClientNetWires are read-only."):format(v38, v39)));
    end
};
v40.new = function(v41) --[[ Line: 234 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), v15 (copy), v10 (copy), v12 (copy), v4 (copy), v13 (copy), v5 (copy), v11 (copy), v3 (copy), l_ClientComm_0 (copy), l_Remotes_0 (copy), v8 (copy), v9 (copy), v14 (copy), v40 (ref), v16 (copy)
    assert(l_RunService_0:IsClient(), "ClientNetWire.new can only be called from the client");
    assert(type(v41) == "string", "ClientNetWire.new expects a string for the nameSpace parameter");
    if v15[v41] then
        return v15[v41];
    else
        local v42 = {
            [v10] = v41, 
            [v12] = v4.new(), 
            [v13] = v5.new()
        };
        v42[v11] = v42[v12]:AddPromise(v3.new(function(v43, v44) --[[ Line: 247 ]]
            -- upvalues: l_RunService_0 (ref), l_ClientComm_0 (ref), l_Remotes_0 (ref), v41 (copy), v42 (copy), v12 (ref), v8 (ref), v13 (ref), v9 (ref), v14 (ref), v11 (ref)
            if not l_RunService_0:IsRunning() then
                v44("ClientNetWire.new can only be called from a running server");
            end;
            local v45 = l_ClientComm_0.new(l_Remotes_0, true, v41);
            local l__instancesFolder_0 = v45._instancesFolder;
            v42[v12]:Add(v45);
            v42[v12]:LinkToInstance(l__instancesFolder_0);
            local function v50(v47, v48, v49) --[[ Line: 258 ]] --[[ Name: SetIndex ]]
                -- upvalues: v8 (ref), v42 (ref), v13 (ref)
                if v8.is((rawget(v42, v47))) then
                    rawget(v42, v47):_SetRemote(v49, v48);
                end;
                rawset(v42, v47, v49);
                v42[v13]:Fire(v47, v48, v49);
            end;
            local function v63(v51) --[[ Line: 266 ]] --[[ Name: LoadFolder ]]
                -- upvalues: v9 (ref), v45 (copy), v50 (copy), v14 (ref)
                if not v51 then
                    return;
                else
                    local v52 = nil;
                    if v51.Name == "RF" then
                        v52 = function(v53) --[[ Line: 273 ]]
                            -- upvalues: v9 (ref), v45 (ref), v50 (ref), v14 (ref)
                            if not v53:IsA("RemoteFunction") then
                                return;
                            else
                                local v54 = {};
                                table.insert(v54, 1, v9);
                                local l_v45_Function_0 = v45:GetFunction(v53.Name, v54);
                                v50(v53.Name, v14.Function, function(_, ...) --[[ Line: 282 ]]
                                    -- upvalues: l_v45_Function_0 (copy)
                                    return l_v45_Function_0(...);
                                end);
                                return;
                            end;
                        end;
                    elseif v51.Name == "RE" then
                        v52 = function(v57) --[[ Line: 288 ]]
                            -- upvalues: v45 (ref), v50 (ref), v14 (ref)
                            if not v57:IsA("RemoteEvent") then
                                return;
                            else
                                local l_v45_Signal_0 = v45:GetSignal(v57.Name);
                                v50(v57.Name, v14.Event, l_v45_Signal_0);
                                return;
                            end;
                        end;
                    elseif v51.Name == "RP" then
                        v52 = function(v59) --[[ Line: 296 ]]
                            -- upvalues: v45 (ref), v50 (ref), v14 (ref)
                            if not v59:IsA("RemoteEvent") then
                                return;
                            else
                                local l_v45_Property_0 = v45:GetProperty(v59.Name);
                                v50(v59.Name, v14.Property, l_v45_Property_0);
                                return;
                            end;
                        end;
                    end;
                    for _, v62 in ipairs(v51:GetChildren()) do
                        v52(v62);
                    end;
                    v51.ChildAdded:Connect(v52);
                    return;
                end;
            end;
            v42[v12]:Add(l__instancesFolder_0.ChildAdded:Connect(v63));
            v63(l__instancesFolder_0:FindFirstChild("RF"));
            v63(l__instancesFolder_0:FindFirstChild("RE"));
            v63(l__instancesFolder_0:FindFirstChild("RP"));
            v42[v11] = v45;
            v43(v45);
        end));
        setmetatable(v42, v40);
        v15[v41] = v42;
        v42[v12]:Add(function() --[[ Line: 323 ]]
            -- upvalues: v15 (ref), v41 (copy)
            v15[v41] = nil;
        end);
        v16:Fire(v42);
        return v42;
    end;
end;
v17.Client = v40;
v17.__call = function(_, ...) --[[ Line: 335 ]]
    -- upvalues: v40 (ref)
    return v40.new(...);
end;
v40 = setmetatable(v40, v17);
return v17;