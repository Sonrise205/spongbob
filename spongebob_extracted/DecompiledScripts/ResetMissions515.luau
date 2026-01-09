return {
    Name = "ResetMissions", 
    Aliases = {
        "resetmissions", 
        "ResetMissions", 
        "resetMissions"
    }, 
    Description = "Reset missions data", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to reset missions data for"
        }
    }
};