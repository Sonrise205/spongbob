local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.SeasonPass);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
return {
    GetXPForLevel = function(_, v5, v6) --[[ Line: 10 ]] --[[ Name: GetXPForLevel ]]
        -- upvalues: v2 (copy)
        v5 = v5 or 0;
        v6 = v6 or 0;
        return v2.xpRequirements[v5] or 0;
    end, 
    GetLevelFromXP = function(v7, v8, v9) --[[ Line: 41 ]] --[[ Name: GetLevelFromXP ]]
        -- upvalues: v2 (copy)
        local v10 = 0;
        for v11 = 1, #v2.xpRequirements do
            if v8 >= v7:GetXPForLevel(v11, v9) then
                v10 = v11;
            else
                break;
            end;
        end;
        return v10;
    end, 
    GetMaxLevel = function(v12, v13, v14, v15, v16) --[[ Line: 57 ]] --[[ Name: GetMaxLevel ]]
        -- upvalues: v3 (copy), v1 (copy)
        v13 = v13 or 0;
        v15 = v15 or v3.SEASON;
        v16 = v16 or false;
        local l_v12_SeasonRewards_0 = v12:GetSeasonRewards(v15);
        local _, v20 = v1.Find(l_v12_SeasonRewards_0.Free, function(v18) --[[ Line: 64 ]]
            return v18._isMaxLevel;
        end);
        local v21 = #l_v12_SeasonRewards_0.Free;
        local v22 = #l_v12_SeasonRewards_0.Premium;
        if v15 < 2 then
            return v20;
        elseif v14 == "Free" then
            return (math.clamp(v20 + v13, v20, v21));
        else
            return (math.clamp(v20 + v13, v20, v22));
        end;
    end, 
    GetMaxPremiumLevel = function(v23, v24, v25) --[[ Line: 89 ]] --[[ Name: GetMaxPremiumLevel ]]
        -- upvalues: v3 (copy)
        v24 = v24 or 0;
        v25 = v25 or v3.SEASON;
        local l_v23_SeasonRewards_0 = v23:GetSeasonRewards(v25);
        local v27 = #l_v23_SeasonRewards_0.Free;
        local v28 = #l_v23_SeasonRewards_0.Premium;
        if v25 < 2 then
            return v27;
        else
            return (math.clamp(v27 + v24, v27, v28));
        end;
    end, 
    IsPremium = function(_, v30) --[[ Line: 106 ]] --[[ Name: IsPremium ]]
        return v30 and v30.HasPremium or false;
    end, 
    GetSeasonRewards = function(_, v32, v33) --[[ Line: 110 ]] --[[ Name: GetSeasonRewards ]]
        -- upvalues: v3 (copy), v1 (copy), v2 (copy)
        local v34 = v32 or v3.SEASON;
        v34 = v1.Copy(v2.Rewards[("Season%*"):format(v34)], true);
        if v33 then
            return v34 and v34[v33];
        else
            return v34;
        end;
    end
};