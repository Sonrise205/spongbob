return {
    Name = "CompleteChapter", 
    Aliases = {
        "completechapter", 
        "CompleteChapter"
    }, 
    Description = "Complete a chapter in data", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to complete chapter for"
        }, 
        {
            Type = "worlds", 
            Name = "World Name", 
            Description = "World to complete chapter in"
        }, 
        {
            Type = "number", 
            Name = "Chapter Number", 
            Description = "Desired chapter (Optional - Default: All)", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Difficulty Number", 
            Description = "Desired difficulty (Optional - Default: 1)", 
            Optional = true
        }
    }
};