return {
    Name = "givegift", 
    Aliases = {
        "givegift", 
        "GiveGift", 
        "gift"
    }, 
    Description = "Gives the player specific Gamepass Gifts", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give the gift to."
        }, 
        {
            Type = "gift", 
            Name = "Gift", 
            Description = "Name of the gift to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of gifts to give"
        }
    }
};