return {
    Name = "AdminGoldenSpatulas", 
    Aliases = {
        "admingoldenspatulas"
    }, 
    Description = "Global Golden Spatulas Boost", 
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
            Description = "Golden Spatulas Multiplier to apply", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Time", 
            Description = "Golden Spatulas Boost Duration in minutes", 
            Optional = true
        }
    }
};