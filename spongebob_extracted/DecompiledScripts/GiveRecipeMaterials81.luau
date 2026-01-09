return {
    Name = script.Name, 
    Aliases = {
        "recipe", 
        "crafting"
    }, 
    Description = "Gives items needed for recipe", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to give the items"
        }, 
        {
            Type = "recipe", 
            Name = "Recipe", 
            Description = "Recipe to use"
        }, 
        {
            Type = "number", 
            Name = "Copies", 
            Description = "Copies to give"
        }
    }
};