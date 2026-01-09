local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextChatService_0 = game:GetService("TextChatService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = v5.CreateController({
    Name = "VirtualCursorController"
});
local v7 = nil;
local function v11(_, v9, _) --[[ Line: 26 ]] --[[ Name: toggleVirtualCursor ]]
    -- upvalues: l_GamepadService_0 (copy), l_GuiService_0 (copy)
    if v9 ~= Enum.UserInputState.Begin then
        return;
    elseif l_GamepadService_0.GamepadCursorEnabled == true then
        l_GamepadService_0:DisableGamepadCursor();
        l_GuiService_0.SelectedObject = nil;
        return;
    else
        if l_GamepadService_0.GamepadCursorEnabled == false then
            l_GamepadService_0:EnableGamepadCursor(nil);
        end;
        return;
    end;
end;
v6.KnitInit = function(_) --[[ Line: 41 ]] --[[ Name: KnitInit ]]
    -- upvalues: v7 (ref), v5 (copy)
    v7 = v5.GetController("DeviceTypeController");
end;
v6.KnitStart = function(_) --[[ Line: 45 ]] --[[ Name: KnitStart ]]
    -- upvalues: l_GuiService_0 (copy), l_ContextActionService_0 (copy), v11 (copy), v7 (ref), l_TextChatService_0 (copy)
    l_GuiService_0.AutoSelectGuiEnabled = false;
    l_ContextActionService_0:BindAction("ToggleVirtualCursor", v11, false, Enum.KeyCode.ButtonSelect);
    if v7:IsConsole() then
        local l_ChatWindowConfiguration_0 = l_TextChatService_0:WaitForChild("ChatWindowConfiguration");
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:WaitForChild("ChatInputBarConfiguration");
        l_ChatWindowConfiguration_0.TextSize = 20;
        l_ChatInputBarConfiguration_0.TextSize = 20;
        l_ChatWindowConfiguration_0.HeightScale = 0.5;
        l_ChatWindowConfiguration_0.WidthScale = 0.7;
        l_ChatWindowConfiguration_0.BackgroundTransparency = 0.7;
    end;
end;
return v6;