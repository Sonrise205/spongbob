local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Util);
local v18 = {
    TypeMethods = v1.MakeDictionary({
        "Transform", 
        "Validate", 
        "Autocomplete", 
        "Parse", 
        "DisplayName", 
        "Listable", 
        "ValidateOnce", 
        "Prefixes", 
        "Default", 
        "ArgumentOperatorAliases"
    }), 
    CommandMethods = v1.MakeDictionary({
        "Name", 
        "Aliases", 
        "AutoExec", 
        "Description", 
        "Args", 
        "Run", 
        "ClientRun", 
        "Data", 
        "Group", 
        "Guards"
    }), 
    CommandArgProps = v1.MakeDictionary({
        "Name", 
        "Type", 
        "Description", 
        "Optional", 
        "Default"
    }), 
    Types = {}, 
    TypeAliases = {}, 
    Commands = {}, 
    CommandsArray = {}, 
    Cmdr = nil, 
    Hooks = {
        BeforeRun = {}, 
        AfterRun = {}
    }, 
    Stores = setmetatable({}, {
        __index = function(v2, v3) --[[ Line: 170 ]] --[[ Name: __index ]]
            v2[v3] = {};
            return v2[v3];
        end
    }), 
    AutoExecBuffer = {}, 
    RegisterType = function(v4, v5, v6) --[[ Line: 184 ]] --[[ Name: RegisterType ]]
        if not v5 or typeof(v5) ~= "string" then
            error("[Cmdr] Invalid type name provided: nil");
        end;
        if not v5:find("^[%d%l]%w*$") then
            error((("[Cmdr] Invalid type name provided: \"%*\", type names must be alphanumeric and start with a lower-case letter or a digit."):format(v5)));
        end;
        for v7 in pairs(v6) do
            if v4.TypeMethods[v7] == nil then
                error((("[Cmdr] Unknown key/method in type \"%*\": %*"):format(v5, v7)));
            end;
        end;
        if v4.Types[v5] ~= nil then
            error((("[Cmdr] Type %* has already been registered."):format(v5)));
        end;
        v6.Name = v5;
        v6.DisplayName = v6.DisplayName or v5;
        v4.Types[v5] = v6;
        if v6.Prefixes then
            v4:RegisterTypePrefix(v5, v6.Prefixes);
        end;
    end, 
    RegisterTypePrefix = function(v8, v9, v10) --[[ Line: 224 ]] --[[ Name: RegisterTypePrefix ]]
        if not v8.TypeAliases[v9] then
            v8.TypeAliases[v9] = v9;
        end;
        v8.TypeAliases[v9] = ("%s %s"):format(v8.TypeAliases[v9], v10);
    end, 
    RegisterTypeAlias = function(v11, v12, v13) --[[ Line: 240 ]] --[[ Name: RegisterTypeAlias ]]
        assert(v11.TypeAliases[v12] == nil, (("[Cmdr] Type alias %* already exists!"):format(v13)));
        v11.TypeAliases[v12] = v13;
    end, 
    RegisterTypesIn = function(v14, v15) --[[ Line: 251 ]] --[[ Name: RegisterTypesIn ]]
        for _, v17 in pairs(v15:GetChildren()) do
            if v17:IsA("ModuleScript") then
                v17.Parent = v14.Cmdr.ReplicatedRoot.Types;
                require(v17)(v14);
            else
                v14:RegisterTypesIn(v17);
            end;
        end;
    end
};
v18.RegisterHooksIn = v18.RegisterTypesIn;
v18.RegisterCommandObject = function(v19, v20) --[[ Line: 283 ]] --[[ Name: RegisterCommandObject ]]
    -- upvalues: l_RunService_0 (copy)
    for v21 in pairs(v20) do
        if v19.CommandMethods[v21] == nil then
            error((("[Cmdr] Unknown key/method in command \"%*\": %*"):format(v20.Name or "unknown command", v21)));
        end;
    end;
    if v20.Args then
        for v22, v23 in pairs(v20.Args) do
            if type(v23) == "table" then
                for v24 in pairs(v23) do
                    if v19.CommandArgProps[v24] == nil then
                        error((("[Cmdr] Unknown property in command \"%*\" argument #%*: %*"):format(v20.Name or "unknown", v22, v24)));
                    end;
                end;
            end;
        end;
    end;
    if v20.AutoExec and l_RunService_0:IsClient() then
        table.insert(v19.AutoExecBuffer, v20.AutoExec);
        v19:FlushAutoExecBufferDeferred();
    end;
    local v25 = v19.Commands[v20.Name:lower()];
    if v25 and v25.Aliases then
        for _, v27 in pairs(v25.Aliases) do
            v19.Commands[v27:lower()] = nil;
        end;
    elseif not v25 then
        table.insert(v19.CommandsArray, v20);
    end;
    v19.Commands[v20.Name:lower()] = v20;
    if v20.Aliases then
        for _, v29 in pairs(v20.Aliases) do
            v19.Commands[v29:lower()] = v20;
        end;
    end;
