return {
    Name = "Play", 
    Aliases = {
        "play", 
        "Play"
    }, 
    Description = "Play a specific world, chapter, and difficulty", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to teleport"
        }, 
        {
            Type = "worlds", 
            Name = "World", 
            Description = "World name"
        }, 
        {
            Type = "number", 
            Name = "Chapter", 
            Description = "Chapter index"
        }, 
        {
            Type = "number", 
            Name = "Difficulty", 
            Description = "Difficulty index"
        }
    }
};