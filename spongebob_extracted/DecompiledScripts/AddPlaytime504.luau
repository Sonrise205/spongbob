return {
    Name = "AddPlaytime", 
    Aliases = {
        "addplaytime", 
        "AddPlaytime"
    }, 
    Description = "Adds playtime for a player", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to add playtime for"
        }, 
        {
            Type = "number", 
            Name = "Time", 
            Description = "Time to add in seconds"
        }
    }
};