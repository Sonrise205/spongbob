return {
    Name = "givechest", 
    Aliases = {
        "givechest", 
        "GiveChest", 
        "chest"
    }, 
    Description = "Gives the player a specific chest", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give the chests to."
        }, 
        {
            Type = "chests", 
            Name = "Chest", 
            Description = "Name of chest to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of chests to give"
        }
    }
};