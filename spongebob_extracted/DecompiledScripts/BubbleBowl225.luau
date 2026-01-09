return {
    Disabled = true, 
    _hideFromUI = true, 
    _resetType = "Daily", 
    EventQuests = true; 
    {
        Name = "Hard1", 
        DisplayName = "", 
        Description = "Complete Bubble Bowl On Hard", 
        Type = "BubbleBowlCompleted_Hard", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "Bubbles", 
                amount = 100
            }
        }
    }, 
    {
        Name = "Nightmare1", 
        DisplayName = "", 
        Description = "Complete Bubble Bowl on Nightmare", 
        Type = "BubbleBowlCompleted_Nightmare", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Currency", 
                name = "Bubbles", 
                amount = 150
            }
        }
    }, 
    {
        Name = "Hard2", 
        DisplayName = "", 
        Description = "Complete Bubble Bowl on Hard {x} Times", 
        Type = "BubbleBowlCompleted_Hard", 
        RequiredValue = 5, 
        Rewards = {
            {
                type = "Inventory", 
                name = "BubblePopper", 
                amount = 1
            }
        }
    }, 
    {
        Name = "Nightmare2", 
        DisplayName = "", 
        Description = "Complete Bubble Bowl on Nightmare {x} Times", 
        Type = "BubbleBowlCompleted_Nightmare", 
        RequiredValue = 5, 
        Rewards = {
            {
                type = "Inventory", 
                name = "BubblePopper", 
                amount = 1
            }
        }
    }, 
    {
        Name = "BubblePopper", 
        DisplayName = "", 
        Description = "Open {x} Bubble Capsules", 
        Type = "BubblePopperOpened", 
        RequiredValue = 5, 
        Rewards = {
            {
                type = "Inventory", 
                name = "RareBubblePopper", 
                amount = 1
            }
        }
    }, 
    {
        Name = "CompleteAll", 
        DisplayName = "", 
        Description = "Complete All Daily Bubble Bowl Quests", 
        Type = "CompletedBubbleBowl", 
        RequiredValue = 5, 
        Rewards = {
            {
                type = "Inventory", 
                name = "BUBBLES_60", 
                amount = 1
            }
        }
    }
};