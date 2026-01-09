return {
    Name = "json-array-decode", 
    Aliases = {}, 
    Description = "Decodes a JSON Array into a comma-separated list", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "json", 
            Name = "JSON", 
            Description = "The JSON array."
        }
    }, 
    ClientRun = function(_, v1) --[[ Line: 14 ]] --[[ Name: ClientRun ]]
        if type(v1) ~= "table" then
            v1 = {
                v1
            };
        end;
        return table.concat(v1, ",");
    end
};