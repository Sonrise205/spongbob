return {
    Name = "AddFactionPoints", 
    Aliases = {
        "faction"
    }, 
    Description = "Increments the Factions Points by the specified number", 
    Group = "Admin", 
    Args = {
        {
            Type = "faction", 
            Name = "Faction", 
            Description = "Faction to give points to"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount to give"
        }
    }
};