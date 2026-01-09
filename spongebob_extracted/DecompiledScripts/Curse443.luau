return {
    Name = "Curse", 
    Aliases = {
        "curse"
    }, 
    Description = "Give player curse card", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of curse cards to give"
        }
    }
};