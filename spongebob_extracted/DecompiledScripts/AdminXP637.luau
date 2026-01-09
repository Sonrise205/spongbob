return {
    Name = "AdminXP", 
    Aliases = {
        "adminxp"
    }, 
    Description = "Global XP Boost", 
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
            Description = "XP Multiplier to apply", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Time", 
            Description = "XP Boost Duration in minutes", 
            Optional = true
        }
    }
};