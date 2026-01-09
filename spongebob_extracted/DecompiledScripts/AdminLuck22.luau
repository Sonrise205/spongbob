return {
    Name = "AdminLuck", 
    Aliases = {
        "adminluck"
    }, 
    Description = "Global Luck Boost", 
    Group = "Admin", 
    Args = {
        {
            Type = "adminAction", 
            Name = "Action", 
            Description = "Start | End | Increment | ChangeMultiplier"
        }, 
        {
            Type = "number", 
            Name = "Multiplier", 
            Description = "Luck Multiplier to apply", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Time", 
            Description = "Luck Boost Duration in minutes", 
            Optional = true
        }
    }
};