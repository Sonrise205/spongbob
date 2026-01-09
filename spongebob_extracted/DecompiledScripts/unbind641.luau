return {
    Name = "unbind", 
    Aliases = {}, 
    Description = "Unbinds an input previously bound with Bind", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "userInput ! bindableResource @ player", 
            Name = "Input/Key", 
            Description = "The key or input type you'd like to unbind."
        }
    }, 
    ClientRun = function(v0, v1) --[[ Line: 14 ]] --[[ Name: ClientRun ]]
        local l_v0_Store_0 = v0:GetStore("CMDR_Binds");
        if l_v0_Store_0[v1] then
            l_v0_Store_0[v1]:Disconnect();
            l_v0_Store_0[v1] = nil;
            return "Unbound command from input.";
        else
            return "That input wasn't bound.";
        end;
    end
};