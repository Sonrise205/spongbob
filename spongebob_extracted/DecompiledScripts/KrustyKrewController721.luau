local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local l_KREW_PLUS_0 = require(l_ReplicatedStorage_0.Shared.Data.Variables).KREW_PLUS;
local v5 = nil;
local v6 = nil;
local v7 = v1.CreateController({
    Name = script.Name, 
    Client = {}
});
v7.KnitInit = function(_) --[[ Line: 34 ]] --[[ Name: KnitInit ]]
    -- upvalues: v5 (ref), v1 (copy), v6 (ref)
    v5 = v1.GetController("DataController");
    v6 = v1.GetController("PurchaseController");
end;
v7.KnitStart = function(_) --[[ Line: 40 ]] --[[ Name: KnitStart ]]

end;
v7.IsActive = function(v10) --[[ Line: 46 ]] --[[ Name: IsActive ]]
    -- upvalues: v6 (ref), v1 (copy)
    local l_v10_Data_0 = v10:GetData();
    if workspace:GetServerTimeNow() < l_v10_Data_0.expiration then
        return true;
    else
        return v6:HasSubscription(v1.Player, "KrustyKrew");
    end;
end;
v7.GetData = function(_) --[[ Line: 55 ]] --[[ Name: GetData ]]
    -- upvalues: v5 (ref), v1 (copy), l_KREW_PLUS_0 (copy)
    return v5:Get(v1.Player, l_KREW_PLUS_0.DATA_KEY):expect();
end;
return v7;