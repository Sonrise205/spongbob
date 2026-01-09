return {
    Name = "AdminChallengeTokens", 
    Aliases = {
        "adminchallengetokens"
    }, 
    Description = "Global Challenge Tokens Boost", 
    Group = "Admin", 
    Args = {
        {
            Type = "adminAction", 
            Name = "Action", 
            Description = "Start | Stop | Increment | ChangeMultiplier"
        }, 
        {
            Type = "number", 
            Name = "Multiplier", 
            Description = "Challenge Tokens Multiplier to apply", 
            Optional = true
        }, 
        {
            Type = "number", 
            Name = "Time", 
            Description = "Challenge Tokens Boost Duration in minutes", 
            Optional = true
        }
    }
};