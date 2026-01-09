return {
    Name = "giveallunits", 
    Aliases = {
        "giveallunits", 
        "GiveAllUnits", 
        "allunits", 
        "AllUnits"
    }, 
    Description = "Gives the player all units in game", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give all units to."
        }
    }
};