return {
    Name = "GivePet", 
    Aliases = {
        "givepet", 
        "pet"
    }, 
    Description = "Gives the player a specific pet", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give all pets to"
        }, 
        {
            Type = "pet", 
            Name = "Pet", 
            Description = "Name of pet to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of pets to give"
        }, 
        {
            Type = "number", 
            Name = "Level", 
            Description = "Pet level (Default: 1)", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Stars", 
            Description = "Pet stars (Default: 0)", 
            Optional = true
        }, 
        {
            Type = "shinywumbo", 
            Name = "Shiny Wumbo", 
            Description = "Make pet shiny, wumbo or both", 
            Optional = true
        }
    }
};