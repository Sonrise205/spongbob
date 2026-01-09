local v0 = {};
local v1 = nil;
local function v4(v2, ...) --[[ Line: 41 ]] --[[ Name: AcquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v1 (ref)
    local l_v1_0 = v1;
    v1 = nil;
    v2(...);
    v1 = l_v1_0;
end;
local function v5(...) --[[ Line: 49 ]] --[[ Name: RunEventHandlerInFreeThread ]]
    -- upvalues: v4 (copy)
    v4(...);
    while true do
        v4(coroutine.yield());
    end;
end;
local function v7(v6, ...) --[[ Line: 56 ]] --[[ Name: CleanupTask ]]
    if type(v6) == "function" then
        v6(...);
        return;
    elseif typeof(v6) == "RBXScriptConnection" then
        v6:Disconnect();
        return;
    elseif typeof(v6) == "Instance" then
        v6:Destroy();
        return;
    else
        if type(v6) == "table" then
            if type(v6.Destroy) == "function" then
                v6:Destroy();
                return;
            elseif type(v6.Disconnect) == "function" then
                v6:Disconnect();
            end;
        end;
        return;
    end;
end;
local function v8(...) --[[ Line: 72 ]] --[[ Name: PerformCleanupTask ]]
    -- upvalues: v1 (ref), v5 (copy), v7 (copy)
    if not v1 then
        v1 = coroutine.create(v5);
    end;
    task.spawn(v1, v7, ...);
end;
local v9 = {};
v9.__index = v9;
v9.AddCleanupTask = function(v10, v11) --[[ Line: 89 ]] --[[ Name: AddCleanupTask ]]
    -- upvalues: v8 (copy)
    if v10._is_cleaned == true then
        v8(v11);
        return function() --[[ Line: 92 ]]

        end;
    else
        if type(v11) == "function" or typeof(v11) == "RBXScriptConnection" or typeof(v11) == "Instance" then
            table.insert(v10._cleanup_tasks, v11);
        elseif type(v11) == "table" then
            if type(v11.Destroy) == "function" or type(v11.Disconnect) == "function" then
                table.insert(v10._cleanup_tasks, v11);
            else
                error("[MadworkMaid]: Received object table as cleanup task, but couldn't detect a :Destroy() method");
            end;
        else
            error("[MadworkMaid]: Cleanup task of type \"" .. typeof(v11) .. "\" not supported");
        end;
        return function(...) --[[ Line: 107 ]]
            -- upvalues: v10 (copy), v11 (copy), v8 (ref)
            v10:RemoveCleanupTask(v11);
            v8(v11, ...);
        end;
    end;
end;
v9.RemoveCleanupTask = function(v12, v13) --[[ Line: 113 ]] --[[ Name: RemoveCleanupTask ]]
    local l__cleanup_tasks_0 = v12._cleanup_tasks;
    local v15 = table.find(l__cleanup_tasks_0, v13);
    if v15 ~= nil then
        table.remove(l__cleanup_tasks_0, v15);
    end;
end;
v9.CleanupOfOne = function(v16, v17, ...) --[[ Line: 121 ]] --[[ Name: CleanupOfOne ]]
    -- upvalues: v8 (copy)
    v16:RemoveCleanupTask(v17);
    v8(v17, ...);
end;
v9.Cleanup = function(v18, ...) --[[ Line: 126 ]] --[[ Name: Cleanup ]]
    -- upvalues: v8 (copy)
    for _, v20 in ipairs(v18._cleanup_tasks) do
        v8(v20, ...);
    end;
    v18._cleanup_tasks = {};
    v18._is_cleaned = true;
end;
v0.NewMaid = function() --[[ Line: 136 ]] --[[ Name: NewMaid ]]
    -- upvalues: v9 (copy)
    local v21 = {
        _cleanup_tasks = {}, 
        _is_cleaned = false
    };
    setmetatable(v21, v9);
    return v21;
end;
v0.Cleanup = v8;
return v0;