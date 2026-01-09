return {
    Name = "giveunit", 
    Aliases = {
        "giveunit", 
        "GiveUnit", 
        "unit"
    }, 
    Description = "Gives the player a specific unit", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give all units to."
        }, 
        {
            Type = "unit", 
            Name = "Unit", 
            Description = "Name of unit to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of units to give"
        }, 
        {
            Type = "number", 
            Name = "Level", 
            Description = "Unit level (Default: 1)", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Stars", 
            Description = "Unit stars (Default: 0)", 
            Optional = true
        }, 
        {
            Type = "traits", 
            Name = "Trait", 
            Description = "Trait name (Default: \"None\")", 
            Optional = true
        }, 
        {
            Type = "relics", 
            Name = "Relic", 
            Description = "Relic name (Default: \"None\")", 
            Optional = true
        }, 
        {
            Type = "shinywumbo", 
            Name = "Shiny Wumbo", 
            Description = "Make unit shiny, wumbo or both", 
            Optional = true
        }
    }
};