return {
    Name = "wipedata", 
    Aliases = {
        "wipe", 
        "wipedata"
    }, 
    Description = "Wipes the players data", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player whos data is being wiped."
        }
    }
};