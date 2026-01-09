return {
    Name = script.Name, 
    Aliases = {
        script.Name
    }, 
    Description = "Gives the player all pets in game", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give all pets to."
        }
    }
};