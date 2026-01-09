local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
return {
    GetShopTier = function(_, v3) --[[ Line: 8 ]] --[[ Name: GetShopTier ]]
        -- upvalues: v1 (copy)
        local v4 = v3 and v3.Points;
        if not v4 then
            return 0;
        else
            local v5 = 0;
            for v6, v7 in v1.FACTIONS.SHOP_MILESTONES do
                if v4 >= v7.pointsNeeded then
                    v5 = v6;
                else
                    break;
                end;
            end;
            return v5;
        end;
    end, 
    GetNextMilestone = function(_, v9) --[[ Line: 28 ]] --[[ Name: GetNextMilestone ]]
        -- upvalues: v1 (copy)
        local v10 = v9 and v9.Points;
        if not v10 then
            return 1;
        else
            for v11, v12 in v1.FACTIONS.SHOP_MILESTONES do
                if v10 < v12.pointsNeeded then
                    return v12, v11;
                end;
            end;
            return;
        end;
    end
};