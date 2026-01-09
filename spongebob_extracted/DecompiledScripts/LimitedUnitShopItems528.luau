local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
return {
    SpongebobSanta = {
        stock = 5000, 
        availableOn = v2.CHRISTMAS_START, 
        expiresOn = v2.CHRISTMAS_DEAL_ENDS
    }
};