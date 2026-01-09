local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v4 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.MouseButton2, 
    Enum.UserInputType.Touch
};
local v5 = {
    Valid = true, 
    AutoComplete = nil, 
    ProcessEntry = nil, 
    OnTextChanged = nil, 
    Cmdr = nil, 
    HistoryState = nil
};
local l_Frame_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Cmdr"):WaitForChild("Frame");
local l_Line_0 = l_Frame_0:WaitForChild("Line");
local l_Entry_0 = l_Frame_0:WaitForChild("Entry");
l_Line_0.Parent = nil;
v5.UpdateLabel = function(v9) --[[ Line: 28 ]] --[[ Name: UpdateLabel ]]
    -- upvalues: l_Entry_0 (copy), l_LocalPlayer_0 (copy)
    l_Entry_0.TextLabel.Text = l_LocalPlayer_0.Name .. "@" .. v9.Cmdr.PlaceName .. "$";
end;
v5.GetLabel = function(_) --[[ Line: 33 ]] --[[ Name: GetLabel ]]
    -- upvalues: l_Entry_0 (copy)
    return l_Entry_0.TextLabel.Text;
end;
v5.UpdateWindowHeight = function(_) --[[ Line: 38 ]] --[[ Name: UpdateWindowHeight ]]
    -- upvalues: l_Frame_0 (copy)
    local v12 = l_Frame_0.UIListLayout.AbsoluteContentSize.Y + l_Frame_0.UIPadding.PaddingTop.Offset + l_Frame_0.UIPadding.PaddingBottom.Offset;
    l_Frame_0.Size = UDim2.new(l_Frame_0.Size.X.Scale, l_Frame_0.Size.X.Offset, 0, (math.clamp(v12, 0, 300)));
    l_Frame_0.CanvasPosition = Vector2.new(0, v12);
end;
v5.AddLine = function(v13, v14, v15) --[[ Line: 47 ]] --[[ Name: AddLine ]]
    -- upvalues: v5 (copy), l_Line_0 (copy), l_Frame_0 (copy)
    v15 = v15 or {};
    v14 = tostring(v14);
    if typeof(v15) == "Color3" then
        v15 = {
            Color = v15
        };
    end;
    if #v14 == 0 then
        v5:UpdateWindowHeight();
        return;
    else
        local v16 = v13.Cmdr.Util.EmulateTabstops(v14 or "nil", 8);
        local v17 = l_Line_0:Clone();
        v17.Text = v16;
        v17.TextColor3 = v15.Color or v17.TextColor3;
        v17.RichText = v15.RichText or false;
        v17.Parent = l_Frame_0;
        return;
    end;
end;
v5.IsVisible = function(_) --[[ Line: 70 ]] --[[ Name: IsVisible ]]
    -- upvalues: l_Frame_0 (copy)
    return l_Frame_0.Visible;
end;
v5.SetVisible = function(v19, v20) --[[ Line: 75 ]] --[[ Name: SetVisible ]]
    -- upvalues: l_Frame_0 (copy), l_TextChatService_0 (copy), l_Entry_0 (copy), l_UserInputService_0 (copy)
    l_Frame_0.Visible = v20;
    if v20 then
        v19.PreviousChatWindowConfigurationEnabled = l_TextChatService_0.ChatWindowConfiguration.Enabled;
        v19.PreviousChatInputBarConfigurationEnabled = l_TextChatService_0.ChatInputBarConfiguration.Enabled;
        l_TextChatService_0.ChatWindowConfiguration.Enabled = false;
        l_TextChatService_0.ChatInputBarConfiguration.Enabled = false;
        l_Entry_0.TextBox:CaptureFocus();
        v19:SetEntryText("");
        if v19.Cmdr.ActivationUnlocksMouse then
            v19.PreviousMouseBehavior = l_UserInputService_0.MouseBehavior;
            l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
            return;
        end;
    else
        l_TextChatService_0.ChatWindowConfiguration.Enabled = v19.PreviousChatWindowConfigurationEnabled == nil or v19.PreviousChatWindowConfigurationEnabled;
        l_TextChatService_0.ChatInputBarConfiguration.Enabled = v19.PreviousChatInputBarConfigurationEnabled == nil or v19.PreviousChatInputBarConfigurationEnabled;
        l_Entry_0.TextBox:ReleaseFocus();
        v19.AutoComplete:Hide();
        if v19.PreviousMouseBehavior then
            l_UserInputService_0.MouseBehavior = v19.PreviousMouseBehavior;
            v19.PreviousMouseBehavior = nil;
        end;
    end;
