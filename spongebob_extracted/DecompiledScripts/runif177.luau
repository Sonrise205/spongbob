local v2 = {
    startsWith = function(v0, v1) --[[ Line: 2 ]] --[[ Name: startsWith ]]
        if v0:sub(1, #v1) == v1 then
            return v0:sub(#v1 + 1);
        else
            return;
        end;
    end
};
return {
    Name = "runif", 
    Aliases = {}, 
    Description = "Runs a given command string if a certain condition is met.", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "conditionFunction", 
            Name = "Condition", 
            Description = "The condition function"
        }, 
        {
            Type = "string", 
            Name = "Argument", 
            Description = "The argument to the condition function"
        }, 
        {
            Type = "string", 
            Name = "Test against", 
            Description = "The text to test against."
        }, 
        {
            Type = "string", 
            Name = "Command", 
            Description = "The command string to run if requirements are met. If omitted, return value from condition function is used.", 
            Optional = true
        }
    }, 
    ClientRun = function(v3, v4, v5, v6, v7) --[[ Line: 38 ]] --[[ Name: ClientRun ]]
        -- upvalues: v2 (copy)
        local v8 = v2[v4];
        if not v8 then
            return ("Condition %q is not valid."):format(v4);
        else
            local v9 = v8(v6, v5);
            if v9 then
                return v3.Dispatcher:EvaluateAndRun(v3.Cmdr.Util.RunEmbeddedCommands(v3.Dispatcher, v7 or v9));
            else
                return "";
            end;
        end;
    end
};