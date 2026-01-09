return {
    Name = "globalgiveunit", 
    Aliases = {
        "globalgiveunit", 
        "GlobalGiveUnit", 
        "unit"
    }, 
    Description = "Gives players a specific unit with a specified chance.", 
    Group = "Admin", 
    Args = {
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
            Description = "Unit level (Default: 1)"
        }, 
        {
            Type = "number", 
            Name = "Stars", 
            Description = "Unit stars (Default: 0)"
        }, 
        {
            Type = "traits", 
            Name = "Trait", 
            Description = "Trait name (Default: \"None\")"
        }, 
        {
            Type = "relics", 
            Name = "Relic", 
            Description = "Relic name (Default: \"None\")"
        }, 
        {
            Type = "shinywumbo", 
            Name = "Shiny Wumbo", 
            Description = "Make unit shiny, wumbo or both"
        }, 
        {
            Type = "number", 
            Name = "Chance", 
            Description = "The chance in % each player gets for the units."
        }
    }
};