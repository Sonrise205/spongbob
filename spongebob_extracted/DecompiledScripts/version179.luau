return {
    Name = "version", 
    Args = {}, 
    Description = "Shows the current version of Cmdr", 
    Group = "DefaultDebug", 
    ClientRun = function() --[[ Line: 9 ]] --[[ Name: ClientRun ]]
        return ("Cmdr Version %s"):format("v1.12.0");
    end
};