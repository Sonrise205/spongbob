return {
    Name = "givefood", 
    Aliases = {
        "givefood", 
        "GiveFood", 
        "food"
    }, 
    Description = "Gives the player specific food items", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give the food to."
        }, 
        {
            Type = "food", 
            Name = "Food", 
            Description = "Name of the food to give"
        }, 
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Amount of food(s) to give"
        }
    }
};