end;
v5.Hide = function(v21) --[[ Line: 111 ]] --[[ Name: Hide ]]
    return v21:SetVisible(false);
end;
v5.Show = function(v22) --[[ Line: 116 ]] --[[ Name: Show ]]
    return v22:SetVisible(true);
end;
v5.SetEntryText = function(v23, v24) --[[ Line: 121 ]] --[[ Name: SetEntryText ]]
    -- upvalues: l_Entry_0 (copy), v5 (copy)
    l_Entry_0.TextBox.Text = v24;
    if v23:IsVisible() then
        l_Entry_0.TextBox:CaptureFocus();
        l_Entry_0.TextBox.CursorPosition = #v24 + 1;
        v5:UpdateWindowHeight();
    end;
end;
v5.GetEntryText = function(_) --[[ Line: 132 ]] --[[ Name: GetEntryText ]]
    -- upvalues: l_Entry_0 (copy)
    return l_Entry_0.TextBox.Text:gsub("\t", "");
end;
v5.SetIsValidInput = function(v26, v27, v28) --[[ Line: 138 ]] --[[ Name: SetIsValidInput ]]
    -- upvalues: l_Entry_0 (copy)
    l_Entry_0.TextBox.TextColor3 = v27 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 73, 73);
    v26.Valid = v27;
    v26._errorText = v28;
end;
v5.HideInvalidState = function(_) --[[ Line: 144 ]] --[[ Name: HideInvalidState ]]
    -- upvalues: l_Entry_0 (copy)
    l_Entry_0.TextBox.TextColor3 = Color3.fromRGB(255, 255, 255);
end;
v5.LoseFocus = function(v30, v31) --[[ Line: 149 ]] --[[ Name: LoseFocus ]]
    -- upvalues: l_Entry_0 (copy), l_Frame_0 (copy), l_GuiService_0 (copy)
    local l_Text_0 = l_Entry_0.TextBox.Text;
    v30:ClearHistoryState();
    if l_Frame_0.Visible and not l_GuiService_0.MenuIsOpen then
        l_Entry_0.TextBox:CaptureFocus();
    elseif l_GuiService_0.MenuIsOpen and l_Frame_0.Visible then
        v30:Hide();
    end;
    if v31 and v30.Valid then
        wait();
        v30:SetEntryText("");
        v30.ProcessEntry(l_Text_0);
        return;
    else
        if v31 then
            v30:AddLine(v30._errorText, Color3.fromRGB(255, 153, 153));
        end;
        return;
    end;
