return {
    Name = "GameSpeed", 
    Aliases = {
        "gamespeed", 
        "GameSpeed"
    }, 
    Description = "Change the game speed", 
    Group = "Admin", 
    Args = {
        {
            Type = "number", 
            Name = "Multiplier", 
            Description = "Speed multiplier"
        }
    }
};