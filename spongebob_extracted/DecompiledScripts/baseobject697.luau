local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Signal);
local v2 = require(script.Parent.Symbol);
local v3 = require(script.Parent.Janitor);
local _ = require(script.Parent.Promise);
local v5 = v2("Id");
local v6 = v2("Janitor");
local v7 = v2("Signals");
local v8 = v2("SignalMarker");
local v9 = l_RunService_0:IsServer() and 0 or 1;
local v10 = setmetatable({}, {
    __mode = "v"
});
local v11 = setmetatable({}, {
    __mode = "k"
});
local function v13(v12, ...) --[[ Line: 89 ]] --[[ Name: errorDestroyed ]]
    -- upvalues: v11 (copy)
    warn((("Attempted to perform operation on a destroyed Object!\n%*\n Destruction Traceback:\n%*"):format(debug.traceback(" Operation Traceback:", 2), v11[v12])));
end;
local v14 = {
    __index = v13, 
    __newindex = v13, 
    __call = v13, 
    __concat = v13, 
    __unm = v13, 
    __add = v13, 
    __mul = v13, 
    __sub = v13, 
    __div = v13, 
    __mod = v13, 
    __pow = v13, 
    __eq = v13, 
    __lt = v13, 
    __le = v13, 
    __len = v13
};
local v15 = {
    ClassName = "BaseObject", 
    _DEBUG = false
};
v15.__index = v15;
v15.__call = function(v16, ...) --[[ Line: 120 ]]
    return v16.new(...);
end;
v15.getObjectFromId = function(v17) --[[ Line: 150 ]] --[[ Name: getObjectFromId ]]
    -- upvalues: v10 (copy)
    return v10[v17];
end;
v15.isDestroyed = function(v18) --[[ Line: 169 ]] --[[ Name: isDestroyed ]]
    return v18.IsDestroyed == true;
