local l_UserInputService_0 = game:GetService("UserInputService");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_TweenService_0 = game:GetService("TweenService");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local v6 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
local v7 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v8 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12"
};
local function _() --[[ Line: 46 ]] --[[ Name: getScreenGui ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local l_ProximityPrompts_0 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = l_PlayerGui_0;
    end;
    return l_ProximityPrompts_0;
end;
local function _(v11) --[[ Line: 57 ]] --[[ Name: setUpCircularProgressBar ]]
    local l_UIGradient_0 = v11.LeftGradient.ProgressBarImage.UIGradient;
    local l_UIGradient_1 = v11.RightGradient.ProgressBarImage.UIGradient;
    v11.Progress.Changed:Connect(function(v14) --[[ Line: 62 ]]
        -- upvalues: l_UIGradient_0 (copy), l_UIGradient_1 (copy)
        local v15 = math.clamp(v14 * 360, 0, 360);
        l_UIGradient_0.Rotation = math.clamp(v15, 180, 360);
        l_UIGradient_1.Rotation = math.clamp(v15, 0, 180);
    end);
end;
local function v127(v17, v18, v19) --[[ Line: 69 ]] --[[ Name: createPrompt ]]
    -- upvalues: l_TweenService_0 (copy), l_UserInputService_0 (copy), v6 (copy), v7 (copy), v8 (copy), l_TextService_0 (copy)
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = TweenInfo.new(v17.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v26 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v27 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v28 = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v29 = nil;
    local l_v17_Attribute_0 = v17:GetAttribute("Theme");
    if l_v17_Attribute_0 then
        local l_script_FirstChild_0 = script:FindFirstChild(l_v17_Attribute_0);
        if l_script_FirstChild_0 then
            v29 = l_script_FirstChild_0:Clone();
        end;
    end;
    if v29 == nil then
        v29 = script.Default:Clone();
    end;
    v29.Enabled = true;
    local l_PromptFrame_0 = v29.PromptFrame;
    local l_InputFrame_0 = l_PromptFrame_0.InputFrame;
    local l_ActionText_0 = l_PromptFrame_0.ActionText;
    local l_ObjectText_0 = l_PromptFrame_0.ObjectText;
    local l_BackgroundTransparency_0 = l_PromptFrame_0.BackgroundTransparency;
    local l_ImageTransparency_0 = l_PromptFrame_0.ImageTransparency;
    l_PromptFrame_0.BackgroundTransparency = 1;
    l_PromptFrame_0.ImageTransparency = 1;
    table.insert(v20, l_TweenService_0:Create(l_PromptFrame_0, v26, {
        Size = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }));
    table.insert(v21, l_TweenService_0:Create(l_PromptFrame_0, v26, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        ImageTransparency = l_ImageTransparency_0
    }));
    table.insert(v22, l_TweenService_0:Create(l_PromptFrame_0, v26, {
        Size = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }));
    table.insert(v23, l_TweenService_0:Create(l_PromptFrame_0, v26, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        ImageTransparency = l_ImageTransparency_0
    }));
    local function v40(v38) --[[ Line: 112 ]] --[[ Name: setupUIStrokeTweens ]]
        -- upvalues: v20 (copy), l_TweenService_0 (ref), v26 (copy), v21 (copy), v22 (copy), v23 (copy)
        local l_Transparency_0 = v38.Transparency;
        v38.Transparency = 1;
        table.insert(v20, l_TweenService_0:Create(v38, v26, {
            Transparency = 1
        }));
        table.insert(v21, l_TweenService_0:Create(v38, v26, {
            Transparency = l_Transparency_0
        }));
        table.insert(v22, l_TweenService_0:Create(v38, v26, {
            Transparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(v38, v26, {
            Transparency = l_Transparency_0
        }));
    end;
    local function v43(v41) --[[ Line: 121 ]] --[[ Name: setupGUIObjectTweens ]]
        -- upvalues: v20 (copy), l_TweenService_0 (ref), v26 (copy), v21 (copy), v22 (copy), v23 (copy)
        local l_BackgroundTransparency_1 = v41.BackgroundTransparency;
        v41.BackgroundTransparency = 1;
        table.insert(v20, l_TweenService_0:Create(v41, v26, {
            BackgroundTransparency = 1
        }));
        table.insert(v21, l_TweenService_0:Create(v41, v26, {
            BackgroundTransparency = l_BackgroundTransparency_1
        }));
        table.insert(v22, l_TweenService_0:Create(v41, v26, {
            BackgroundTransparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(v41, v26, {
            BackgroundTransparency = l_BackgroundTransparency_1
        }));
    end;
    local function v47(v44) --[[ Line: 130 ]] --[[ Name: setupTextLabelTweens ]]
        -- upvalues: v20 (copy), l_TweenService_0 (ref), v26 (copy), v21 (copy), v22 (copy), v23 (copy)
        local l_TextTransparency_0 = v44.TextTransparency;
        local l_TextStrokeTransparency_0 = v44.TextStrokeTransparency;
        v44.TextTransparency = 1;
        v44.TextStrokeTransparency = 1;
        table.insert(v20, l_TweenService_0:Create(v44, v26, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1
        }));
        table.insert(v21, l_TweenService_0:Create(v44, v26, {
            TextTransparency = l_TextTransparency_0, 
            TextStrokeTransparency = l_TextStrokeTransparency_0
        }));
        table.insert(v22, l_TweenService_0:Create(v44, v26, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(v44, v26, {
            TextTransparency = l_TextTransparency_0, 
            TextStrokeTransparency = l_TextStrokeTransparency_0
        }));
    end;
    local function v50(v48) --[[ Line: 141 ]] --[[ Name: setupImageLabelTweens ]]
        -- upvalues: v20 (copy), l_TweenService_0 (ref), v26 (copy), v21 (copy), v22 (copy), v23 (copy)
        local l_ImageTransparency_1 = v48.ImageTransparency;
        v48.ImageTransparency = 1;
        table.insert(v20, l_TweenService_0:Create(v48, v26, {
            ImageTransparency = 1
        }));
        table.insert(v21, l_TweenService_0:Create(v48, v26, {
            ImageTransparency = l_ImageTransparency_1
        }));
        table.insert(v22, l_TweenService_0:Create(v48, v26, {
            ImageTransparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(v48, v26, {
            ImageTransparency = l_ImageTransparency_1
        }));
    end;
    local function v51(v52) --[[ Line: 150 ]] --[[ Name: setupUnexpectedChildTweens ]]
        -- upvalues: v40 (copy), v43 (copy), v47 (copy), v50 (copy), v51 (copy)
        if v52:IsA("UIStroke") then
            v40(v52);
        elseif not v52:IsA("UIGradient") and v52:IsA("GuiObject") then
            v43(v52);
            if v52:IsA("TextLabel") then
                v47(v52);
            elseif v52:IsA("ImageLabel") then
                v50(v52);
            end;
        end;
        for _, v54 in pairs(v52:GetChildren()) do
            v51(v54);
        end;
    end;
    local v55 = {
        [l_InputFrame_0] = false, 
        [l_ActionText_0] = true, 
        [l_ObjectText_0] = true
    };
    for _, v57 in pairs(l_PromptFrame_0:GetChildren()) do
        if v55[v57] == nil then
            v51(v57);
        elseif v55[v57] == true then
            for _, v59 in pairs(v57:GetChildren()) do
                v51(v59);
            end;
        end;
    end;
    local l_Frame_0 = l_InputFrame_0.Frame;
    local l_UIScale_0 = l_Frame_0.UIScale;
    local v62 = v18 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33;
    table.insert(v20, l_TweenService_0:Create(l_UIScale_0, v26, {
        Scale = v62
    }));
    table.insert(v21, l_TweenService_0:Create(l_UIScale_0, v26, {
        Scale = 1
    }));
    v47(l_ActionText_0);
    v47(l_ObjectText_0);
    local l_ButtonFrame_0 = l_Frame_0.ButtonFrame;
    (function() --[[ Line: 197 ]] --[[ Name: setupButtonFrameTweens ]]
        -- upvalues: l_ButtonFrame_0 (copy), v22 (copy), l_TweenService_0 (ref), v27 (copy), v23 (copy)
        local l_BackgroundTransparency_2 = l_ButtonFrame_0.BackgroundTransparency;
        local l_ImageTransparency_2 = l_ButtonFrame_0.ImageTransparency;
        table.insert(v22, l_TweenService_0:Create(l_ButtonFrame_0, v27, {
            BackgroundTransparency = 1, 
            ImageTransparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(l_ButtonFrame_0, v27, {
            BackgroundTransparency = l_BackgroundTransparency_2, 
            ImageTransparency = l_ImageTransparency_2
        }));
        for _, v67 in pairs(l_ButtonFrame_0:getChildren()) do
            if v67:IsA("UIStroke") then
                local l_Transparency_1 = v67.Transparency;
                table.insert(v22, l_TweenService_0:Create(v67, v27, {
                    Transparency = 1
                }));
                table.insert(v23, l_TweenService_0:Create(v67, v27, {
                    Transparency = l_Transparency_1
                }));
            end;
        end;
    end)();
    local l_ButtonImage_0 = l_Frame_0.ButtonImage;
    local l_ButtonText_0 = l_Frame_0.ButtonText;
    local l_ButtonTextImage_0 = l_Frame_0.ButtonTextImage;
    local function v78() --[[ Line: 219 ]] --[[ Name: setupButtonTextTweens ]]
        -- upvalues: l_ButtonText_0 (copy), v22 (copy), l_TweenService_0 (ref), v27 (copy), v23 (copy)
        local l_TextTransparency_1 = l_ButtonText_0.TextTransparency;
        local l_TextStrokeTransparency_1 = l_ButtonText_0.TextStrokeTransparency;
        local l_BackgroundTransparency_3 = l_ButtonText_0.BackgroundTransparency;
        l_ButtonText_0.BackgroundTransparency = 1;
        l_ButtonText_0.TextStrokeTransparency = 1;
        l_ButtonText_0.TextTransparency = 1;
        table.insert(v22, l_TweenService_0:Create(l_ButtonText_0, v27, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(l_ButtonText_0, v27, {
            TextTransparency = l_TextTransparency_1, 
            TextStrokeTransparency = l_TextStrokeTransparency_1, 
            BackgroundTransparency = l_BackgroundTransparency_3
        }));
        for _, v76 in pairs(l_ButtonText_0:getChildren()) do
            if v76:IsA("UIStroke") then
                local l_Transparency_2 = v76.Transparency;
                table.insert(v22, l_TweenService_0:Create(v76, v27, {
                    Transparency = 1
                }));
                table.insert(v23, l_TweenService_0:Create(v76, v27, {
                    Transparency = l_Transparency_2
                }));
            end;
        end;
    end;
    local function v81() --[[ Line: 239 ]] --[[ Name: setupButtonImageTweens ]]
        -- upvalues: l_ButtonImage_0 (copy), v22 (copy), l_TweenService_0 (ref), v27 (copy), v23 (copy)
        local l_ImageTransparency_3 = l_ButtonImage_0.ImageTransparency;
        local l_BackgroundTransparency_4 = l_ButtonImage_0.BackgroundTransparency;
        l_ButtonImage_0.BackgroundTransparency = 1;
        l_ButtonImage_0.ImageTransparency = 1;
        table.insert(v22, l_TweenService_0:Create(l_ButtonImage_0, v27, {
            ImageTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(l_ButtonImage_0, v27, {
            ImageTransparency = l_ImageTransparency_3, 
            BackgroundTransparency = l_BackgroundTransparency_4
        }));
    end;
    local function v84() --[[ Line: 248 ]] --[[ Name: setupIconTweens ]]
        -- upvalues: l_ButtonTextImage_0 (copy), v22 (copy), l_TweenService_0 (ref), v27 (copy), v23 (copy)
        local l_BackgroundTransparency_5 = l_ButtonTextImage_0.BackgroundTransparency;
        local l_ImageTransparency_4 = l_ButtonTextImage_0.ImageTransparency;
        l_ButtonTextImage_0.BackgroundTransparency = 1;
        l_ButtonTextImage_0.ImageTransparency = 1;
        table.insert(v22, l_TweenService_0:Create(l_ButtonTextImage_0, v27, {
            ImageTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v23, l_TweenService_0:Create(l_ButtonTextImage_0, v27, {
            ImageTransparency = l_ImageTransparency_4, 
            BackgroundTransparency = l_BackgroundTransparency_5
        }));
    end;
    if v18 == Enum.ProximityPromptInputType.Gamepad then
        local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v17.GamepadKeyCode);
        if l_l_UserInputService_0_ImageForKeyCode_0 then
            v84();
            l_ButtonTextImage_0.Image = l_l_UserInputService_0_ImageForKeyCode_0;
            l_ButtonText_0.Visible = false;
            l_ButtonImage_0.Visible = false;
            l_ButtonTextImage_0.Visible = true;
        end;
    elseif v18 == Enum.ProximityPromptInputType.Touch then
        v81();
        l_ButtonImage_0.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ButtonText_0.Visible = false;
        l_ButtonTextImage_0.Visible = false;
        l_ButtonImage_0.Visible = true;
    else
        v81();
        l_ButtonImage_0.Visible = true;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v17.KeyboardKeyCode);
        local v87 = v6[v17.KeyboardKeyCode];
        if v87 == nil then
            v87 = v7[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v87 == nil then
            local v88 = v8[v17.KeyboardKeyCode];
            if v88 then
                l_l_UserInputService_0_StringForKeyCode_0 = v88;
            end;
        end;
        if v87 then
            v84();
            l_ButtonTextImage_0.Image = v87;
            l_ButtonText_0.Visible = false;
            l_ButtonTextImage_0.Visible = true;
        elseif l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
            if string.len(l_l_UserInputService_0_StringForKeyCode_0) > 2 then
                l_ButtonText_0.TextSize = math.round(l_ButtonText_0.TextSize * 6 / 7);
            end;
            v78();
            l_ButtonText_0.Text = l_l_UserInputService_0_StringForKeyCode_0;
            l_ButtonTextImage_0.Visible = false;
            l_ButtonText_0.Visible = true;
        else
            error("ProximityPrompt '" .. v17.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v17.KeyboardKeyCode));
        end;
    end;
    if v18 == Enum.ProximityPromptInputType.Touch or v17.ClickablePrompt then
        local l_TextButton_0 = v29.TextButton;
        local v90 = false;
        do
            local l_v90_0 = v90;
            l_TextButton_0.InputBegan:Connect(function(v92) --[[ Line: 323 ]]
                -- upvalues: v17 (copy), l_v90_0 (ref)
                if (v92.UserInputType == Enum.UserInputType.Touch or v92.UserInputType == Enum.UserInputType.MouseButton1) and v92.UserInputState ~= Enum.UserInputState.Change then
                    v17:InputHoldBegin();
                    l_v90_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v93) --[[ Line: 330 ]]
                -- upvalues: l_v90_0 (ref), v17 (copy)
                if (v93.UserInputType == Enum.UserInputType.Touch or v93.UserInputType == Enum.UserInputType.MouseButton1) and l_v90_0 then
                    l_v90_0 = false;
                    v17:InputHoldEnd();
                end;
            end);
            v29.Active = true;
        end;
    end;
    if v17.HoldDuration > 0 then
        local l_ProgressBar_0 = l_Frame_0.ProgressBar;
        local l_UIGradient_2 = l_ProgressBar_0.LeftGradient.ProgressBarImage.UIGradient;
        local l_UIGradient_3 = l_ProgressBar_0.RightGradient.ProgressBarImage.UIGradient;
        local l_l_UIGradient_2_0 = l_UIGradient_2 --[[ copy: 38 -> 48 ]];
        local l_l_UIGradient_3_0 = l_UIGradient_3 --[[ copy: 39 -> 49 ]];
        l_ProgressBar_0.Progress.Changed:Connect(function(v99) --[[ Line: 62 ]]
            -- upvalues: l_l_UIGradient_2_0 (copy), l_l_UIGradient_3_0 (copy)
            local v100 = math.clamp(v99 * 360, 0, 360);
            l_l_UIGradient_2_0.Rotation = math.clamp(v100, 180, 360);
            l_l_UIGradient_3_0.Rotation = math.clamp(v100, 0, 180);
        end);
        table.insert(v20, l_TweenService_0:Create(l_ProgressBar_0.Progress, v24, {
            Value = 1
        }));
        table.insert(v21, l_TweenService_0:Create(l_ProgressBar_0.Progress, v28, {
            Value = 0
        }));
    end;
    local v101 = nil;
    local v102 = nil;
    local v103 = nil;
    local v104 = nil;
    if v17.HoldDuration > 0 then
        v101 = v17.PromptButtonHoldBegan:Connect(function() --[[ Line: 355 ]]
            -- upvalues: v20 (copy)
            for _, v106 in ipairs(v20) do
                v106:Play();
            end;
        end);
        v102 = v17.PromptButtonHoldEnded:Connect(function() --[[ Line: 361 ]]
            -- upvalues: v21 (copy)
            for _, v108 in ipairs(v21) do
                v108:Play();
            end;
        end);
    end;
    v103 = v17.Triggered:Connect(function() --[[ Line: 368 ]]
        -- upvalues: v22 (copy)
        for _, v110 in ipairs(v22) do
            v110:Play();
        end;
    end);
    v104 = v17.TriggerEnded:Connect(function() --[[ Line: 374 ]]
        -- upvalues: v23 (copy)
        for _, v112 in ipairs(v23) do
            v112:Play();
        end;
    end);
    local function v120() --[[ Line: 380 ]] --[[ Name: updateUIFromPrompt ]]
        -- upvalues: v17 (copy), l_ActionText_0 (copy), l_TextService_0 (ref), l_ObjectText_0 (copy), v29 (ref)
        local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
        l_GetTextBoundsParams_0.Text = v17.ActionText;
        l_GetTextBoundsParams_0.Font = l_ActionText_0.FontFace;
        l_GetTextBoundsParams_0.Size = l_ActionText_0.TextSize;
        l_GetTextBoundsParams_0.Width = 1000;
        local l_l_TextService_0_TextBoundsAsync_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
        local l_GetTextBoundsParams_1 = Instance.new("GetTextBoundsParams");
        l_GetTextBoundsParams_1.Text = v17.ObjectText;
        l_GetTextBoundsParams_1.Font = l_ObjectText_0.FontFace;
        l_GetTextBoundsParams_1.Size = l_ObjectText_0.TextSize;
        l_GetTextBoundsParams_1.Width = 1000;
        local l_l_TextService_0_TextBoundsAsync_1 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_1);
        local v117 = math.max(l_l_TextService_0_TextBoundsAsync_0.X, l_l_TextService_0_TextBoundsAsync_1.X);
        local v118 = 72;
        if v17.ActionText ~= nil and v17.ActionText ~= "" or v17.ObjectText ~= nil and v17.ObjectText ~= "" then
            v118 = v117 + 72 + 24;
        end;
        local v119 = 0;
        if v17.ObjectText ~= nil and v17.ObjectText ~= "" then
            v119 = 9;
        end;
        l_ActionText_0.Text = v17.ActionText;
        l_ObjectText_0.Text = v17.ObjectText;
        l_ActionText_0.AutoLocalize = v17.AutoLocalize;
        l_ActionText_0.RootLocalizationTable = v17.RootLocalizationTable;
        l_ObjectText_0.AutoLocalize = v17.AutoLocalize;
        l_ObjectText_0.RootLocalizationTable = v17.RootLocalizationTable;
        v29.Size = UDim2.fromOffset(v118, 72);
        v29.SizeOffset = Vector2.new(v17.UIOffset.X / v29.Size.Width.Offset, v17.UIOffset.Y / v29.Size.Height.Offset);
    end;
    local v121 = v17.Changed:Connect(v120);
    v120();
    local l_Parent_0 = v17.Parent;
    v29.Adornee = l_Parent_0;
    v29.Parent = v19;
    for _, v124 in ipairs(v23) do
        v124:Play();
    end;
    return function() --[[ Line: 436 ]] --[[ Name: cleanup ]]
        -- upvalues: v101 (ref), v102 (ref), v103 (ref), v104 (ref), v121 (copy), v22 (copy), v29 (ref)
        if v101 then
            v101:Disconnect();
        end;
        if v102 then
            v102:Disconnect();
        end;
        v103:Disconnect();
        v104:Disconnect();
        v121:Disconnect();
        for _, v126 in ipairs(v22) do
            v126:Play();
        end;
        wait(0.2);
        v29.Parent = nil;
    end;
end;
local function _() --[[ Line: 461 ]] --[[ Name: onLoad ]]
    -- upvalues: l_ProximityPromptService_0 (copy), l_LocalPlayer_0 (copy), l_PlayerGui_0 (copy), v127 (copy)
    l_ProximityPromptService_0.PromptShown:Connect(function(v128, v129) --[[ Line: 462 ]]
        -- upvalues: l_LocalPlayer_0 (ref), l_PlayerGui_0 (ref), v127 (ref)
        if v128.Style == Enum.ProximityPromptStyle.Default then
            return;
        elseif not v128:GetAttribute("AlwaysShow") and not l_LocalPlayer_0:GetAttribute("SHOW_PROMPTS") then
            return;
        else
            local l_ProximityPrompts_1 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_1 == nil then
                l_ProximityPrompts_1 = Instance.new("ScreenGui");
                l_ProximityPrompts_1.Name = "ProximityPrompts";
                l_ProximityPrompts_1.ResetOnSpawn = false;
                l_ProximityPrompts_1.Parent = l_PlayerGui_0;
            end;
            l_ProximityPrompts_1 = v127(v128, v129, l_ProximityPrompts_1);
            local v131 = nil;
            local v132 = nil;
            v131 = v128.PromptHidden:Connect(function() --[[ Line: 479 ]]
                -- upvalues: v131 (ref), v132 (ref), l_ProximityPrompts_1 (ref)
                v131:Disconnect();
                v132:Disconnect();
                if not l_ProximityPrompts_1 then
                    return;
                else
                    l_ProximityPrompts_1();
                    l_ProximityPrompts_1 = nil;
                    return;
                end;
            end);
            v132 = l_LocalPlayer_0:GetAttributeChangedSignal("SHOW_PROMPTS"):Connect(function() --[[ Line: 491 ]]
                -- upvalues: l_ProximityPrompts_1 (ref), l_LocalPlayer_0 (ref), v132 (ref), v131 (ref)
                if not l_ProximityPrompts_1 or l_LocalPlayer_0:GetAttribute("SHOW_PROMPTS") then
                    return;
                else
                    v132:Disconnect();
                    if v131 then
                        v131:Disconnect();
                        l_ProximityPrompts_1();
                        l_ProximityPrompts_1 = nil;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end);
end;
l_ProximityPromptService_0.PromptShown:Connect(function(v134, v135) --[[ Line: 462 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_PlayerGui_0 (copy), v127 (copy)
    if v134.Style == Enum.ProximityPromptStyle.Default then
        return;
    elseif not v134:GetAttribute("AlwaysShow") and not l_LocalPlayer_0:GetAttribute("SHOW_PROMPTS") then
        return;
    else
        local l_ProximityPrompts_2 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
        if l_ProximityPrompts_2 == nil then
            l_ProximityPrompts_2 = Instance.new("ScreenGui");
            l_ProximityPrompts_2.Name = "ProximityPrompts";
            l_ProximityPrompts_2.ResetOnSpawn = false;
            l_ProximityPrompts_2.Parent = l_PlayerGui_0;
        end;
        l_ProximityPrompts_2 = v127(v134, v135, l_ProximityPrompts_2);
        local v137 = nil;
        local v138 = nil;
        v137 = v134.PromptHidden:Connect(function() --[[ Line: 479 ]]
            -- upvalues: v137 (ref), v138 (ref), l_ProximityPrompts_2 (ref)
            v137:Disconnect();
            v138:Disconnect();
            if not l_ProximityPrompts_2 then
                return;
            else
                l_ProximityPrompts_2();
                l_ProximityPrompts_2 = nil;
                return;
            end;
        end);
        v138 = l_LocalPlayer_0:GetAttributeChangedSignal("SHOW_PROMPTS"):Connect(function() --[[ Line: 491 ]]
            -- upvalues: l_ProximityPrompts_2 (ref), l_LocalPlayer_0 (ref), v138 (ref), v137 (ref)
            if not l_ProximityPrompts_2 or l_LocalPlayer_0:GetAttribute("SHOW_PROMPTS") then
                return;
            else
                v138:Disconnect();
                if v137 then
                    v137:Disconnect();
                    l_ProximityPrompts_2();
                    l_ProximityPrompts_2 = nil;
                end;
                return;
            end;
        end);
        return;
    end;
end);