return {
    Name = "echo", 
    Aliases = {
        "="
    }, 
    Description = "Echoes your text back to you.", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "string", 
            Name = "Text", 
            Description = "The text."
        }
    }, 
    ClientRun = function(_, v1) --[[ Line: 14 ]] --[[ Name: ClientRun ]]
        return v1;
    end
};