return {
    Name = "Level", 
    Aliases = {
        "level", 
        "Level"
    }, 
    Description = "Sets player's player prestige and level", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to set level for"
        }, 
        {
            Type = "number", 
            Name = "Prestige", 
            Description = "Set prestige to"
        }, 
        {
            Type = "number", 
            Name = "Level", 
            Description = "Set level to"
        }
    }
};