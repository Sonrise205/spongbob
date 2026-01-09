return {
    Name = "setleaderstat", 
    Aliases = {
        "SetLeaderstat", 
        "slt"
    }, 
    Description = "Sets leaderstat at the defined path for player", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to set the leaderstat for"
        }, 
        {
            Type = "string", 
            Name = "Path", 
            Description = "Path to the leaderstat"
        }, 
        {
            Type = "number", 
            Name = "Value", 
            Description = "Value to set the leaderstat to"
        }
    }
};