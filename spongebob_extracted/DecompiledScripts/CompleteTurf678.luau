return {
    Name = "CompleteTurf", 
    Aliases = {
        "completeturf", 
        "completeTurf"
    }, 
    Description = "Complete Turf Wars quest(s)", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to complete quests for"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Complete this many quests"
        }
    }
};