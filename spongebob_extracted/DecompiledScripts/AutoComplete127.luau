local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
return function(v1) --[[ Line: 4 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v2 = {
        Items = {}, 
        ItemOptions = {}, 
        SelectedItem = 0
    };
    local l_Util_0 = v1.Util;
    local l_Autocomplete_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Cmdr"):WaitForChild("Autocomplete");
    local l_TextButton_0 = l_Autocomplete_0:WaitForChild("TextButton");
    local l_Title_0 = l_Autocomplete_0:WaitForChild("Title");
    local l_Description_0 = l_Autocomplete_0:WaitForChild("Description");
    local l_Entry_0 = l_Autocomplete_0.Parent:WaitForChild("Frame"):WaitForChild("Entry");
    l_TextButton_0.Parent = nil;
    local l_ScrollBarThickness_0 = l_Autocomplete_0.ScrollBarThickness;
    local function v14(v10, v11, v12, v13) --[[ Line: 23 ]] --[[ Name: SetText ]]
        -- upvalues: l_Util_0 (copy)
        v10.Visible = v12 ~= nil;
        v11.Text = v12 or "";
        if v13 then
            v11.Size = UDim2.new(0, l_Util_0.GetTextSize(v12 or "", v11, Vector2.new(1000, 1000), 1, 0).X, v10.Size.Y.Scale, v10.Size.Y.Offset);
        end;
    end;
    local function v15() --[[ Line: 37 ]] --[[ Name: UpdateContainerSize ]]
        -- upvalues: l_Autocomplete_0 (copy), l_Title_0 (copy)
        l_Autocomplete_0.Size = UDim2.new(0, math.max(l_Title_0.Field.TextBounds.X + l_Title_0.Field.Type.TextBounds.X, l_Autocomplete_0.Size.X.Offset), 0, (math.min(l_Autocomplete_0.UIListLayout.AbsoluteContentSize.Y, l_Autocomplete_0.Parent.AbsoluteSize.Y - l_Autocomplete_0.AbsolutePosition.Y - 10)));
    end;
    local function v17(v16) --[[ Line: 47 ]] --[[ Name: UpdateInfoDisplay ]]
        -- upvalues: v14 (copy), l_Title_0 (copy), l_Description_0 (copy), l_Autocomplete_0 (copy), v15 (copy), l_ScrollBarThickness_0 (copy)
        v14(l_Title_0, l_Title_0.Field, v16.name, true);
        v14(l_Title_0.Field.Type, l_Title_0.Field.Type, v16.type and ": " .. v16.type:sub(1, 1):upper() .. v16.type:sub(2));
        v14(l_Description_0, l_Description_0.Label, v16.description);
        l_Description_0.Label.TextColor3 = v16.invalid and Color3.fromRGB(255, 73, 73) or Color3.fromRGB(255, 255, 255);
        l_Description_0.Size = UDim2.new(1, 0, 0, 40);
        while not l_Description_0.Label.TextFits do
            l_Description_0.Size = l_Description_0.Size + UDim2.new(0, 0, 0, 2);
            if l_Description_0.Size.Y.Offset > 500 then
                break;
            end;
        end;
        task.wait();
        l_Autocomplete_0.UIListLayout:ApplyLayout();
        v15();
        l_Autocomplete_0.ScrollBarThickness = l_ScrollBarThickness_0;
    end;
    v2.Show = function(v18, v19, v20) --[[ Line: 87 ]] --[[ Name: Show ]]
        -- upvalues: l_Autocomplete_0 (copy), l_TextButton_0 (copy), l_Entry_0 (copy), l_Util_0 (copy), v17 (copy)
        v20 = v20 or {};
        for _, v22 in pairs(v18.Items) do
            if v22.gui then
                v22.gui:Destroy();
            end;
        end;
        v18.SelectedItem = 1;
        v18.Items = v19;
        v18.Prefix = v20.prefix or "";
        v18.LastItem = v20.isLast or false;
        v18.Command = v20.command;
        v18.Arg = v20.arg;
        v18.NumArgs = v20.numArgs;
        v18.IsPartial = v20.isPartial;
        local v23 = 200;
        l_Autocomplete_0.ScrollBarThickness = 0;
        for v24, v25 in pairs(v18.Items) do
            local v26 = v25[1];
            local v27 = v25[2];
            local v28 = l_TextButton_0:Clone();
            v28.Name = v26 .. v27;
            v28.BackgroundTransparency = v24 == v18.SelectedItem and 0.5 or 1;
            local v29, v30 = string.find(v27:lower(), v26:lower(), 1, true);
            if v29 == nil and v30 == nil then
                v29 = 1;
                v30 = string.len(v27);
            end;
            v28.Typed.Text = string.rep(" ", v29 - 1) .. v26;
            v28.Suggest.Text = string.sub(v27, 0, v29 - 1) .. string.rep(" ", #v26) .. string.sub(v27, v30 + 1);
            v28.Parent = l_Autocomplete_0;
            v28.LayoutOrder = v24;
            local v31 = math.max(v28.Typed.TextBounds.X, v28.Suggest.TextBounds.X) + 20;
            if v23 < v31 then
                v23 = v31;
            end;
            v25.gui = v28;
        end;
        l_Autocomplete_0.UIListLayout:ApplyLayout();
        local l_Text_0 = l_Entry_0.TextBox.Text;
        local v33 = l_Util_0.SplitString(l_Text_0);
        if l_Text_0:sub(#l_Text_0, #l_Text_0) == " " and not v20.at then
            v33[#v33 + 1] = "e";
        end;
        table.remove(v33, #v33);
        local v34 = (v20.at and v20.at or #table.concat(v33, " ") + 1) * 7;
        l_Autocomplete_0.Position = UDim2.new(0, l_Entry_0.TextBox.AbsolutePosition.X - 10 + v34, 0, l_Entry_0.TextBox.AbsolutePosition.Y + 30);
        l_Autocomplete_0.Size = UDim2.new(0, v23, 0, l_Autocomplete_0.UIListLayout.AbsoluteContentSize.Y);
        l_Autocomplete_0.Visible = true;
        v17(v18.Items[1] and v18.Items[1].options or v20);
    end;
    v2.GetSelectedItem = function(_) --[[ Line: 164 ]] --[[ Name: GetSelectedItem ]]
        -- upvalues: l_Autocomplete_0 (copy), v2 (copy)
        if l_Autocomplete_0.Visible == false then
            return nil;
        else
            return v2.Items[v2.SelectedItem];
        end;
    end;
    v2.Hide = function(_) --[[ Line: 173 ]] --[[ Name: Hide ]]
        -- upvalues: l_Autocomplete_0 (copy)
        l_Autocomplete_0.Visible = false;
    end;
    v2.IsVisible = function(_) --[[ Line: 178 ]] --[[ Name: IsVisible ]]
        -- upvalues: l_Autocomplete_0 (copy)
        return l_Autocomplete_0.Visible;
    end;
    v2.Select = function(v38, v39) --[[ Line: 183 ]] --[[ Name: Select ]]
        -- upvalues: l_Autocomplete_0 (copy), l_Title_0 (copy), l_Description_0 (copy), l_TextButton_0 (copy), v17 (copy)
        if not l_Autocomplete_0.Visible then
            return;
        else
            v38.SelectedItem = v38.SelectedItem + v39;
            if v38.SelectedItem > #v38.Items then
                v38.SelectedItem = 1;
            elseif v38.SelectedItem < 1 then
                v38.SelectedItem = #v38.Items;
            end;
            for v40, v41 in pairs(v38.Items) do
                v41.gui.BackgroundTransparency = v40 == v38.SelectedItem and 0.5 or 1;
            end;
            l_Autocomplete_0.CanvasPosition = Vector2.new(0, (math.max(0, l_Title_0.Size.Y.Offset + l_Description_0.Size.Y.Offset + v38.SelectedItem * l_TextButton_0.Size.Y.Offset - l_Autocomplete_0.Size.Y.Offset)));
            if v38.Items[v38.SelectedItem] and v38.Items[v38.SelectedItem].options then
                v17(v38.Items[v38.SelectedItem].options or {});
            end;
            return;
        end;
    end;
    l_Autocomplete_0.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(v15);
    return v2;
end;