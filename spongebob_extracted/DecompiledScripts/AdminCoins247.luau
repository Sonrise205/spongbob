return {
    Name = "AdminCoins", 
    Aliases = {
        "admincoins"
    }, 
    Description = "Global Coins Boost", 
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
            Description = "Coins Multiplier to apply", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Time", 
            Description = "Coins Boost Duration in minutes", 
            Optional = true
        }
    }
};