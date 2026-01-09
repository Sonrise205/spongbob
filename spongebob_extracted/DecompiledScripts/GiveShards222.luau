return {
    Name = script.Name, 
    Aliases = {
        "shards"
    }, 
    Description = "Gives the player all the egg shards", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "The player to give all egg shards to."
        }, 
        {
            Type = "shards", 
            Name = "Shard", 
            Description = "The shard to give."
        }
    }
};