end;
v18.RegisterCommand = function(v30, v31, v32, v33) --[[ Line: 336 ]] --[[ Name: RegisterCommand ]]
    -- upvalues: l_RunService_0 (copy)
    local v34 = require(v31);
    assert(typeof(v34) == "table", (("[Cmdr] Invalid return value from command script \"%*\" (CommandDefinition expected, got %*)"):format(v31.Name, (typeof(v34)))));
    if v32 then
        assert(l_RunService_0:IsServer(), "[Cmdr] The commandServerScript parameter is not valid for client usage.");
        v34.Run = require(v32);
    end;
    if v33 and not v33(v34) then
        return;
    else
        v30:RegisterCommandObject(v34);
        v31.Parent = v30.Cmdr.ReplicatedRoot.Commands;
        return;
    end;
end;
v18.RegisterCommandsIn = function(v35, v36, v37) --[[ Line: 371 ]] --[[ Name: RegisterCommandsIn ]]
    local v38 = {};
    local v39 = {};
    for _, v41 in pairs(v36:GetChildren()) do
        if v41:IsA("ModuleScript") then
            if not v41.Name:find("Server") then
                local l_v36_FirstChild_0 = v36:FindFirstChild(v41.Name .. "Server");
                if l_v36_FirstChild_0 then
                    v39[l_v36_FirstChild_0] = true;
                end;
                v35:RegisterCommand(v41, l_v36_FirstChild_0, v37);
            else
                v38[v41] = true;
            end;
        else
            v35:RegisterCommandsIn(v41, v37);
        end;
    end;
    for v43 in pairs(v38) do
        if not v39[v43] then
            warn((("[Cmdr] Command script %* was skipped because it has 'Server' in its name, and has no equivalent shared script."):format(v43.Name)));
        end;
    end;
end;
v18.RegisterDefaultCommands = function(v44, v45) --[[ Line: 415 ]] --[[ Name: RegisterDefaultCommands ]]
    -- upvalues: l_RunService_0 (copy), v1 (copy)
    assert(l_RunService_0:IsServer(), "[Cmdr] RegisterDefaultCommands cannot be called from the client.");
    local v46 = if type(v45) == "table" then v1.MakeDictionary(v45) else nil;
    v44:RegisterCommandsIn(v44.Cmdr.DefaultCommandsFolder, v46 ~= nil and function(v47) --[[ Line: 420 ]]
        -- upvalues: v46 (copy)
        return v46[v47.Group] or false;
    end or v45);
end;
v18.GetCommand = function(v48, v49) --[[ Line: 430 ]] --[[ Name: GetCommand ]]
    v49 = v49 or "";
    return v48.Commands[v49:lower()];
end;
v18.GetCommands = function(v50) --[[ Line: 440 ]] --[[ Name: GetCommands ]]
    return v50.CommandsArray;
end;
v18.GetCommandNames = function(v51) --[[ Line: 448 ]] --[[ Name: GetCommandNames ]]
    local v52 = {};
    for _, v54 in pairs(v51.CommandsArray) do
        table.insert(v52, v54.Name);
    end;
    return v52;
end;
v18.GetCommandsAsStrings = v18.GetCommandNames;
v18.GetTypeNames = function(v55) --[[ Line: 469 ]] --[[ Name: GetTypeNames ]]
    local v56 = {};
    for v57 in pairs(v55.Types) do
        table.insert(v56, v57);
    end;
    return v56;
end;
v18.GetType = function(v58, v59) --[[ Line: 484 ]] --[[ Name: GetType ]]
    return v58.Types[v59];
end;
v18.GetTypeName = function(v60, v61) --[[ Line: 493 ]] --[[ Name: GetTypeName ]]
    return v60.TypeAliases[v61] or v61;
end;
v18.RegisterHook = function(v62, v63, v64, v65) --[[ Line: 507 ]] --[[ Name: RegisterHook ]]
    if not v62.Hooks[v63] then
        error(("[Cmdr] Invalid hook name: %q"):format(v63), 2);
    end;
    table.insert(v62.Hooks[v63], {
        callback = v64, 
        priority = v65 or 0
    });
    table.sort(v62.Hooks[v63], function(v66, v67) --[[ Line: 513 ]]
        return v66.priority < v67.priority;
    end);
end;
v18.AddHook = v18.RegisterHook;
v18.GetStore = function(v68, v69) --[[ Line: 534 ]] --[[ Name: GetStore ]]
    return v68.Stores[v69];
end;
v18.FlushAutoExecBufferDeferred = function(v70) --[[ Line: 543 ]] --[[ Name: FlushAutoExecBufferDeferred ]]
    -- upvalues: l_RunService_0 (copy)
    if v70.AutoExecFlushConnection then
        return;
    else
        v70.AutoExecFlushConnection = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 548 ]]
            -- upvalues: v70 (copy)
            v70.AutoExecFlushConnection:Disconnect();
            v70.AutoExecFlushConnection = nil;
            v70:FlushAutoExecBuffer();
        end);
        return;
    end;
end;
v18.FlushAutoExecBuffer = function(v71) --[[ Line: 560 ]] --[[ Name: FlushAutoExecBuffer ]]
    for _, v73 in ipairs(v71.AutoExecBuffer) do
        for _, v75 in ipairs(v73) do
            v71.Cmdr.Dispatcher:EvaluateAndRun(v75);
        end;
    end;
    v71.AutoExecBuffer = {};
end;
return function(v76) --[[ Line: 570 ]]
    -- upvalues: v18 (copy)
    v18.Cmdr = v76;
    return v18;
end;