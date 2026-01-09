return {
    Name = "globalgiveitem", 
    Aliases = {
        "global", 
        "globalgiveitem"
    }, 
    Description = "\240\159\140\142 Gives players an item", 
    Group = "Admin", 
    Args = {
        {
            Type = "item", 
            Name = "Item", 
            Description = "Name of the item to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of item(s) to give"
        }, 
        {
            Type = "number", 
            Name = "Chance", 
            Description = "The chance in % each player gets for the item"
        }
    }
};