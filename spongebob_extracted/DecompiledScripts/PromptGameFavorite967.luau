return {
    Name = "promptGameFavorite", 
    Aliases = {
        "promptfavorite", 
        "favoriteGame", 
        "favorite", 
        "promptgamefavorite"
    }, 
    Description = "Prompts everyone globally to favorite a game", 
    Group = "Admin", 
    Args = {
        {
            Type = "gameFavorite", 
            Name = "Game", 
            Description = "The game to prompt favoriting for"
        }
    }
};