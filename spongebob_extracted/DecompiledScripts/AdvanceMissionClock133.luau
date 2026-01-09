return {
    Name = "AdvanceMissionClock", 
    Aliases = {
        "advancemissionclock", 
        "AdvanceMissionClock", 
        "advanceMissionClock"
    }, 
    Description = "Increase mission clock time", 
    Group = "Admin", 
    Args = {
        {
            Type = "number", 
            Name = "Amount", 
            Description = "Increase mission clock time by this amount"
        }
    }
};