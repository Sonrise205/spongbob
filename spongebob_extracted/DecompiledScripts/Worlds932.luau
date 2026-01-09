local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(l_ReplicatedStorage_0.Levels);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v6 = {};
local v7 = require(script.TemplateAchievement);
for _, v9 in script:GetChildren() do
    if v9:IsA("ModuleScript") and v9.Name ~= "TemplateAchievement" then
        v6[v9.Name] = require(v9);
    end;
end;
local v10 = v3:GetWorlds("Story") or {};
for v11, v12 in v10 do
    local v13 = v6[v11] or v1.Copy(v7, true);
    local v14 = v12.displayName or v12.DisplayName;
    local v15 = v12.WorldOrder or 1;
    v13._displayName = ("Ocean Odyssey %*: %*"):format(v4:IntToRoman(v15), v14);
    v13._order = v15;
    local l_WORLD_ACHIEVEMENT_0 = v2.PLAYER_XP_REWARDS.WORLD_ACHIEVEMENT;
    local l_WORLD_ACHIEVEMENT_1 = v2.PLAYER_SEASON_XP_REWARDS.WORLD_ACHIEVEMENT;
    for v18 = 1, #v13 do
        local v19 = v13[v18];
        if v19.Description then
            v19.Description = string.gsub(v19.Description, "{worldName}", v14);
        end;
        if v19 and v19.Rewards then
            if l_WORLD_ACHIEVEMENT_0 then
                table.insert(v19.Rewards, {
                    type = "Experience", 
                    amount = l_WORLD_ACHIEVEMENT_0
                });
            end;
            if l_WORLD_ACHIEVEMENT_1 then
                table.insert(v19.Rewards, {
                    type = "SeasonXP", 
                    name = "SeasonXP", 
                    amount = l_WORLD_ACHIEVEMENT_1
                });
            end;
        end;
    end;
    v6[v11] = v13;
end;
return v6;