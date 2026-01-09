local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("HttpService");
local _ = game:GetService("RunService");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Packages.BaseObject);
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ServerStorage_0.Knit.Modules.IceSpiceEventServer_Config);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = setmetatable({}, v5);
v12.ClassName = "IceSpiceEvent_Server";
v12.__index = v12;
v12.TimedEvents = v7;
v12.new = function(v13) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v12 (copy)
    local v14 = setmetatable(v5.new(), v12);
    v14.Name = v13.Name;
    v14.StartTime = v13.StartTime;
    v14.Duration = v13.Duration;
    v14.Scope = v13.Scope;
    v14.WorldAssets = v13.WorldAssets;
    v14.WorldContainer = v13.WorldContainer;
    v14.Multiplier = v13.ExtraData and v13.ExtraData.Multiplier or 2;
    v14.TimedEventsCache = {};
    return v14;
end;
v12.Init = function(_) --[[ Line: 54 ]] --[[ Name: Init ]]
    -- upvalues: v8 (ref), v6 (copy), v9 (ref), v10 (ref), v11 (ref)
    v8 = v6.GetService("DataService");
    v9 = v6.GetService("RewardService");
    v10 = v6.GetService("RepeatEventService");
    v11 = v6.GetService("NotificationService");
end;
v12.Start = function(_) --[[ Line: 61 ]] --[[ Name: Start ]]

end;
v12.Increment = function(_) --[[ Line: 64 ]] --[[ Name: Increment ]]

end;
v12.Stop = function(_) --[[ Line: 68 ]] --[[ Name: Stop ]]

end;
v12.Destroy = function(v19) --[[ Line: 71 ]] --[[ Name: Destroy ]]
    -- upvalues: v5 (copy)
    v5.Destroy(v19);
end;
v12._ProcessTimelineEvent = function(_, _) --[[ Line: 75 ]] --[[ Name: _ProcessTimelineEvent ]]

end;
v12.Notify = function(_, v23, v24) --[[ Line: 79 ]] --[[ Name: Notify ]]
    -- upvalues: v11 (ref)
    v11:NotifyAll({
        message = v23, 
        duration = v24 or 12, 
        isAdminAnnouncement = true
    });
end;
v12.GiveIceSpiceUnit = function(_, v26, v27) --[[ Line: 87 ]] --[[ Name: GiveIceSpiceUnit ]]
    -- upvalues: v6 (copy), l_ReplicatedStorage_0 (copy), v8 (ref), v11 (ref)
    local v28 = v6.GetService("UnitService");
    local v29 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
    local v30 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
    v27 = v27 or {};
    if v27.Shiny == nil then
        v27.Shiny = false;
    end;
    if v27.Mega == nil and v27.Wumbo == nil then
        v27.Mega = false;
    end;
    if v27.Wumbo ~= nil then
        v27.Mega = v27.Wumbo;
        v27.Wumbo = nil;
    end;
    local v31 = {};
    table.insert(v31, {
        UnitName = "IceSpice", 
        ExtraData = v27
    });
    local v32 = {
        {
            type = "Unit", 
            weight = v26
        }
    };
    if v26 < 100 then
        table.insert(v32, {
            type = "Nothing", 
            weight = 100 - v26
        });
    end;
    local l_UnitName_0 = v31[1].UnitName;
    local v34 = v29:GetUnitValue(l_UnitName_0, "FullName") or l_UnitName_0;
    local l_ExtraData_0 = v31[1].ExtraData;
    local v36 = "";
    if l_ExtraData_0.Level and l_ExtraData_0.Level > 1 then
        v36 = v36 .. ("LVL %* "):format(l_ExtraData_0.Level);
    end;
    if l_ExtraData_0.Shiny and not l_ExtraData_0.Mega then
        v36 = v36 .. "Shiny ";
    elseif l_ExtraData_0.Mega and not l_ExtraData_0.Shiny then
        v36 = v36 .. "Wumbo ";
    elseif l_ExtraData_0.Mega and l_ExtraData_0.Shiny then
        v36 = v36 .. "SW ";
    end;
    if l_ExtraData_0.Stars and l_ExtraData_0.Stars > 0 then
        v36 = v36 .. ("%*-Star "):format(l_ExtraData_0.Stars);
    end;
    if l_ExtraData_0.Trait and l_ExtraData_0.Trait2 then
        v36 = v36 .. "NC";
    elseif l_ExtraData_0.Trait then
        v36 = v36 .. ("%* "):format(l_ExtraData_0.Trait.Name);
    end;
    v8:IterateLoadedPlayers(function(v37) --[[ Line: 153 ]]
        -- upvalues: v30 (copy), v32 (copy), v11 (ref), v31 (copy), v36 (ref), v34 (copy), v28 (copy)
        if v30:RollLoot(v32).type == "Nothing" then
            v11:Notify(v37, {
                isNegative = true, 
                message = ("Womp..Womp! You're not very lucky and just missed out on x%* %*%*!"):format(#v31, v36, v34), 
                duration = 8
            });
            return;
        else
            v11:Notify(v37, {
                isPositive = true, 
                message = ("Wow! You're super lucky and just recieved x%* %*%*!"):format(#v31, v36, v34), 
                duration = 8
            });
            v28:Create(v37, v31);
            return;
        end;
    end);
end;
v12.GivePlayersItem = function(_, v39, v40) --[[ Line: 175 ]] --[[ Name: GivePlayersItem ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v8 (ref), v11 (ref), v9 (ref)
    local v41 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
    local v42 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
    local v43 = v40.amount or 1;
    local l_name_0 = v40.name;
    if not l_name_0 or not v39 then
        return;
    else
        local l_v42_ByItemName_0 = v42:GetByItemName(l_name_0);
        if not l_v42_ByItemName_0 then
            return;
        else
            local v46 = l_v42_ByItemName_0.displayName or l_v42_ByItemName_0.DisplayName or l_name_0;
            local v47 = {
                {
                    type = "Item", 
                    weight = v39
                }
            };
            if v39 < 100 then
                table.insert(v47, {
                    type = "Nothing", 
                    weight = 100 - v39
                });
            end;
            v8:IterateLoadedPlayers(function(v48) --[[ Line: 205 ]]
                -- upvalues: v41 (copy), v47 (copy), v11 (ref), v43 (copy), v46 (copy), l_name_0 (copy), v42 (copy), v9 (ref)
                if v41:RollLoot(v47).type == "Nothing" then
                    v11:Notify(v48, {
                        isNegative = true, 
                        message = ("Womp..Womp! You're not very lucky and just missed out on x%* %*!"):format(v43, v46), 
                        duration = 8
                    });
                    return;
                else
                    v11:Notify(v48, {
                        isPositive = true, 
                        message = ("Wow! You're super lucky and just recieved x%* %*!"):format(v43, v46), 
                        duration = 8
                    });
                    local v49 = {
                        name = l_name_0, 
                        amount = v43, 
                        type = "Inventory"
                    };
                    if v42:IsCurrency(l_name_0) == true then
                        v49.type = "Currency";
                    end;
                    v9:Reward(v48, {
                        v49
                    });
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v12.ToggleIceSpiceMusic = function(_, _) --[[ Line: 240 ]] --[[ Name: ToggleIceSpiceMusic ]]

end;
return v12;