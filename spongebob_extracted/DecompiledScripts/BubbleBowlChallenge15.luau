return {
    Disabled = true, 
    _hideFromUI = true, 
    EventQuests = true; 
    {
        Name = "Challenge1", 
        DisplayName = "Bubble Brainiac", 
        Description = "Complete the Bubble Bowl Raid on Hard with ONLY Rare or Below Units Equipped", 
        Type = "BubbleBowlCompleted_Hard_Rare_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "SecretBubblePopper", 
                amount = 1
            }, 
            {
                type = "Currency", 
                name = "Bubbles", 
                amount = 2000
            }
        }
    }, 
    {
        Name = "Challenge2", 
        DisplayName = "Halftime Legend", 
        Description = "Complete the Bubble Bowl Raid on Nightmare with ONLY Legendary or Below Units Equipped", 
        Type = "BubbleBowlCompleted_Nightmare_Legendary_Units", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "SecretBubblePopper", 
                amount = 2
            }, 
            {
                type = "Currency", 
                name = "Bubbles", 
                amount = 4000
            }
        }
    }, 
    {
        Name = "Challenge3", 
        DisplayName = "Band Conductor", 
        Description = "Complete Bubble Bowl Raid on Nightmare with ONLY Band Geek Units Equipped", 
        Type = "BubbleBowlNightmareBandGeeksOnly", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "SecretBubblePopper", 
                amount = 3
            }, 
            {
                type = "Currency", 
                name = "Bubbles", 
                amount = 6000
            }
        }
    }
};