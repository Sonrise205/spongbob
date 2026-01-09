local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedFirst_0.PlaceIds);
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = v4.CreateController({
    Name = script.Name, 
    EventStarted = v6.new(), 
    EventEnded = v6.new(), 
    _eventActive = true, 
    _timerSubscriptions = {}
});
v19.KnitInit = function(_) --[[ Line: 51 ]] --[[ Name: KnitInit ]]
    -- upvalues: v14 (ref), v4 (copy), v16 (ref), v15 (ref)
    v14 = v4.GetController("DataController");
    v16 = v4.GetController("UIController");
    v15 = v4.GetService("EventService");
end;
v19.KnitStart = function(v21) --[[ Line: 58 ]] --[[ Name: KnitStart ]]
    -- upvalues: v13 (copy), v17 (ref), v16 (ref), v18 (ref), v9 (copy), v11 (copy), v15 (ref)
    if v13:GetDestination() ~= "AFK" then
        v17 = v16:GetModuleAsync("HUD"):expect();
        v18 = v16:GetModuleAsync("Notification"):expect();
    end;
    local l_UnixTimestamp_0 = v9.EVENT_START.UnixTimestamp;
    local l_UnixTimestamp_1 = v9.EVENT_END.UnixTimestamp;
    local function v29(v24, v25) --[[ Line: 67 ]] --[[ Name: notifySubscribers ]]
        -- upvalues: l_UnixTimestamp_0 (copy), l_UnixTimestamp_1 (copy), v21 (copy)
        local v26 = v25 and l_UnixTimestamp_0 or l_UnixTimestamp_1;
        for v27, v28 in v21._timerSubscriptions do
            if typeof(v28) ~= "function" then
                v21._timerSubscriptions[v27] = nil;
            else
                task.spawn(v28, v24, v26, v25);
            end;
        end;
    end;
    v21.EventEnded:Connect(function() --[[ Line: 81 ]]
        -- upvalues: v21 (copy), v17 (ref), v9 (ref), v16 (ref), v29 (copy)
        v21._eventActive = false;
        if v17 then
            local v30 = false;
            if v9.Currency ~= "" then
                v30 = v9.Currency ~= nil;
            end;
            if v17 and v17.currencyBar and v17.currencyBar:FindFirstChild("EventCurrency") then
                v17.currencyBar.EventCurrency.Visible = v21:IsActive() and v30;
            end;
        end;
        if v9.EventUIName then
            v16:Toggle(v9.EventUIName, false);
        end;
        v29(0, false);
        table.clear(v21._timerSubscriptions);
    end);
    v21.EventStarted:Connect(function() --[[ Line: 106 ]]
        -- upvalues: v21 (copy), l_UnixTimestamp_1 (copy), v29 (copy), v11 (ref)
        v21._eventActive = true;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v32 = nil;
        local function v33() --[[ Line: 112 ]] --[[ Name: eventEnded ]]
            -- upvalues: v32 (ref), v21 (ref), v33 (ref)
            if v32 then
                v32:Disconnect();
                v32 = nil;
            end;
            v21.EventEnded:Fire();
            v33 = nil;
        end;
        if l_UnixTimestamp_1 <= l_workspace_ServerTimeNow_0 then
            v33();
            return;
        else
            local v34 = l_UnixTimestamp_1 - l_workspace_ServerTimeNow_0;
            v29(v34, false);
            v32 = v11.Simple(1, function() --[[ Line: 131 ]]
                -- upvalues: v34 (ref), v29 (ref), v33 (ref)
                v34 = v34 - 1;
                v29(v34, false);
                if v34 < 1 then
                    v33();
                end;
            end);
            return;
        end;
    end);
    v15.EndEvent:Connect(function() --[[ Line: 141 ]]
        -- upvalues: v21 (copy)
        v21.EventEnded:Fire();
    end);
    local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
    if l_UnixTimestamp_0 <= l_workspace_ServerTimeNow_1 and l_workspace_ServerTimeNow_1 < l_UnixTimestamp_1 then
        v21.EventStarted:Fire();
        return;
    elseif l_UnixTimestamp_1 <= l_workspace_ServerTimeNow_1 then
        v21.EventEnded:Fire();
        return;
    else
        v21._eventActive = false;
        local v36 = l_UnixTimestamp_0 - l_workspace_ServerTimeNow_1;
        v29(v36, true);
        local v37 = nil;
        v37 = v11.Simple(1, function() --[[ Line: 164 ]]
            -- upvalues: v36 (ref), v29 (copy), v37 (ref), v21 (copy)
            v36 = v36 - 1;
            v29(v36, true);
            if v36 < 1 then
                v37:Disconnect();
                v37 = nil;
                v21.EventStarted:Fire();
            end;
        end);
        return;
    end;
end;
v19.IsActive = function(v38, v39) --[[ Line: 178 ]] --[[ Name: IsActive ]]
    local l_v38_EventName_0 = v38:GetEventName();
    if l_v38_EventName_0 and v39 and l_v38_EventName_0 ~= v39 then
        return false;
    else
        return v38._eventActive;
    end;
end;
v19.GetEventName = function(_) --[[ Line: 188 ]] --[[ Name: GetEventName ]]
    -- upvalues: v9 (copy)
    return v9.EventName;
end;
v19.ObserveTimeLeft = function(v42, v43, v44) --[[ Line: 192 ]] --[[ Name: ObserveTimeLeft ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy)
    v8:Assert(typeof(v43) == "function", (("[%*]:ObserveTimeLeft expects a function!"):format(script.Name)));
    local v45 = l_HttpService_0:GenerateGUID(false);
    v42._timerSubscriptions[v45] = v43;
    return function() --[[ Line: 199 ]]
        -- upvalues: v44 (ref), v42 (copy), v45 (ref)
        if v44 and typeof(v44) == "function" then
            task.spawn(v44);
            v44 = nil;
        end;
        v42._timerSubscriptions[v45] = nil;
        v45 = nil;
    end;
end;
v19.GetTimestamps = function(_) --[[ Line: 210 ]] --[[ Name: GetTimestamps ]]
    -- upvalues: v9 (copy)
    return v9.EVENT_START, v9.EVENT_END;
end;
return v19;