local v0 = require(script.Parent.Constants);
return {
    GetRankRewards = function(v1) --[[ Line: 10 ]] --[[ Name: GetRankRewards ]]
        -- upvalues: v0 (copy)
        local v2 = v0.BeltRanks[v1];
        if v2 and v2.Rewards then
            return v2.Rewards;
        else
            return;
        end;
    end, 
    GetBeltColor = function(v3) --[[ Line: 19 ]] --[[ Name: GetBeltColor ]]
        -- upvalues: v0 (copy)
        for _, v5 in v0.BeltColors do
            if v5.LevelRange.Min <= v3 and v3 <= v5.LevelRange.Max then
                return v5.Color;
            end;
        end;
        return Color3.new(1, 1, 1);
    end, 
    GetBeltTier = function(v6) --[[ Line: 29 ]] --[[ Name: GetBeltTier ]]
        -- upvalues: v0 (copy)
        for _, v8 in v0.BeltColors do
            if v8.LevelRange.Min <= v6 and v6 <= v8.LevelRange.Max then
                return v6 - v8.LevelRange.Min + 1;
            end;
        end;
        return 0;
    end, 
    GetRankData = function(v9) --[[ Line: 39 ]] --[[ Name: GetRankData ]]
        -- upvalues: v0 (copy)
        return v0.BeltRanks[v9];
    end
};