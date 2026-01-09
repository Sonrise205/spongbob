return {
    Name = "AddStardom", 
    Aliases = {
        "addstardom", 
        "addStardom"
    }, 
    Description = "Give player Stardom", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to give to"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Increase by this amount"
        }
    }
};