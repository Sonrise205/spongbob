return {
    Name = "help", 
    Aliases = {
        "cmds", 
        "commands"
    }, 
    Description = "Displays a list of all commands, or inspects one command.", 
    Group = "Help", 
    Args = {
        {
            Type = "command", 
            Name = "Command", 
            Description = "The command to view information on", 
            Optional = true
        }
    }, 
    ClientRun = function(v0, v1) --[[ Line: 32 ]] --[[ Name: ClientRun ]]
        if v1 then
            local l_Command_0 = v0.Cmdr.Registry:GetCommand(v1);
            v0:Reply(("Command: %*"):format(l_Command_0.Name), Color3.fromRGB(230, 126, 34));
            if l_Command_0.Aliases and #l_Command_0.Aliases > 0 then
                v0:Reply(("Aliases: %*"):format((table.concat(l_Command_0.Aliases, ", "))), Color3.fromRGB(230, 230, 230));
            end;
            if l_Command_0.Description then
                v0:Reply(("Description: %*"):format(l_Command_0.Description), Color3.fromRGB(230, 230, 230));
            end;
            if l_Command_0.Group then
                v0:Reply(("Group: %*"):format(l_Command_0.Group), Color3.fromRGB(230, 230, 230));
            end;
            if l_Command_0.Args then
                for v3, v4 in ipairs(l_Command_0.Args) do
                    v0:Reply((("#%* %*"):format(v3, if type(v4) == "table" then ("%*%*: %* - %*"):format(v4.Name, v4.Optional == true and "?" or "", v4.Type, v4.Description) else "Unknown (inline argument)")));
                end;
            end;
        else
            v0:Reply("Argument Shorthands\n-------------------\n.   Me/Self\n*   All/Everyone\n**  Others\n?   Random\n?N  List of N random values\n");
            v0:Reply("Tips\n----\n\226\128\162 Utilize the Tab key to automatically complete commands\n\226\128\162 Easily select and copy command output\n");
            local l_Commands_0 = v0.Cmdr.Registry:GetCommands();
            table.sort(l_Commands_0, function(v6, v7) --[[ Line: 59 ]]
                if v6.Group and v7.Group then
                    return v6.Group < v7.Group;
                else
                    return v6.Group;
                end;
            end);
            local v8 = nil;
            for _, v10 in ipairs(l_Commands_0) do
                local v11 = v10.Group or "No Group";
                if v8 ~= v11 then
                    v0:Reply((("\n%*\n%*"):format(v11, (string.rep("-", #v11)))));
                    v8 = v11;
                end;
                v0:Reply(if v10.Description then ("%* - %*"):format(v10.Name, v10.Description) else v10.Name);
            end;
        end;
        return "";
    end
};