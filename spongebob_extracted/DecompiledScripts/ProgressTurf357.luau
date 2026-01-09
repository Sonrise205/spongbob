return {
    Name = "ProgressTurf", 
    Aliases = {
        "progressturf", 
        "ProgressTurf", 
        "progressTurf"
    }, 
    Description = "Progress a Turf Wars quest", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to progress quest for"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Increase progression by this amount"
        }
    }
};