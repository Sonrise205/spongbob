local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("AvatarEditorService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v7 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v8 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v11 = nil;
local _ = v7.peek;
local _ = v7.Children;
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
for _, v19 in l_ReplicatedStorage_0.Shared.GlobalEvents:GetChildren() do
    local l_Name_0 = v19.Name;
    local v21 = ("%*_"):format(l_Name_0);
    v16[l_Name_0] = true;
    local l_v19_FirstChild_0 = v19:FindFirstChild((("%*Client"):format(v21)));
    if l_v19_FirstChild_0 then
        v14[l_Name_0] = require(l_v19_FirstChild_0);
    end;
    local l_v19_FirstChild_1 = v19:FindFirstChild((("%*Config"):format(v21)));
    if l_v19_FirstChild_1 then
        v15[l_Name_0] = require(l_v19_FirstChild_1);
    else
        v15[l_Name_0] = {};
    end;
end;
local v24 = v4.CreateController({
    Name = script.Name
});
v24.KnitInit = function(v25) --[[ Line: 64 ]] --[[ Name: KnitInit ]]
    -- upvalues: v11 (ref), v4 (copy), v6 (copy), v16 (copy)
    v11 = v4.GetService("GlobalEventService");
    local v26 = v6.Fusion.scoped();
    v25._scope = v26;
    v25._eventTimers = {};
    for v27 in v16 do
        local v28 = v26:Value(0);
        v25._eventTimers[v27] = v28;
    end;
end;
v24.KnitStart = function(v29) --[[ Line: 80 ]] --[[ Name: KnitStart ]]
    -- upvalues: v14 (copy), v17 (copy), v15 (copy), v6 (copy), v7 (copy), v11 (ref), v8 (copy), l_RunService_0 (copy)
    warn(script.Name, "started");
    local function v45(v30, v31, v32) --[[ Line: 83 ]] --[[ Name: startEvent ]]
        -- upvalues: v29 (copy), v14 (ref), v17 (ref), v15 (ref), v6 (ref), v7 (ref)
        assert(v29._eventTimers[v30] ~= nil, "Event timer not found for: " .. v30);
        local v33 = v14[v30];
        assert(v33 ~= nil, "Event class not found for: " .. v30);
        if v17[v30] ~= nil then
            return;
        else
            local v34 = v15[v30];
            v32 = v32 or v34.DefaultDuration;
            assert(v32 ~= nil, "Event duration not defined for: " .. v30);
            local v35 = {
                Name = v30, 
                Duration = v32, 
                StartTime = v31, 
                Scope = v6.Fusion.scoped()
            };
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            local v37 = math.max(0, v31 + v32 - l_workspace_ServerTimeNow_0);
            local v38 = l_workspace_ServerTimeNow_0 - v31;
            local v39 = v29._eventTimers[v30];
            if v39 then
                v39:set(v37);
            end;
            local v40 = nil;
            if v35.WorldAssets and v35.WorldAssets.Persistent then
                local v41 = v35.WorldAssets.Persistent:Clone();
                v41.Parent = nil;
                v35.WorldAssets.Persistent = v41;
                v40 = v41;
            end;
            v33 = v33.new(v35);
            v17[v30] = v33;
            if v33.GetTimePassed == nil then
                v33.GetTimePassed = function(v42) --[[ Line: 147 ]]
                    return (math.max(0, workspace:GetServerTimeNow() - v42.StartTime));
                end;
            end;
            v33:AddTask(function() --[[ Line: 152 ]]
                -- upvalues: v7 (ref), v33 (ref)
                v7.doCleanup(v33.Scope);
            end);
            if v40 then
                v33:AddTask(v40);
            end;
            v33:Init();
            v33._initialized = true;
            task.spawn(v33.Start, v33);
            v38 = workspace:GetServerTimeNow() - v31;
            if v33.TimedEvents then
                for v43, v44 in v33.TimedEvents do
                    if v38 >= v44.Time then
                        v33.TimedEventsCache[v43] = true;
                        if v44.Time >= v38 or v44.Retroactive then
                            task.spawn(v44.Run, v33, v38);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    v11.Started:Connect(v45);
    v11.Increment:Connect(function(v46, v47) --[[ Line: 187 ]]
        -- upvalues: v29 (copy), v17 (ref)
        assert(v29._eventTimers[v46] ~= nil, "Event timer not found for: " .. v46);
        local v48 = v17[v46];
        assert(v48 ~= nil, "Event not running: " .. v46);
        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
        v48.Duration = v48.Duration + v47;
        local v50 = math.max(0, v48.StartTime + v48.Duration - l_workspace_ServerTimeNow_1);
        local v51 = v29._eventTimers[v46];
        if v51 then
            v51:set(v50);
        end;
    end);
    v11.Stopped:Connect(function(v52) --[[ Line: 203 ]]
        -- upvalues: v29 (copy), v17 (ref), v8 (ref)
        assert(v29._eventTimers[v52] ~= nil, "Event timer not found for: " .. v52);
        local v53 = v17[v52];
        assert(v53 ~= nil, "Event not running: " .. v52);
        v17[v52] = nil;
        v8.try(v53.Stop, v53):andThenCall(v53.Destroy, v53);
        local v54 = v29._eventTimers[v52];
        if v54 then
            v54:set(0);
        end;
    end);
    v11:GetRunningEvents():andThen(function(v55) --[[ Line: 220 ]]
        -- upvalues: v45 (copy)
        for v56, v57 in v55 do
            v45(v56, v57.StartTime, v57.Duration);
        end;
    end);
    l_RunService_0.PreSimulation:Connect(function() --[[ Line: 243 ]]
        -- upvalues: v17 (ref)
        local l_workspace_ServerTimeNow_2 = workspace:GetServerTimeNow();
        for _, v60 in v17 do
            if v60.TimedEvents and v60._initialized then
                local v61 = l_workspace_ServerTimeNow_2 - v60.StartTime;
                for v62, v63 in v60.TimedEvents do
                    if not v60.TimedEventsCache[v62] and v61 >= v63.Time then
                        v60.TimedEventsCache[v62] = true;
                        task.spawn(v63.Run, v60);
                    end;
                end;
            end;
        end;
    end);
end;
return v24;