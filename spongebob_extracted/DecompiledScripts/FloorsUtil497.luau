local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent.Constants);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = {};
local l_MAX_FLOORS_0 = v1.MAX_FLOORS;
v3.getMaxFloors = function() --[[ Line: 10 ]] --[[ Name: getMaxFloors ]]
    -- upvalues: l_MAX_FLOORS_0 (copy)
    return l_MAX_FLOORS_0;
end;
v3.getFloorIndex = function(v5) --[[ Line: 15 ]] --[[ Name: getFloorIndex ]]
    -- upvalues: l_MAX_FLOORS_0 (copy)
    return (v5 - 1) % l_MAX_FLOORS_0 + 1;
end;
v3.isFloorUnlocked = function(v6, v7) --[[ Line: 19 ]] --[[ Name: isFloorUnlocked ]]
    if v6 == 1 then
        return true;
    elseif not v7 or not v7.HighestFloor then
        return false;
    else
        return v6 <= v7.HighestFloor + 1;
    end;
end;
v3.isDifficultyUnlocked = function(v8, v9) --[[ Line: 31 ]] --[[ Name: isDifficultyUnlocked ]]
    if v8 <= 2 then
        return true;
    else
        local v10 = v9 and v9[tostring(v8 - 1)];
        if v10 and v10.TotalCompletions >= 1 then
            return true;
        else
            return false;
        end;
    end;
end;
v3.getEarningsForFloor = function(v11, v12) --[[ Line: 45 ]] --[[ Name: getEarningsForFloor ]]
    -- upvalues: v1 (copy), v2 (copy)
    for _, v14 in v1.FloorEarnings do
        if v14.FloorRange.Max >= v11 then
            local l_Coins_0 = v14.Coins;
            local l_Belts_0 = v14.Belts;
            local l_Swashbucks_0 = v14.Swashbucks;
            local v18 = v2.DIFFICULTY_NAMES[v12];
            local v19 = v1.REWARD_BUFFS[v18];
            if v19 then
                l_Coins_0 = math.floor(l_Coins_0 * v19);
                l_Belts_0 = math.floor(l_Belts_0 * v19);
            end;
            return l_Coins_0, l_Belts_0, l_Swashbucks_0;
        end;
    end;
    return 0, 0, 0;
end;
v3.getCoinEarningsForTower = function(v20, v21) --[[ Line: 73 ]] --[[ Name: getCoinEarningsForTower ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v22 = v2.DIFFICULTY_NAMES[v21];
    for _, v24 in v1.FloorEarnings do
        if v24.FloorRange.Max >= v20 then
            local v25 = v24.Coins * 10;
            local v26 = v1.REWARD_BUFFS[v22];
            if v26 then
                v25 = math.floor(v25 * v26);
            end;
            return v25;
        end;
    end;
end;
return v3;