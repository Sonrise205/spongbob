local l_HttpService_0 = game:GetService("HttpService");
return {
    Name = "json-array-encode", 
    Aliases = {}, 
    Description = "Encodes a comma-separated list into a JSON array", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "string", 
            Name = "CSV", 
            Description = "The comma-separated list"
        }
    }, 
    ClientRun = function(_, v2) --[[ Line: 16 ]] --[[ Name: ClientRun ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:JSONEncode(v2:split(","));
    end
};