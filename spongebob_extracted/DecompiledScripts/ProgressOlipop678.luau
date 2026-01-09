return {
    Name = script.Name, 
    Aliases = {
        "progressolipop", 
        "ProgressOlipop", 
        "progressOlipop"
    }, 
    Description = "Progress a OLIPOP quest", 
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