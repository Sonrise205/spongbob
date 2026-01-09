return {
    Name = "summonunit", 
    Aliases = {
        "summonunit", 
        "summon"
    }, 
    Description = "Gives the player a specific unit with the summon animation", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to summon the unit to."
        }, 
        {
            Type = "unit", 
            Name = "Unit", 
            Description = "Name of unit to give"
        }, 
        {
            Type = "shinywumbo", 
            Name = "Shiny Wumbo", 
            Description = "Make unit shiny, wumbo or both", 
            Optional = true
        }
    }
};