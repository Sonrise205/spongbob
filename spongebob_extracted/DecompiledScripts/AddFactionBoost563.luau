return {
    Name = script.Name, 
    Aliases = {
        "faction", 
        "boost"
    }, 
    Description = "Increments the Factions Boost Time by the specified number", 
    Group = "Admin", 
    Args = {
        {
            Type = "faction", 
            Name = "Faction", 
            Description = "Faction to give boost to"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Hours to give"
        }
    }
};