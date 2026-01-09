return {
    Name = "giveitem", 
    Aliases = {
        "giveitem", 
        "GiveItem", 
        "item"
    }, 
    Description = "Gives the player specific items", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give the item to."
        }, 
        {
            Type = "item", 
            Name = "Item", 
            Description = "Name of the item to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of item(s) to give"
        }
    }
};