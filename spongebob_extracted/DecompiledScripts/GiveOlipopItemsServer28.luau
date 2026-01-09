local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    v2 = v1.GetService("InventoryService");
    v3 = v1.GetService("DataService");
end);
return function(_, v5) --[[ Line: 14 ]]
    -- upvalues: v3 (ref), v2 (ref)
    local v6 = {
        OlipopRelic1 = 1, 
        OlipopRelic2 = 1, 
        OlipopRelic3 = 1, 
        OlipopRelic4 = 1, 
        OlipopRelic5 = 1, 
        Rare_Olipop = 100, 
        Epic_Olipop = 100, 
        Legendary_Olipop = 100, 
        Mythic_Olipop = 100, 
        Secret_Olipop = 100
    };
    local v7 = v3:Get(v5, "Inventory");
    if v7 then
        for v8, _ in v6 do
            if string.find(v8, "OlipopRelic") and v7[v8] then
                v6[v8] = nil;
            end;
        end;
    end;
    v2:BulkAddItems(v5, v6);
    return (("Gave OLIPOP items to %*"):format(v5));
end;