local v0 = {};
v0.__index = v0;
local l_TweenService_0 = game:GetService("TweenService");
local function v21(v2) --[[ Line: 39 ]] --[[ Name: createShimmer ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "UIShimmer";
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_0.BackgroundTransparency = 0;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v2;
    local v4 = {};
    local function _() --[[ Line: 56 ]] --[[ Name: updateCornerRadius ]]
        -- upvalues: l_Frame_0 (copy)
        if l_Frame_0.Parent:FindFirstChildOfClass("UICorner") then
            local l_UICorner_0 = l_Frame_0.Parent:FindFirstChildOfClass("UICorner");
            local l_UICorner_1 = Instance.new("UICorner");
            l_UICorner_1.CornerRadius = l_UICorner_0.CornerRadius;
            l_UICorner_1.Parent = l_Frame_0;
        end;
    end;
    if l_Frame_0.Parent:FindFirstChildOfClass("UICorner") then
        local l_UICorner_2 = l_Frame_0.Parent:FindFirstChildOfClass("UICorner");
        local l_UICorner_3 = Instance.new("UICorner");
        l_UICorner_3.CornerRadius = l_UICorner_2.CornerRadius;
        l_UICorner_3.Parent = l_Frame_0;
    end;
    local function v10() --[[ Line: 71 ]] --[[ Name: updatePaddingOffset ]]
        -- upvalues: l_Frame_0 (copy), v10 (copy)
        if l_Frame_0.Parent:FindFirstChildOfClass("UIPadding") then
            local l_UIPadding_0 = l_Frame_0.Parent:FindFirstChildOfClass("UIPadding");
            local v12 = l_UIPadding_0.PaddingLeft.Scale + l_UIPadding_0.PaddingRight.Scale;
            local v13 = l_UIPadding_0.PaddingTop.Scale + l_UIPadding_0.PaddingBottom.Scale;
            local v14 = l_UIPadding_0.PaddingLeft.Offset + l_UIPadding_0.PaddingRight.Offset;
            local v15 = l_UIPadding_0.PaddingTop.Offset + l_UIPadding_0.PaddingBottom.Offset;
            local v16 = l_UIPadding_0.PaddingTop.Offset - l_UIPadding_0.PaddingBottom.Offset;
            local v17 = l_UIPadding_0.PaddingLeft.Offset - l_UIPadding_0.PaddingRight.Offset;
            local v18 = 1 / (1 - v12);
            local v19 = 1 / (1 - v13);
            l_Frame_0.Size = UDim2.new(v18, v14, v19, v15);
            l_Frame_0.Position = UDim2.new(0.5, -v17 / 2, 0.5, -v16 / 2);
            l_UIPadding_0:GetPropertyChangedSignal("PaddingLeft"):Connect(v10);
            l_UIPadding_0:GetPropertyChangedSignal("PaddingRight"):Connect(v10);
            l_UIPadding_0:GetPropertyChangedSignal("PaddingTop"):Connect(v10);
            l_UIPadding_0:GetPropertyChangedSignal("PaddingBottom"):Connect(v10);
        end;
    end;
    v10();
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Rotation = 15;
    l_UIGradient_0.Color = ColorSequence.new(Color3.new(1, 1, 1));
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.15, 1), 
        NumberSequenceKeypoint.new(0.5, 0.55), 
        NumberSequenceKeypoint.new(0.85, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Offset = Vector2.new(-1, 0);
    l_UIGradient_0.Parent = l_Frame_0;
    return l_Frame_0, v4;
end;
v0.PlaybackState = nil;
v0.new = function(v22, v23, v24, v25, v26, v27, v28) --[[ Line: 121 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v21 (copy), l_TweenService_0 (copy)
    local v29 = setmetatable({}, v0);
    local v30 = v23 or 1;
    local v31 = v24 or Enum.EasingStyle.Linear;
    local v32 = v25 or Enum.EasingDirection.InOut;
    local v33 = v26 or -1;
    local v34 = v27 or false;
    local v35 = v28 or 0;
    local v36, v37 = v21(v22);
    v29._frame = v36;
    v29._connections = v37;
    v29._gradient = v36:FindFirstChildOfClass("UIGradient");
    v29._corner = v36:FindFirstChildOfClass("UICorner");
    v29._tween = l_TweenService_0:Create(v29._gradient, TweenInfo.new(v30, v31, v32, v33, v34, v35), {
        Offset = Vector2.new(1, 0)
    });
    v29._tween.Completed:Connect(function(v38) --[[ Line: 155 ]]
        -- upvalues: v29 (copy)
        if v38 ~= Enum.PlaybackState.Completed then
            return;
        else
            v29:_TweenCompleted();
            return;
        end;
    end);
    return v29;
end;
v0._TweenCompleted = function(v39) --[[ Line: 167 ]] --[[ Name: _TweenCompleted ]]
    v39._frame.Visible = false;
    v39._gradient.Offset = Vector2.new(-1, 0);
end;
v0.GetFrame = function(v40) --[[ Line: 173 ]] --[[ Name: GetFrame ]]
    return v40._frame;
end;
v0.GetGradient = function(v41) --[[ Line: 178 ]] --[[ Name: GetGradient ]]
    return v41._gradient;
end;
v0.GetCorner = function(v42) --[[ Line: 183 ]] --[[ Name: GetCorner ]]
    return v42._corner;
end;
v0.Play = function(v43) --[[ Line: 188 ]] --[[ Name: Play ]]
    v43._frame.Visible = true;
    v43._tween:Play();
end;
v0.Pause = function(v44) --[[ Line: 194 ]] --[[ Name: Pause ]]
    if v44._tween.PlaybackState == Enum.PlaybackState.Playing then
        v44._tween:Pause();
    end;
end;
v0.Cancel = function(v45) --[[ Line: 201 ]] --[[ Name: Cancel ]]
    v45._tween:Cancel();
    v45._frame.Visible = false;
    v45._gradient.Offset = Vector2.new(-1, 0);
end;
v0.Destroy = function(v46) --[[ Line: 207 ]] --[[ Name: Destroy ]]
    v46:Cancel();
    for _, v48 in v46._connections do
        v48:Disconnect();
    end;
    v46._frame:Destroy();
    v46._tween:Destroy();
    table.clear(v46);
end;
return v0;