end;
v5.TraverseHistory = function(v33, v34) --[[ Line: 170 ]] --[[ Name: TraverseHistory ]]
    local l_History_0 = v33.Cmdr.Dispatcher:GetHistory();
    if v33.HistoryState == nil then
        v33.HistoryState = {
            Position = #l_History_0 + 1, 
            InitialText = v33:GetEntryText()
        };
    end;
    v33.HistoryState.Position = math.clamp(v33.HistoryState.Position + v34, 1, #l_History_0 + 1);
    v33:SetEntryText(v33.HistoryState.Position == #l_History_0 + 1 and v33.HistoryState.InitialText or l_History_0[v33.HistoryState.Position]);
end;
v5.ClearHistoryState = function(v36) --[[ Line: 188 ]] --[[ Name: ClearHistoryState ]]
    v36.HistoryState = nil;
end;
v5.SelectVertical = function(v37, v38) --[[ Line: 192 ]] --[[ Name: SelectVertical ]]
    if v37.AutoComplete:IsVisible() and not v37.HistoryState then
        v37.AutoComplete:Select(v38);
        return;
    else
        v37:TraverseHistory(v38);
        return;
    end;
end;
local v39 = 0;
local v40 = 0;
v5.BeginInput = function(v41, v42, v43) --[[ Line: 203 ]] --[[ Name: BeginInput ]]
    -- upvalues: l_GuiService_0 (copy), v39 (ref), v40 (ref), v4 (copy), l_Frame_0 (copy)
    if l_GuiService_0.MenuIsOpen then
        v41:Hide();
    end;
    if v43 and v41:IsVisible() == false then
        return;
    elseif v41.Cmdr.ActivationKeys[v42.KeyCode] then
        if v41.Cmdr.MashToEnable and not v41.Cmdr.Enabled then
            if tick() - v39 < 1 then
                if v40 >= 5 then
                    return v41.Cmdr:SetEnabled(true);
                else
                    v40 = v40 + 1;
                end;
            else
                v40 = 1;
            end;
            v39 = tick();
            return;
        else
            if v41.Cmdr.Enabled then
                v41:SetVisible(not v41:IsVisible());
                wait();
                v41:SetEntryText("");
                if l_GuiService_0.MenuIsOpen then
                    v41:Hide();
                end;
            end;
            return;
        end;
    elseif v41.Cmdr.Enabled == false or not v41:IsVisible() then
        if v41:IsVisible() then
            v41:Hide();
        end;
        return;
    else
        if v41.Cmdr.HideOnLostFocus and table.find(v4, v42.UserInputType) then
            local l_Position_0 = v42.Position;
            local l_AbsolutePosition_0 = l_Frame_0.AbsolutePosition;
            local l_AbsoluteSize_0 = l_Frame_0.AbsoluteSize;
            if l_Position_0.X < l_AbsolutePosition_0.X or l_Position_0.X > l_AbsolutePosition_0.X + l_AbsoluteSize_0.X or l_Position_0.Y < l_AbsolutePosition_0.Y or l_Position_0.Y > l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                v41:Hide();
                return;
            end;
        elseif v42.KeyCode == Enum.KeyCode.Down then
            v41:SelectVertical(1);
            return;
        elseif v42.KeyCode == Enum.KeyCode.Up then
            v41:SelectVertical(-1);
            return;
        elseif v42.KeyCode == Enum.KeyCode.Return then
            wait();
            v41:SetEntryText(v41:GetEntryText():gsub("\n", ""):gsub("\r", ""));
            return;
        elseif v42.KeyCode == Enum.KeyCode.Tab then
            local l_SelectedItem_0 = v41.AutoComplete:GetSelectedItem();
            local l_v41_EntryText_0 = v41:GetEntryText();
            if l_SelectedItem_0 and (not l_v41_EntryText_0:sub(#l_v41_EntryText_0, #l_v41_EntryText_0):match("%s") or not v41.AutoComplete.LastItem) then
                local v49 = l_SelectedItem_0[2];
                local v50 = nil;
                local v51 = true;
                local l_Command_0 = v41.AutoComplete.Command;
                if l_Command_0 then
                    local l_Arg_0 = v41.AutoComplete.Arg;
                    v50 = l_Command_0.Alias;
                    local v54 = false;
                    if v41.AutoComplete.NumArgs ~= #l_Command_0.ArgumentDefinitions then
                        v54 = v41.AutoComplete.IsPartial == false;
                    end;
                    v51 = v54;
                    v54 = l_Command_0.Arguments;
                    for v55 = 1, #v54 do
                        local v56 = v54[v55];
                        local l_RawSegments_0 = v56.RawSegments;
                        if v56 == l_Arg_0 then
                            l_RawSegments_0[#l_RawSegments_0] = v49;
                        end;
                        local v58 = v56.Prefix .. table.concat(l_RawSegments_0, ",");
                        if v58:find(" ") or v58 == "" then
                            v58 = ("%q"):format(v58);
                        end;
                        v50 = ("%s %s"):format(v50, v58);
                        if v56 == l_Arg_0 then
                            break;
                        end;
                    end;
                else
                    v50 = v49;
                end;
                wait();
                v41:SetEntryText(v50 .. (v51 and " " or ""));
                return;
            else
                wait();
                v41:SetEntryText(v41:GetEntryText());
                return;
            end;
        else
            v41:ClearHistoryState();
        end;
        return;
    end;
end;
l_Entry_0.TextBox.FocusLost:Connect(function(v59) --[[ Line: 314 ]]
    -- upvalues: v5 (copy)
    return v5:LoseFocus(v59);
end);
l_UserInputService_0.InputBegan:Connect(function(v60, v61) --[[ Line: 318 ]]
    -- upvalues: v5 (copy)
    return v5:BeginInput(v60, v61);
end);
l_Entry_0.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 322 ]]
    -- upvalues: l_Frame_0 (copy), l_Entry_0 (copy), v5 (copy)
    l_Frame_0.CanvasPosition = Vector2.new(0, l_Frame_0.AbsoluteCanvasSize.Y);
    if l_Entry_0.TextBox.Text:match("\t") then
        l_Entry_0.TextBox.Text = l_Entry_0.TextBox.Text:gsub("\t", "");
        return;
    elseif v5.OnTextChanged then
        return v5.OnTextChanged(l_Entry_0.TextBox.Text);
    else
        return;
    end;
end);
l_Frame_0.ChildAdded:Connect(function() --[[ Line: 334 ]]
    -- upvalues: v5 (copy)
    task.defer(v5.UpdateWindowHeight);
end);
return v5;