local l_RunService_0 = game:GetService("RunService");
local l_Remotes_0 = script.Parent.Remotes;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Janitor);
local v5 = require(l_Parent_0.Signal);
local l_ClientComm_0 = require(l_Parent_0.Comm).ClientComm;
local _ = require(script.Parent.NetWireTypes);
local v8 = require(script.Parent.Shared);
local v9 = require(script.Parent.Utils.ClientRemoteProxy);
local v10 = require(script.Parent.Utils.ClientPromiseConversionMiddleware);
local l_NAME_KEY_0 = v8.NAME_KEY;
local l_COMM_KEY_0 = v8.COMM_KEY;
local l_JANI_KEY_0 = v8.JANI_KEY;
local l_SIG_KEY_0 = v8.SIG_KEY;
local v15 = {
    Function = "RF", 
    Event = "RE", 
    Property = "RP"
};
local v16 = {};
local v17 = v5.new();
local v18 = {
    ClassName = "ClientNetWire"
};
local v25 = {
    __index = function(v19, v20) --[[ Line: 144 ]]
        -- upvalues: v18 (copy), v9 (copy)
        if not v18.isReady(v19) then
            warn((("Attempted to index '%*' in a ClientNetWire that is not ready or does not exist. Ensure the server side is actually being setup."):format(v20)));
        else
            warn((("Index '%*' is not yet initialized in this ClientNetWire. Use NetWire.promiseIndex to wait for the index."):format(v20)));
        end;
        local v21 = v9.new();
        rawset(v19, v20, v21);
        return v21;
    end, 
    __newindex = function(_, v23, v24) --[[ Line: 158 ]]
        error((("Attempted to set index '%*' to '%*' in a ClientNetWire. ClientNetWires are read-only."):format(v23, v24)));
    end
};
v18.new = function(v26) --[[ Line: 173 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), v16 (copy), l_NAME_KEY_0 (copy), l_JANI_KEY_0 (copy), v4 (copy), l_SIG_KEY_0 (copy), v5 (copy), l_COMM_KEY_0 (copy), v3 (copy), l_ClientComm_0 (copy), l_Remotes_0 (copy), v9 (copy), v10 (copy), v15 (copy), v25 (copy), v17 (copy)
    assert(l_RunService_0:IsClient(), "ClientNetWire.new can only be called from the client");
    assert(type(v26) == "string", "ClientNetWire.new expects a string for the nameSpace parameter");
    if v16[v26] then
        return v16[v26];
    else
        local v27 = {
            [""] = nil, 
            [l_NAME_KEY_0] = v26, 
            [l_JANI_KEY_0] = v4.new(), 
            [l_SIG_KEY_0] = v5.new()
        };
        v27[l_COMM_KEY_0] = v27[l_JANI_KEY_0]:AddPromise(v3.new(function(v28, v29) --[[ Line: 188 ]]
            -- upvalues: l_RunService_0 (ref), l_ClientComm_0 (ref), l_Remotes_0 (ref), v26 (copy), v27 (copy), l_JANI_KEY_0 (ref), v9 (ref), l_SIG_KEY_0 (ref), v10 (ref), v15 (ref), l_COMM_KEY_0 (ref)
            if not l_RunService_0:IsRunning() then
                v29("ClientNetWire.new can only be called from a running server");
            end;
            local v30 = l_ClientComm_0.new(l_Remotes_0, true, v26);
            local l__instancesFolder_0 = v30._instancesFolder;
            v27[l_JANI_KEY_0]:Add(v30);
            v27[l_JANI_KEY_0]:LinkToInstance(l__instancesFolder_0);
            local function v35(v32, v33, v34) --[[ Line: 199 ]] --[[ Name: SetIndex ]]
                -- upvalues: v9 (ref), v27 (ref), l_SIG_KEY_0 (ref)
                if v9.is((rawget(v27, v32))) then
                    rawget(v27, v32):_SetRemote(v34, v33);
                end;
                rawset(v27, v32, v34);
                v27[l_SIG_KEY_0]:Fire(v32, v33, v34);
            end;
            local function v48(v36) --[[ Line: 207 ]] --[[ Name: LoadFolder ]]
                -- upvalues: v10 (ref), v30 (copy), v35 (copy), v15 (ref)
                if not v36 then
                    return;
                else
                    local v37 = nil;
                    if v36.Name == "RF" then
                        v37 = function(v38) --[[ Line: 214 ]]
                            -- upvalues: v10 (ref), v30 (ref), v35 (ref), v15 (ref)
                            if not v38:IsA("RemoteFunction") then
                                return;
                            else
                                local v39 = {};
                                table.insert(v39, 1, v10);
                                local l_v30_Function_0 = v30:GetFunction(v38.Name, v39);
                                v35(v38.Name, v15.Function, function(_, ...) --[[ Line: 223 ]]
                                    -- upvalues: l_v30_Function_0 (copy)
                                    return l_v30_Function_0(...);
                                end);
                                return;
                            end;
                        end;
                    elseif v36.Name == "RE" then
                        v37 = function(v42) --[[ Line: 229 ]]
                            -- upvalues: v30 (ref), v35 (ref), v15 (ref)
                            if not v42:IsA("RemoteEvent") and not v42:IsA("UnreliableRemoteEvent") then
                                return;
                            else
                                local l_v30_Signal_0 = v30:GetSignal(v42.Name);
                                v35(v42.Name, v15.Event, l_v30_Signal_0);
                                return;
                            end;
                        end;
                    elseif v36.Name == "RP" then
                        v37 = function(v44) --[[ Line: 237 ]]
                            -- upvalues: v30 (ref), v35 (ref), v15 (ref)
                            if not v44:IsA("RemoteEvent") then
                                return;
                            else
                                local l_v30_Property_0 = v30:GetProperty(v44.Name);
                                v35(v44.Name, v15.Property, l_v30_Property_0);
                                return;
                            end;
                        end;
                    end;
                    for _, v47 in ipairs(v36:GetChildren()) do
                        v37(v47);
                    end;
                    v36.ChildAdded:Connect(v37);
                    return;
                end;
            end;
            v27[l_JANI_KEY_0]:Add(l__instancesFolder_0.ChildAdded:Connect(v48));
            v48(l__instancesFolder_0:FindFirstChild("RF"));
            v48(l__instancesFolder_0:FindFirstChild("RE"));
            v48(l__instancesFolder_0:FindFirstChild("RP"));
            v27[l_COMM_KEY_0] = v30;
            v28(v30);
        end));
        setmetatable(v27, v25);
        v16[v26] = v27;
        v27[l_JANI_KEY_0]:Add(function() --[[ Line: 264 ]]
            -- upvalues: v16 (ref), v26 (copy)
            v16[v26] = nil;
        end);
        v17:Fire(v27);
        return v27;
    end;
end;
v18.onReady = function(v49) --[[ Line: 282 ]] --[[ Name: onReady ]]
    -- upvalues: v3 (copy), v16 (copy), v17 (copy), l_NAME_KEY_0 (copy), v18 (copy), l_COMM_KEY_0 (copy)
    return v3.new(function(v50) --[[ Line: 283 ]]
        -- upvalues: v49 (ref), v16 (ref), v3 (ref), v17 (ref), l_NAME_KEY_0 (ref)
        if typeof(v49) == "string" then
            v49 = v16[v49];
        end;
        if not v49 then
            v50(v3.fromEvent(v17, function(v51) --[[ Line: 288 ]]
                -- upvalues: l_NAME_KEY_0 (ref), v49 (ref)
                return v51[l_NAME_KEY_0] == v49;
            end));
        end;
        v50(v49);
    end):andThen(function(v52) --[[ Line: 293 ]]
        -- upvalues: v18 (ref), l_COMM_KEY_0 (ref)
        if v18.isReady(v52) then
            return v52;
        else
            return v52[l_COMM_KEY_0]:andThenReturn(v52);
        end;
    end);
end;
v18.promiseWire = v18.onReady;
v18.isReady = function(v53) --[[ Line: 311 ]] --[[ Name: isReady ]]
    -- upvalues: v16 (copy), v3 (copy), l_COMM_KEY_0 (copy)
    if typeof(v53) == "string" then
        v53 = v16[v53];
        if not v53 then
            return false;
        end;
    end;
    assert(typeof(v53) == "table", "ClientNetWire must be a table");
    return not v3.is(v53[l_COMM_KEY_0]);
end;
v18.indexReady = function(v54, v55) --[[ Line: 331 ]] --[[ Name: indexReady ]]
    -- upvalues: v18 (copy), v3 (copy), l_SIG_KEY_0 (copy)
    return v18.onReady(v54):andThen(function(v56) --[[ Line: 332 ]]
        -- upvalues: v55 (copy), v3 (ref), l_SIG_KEY_0 (ref)
        if rawget(v56, v55) then
            return (rawget(v56, v55));
        else
            return v3.fromEvent(v56[l_SIG_KEY_0], function(v57, _, _) --[[ Line: 336 ]]
                -- upvalues: v55 (ref)
                return v57 == v55;
            end):andThen(function(_, _, v62) --[[ Line: 338 ]]
                return v62;
            end);
        end;
    end);
end;
v18.promiseIndex = v18.indexReady;
v18.destroy = function(v63) --[[ Line: 352 ]] --[[ Name: destroy ]]
    -- upvalues: v16 (copy), l_NAME_KEY_0 (copy), l_JANI_KEY_0 (copy), l_COMM_KEY_0 (copy)
    if not v16[v63[l_NAME_KEY_0]] then
        warn("Attempted to destroy an uncached ClientNetWire");
        return;
    else
        v16[v63[l_NAME_KEY_0]] = nil;
        v63[l_JANI_KEY_0]:Destroy();
        v63[l_JANI_KEY_0] = nil;
        v63[l_COMM_KEY_0] = nil;
        warn("Clearing NetWire cache for " .. v63[l_NAME_KEY_0]);
        return;
    end;
end;
setmetatable(v18, {
    __call = function(_, ...) --[[ Line: 368 ]] --[[ Name: __call ]]
        -- upvalues: v18 (copy)
        return v18.new(...);
    end, 
    __metatable = v18
});
v18.Client = setmetatable({}, {
    __call = function(_, ...) --[[ Line: 390 ]] --[[ Name: __call ]]
        -- upvalues: v18 (copy)
        return v18.new(...);
    end, 
    __index = v18, 
    __metatable = v18
});
return v18;