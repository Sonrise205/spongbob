return {
    Name = "history", 
    Aliases = {}, 
    AutoExec = {
        "alias \"!|Displays previous command from history.\" run ${history $1{number|Line Number}}", 
        "alias \"^|Runs the previous command, replacing all occurrences of A with B.\" run ${run replace ${history -1} $1{string|A} $2{string|B}}", 
        "alias \"!!|Reruns the last command.\" ! -1"
    }, 
    Description = "Displays previous commands from history.", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "integer", 
            Name = "Line Number", 
            Description = "Command line number (can be negative to go from end)"
        }
    }, 
    ClientRun = function(v0, v1) --[[ Line: 19 ]] --[[ Name: ClientRun ]]
        local l_History_0 = v0.Dispatcher:GetHistory();
        if v1 <= 0 then
            v1 = #l_History_0 + v1;
        end;
        return l_History_0[v1] or "";
    end
};