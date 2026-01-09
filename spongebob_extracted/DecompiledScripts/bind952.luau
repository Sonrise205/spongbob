local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextChatService_0 = game:GetService("TextChatService");
return {
    Name = "bind", 
    Aliases = {}, 
    Description = "Binds a command string to a key or mouse input.", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "userInput ! bindableResource @ player", 
            Name = "Input", 
            Description = "The key or input type you'd like to bind the command to."
        }, 
        {
            Type = "command", 
            Name = "Command", 
            Description = "The command you want to run on this input"
        }, 
        {
            Type = "string", 
            Name = "Arguments", 
            Description = "The arguments for the command", 
            Default = ""
        }
    }, 
    ClientRun = function(v2, v3, v4, v5) --[[ Line: 28 ]] --[[ Name: ClientRun ]]
        -- upvalues: l_UserInputService_0 (copy), l_TextChatService_0 (copy)
        local l_v2_Store_0 = v2:GetStore("CMDR_Binds");
        v4 = v4 .. " " .. v5;
        if l_v2_Store_0[v3] then
            l_v2_Store_0[v3]:Disconnect();
        end;
        local l_Name_0 = v2:GetArgument(1).Type.Name;
        if l_Name_0 == "userInput" then
            l_v2_Store_0[v3] = l_UserInputService_0.InputBegan:Connect(function(v8, v9) --[[ Line: 40 ]]
                -- upvalues: v3 (copy), v2 (copy), v4 (ref)
                if v9 then
                    return;
                else
                    if v8.UserInputType == v3 or v8.KeyCode == v3 then
                        v2:Reply(v2.Dispatcher:EvaluateAndRun(v2.Cmdr.Util.RunEmbeddedCommands(v2.Dispatcher, v4)));
                    end;
                    return;
                end;
            end);
        elseif l_Name_0 == "bindableResource" then
            return "Unimplemented...";
        elseif l_Name_0 == "player" then
            local function v12(v10) --[[ Line: 56 ]] --[[ Name: RunCommand ]]
                -- upvalues: v2 (copy), v4 (ref), v3 (copy)
                local v11 = v2.Cmdr.Util.RunEmbeddedCommands(v2.Dispatcher, v2.Cmdr.Util.SubstituteArgs(v4, {
                    v10
                }));
                v2:Reply(("%s $ %s : %s"):format(v3.Name, v11, v2.Dispatcher:EvaluateAndRun(v11)), Color3.fromRGB(244, 92, 66));
            end;
            if l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService then
                l_v2_Store_0[v3] = v3.Chatted:Connect(v12);
            else
                l_v2_Store_0[v3] = l_TextChatService_0.SendingMessage:Connect(function(v13) --[[ Line: 71 ]]
                    -- upvalues: v12 (copy)
                    v12(v13.Text);
                end);
            end;
        end;
        return "Bound command to input.";
    end
};