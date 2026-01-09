local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local l_SBB_QUEST_HOUR_0 = v3.SBB_QUEST_HOUR;
local v5 = {
    name = "", 
    speaker = "", 
    start = v2:GetForCTUnix({
        year = 2025, 
        month = 12, 
        day = 3, 
        hour = 0
    }), 
    completionRewards = {
        [1] = {
            required = 1, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "AdminCrate", 
                    amount = 100
                }
            }
        }, 
        [2] = {
            required = 2, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "ExoticTreasureChest", 
                    amount = 10
                }
            }
        }, 
        [3] = {
            required = 3, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "AlaskanBullWorm", 
                    amount = 1
                }
            }
        }, 
        [4] = {
            required = 4, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "AdminCrate", 
                    amount = 250
                }
            }
        }, 
        [5] = {
            required = 5, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "ExoticTreasureChest", 
                    amount = 25
                }
            }
        }, 
        [6] = {
            required = 6, 
            rewards = {
                {
                    type = "Pet", 
                    name = "CursedJellyfish", 
                    amount = 1
                }
            }
        }, 
        [7] = {
            required = 7, 
            rewards = {
                {
                    type = "Unit", 
                    name = "ChumBrute", 
                    amount = 1
                }
            }
        }
    }, 
    batches = {}
};
v5.batches[1] = {
    name = "", 
    expire = v2:GetForCTUnix({
        year = 2025, 
        month = 12, 
        day = 14, 
        hour = 23, 
        minute = 59
    }), 
    start = v3.SBB_LAUNCH_TIME, 
    quests = {
        [1] = {
            name = "Survive 10 Days", 
            required = 1, 
            objective = "Reach <rich>Day 10</rich> in Survive Bikini Bottom", 
            collect = {
                badgeIcon = "rbxassetid://127911075684217", 
                badgeId = 3.803046797893983E15
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "AdminCrate", 
                    amount = 100
                }
            }
        }, 
        [2] = {
            name = "Jellykeeper III", 
            start = v2:GetForCTUnix({
                year = 2025, 
                month = 12, 
                day = 4, 
                hour = l_SBB_QUEST_HOUR_0
            }), 
            required = 1, 
            objective = "Upgrade the Jelly Hive to <rich>Level 5</rich> in Survive Bikini Bottom", 
            collect = {
                badgeIcon = "rbxassetid://92271586963088", 
                badgeId = 452061040390938
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "ExoticTreasureChest", 
                    amount = 10
                }
            }
        }, 
        [3] = {
            name = "Survive 30 Days", 
            start = v2:GetForCTUnix({
                year = 2025, 
                month = 12, 
                day = 5, 
                hour = l_SBB_QUEST_HOUR_0
            }), 
            required = 1, 
            objective = "Reach <rich>Day 30</rich> in Survive Bikini Bottom", 
            collect = {
                badgeIcon = "rbxassetid://128724460287252", 
                badgeId = 2.238477618512534E15
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "AlaskanBullWorm", 
                    amount = 1
                }
            }
        }, 
        [4] = {
            name = "Classy", 
            start = v2:GetForCTUnix({
                year = 2025, 
                month = 12, 
                day = 6, 
                hour = l_SBB_QUEST_HOUR_0
            }), 
            required = 1, 
            objective = "Unlock a <rich>3-Star Class</rich> in Survive Bikini Bottom", 
            collect = {
                badgeIcon = "rbxassetid://113186413857332", 
                badgeId = 1.201467676992654E15
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "AdminCrate", 
                    amount = 250
                }
            }
        }, 
        [5] = {
            name = "Survive 50 Days", 
            start = v2:GetForCTUnix({
                year = 2025, 
                month = 12, 
                day = 7, 
                hour = l_SBB_QUEST_HOUR_0
            }), 
            required = 1, 
            objective = "Reach <rich>Day 50</rich> in Survive Bikini Bottom", 
            collect = {
                badgeIcon = "rbxassetid://135185613090541", 
                badgeId = 3.862357233149841E15
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "ExoticTreasureChest", 
                    amount = 25
                }
            }
        }, 
        [6] = {
            name = "Delivery Ace", 
            start = v2:GetForCTUnix({
                year = 2025, 
                month = 12, 
                day = 8, 
                hour = l_SBB_QUEST_HOUR_0
            }), 
            required = 1, 
            objective = "Complete all <rich>Mailman Requests</rich> in Survive Bikini Bottom", 
            collect = {
                badgeIcon = "rbxthumb://type=BadgeIcon&id=3566224151539084&w=150&h=150", 
                badgeId = 3.566224151539084E15
            }, 
            rewards = {
                {
                    type = "Pet", 
                    name = "CursedJellyfish", 
                    amount = 1
                }
            }
        }, 
        [7] = {
            name = "Survive 100 Days", 
            start = v2:GetForCTUnix({
                year = 2025, 
                month = 12, 
                day = 9, 
                hour = l_SBB_QUEST_HOUR_0
            }), 
            required = 1, 
            objective = "Reach <rich>Day 100</rich> in Survive Bikini Bottom", 
            collect = {
                badgeIcon = "rbxthumb://type=BadgeIcon&id=508765319318414&w=150&h=150", 
                badgeId = 508765319318414
            }, 
            rewards = {
                {
                    type = "Unit", 
                    name = "ChumBrute", 
                    amount = 1
                }
            }
        }
    }
};
return v5;