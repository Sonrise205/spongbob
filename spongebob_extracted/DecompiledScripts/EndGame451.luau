return {
    Name = "EndGame", 
    Aliases = {
        "endgame", 
        "EndGame"
    }, 
    Description = "End the game", 
    Group = "Admin", 
    Args = {
        {
            Type = "endgamestate", 
            Name = "State", 
            Description = "Victory or Defeat"
        }
    }
};