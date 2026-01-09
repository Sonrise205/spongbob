return {
    Name = "XP", 
    Aliases = {
        "xp", 
        "exp", 
        "XP"
    }, 
    Description = "Increments the players xp by the specified number", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to give xp to"
        }, 
        {
            Type = "xp", 
            Name = "XP", 
            Description = "XP type to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount to give"
        }
    }
};