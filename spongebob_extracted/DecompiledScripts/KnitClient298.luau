local v0 = {
    ServicePromises = true, 
    Middleware = nil, 
    PerServiceMiddleware = {}
};
local v1 = nil;
local v2 = {
    Player = game:GetService("Players").LocalPlayer, 
    Util = script.Parent.Parent
};
local v3 = require(v2.Util.Promise);
local l_ClientComm_0 = require(v2.Util.Comm).ClientComm;
local v5 = {};
local v6 = {};
local v7 = nil;
local v8 = false;
local v9 = false;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local function _(v11) --[[ Line: 127 ]] --[[ Name: DoesControllerExist ]]
    -- upvalues: v5 (copy)
    return v5[v11] ~= nil;
end;
local function _() --[[ Line: 133 ]] --[[ Name: GetServicesFolder ]]
    -- upvalues: v7 (ref)
    if not v7 then
        v7 = script.Parent:WaitForChild("Services");
    end;
    return v7;
end;
local function _(v14) --[[ Line: 141 ]] --[[ Name: GetMiddlewareForService ]]
    -- upvalues: v1 (ref)
    local v15 = if v1.Middleware ~= nil then v1.Middleware else {};
    local v16 = v1.PerServiceMiddleware[v14];
    if v16 ~= nil then
        return v16;
    else
        return v15;
    end;
end;
local function _(v18) --[[ Line: 148 ]] --[[ Name: BuildService ]]
    -- upvalues: v7 (ref), v1 (ref), l_ClientComm_0 (copy), v6 (copy)
    if not v7 then
        v7 = script.Parent:WaitForChild("Services");
    end;
    local l_v7_0 = v7;
    local v20 = if v1.Middleware ~= nil then v1.Middleware else {};
    local v21 = v1.PerServiceMiddleware[v18];
    local v22 = if v21 ~= nil then v21 else v20;
    v21 = l_ClientComm_0.new(l_v7_0, v1.ServicePromises, v18):BuildObject(v22.Inbound, v22.Outbound);
    v6[v18] = v21;
    return v21;
