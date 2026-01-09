return {
    Name = "UnlockAllBossBattles", 
    Aliases = {
        "UnlockAllBossBattles", 
        "unlockAllBossBattles"
    }, 
    Description = "Unlock all of the boss battles for a player.", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to add playtime for"
        }
    }
};