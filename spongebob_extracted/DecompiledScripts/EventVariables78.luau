local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v4 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = l_RunService_0:IsStudio();
local _ = v4:IsTestBranch();
local v7 = {
    EventName = "SearchForSquarePants", 
    EventDisplayName = "Search For SquarePants", 
    ShowEventButton = true, 
    EventUIName = "SearchForSquarePantsEvent", 
    Currency = "Swashbucks", 
    CurrencyBoostName = nil, 
    TimeForFreeCrate = nil, 
    Shop = {
        {
            type = "Inventory", 
            name = "SwashbucklerCrate", 
            amount = 1, 
            cost = {
                currency = "Swashbucks", 
                amount = 150
            }
        }
    }, 
    EVENT_START = v3:GetForCT({
        Year = 2025, 
        Month = 12, 
        Day = 12, 
        Hour = 10, 
        Minute = 0, 
        Second = 0
    }), 
    EVENT_END = v3:GetForCT({
        Year = 2025, 
        Month = 12, 
        Day = 31, 
        Hour = 23, 
        Minute = 59, 
        Second = 0
    })
};
v7.IsActive = function(v8) --[[ Line: 76 ]] --[[ Name: IsActive ]]
    -- upvalues: v7 (copy)
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    if l_workspace_ServerTimeNow_0 < v8.EVENT_START then
        return false, v7.EventName;
    elseif v8.EVENT_END <= l_workspace_ServerTimeNow_0 then
        return false, v7.EventName;
    else
        return true, v7.EventName;
    end;
end;
return v7;