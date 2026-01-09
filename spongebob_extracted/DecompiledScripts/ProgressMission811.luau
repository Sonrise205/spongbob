return {
    Name = "ProgressMission", 
    Aliases = {
        "progressmission", 
        "ProgressMission", 
        "progressMission"
    }, 
    Description = "Progress a mission", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to progress mission for"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Increase progression by this amount"
        }
    }
};