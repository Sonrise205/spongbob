return {
    Name = "AdminGems", 
    Aliases = {
        "admingems"
    }, 
    Description = "Global Gems Boost", 
    Group = "Admin", 
    Args = {
        {
            Type = "adminAction", 
            Name = "Action", 
            Description = "Start | Stop | Increment | ChangeMultiplier"
        }, 
        {
            Type = "number", 
            Name = "Multiplier", 
            Description = "Gems Multiplier to apply", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Time", 
            Description = "Gems Boost Duration in minutes", 
            Optional = true
        }
    }
};