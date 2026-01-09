local l_Players_0 = game:GetService("Players");
local v1 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    BackgroundColor3 = Color3.fromRGB(17, 17, 17), 
    BackgroundTransparency = 0.05, 
    BorderColor3 = Color3.fromRGB(17, 17, 17), 
    BorderSizePixel = 20, 
    ClearTextOnFocus = false, 
    MultiLine = true, 
    Position = UDim2.new(0.5, 0, 0.5, 0), 
    Size = UDim2.new(0.5, 0, 0.4, 0), 
    Font = Enum.Font.Code, 
    TextColor3 = Color3.fromRGB(241, 241, 241), 
    TextWrapped = true, 
    TextSize = 18, 
    TextXAlignment = "Left", 
    TextYAlignment = "Top", 
    AutoLocalize = false, 
    PlaceholderText = "Right click to exit"
};
local v2 = nil;
return {
    Name = "edit", 
    Aliases = {}, 
    Description = "Edit text in a TextBox", 
    Group = "DefaultUtil", 
    Args = {
        {
            Type = "string", 
            Name = "Input text", 
            Description = "The text you wish to edit", 
            Default = ""
        }, 
        {
            Type = "string", 
            Name = "Delimiter", 
            Description = "The character that separates each line", 
            Default = ","
        }
    }, 
    ClientRun = function(v3, v4, v5) --[[ Line: 45 ]] --[[ Name: ClientRun ]]
        -- upvalues: v2 (ref), v1 (copy), l_Players_0 (copy)
        v2 = v2 or v3.Cmdr.Util.Mutex();
        local v6 = v2();
        v3:Reply("Right-click on the text area to exit.", Color3.fromRGB(158, 158, 158));
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "CmdrEditBox";
        l_ScreenGui_0.ResetOnSpawn = false;
        local l_TextBox_0 = Instance.new("TextBox");
        for v9, v10 in pairs(v1) do
            l_TextBox_0[v9] = v10;
        end;
        l_TextBox_0.Text = v4:gsub(v5, "\n");
        l_TextBox_0.Parent = l_ScreenGui_0;
        l_ScreenGui_0.Parent = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
        local v11 = coroutine.running();
        l_TextBox_0.InputBegan:Connect(function(v12) --[[ Line: 69 ]]
            -- upvalues: v11 (copy), l_TextBox_0 (copy), v5 (copy), l_ScreenGui_0 (copy), v6 (copy)
            if v12.UserInputType == Enum.UserInputType.MouseButton2 then
                coroutine.resume(v11, l_TextBox_0.Text:gsub("\n", v5));
                l_ScreenGui_0:Destroy();
                v6();
            end;
        end);
        return coroutine.yield();
    end
};