end;
v2.CreateController = function(v24) --[[ Line: 180 ]] --[[ Name: CreateController ]]
    -- upvalues: v5 (copy), v8 (ref)
    assert(type(v24) == "table", (("Controller must be a table; got %*"):format((type(v24)))));
    assert(type(v24.Name) == "string", (("Controller.Name must be a string; got %*"):format((type(v24.Name)))));
    assert(#v24.Name > 0, "Controller.Name must be a non-empty string");
    assert(not (v5[v24.Name] ~= nil), (("Controller %* already exists"):format(v24.Name)));
    assert(not v8, "Controllers cannot be created after calling \"Knit.Start()\"");
    v5[v24.Name] = v24;
    return v24;
end;
v2.AddControllers = function(v25) --[[ Line: 200 ]] --[[ Name: AddControllers ]]
    -- upvalues: v8 (ref)
    assert(not v8, "Controllers cannot be added after calling \"Knit.Start()\"");
    local v26 = {};
    for _, v28 in v25:GetChildren() do
        if v28:IsA("ModuleScript") then
            table.insert(v26, require(v28));
        end;
    end;
    return v26;
end;
v2.AddControllersDeep = function(v29) --[[ Line: 218 ]] --[[ Name: AddControllersDeep ]]
    -- upvalues: v8 (ref)
    assert(not v8, "Controllers cannot be added after calling \"Knit.Start()\"");
    local v30 = {};
    for _, v32 in v29:GetDescendants() do
        if v32:IsA("ModuleScript") then
            table.insert(v30, require(v32));
        end;
    end;
    return v30;
end;
v2.GetService = function(v33) --[[ Line: 285 ]] --[[ Name: GetService ]]
    -- upvalues: v6 (copy), v8 (ref), v7 (ref), v1 (ref), l_ClientComm_0 (copy)
    local v34 = v6[v33];
    if v34 then
        return v34;
    else
        assert(v8, "Cannot call GetService until Knit has been started");
        assert(type(v33) == "string", (("ServiceName must be a string; got %*"):format((type(v33)))));
        if not v7 then
            v7 = script.Parent:WaitForChild("Services");
        end;
        local l_v7_1 = v7;
        local v36 = if v1.Middleware ~= nil then v1.Middleware else {};
        local v37 = v1.PerServiceMiddleware[v33];
        local v38 = if v37 ~= nil then v37 else v36;
        v37 = l_ClientComm_0.new(l_v7_1, v1.ServicePromises, v33):BuildObject(v38.Inbound, v38.Outbound);
        v6[v33] = v37;
        return v37;
    end;
end;
v2.GetController = function(v39) --[[ Line: 301 ]] --[[ Name: GetController ]]
    -- upvalues: v5 (copy), v8 (ref)
    local v40 = v5[v39];
    if v40 then
        return v40;
    else
        assert(v8, "Cannot call GetController until Knit has been started");
        assert(type(v39) == "string", (("ControllerName must be a string; got %*"):format((type(v39)))));
        error(("Could not find controller \"%*\". Check to verify a controller with this name exists."):format(v39), 2);
        return;
    end;
end;
v2.GetControllers = function() --[[ Line: 315 ]] --[[ Name: GetControllers ]]
    -- upvalues: v8 (ref), v5 (copy)
    assert(v8, "Cannot call GetControllers until Knit has been started");
    return v5;
end;
v2.Start = function(v41) --[[ Line: 338 ]] --[[ Name: Start ]]
    -- upvalues: v8 (ref), v3 (copy), v5 (copy), v1 (ref), v0 (copy), v9 (ref), l_BindableEvent_0 (copy)
    if v8 then
        return v3.reject("Knit already started");
    else
        v8 = true;
        table.freeze(v5);
        if v41 == nil then
            v1 = v0;
        else
            assert(typeof(v41) == "table", (("KnitOptions should be a table or nil; got %*"):format((typeof(v41)))));
            v1 = v41;
            for v42, v43 in v0 do
                if v1[v42] == nil then
                    v1[v42] = v43;
                end;
            end;
        end;
        if type(v1.PerServiceMiddleware) ~= "table" then
            v1.PerServiceMiddleware = {};
        end;
        return v3.new(function(v44) --[[ Line: 362 ]]
            -- upvalues: v5 (ref), v3 (ref)
            local v45 = {};
            for _, v47 in v5 do
                if type(v47.KnitInit) == "function" then
                    table.insert(v45, v3.new(function(v48) --[[ Line: 370 ]]
                        -- upvalues: v47 (copy)
                        debug.setmemorycategory(v47.Name);
                        v47:KnitInit();
                        v48();
                    end));
                end;
            end;
            v44(v3.all(v45));
        end):andThen(function() --[[ Line: 380 ]]
            -- upvalues: v5 (ref), v9 (ref), l_BindableEvent_0 (ref)
            for _, v50 in v5 do
                if type(v50.KnitStart) == "function" then
                    task.spawn(function() --[[ Line: 384 ]]
                        -- upvalues: v50 (copy)
                        debug.setmemorycategory(v50.Name);
                        v50:KnitStart();
                    end);
                end;
            end;
            v9 = true;
            l_BindableEvent_0:Fire();
            task.defer(function() --[[ Line: 394 ]]
                -- upvalues: l_BindableEvent_0 (ref)
                l_BindableEvent_0:Destroy();
            end);
        end);
    end;
end;
v2.OnStart = function() --[[ Line: 412 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (ref), v3 (copy), l_BindableEvent_0 (copy)
    if v9 then
        return v3.resolve();
    else
        return v3.fromEvent(l_BindableEvent_0.Event);
    end;
end;
return v2;