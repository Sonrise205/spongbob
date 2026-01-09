return {
    Name = "givekrewplusmonths", 
    Aliases = {
        "givekrewplusmonths", 
        "GiveKrewPlusMonths"
    }, 
    Description = "Gives the player months of Krusty Krew+", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give the months to"
        }, 
        {
            Type = "number", 
            Name = "Months", 
            Description = "Number of months to give"
        }
    }
};