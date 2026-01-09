return {
    Name = "StartMission", 
    Aliases = {
        "startmission", 
        "StartMission", 
        "startMission"
    }, 
    Description = "Start a mission", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to start mission for"
        }, 
        {
            Type = "number", 
            Name = "Questline", 
            Description = "Set Questline to"
        }, 
        {
            Type = "number", 
            Name = "Week", 
            Description = "Set Week to"
        }, 
        {
            Type = "number", 
            Name = "Mission", 
            Description = "Set Mission to"
        }
    }
};