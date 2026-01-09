local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v2 = {};
for _, v4 in script:GetChildren() do
    v2[v4.Name] = require(v4);
    for v5 = 1, #v2[v4.Name] do
        local v6 = v2[v4.Name][v5];
        if v6 and v6.Rewards then
            local l_WORLD_ACHIEVEMENT_0 = v1.PLAYER_XP_REWARDS.WORLD_ACHIEVEMENT;
            local l_WORLD_ACHIEVEMENT_1 = v1.PLAYER_SEASON_XP_REWARDS.WORLD_ACHIEVEMENT;
            if l_WORLD_ACHIEVEMENT_0 then
                table.insert(v6.Rewards, {
                    type = "Experience", 
                    amount = l_WORLD_ACHIEVEMENT_0
                });
            end;
            if l_WORLD_ACHIEVEMENT_1 then
                table.insert(v6.Rewards, {
                    type = "SeasonXP", 
                    name = "SeasonXP", 
                    amount = l_WORLD_ACHIEVEMENT_1
                });
            end;
        end;
    end;
end;
return v2;