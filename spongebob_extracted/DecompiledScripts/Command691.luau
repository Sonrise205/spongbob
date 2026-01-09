local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v2 = require(script.Parent.Argument);
local v3 = l_RunService_0:IsServer();
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v6 = {
        Dispatcher = v5.Dispatcher, 
        Cmdr = v5.Dispatcher.Cmdr, 
        Name = v5.CommandObject.Name, 
        RawText = v5.Text, 
        Object = v5.CommandObject, 
        Group = v5.CommandObject.Group, 
        State = {}, 
        Aliases = v5.CommandObject.Aliases, 
        Alias = v5.Alias, 
        Description = v5.CommandObject.Description, 
        Executor = v5.Executor, 
        ArgumentDefinitions = v5.CommandObject.Args, 
        RawArguments = v5.Arguments, 
        Arguments = {}, 
        Data = v5.Data, 
        Response = nil, 
        Guards = v5.Guards
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.Parse = function(v7, v8) --[[ Line: 51 ]] --[[ Name: Parse ]]
    -- upvalues: v2 (copy)
    local v9 = false;
    for v10, v11 in ipairs(v7.ArgumentDefinitions) do
        if type(v11) == "function" then
            v11 = v11(v7);
            if v11 == nil then
                break;
            end;
        end;
        local v12 = false;
        if v11.Default == nil then
            v12 = v11.Optional ~= true;
        end;
        if v12 and v9 then
            error(("[Cmdr] Command %q: Required arguments cannot occur after optional arguments."):format(v7.Name));
        elseif not v12 then
            v9 = true;
        end;
        if v7.RawArguments[v10] == nil and v12 and v8 ~= true then
            return false, ("Required argument #%d %s is missing."):format(v10, v11.Name);
        elseif v7.RawArguments[v10] or v8 then
            v7.Arguments[v10] = v2.new(v7, v11, v7.RawArguments[v10] or "");
        end;
    end;
    return true;
end;
v4.Validate = function(v13, v14) --[[ Line: 83 ]] --[[ Name: Validate ]]
    v13._Validated = true;
    local v15 = "";
    local v16 = true;
    for v17, v18 in pairs(v13.Arguments) do
        local v19, v20 = v18:Validate(v14);
        if not v19 then
            v16 = false;
            v15 = ("%s; #%d %s: %s"):format(v15, v17, v18.Name, v20 or "error");
        end;
    end;
    return v16, v15:sub(3);
end;
v4.GetLastArgument = function(v21) --[[ Line: 102 ]] --[[ Name: GetLastArgument ]]
    for v22 = #v21.Arguments, 1, -1 do
        if v21.Arguments[v22].RawValue then
            return v21.Arguments[v22];
        end;
    end;
end;
v4.GatherArgumentValues = function(v23) --[[ Line: 111 ]] --[[ Name: GatherArgumentValues ]]
    local v24 = {};
    for v25 = 1, #v23.ArgumentDefinitions do
        local v26 = v23.Arguments[v25];
        if v26 then
            v24[v25] = v26:GetValue();
        elseif type(v23.ArgumentDefinitions[v25]) == "table" then
            v24[v25] = v23.ArgumentDefinitions[v25].Default;
        end;
    end;
    return v24, #v23.ArgumentDefinitions;
end;
v4.Run = function(v27) --[[ Line: 128 ]] --[[ Name: Run ]]
    -- upvalues: v3 (copy)
    if v27._Validated == nil then
        error("[Cmdr] Must validate a command before running.");
    end;
    local v28 = v27.Dispatcher:RunHooks("BeforeRun", v27);
    if v28 then
        return v28;
    else
        local v29 = v27.Dispatcher:RunGuards(v27);
        if v29 then
            return v29;
        else
            if not v3 and v27.Object.Data and v27.Data == nil then
                local v30, v31 = v27:GatherArgumentValues();
                v27.Data = v27.Object.Data(v27, unpack(v30, 1, v31));
            end;
            if not v3 and v27.Object.ClientRun then
                local v32, v33 = v27:GatherArgumentValues();
                v27.Response = v27.Object.ClientRun(v27, unpack(v32, 1, v33));
            end;
            if v27.Response == nil then
                if v27.Object.Run then
                    local v34, v35 = v27:GatherArgumentValues();
                    v27.Response = v27.Object.Run(v27, unpack(v34, 1, v35));
                elseif v3 then
                    if v27.Object.ClientRun then
                        warn((("[Cmdr] %* command fell back to the server because ClientRun returned nil, but there is no server implementation! Either return a string from ClientRun, or create a server implementation for this command."):format(v27.Name)));
                    else
                        warn((("[Cmdr] %* command has no implementation!"):format(v27.Name)));
                    end;
                    v27.Response = "No implementation.";
                else
                    v27.Response = v27.Dispatcher:Send(v27.RawText, v27.Data);
                end;
            end;
            local v36 = v27.Dispatcher:RunHooks("AfterRun", v27);
            if v36 then
                return v36;
            else
                return v27.Response;
            end;
        end;
    end;
end;
v4.GetArgument = function(v37, v38) --[[ Line: 181 ]] --[[ Name: GetArgument ]]
    return v37.Arguments[v38];
end;
v4.GetData = function(v39) --[[ Line: 189 ]] --[[ Name: GetData ]]
    -- upvalues: v3 (copy)
    if v39.Data then
        return v39.Data;
    else
        if v39.Object.Data and not v3 then
            v39.Data = v39.Object.Data(v39);
        end;
        return v39.Data;
    end;
end;
v4.SendEvent = function(v40, v41, v42, ...) --[[ Line: 202 ]] --[[ Name: SendEvent ]]
    -- upvalues: v3 (copy), l_Players_0 (copy)
    local v43 = false;
    if typeof(v41) == "Instance" then
        v43 = v41:IsA("Player");
    end;
    assert(v43, "[Cmdr] Argument #1 must be a Player");
    assert(type(v42) == "string", "[Cmdr] Argument #2 must be a string");
    if v3 then
        v40.Dispatcher.Cmdr.RemoteEvent:FireClient(v41, v42, ...);
        return;
    else
        if v40.Dispatcher.Cmdr.Events[v42] then
            assert(v41 == l_Players_0.LocalPlayer, "[Cmdr] Event messages can only be sent to the local player on the client.");
            v40.Dispatcher.Cmdr.Events[v42](...);
        end;
        return;
    end;
end;
v4.BroadcastEvent = function(v44, ...) --[[ Line: 218 ]] --[[ Name: BroadcastEvent ]]
    -- upvalues: v3 (copy)
    if not v3 then
        error("[Cmdr] Can't broadcast event messages from the client.", 2);
    end;
    v44.Dispatcher.Cmdr.RemoteEvent:FireAllClients(...);
end;
v4.Reply = function(v45, ...) --[[ Line: 227 ]] --[[ Name: Reply ]]
    return v45:SendEvent(v45.Executor, "AddLine", ...);
end;
v4.GetStore = function(v46, ...) --[[ Line: 232 ]] --[[ Name: GetStore ]]
    return v46.Dispatcher.Cmdr.Registry:GetStore(...);
end;
v4.HasImplementation = function(v47) --[[ Line: 237 ]] --[[ Name: HasImplementation ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsClient() and v47.Object.ClientRun or v47.Object.Run then
        return true;
    else
        return false;
    end;
end;
return v4;