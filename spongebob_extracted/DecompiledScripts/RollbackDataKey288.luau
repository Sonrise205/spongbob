return {
    Name = "RollbackDataKey", 
    Aliases = {
        "rollbackDataKey", 
        "RollbackDataKey"
    }, 
    Description = "Rolls back a data key for a player", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to add rollback"
        }, 
        {
            Type = "string", 
            Name = "KeyPath", 
            Description = "When to rollback data"
        }, 
        {
            Type = "number", 
            Name = "Timestamp", 
            Description = "Max Unix Timestamp to rollback to"
        }
    }
};