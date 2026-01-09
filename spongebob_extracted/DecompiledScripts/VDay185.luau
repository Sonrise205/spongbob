return {
    Disabled = true, 
    _hideFromUI = true; 
    {
        Name = "Waves1", 
        DisplayName = "", 
        Description = "Complete 50 Story Mode Chapters!", 
        Type = "ChapterCompleted", 
        RequiredValue = 50, 
        Rewards = {
            {
                type = "Inventory", 
                name = "Parade Present", 
                amount = 1
            }
        }
    }, 
    {
        Name = "Challenge1", 
        DisplayName = "", 
        Description = "Complete 25 Challenges!", 
        Type = "ClearChallenge", 
        RequiredValue = 25, 
        Rewards = {
            {
                type = "Inventory", 
                name = "Parade Present", 
                amount = 2
            }
        }
    }, 
    {
        Name = "Raid1", 
        DisplayName = "", 
        Description = "Complete 10 Raids!", 
        Type = "RaidCompleted", 
        RequiredValue = 10, 
        Rewards = {
            {
                type = "Inventory", 
                name = "Parade Present", 
                amount = 3
            }
        }
    }, 
    {
        Name = "CompleteAll", 
        DisplayName = "", 
        Description = "Complete All Event Quests!", 
        Type = "CompletedVDay", 
        RequiredValue = 3, 
        Rewards = {
            {
                type = "Inventory", 
                name = "Parade Present", 
                amount = 4
            }
        }
    }
};