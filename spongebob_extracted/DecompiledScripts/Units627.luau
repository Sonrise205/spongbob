local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v2 = {};
for _, v4 in script:GetChildren() do
    v2[v4.Name] = require(v4);
    for v5 = 1, #v2[v4.Name] do
        local v6 = v2[v4.Name][v5];
        if v6 and v6.Rewards then
            local v7 = v4.Name == "Fusions" and "FUSION_ACHIEVEMENT" or "UNIT_ACHIEVEMENT";
            local v8 = v1.PLAYER_XP_REWARDS[v7];
            local v9 = v1.PLAYER_SEASON_XP_REWARDS[v7];
            if v8 then
                table.insert(v6.Rewards, {
                    type = "Experience", 
                    amount = v8
                });
            end;
            if v9 then
                table.insert(v6.Rewards, {
                    type = "SeasonXP", 
                    name = "SeasonXP", 
                    amount = v9
                });
            end;
        end;
    end;
end;
return v2;