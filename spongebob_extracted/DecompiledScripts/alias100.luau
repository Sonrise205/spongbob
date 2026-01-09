return {
    Name = "alias", 
    Aliases = {}, 
    Description = "Creates a new, single command out of a command and given arguments.", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "string", 
            Name = "Alias name", 
            Description = "The key or input type you'd like to bind the command to."
        }, 
        {
            Type = "string", 
            Name = "Command string", 
            Description = "The command text you want to run. Separate multiple commands with \"&&\". Accept arguments with $1, $2, $3, etc."
        }
    }, 
    ClientRun = function(v0, v1, v2) --[[ Line: 19 ]] --[[ Name: ClientRun ]]
        v0.Cmdr.Registry:RegisterCommandObject(v0.Cmdr.Util.MakeAliasCommand(v1, v2), true);
        return ("Created alias %q"):format(v1);
    end
};