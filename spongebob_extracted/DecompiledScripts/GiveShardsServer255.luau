local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v4 = nil;
v1.OnStart():andThen(function() --[[ Line: 10 ]]
    -- upvalues: v4 (ref), v1 (copy)
    v4 = v1.GetService("InventoryService");
end);
return function(_, v6, v7) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v4 (ref), v3 (copy)
    local v8 = {};
    if v7 == "All" then
        for _, v10 in v2.EGG_SHARDS do
            if not v4:HasItem(v6, v10) then
                v8[v10] = 1;
            end;
        end;
    else
        local v11 = select(2, v3:GetByDisplayName(v7));
        if v4:HasItem(v6, v11) then
            return (("%* already has the %*!"):format(v6, v7));
        else
            v8[v11] = 1;
        end;
    end;
    if not v4:BulkAddItems(v6, v8):await() then
        return (("Failed to give all shards to %*!"):format(v6));
    elseif v7 == "All" then
        return (("Successfully gave %* all shards needed."):format(v6));
    else
        return (("Successfully gave %* the %*"):format(v6, v7));
    end;
end;