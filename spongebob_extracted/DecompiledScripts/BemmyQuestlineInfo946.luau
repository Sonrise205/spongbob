local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local l_BEMMY_0 = require(l_ReplicatedStorage_0.Shared.Data.Variables).BEMMY;
local v8 = {
    enabled = true, 
    util = {}, 
    quests = {
        [1] = {
            map = "JellyfishFields", 
            required = 1000, 
            objective = "Defeat <rich><amount> Enemies</rich> in <rich><map></rich>", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 10
                }, 
                {
                    type = "PoF", 
                    amount = 100
                }
            }, 
            dialogue = {
                intro = "Everyone wants to be my friend. It's exhausting. But hey, I'm feeling generous. Go zap some jellyfish. Impress me or don't. I'll be judging from a distance\226\128\148with snacks.", 
                complete = "You actually did it. Mildly impressive. You've upgraded from 'random stranger' to 'possible acquaintance."
            }
        }, 
        [2] = {
            required = 5, 
            objective = "Complete <rich><amount> Challenges</rich> on <rich>Nightmare Difficulty</rich>", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 25
                }, 
                {
                    type = "PoF", 
                    amount = 150
                }
            }, 
            dialogue = {
                intro = "You ever train with a bubble mentor before? No? Good. I make stuff up as I go. Beat a few challenge maps. Show me you're not made of sand.", 
                complete = "Okay, okay! You're not completely helpless. Still weird though."
            }
        }, 
        [3] = {
            required = 2000, 
            objective = "Defeat <rich><amount> Enemies</rich> with Bemmy Buddy Unit", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 50
                }, 
                {
                    type = "PoF", 
                    amount = 200
                }
            }, 
            dialogue = {
                intro = "Time to use my people\226\128\148uh, bubbles. They're squishy, floaty, and deadly in large quantities. Like me at a buffet.", 
                complete = "Bursting with potential. Get it? Bursting? Eh, whatever."
            }
        }, 
        [4] = {
            required = 5, 
            objective = "Defeat <rich>Man Ray Boss</rich> in Boss Battles <rich><amount> Times</rich>", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 75
                }, 
                {
                    type = "PoF", 
                    amount = 250
                }
            }, 
            dialogue = {
                intro = "Real talk: I've got enemies. Probably because I'm cooler than them. Beat up one of their big guys for me. You know, as a trust exercise.", 
                complete = "Nice! That boss looked like it owed me money. Buddy points unlocked."
            }
        }, 
        [5] = {
            required = 5, 
            objective = "Give Bemmy <rich><amount> Rare Units</rich>", 
            unitExchange = true, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 100
                }, 
                {
                    type = "PoF", 
                    amount = 300
                }
            }, 
            dialogue = {
                intro = "I saw something glittery the other day. I want it. Don't care what it is. Go rummage around and bring me five rare things. I'm building... something.", 
                complete = "Oooooh shiny. You can stick around. For now."
            }
        }, 
        [6] = {
            required = 1, 
            objective = "Place <rich>34 Towers</rich> in a Story Mode Map <rich>and Win</rich>", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 125
                }, 
                {
                    type = "PoF", 
                    amount = 350
                }
            }, 
            dialogue = {
                intro = "Strategy is key. I'm lying. I just throw stuff down and hope it works. Try it! Place 34 towers in a story mode and pretend you know what you're doing.", 
                complete = "Nice work. You're learning. Kinda. Maybe. Not really."
            }
        }, 
        [7] = {
            required = 1, 
            objective = "`\204\181\205\130\204\158?\204\183\205\132\204\168?\204\182\204\137\205\148?\204\184\205\134\205\142?\204\182\204\155\204\188?\204\183\205\139\204\161`\204\183\205\160\205\154,\204\183\204\130\205\150", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 150
                }, 
                {
                    type = "PoF", 
                    amount = 400
                }
            }, 
            dialogue = {
                intro = "If we're gonna be buddies, you need to be able to really move. Show me what you got. Anything. Please.", 
                complete = "Yessss. Now you almost look as cool as me. Almost."
            }
        }, 
        [8] = {
            required = 5, 
            objective = "Complete <rich><amount> Raids</rich> on <rich>Nightmare Difficulty</rich>", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 175
                }, 
                {
                    type = "PoF", 
                    amount = 450
                }
            }, 
            dialogue = {
                intro = "I joined a raid once. We even made an arrest, it was me. Let's see if you can keep your cool better than I did.", 
                complete = "You didn't end up in handcuffs. That's a win in my book."
            }
        }, 
        [9] = {
            required = 1, 
            objective = "Complete a <rich>Davy Jones Challenge</rich> with <rich>Only Rare or worse Units</rich>", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "CannedBread", 
                    amount = 200
                }, 
                {
                    type = "PoF", 
                    amount = 1500
                }
            }, 
            dialogue = {
                intro = "Being my buddy means being... well-rounded. Like a bubble. Show me you're consistent. Like my upload schedule.", 
                complete = "Consistently average. That's all I ask."
            }
        }, 
        [10] = {
            required = 0, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "BubbleTaxi", 
                    amount = 1
                }, 
                {
                    type = "Inventory", 
                    name = "BoostedSecretChest", 
                    amount = 1
                }
            }, 
            dialogue = {
                intro = "Alright. You did the quests. You didn't rage quit. You smell decent. Congrats\226\128\148you're now officially... Buddy-Adjacent\226\132\162. You're in the exclusive Bemmy Buddy Circle. It's a metaphorical circle. Very elite. You get nothing. I mean... my respect. Kinda. Go brag to someone."
            }
        }
    }, 
    GetQuestInfo = function(v3, v4) --[[ Line: 162 ]] --[[ Name: GetQuestInfo ]]
        return v3.quests[v4];
    end, 
    GetQuestRewards = function(v5, v6) --[[ Line: 166 ]] --[[ Name: GetQuestRewards ]]
        return v5:GetQuestInfo(v6).rewards;
    end, 
    GetQuests = function(v7) --[[ Line: 170 ]] --[[ Name: GetQuests ]]
        return v7.quests;
    end
};
v8.util.IsQuestCompleted = function(v9, v10) --[[ Line: 174 ]] --[[ Name: IsQuestCompleted ]]
    local v11 = v10 or v9.quest;
    return v9.completion[v11];
end;
v8.util.IsQuestFinished = function(v12, v13) --[[ Line: 180 ]] --[[ Name: IsQuestFinished ]]
    -- upvalues: v8 (copy)
    v13 = v13 or v12.quest;
    local l_v8_QuestInfo_0 = v8:GetQuestInfo(v13);
    return v12.progress[v13] == l_v8_QuestInfo_0.required;
end;
v8.util.GetCompletedQuests = function(v15) --[[ Line: 187 ]] --[[ Name: GetCompletedQuests ]]
    return #v15.completion;
end;
v8.util.GetProgress = function(v16, v17) --[[ Line: 191 ]] --[[ Name: GetProgress ]]
    local v18 = v17 or v16.quest;
    return v16.progress[v18];
end;
v8.util.GetQuestInfo = function(v19) --[[ Line: 197 ]] --[[ Name: GetQuestInfo ]]
    -- upvalues: v8 (copy)
    return v8:GetQuestInfo(v19.quest);
end;
local v20 = {};
for v21, v22 in l_BEMMY_0.MILESTONES do
    table.insert(v20, {
        level = v21, 
        reward = v22
    });
end;
local v23 = #v20;
table.sort(v20, function(v24, v25) --[[ Line: 213 ]]
    return v24.level < v25.level;
end);
v8.milestones = v20;
v8.totalMilestones = v23;
return v8;