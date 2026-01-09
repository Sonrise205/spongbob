return {
    Name = "Currency", 
    Aliases = {
        "currency", 
        "Currency"
    }, 
    Description = "Increments the players currency by the specified number", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to give currency to"
        }, 
        {
            Type = "currency", 
            Name = "Currency", 
            Description = "Currency to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount to give"
        }
    }
};