return {
    Name = "FinishRecipe", 
    Aliases = {
        "finish", 
        "finishRecipe"
    }, 
    Description = "Finishes the recipe instantly", 
    Group = "Admin", 
    Args = {
        {
            Type = "number", 
            Name = "Slot", 
            Description = "Slot range 1 - 3"
        }
    }
};