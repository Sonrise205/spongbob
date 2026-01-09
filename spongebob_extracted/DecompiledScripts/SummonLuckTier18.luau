local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = #require(l_ReplicatedStorage_0.Shared.Data.Variables).SUMMONING.PROGRESSIVE_LUCK_BOOSTS;
return {
    Name = "SummonLuckTier", 
    Aliases = {
        "summonlucktier", 
        "SummonLuckTier"
    }, 
    Description = "Set progressive summon luck tier", 
    Group = "Admin", 
    Args = {
        {
            Type = "player", 
            Name = "Player", 
            Description = "Player to set tier for"
        }, 
        {
            Type = "number", 
            Name = "Tier", 
            Description = ("Tiers are 1-%*"):format(v1)
        }
    }
};