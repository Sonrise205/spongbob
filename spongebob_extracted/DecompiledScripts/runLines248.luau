return {
    Name = "run-lines", 
    Aliases = {}, 
    Description = "Splits input by newlines and runs each line as its own command. This is used by the init-run command.", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "string", 
            Name = "Script", 
            Description = "The script to parse.", 
            Default = ""
        }
    }, 
    ClientRun = function(v0, v1) --[[ Line: 15 ]] --[[ Name: ClientRun ]]
        if #v1 == 0 then
            return "";
        else
            local v2 = v0.Dispatcher:Run("var", "INIT_PRINT_OUTPUT") ~= "";
            local v3 = v1:gsub("\n+", "\n"):split("\n");
            for _, v5 in ipairs(v3) do
                if v5:sub(1, 1) ~= "#" then
                    local v6 = v0.Dispatcher:EvaluateAndRun(v5);
                    if v2 then
                        v0:Reply(v6);
                    end;
                end;
            end;
            return "";
        end;
    end
};