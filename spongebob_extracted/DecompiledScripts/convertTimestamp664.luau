return {
    Name = "convertTimestamp", 
    Aliases = {
        "date"
    }, 
    Description = "Convert a timestamp to a human-readable format.", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "number", 
            Name = "timestamp", 
            Description = "A numerical representation of a specific moment in time.", 
            Optional = true
        }
    }, 
    ClientRun = function(_, v1) --[[ Line: 14 ]] --[[ Name: ClientRun ]]
        v1 = v1 or os.time();
        return (("%* %*"):format(os.date("%x", v1), (os.date("%X", v1))));
    end
};