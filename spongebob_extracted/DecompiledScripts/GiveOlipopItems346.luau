return {
    Name = script.Name, 
    Aliases = {
        "giveOlipop", 
        "GiveOlipop"
    }, 
    Description = "Gives the player specific items", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give the Olipop items to."
        }
    }
};