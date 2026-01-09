local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.BossVariables);
local _ = require(l_ReplicatedStorage_0.Levels);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.EnemyShared);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v8 = {
    "BadBubbleBass", 
    "FlatsTheFlounder", 
    "DirtyBubbleLarge", 
    "ManRay", 
    "Doodlebob", 
    "LordPoltergeist", 
    "FlyingDutchman", 
    "SeaRhino", 
    "SeaBear", 
    "Tattletale", 
    "Dennis", 
    "HashSlingingSlasher", 
    "CyborgPlanktonLarge", 
    "AlaskanBullWorm", 
    "MegaHydraKaren", 
    "LionFish"
};
local v9 = {
    BadBubbleBass = {
        order = 1, 
        tier = 1
    }, 
    FlatsTheFlounder = {
        order = 2, 
        tier = 1
    }, 
    DirtyBubbleLarge = {
        order = 3, 
        tier = 1
    }, 
    ManRay = {
        order = 4, 
        tier = 1
    }, 
    Doodlebob = {
        order = 5, 
        tier = 1
    }, 
    LordPoltergeist = {
        order = 6, 
        tier = 2
    }, 
    FlyingDutchman = {
        order = 7, 
        tier = 2
    }, 
    SeaRhino = {
        order = 8, 
        tier = 2
    }, 
    SeaBear = {
        order = 9, 
        tier = 2
    }, 
    Tattletale = {
        order = 10, 
        tier = 2
    }, 
    Dennis = {
        order = 11, 
        tier = 3
    }, 
    HashSlingingSlasher = {
        order = 12, 
        tier = 3
    }, 
    CyborgPlanktonLarge = {
        order = 13, 
        tier = 3
    }, 
    AlaskanBullWorm = {
        order = 14, 
        tier = 3
    }, 
    MegaHydraKaren = {
        order = 15, 
        tier = 3
    }, 
    LionFish = {
        order = 16, 
        tier = 4
    }
};
local v10 = {
    {
        Name = "Defeat", 
        DisplayName = "Defeat Boss {index}", 
        Description = "Defeat the Final Form of {bossDisplayName}", 
        Type = "DefeatedBoss_{bossName}", 
        RequiredValue = 1
    }, 
    {
        Name = "3Star", 
        DisplayName = "All-Star Boss {index}", 
        Description = "Earn All Stars Battling {bossDisplayName}", 
        Type = "StarEarned_{bossName}", 
        RequiredValue = 15
    }
};
local v11 = {
    BossBattles = {
        _order = 1, 
        FullCompletionRewards = {
            {
                type = "Unit", 
                name = "GladiatorPatrick", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1
            }
        }
    }
};
for v12, v13 in v8 do
    local v14 = v9[v13];
    if v14 then
        for _, v16 in v10 do
            local v17 = table.clone(v16);
            v17.Name = v17.Name .. "_" .. v13;
            v17.Rewards = table.clone(v3.ACHIEVEMENT_REWARDS[("TIER_%*"):format(v14.tier or 1)][v16.Name]);
            local v18 = v6:GetUnitValue(v13, "FullName") or v13;
            for v19, v20 in v17 do
                if typeof(v20) == "string" then
                    local l_v20_0 = v20;
                    if string.find(v20, "{bossDisplayName}") then
                        l_v20_0 = string.gsub(v20, "{bossDisplayName}", v18);
                    elseif string.find(v20, "{bossName}") then
                        l_v20_0 = string.gsub(v20, "{bossName}", v13);
                    elseif string.find(v20, "{index}") then
                        l_v20_0 = string.gsub(v20, "{index}", v5:IntToRoman(v12));
                    end;
                    v17[v19] = l_v20_0;
                end;
            end;
            table.insert(v11.BossBattles, v17);
        end;
    end;
end;
return v11;