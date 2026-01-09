return {
    Name = "resolve", 
    Aliases = {}, 
    Description = "Resolves Argument Value Operators into lists. E.g., resolve players * gives you a list of all players.", 
    Group = "DefaultUtil", 
    AutoExec = {
        "alias \"me|Displays your username\" resolve players ."
    }, 
    Args = {
        {
            Type = "type", 
            Name = "Type", 
            Description = "The type for which to resolve"
        }, 
        function(v0) --[[ Line: 15 ]]
            if v0:GetArgument(1):Validate() == false then
                return;
            else
                return {
                    Type = v0:GetArgument(1):GetValue(), 
                    Name = "Argument Value Operator", 
                    Description = "The value operator to resolve. One of: * ** . ? ?N", 
                    Optional = true
                };
            end;
        end
    }, 
    ClientRun = function(v1) --[[ Line: 29 ]] --[[ Name: ClientRun ]]
        return table.concat(v1:GetArgument(2).RawSegments, ",");
    end
};