end;
v15.new = function(v19) --[[ Line: 217 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v7 (copy), v6 (copy), v3 (copy), v5 (copy), v9 (ref), v10 (copy)
    local v20 = true;
    if typeof(v19) ~= "table" then
        v20 = v19 == nil;
    end;
    assert(v20, "Argument 1 must be a table or nil");
    local v21 = setmetatable(v19 or {}, v15);
    v21[v7] = nil;
    v21[v6] = v3.new();
    v21[v5] = v9;
    v10[v21[v5]] = v21;
    v9 = v9 + 2;
    v21.IsDestroyed = nil;
    return v21;
end;
v15.Destroy = function(v22) --[[ Line: 250 ]] --[[ Name: Destroy ]]
    -- upvalues: v15 (copy), v5 (copy), v6 (copy), v14 (copy), v11 (copy)
    if v22.IsDestroyed then
        return;
    else
        v22.IsDestroyed = true;
        local l_ClassName_0 = v22.ClassName;
        v22.Destroy = function() --[[ Line: 257 ]]
            -- upvalues: v15 (ref), l_ClassName_0 (copy), v22 (copy), v5 (ref)
            if v15._DEBUG then
                warn((("Attempted to destroy an already destroyed object! %*[%*]"):format(l_ClassName_0, v22[v5])));
            end;
        end;
        if v22:HasSignal("Destroyed") then
            v22:GetSignal("Destroyed"):Fire();
        end;
        v22[v6]:Destroy();
        setmetatable(v22, v14);
        v11[v22] = debug.traceback();
        return;
    end;
end;
v15.GetId = function(v24) --[[ Line: 282 ]] --[[ Name: GetId ]]
    -- upvalues: v5 (copy)
    return v24[v5];
end;
v15.IsA = function(v25, v26) --[[ Line: 290 ]] --[[ Name: IsA ]]
    local l_v25_0 = v25;
    while true do
        if l_v25_0 then
            l_v25_0 = getmetatable(l_v25_0);
            if l_v25_0 == v26 or l_v25_0 and l_v25_0.ClassName == v26 then
                return true;
            end;
        else
            return false;
        end;
    end;
end;
v15.GetTask = function(v28, v29) --[[ Line: 322 ]] --[[ Name: GetTask ]]
    -- upvalues: v6 (copy)
    return (v28[v6]:Get(v29));
end;
v15.AddTask = function(v30, v31, v32, v33) --[[ Line: 347 ]] --[[ Name: AddTask ]]
    -- upvalues: v6 (copy)
    return v30[v6]:Add(v31, v32, v33);
end;
v15.GiveTask = v15.AddTask;
v15.AddPromise = function(v34, v35) --[[ Line: 369 ]] --[[ Name: AddPromise ]]
    -- upvalues: v6 (copy)
    v34[v6]:AddPromise(v35);
    return v35;
end;
v15.GivePromise = v15.AddPromise;
v15.RemoveTask = function(v36, v37, v38) --[[ Line: 392 ]] --[[ Name: RemoveTask ]]
    -- upvalues: v6 (copy)
    if v38 then
        return v36:RemoveTaskNoClean(v37);
    else
        return v36[v6]:Remove(v37);
    end;
end;
v15.RemoveTaskNoClean = function(v39, v40) --[[ Line: 413 ]] --[[ Name: RemoveTaskNoClean ]]
    -- upvalues: v6 (copy)
    return v39[v6]:RemoveNoClean(v40);
end;
v15.FireSignal = function(v41, v42, ...) --[[ Line: 439 ]] --[[ Name: FireSignal ]]
    -- upvalues: v7 (copy)
    if v41[v7] and typeof(v41[v7][v42]) == "table" then
        v41[v7][v42]:Fire(...);
    end;
end;
v15.RegisterSignal = function(v43, v44) --[[ Line: 452 ]] --[[ Name: RegisterSignal ]]
    -- upvalues: v7 (copy), v8 (copy)
    if not v43[v7] then
        v43[v7] = {};
    end;
    if v43[v7][v44] then
        warn(("Signal name '%*' already registered on "):format(v44), v43);
        return;
    else
        v43[v7][v44] = v8;
        return;
    end;
end;
v15.HasSignal = function(v45, v46) --[[ Line: 480 ]] --[[ Name: HasSignal ]]
    -- upvalues: v7 (copy)
    if v45[v7] then
        return v45[v7][v46] ~= nil;
    else
        return false;
    end;
end;
v15.GetSignal = function(v47, v48) --[[ Line: 489 ]] --[[ Name: GetSignal ]]
    -- upvalues: v7 (copy), v8 (copy), v1 (copy)
    local v49 = v47[v7];
    if not v49 or not v49[v48] then
        warn((("Signal name '%*' not pre-registered. Please Register before fetching on %*"):format(v48, v47.ClassName)));
        v47:RegisterSignal(v48);
    end;
    if v49[v48] == v8 then
        v49[v48] = v47:AddTask(v1.new());
    end;
    return v49[v48];
end;
v15.ConnectSignal = function(v50, v51, v52) --[[ Line: 510 ]] --[[ Name: ConnectSignal ]]
    return v50:GetSignal(v51):Connect(v52);
end;
v15.GetDestroyedSignal = function(v53) --[[ Line: 528 ]] --[[ Name: GetDestroyedSignal ]]
    if not v53:HasSignal("Destroyed") then
        v53:RegisterSignal("Destroyed");
    end;
    return v53:GetSignal("Destroyed");
end;
v15.BindToInstance = function(v54, v55, v56) --[[ Line: 568 ]] --[[ Name: BindToInstance ]]
    local v57 = {};
    local function v60() --[[ Line: 570 ]] --[[ Name: CleanConnections ]]
        -- upvalues: v57 (copy)
        for _, v59 in ipairs(v57) do
            v59:Disconnect();
        end;
    end;
    table.insert(v57, v54:GetDestroyedSignal():Once(function() --[[ Line: 576 ]]
        -- upvalues: v55 (copy)
        pcall(v55.Destroy, v55);
    end));
    table.insert(v57, v54:AddTask(v55.Destroying:Once(function() --[[ Line: 580 ]]
        -- upvalues: v54 (copy)
        if not v54.IsDestroyed then
            v54:Destroy();
        end;
    end)));
    if v56 then
        table.insert(v57, v54:AddTask(v55.AncestryChanged:Connect(function(_, v62) --[[ Line: 587 ]]
            -- upvalues: v54 (copy)
            if not v62 then
                v54:Destroy();
            end;
        end)));
    end;
    return v60;
end;
return v15;