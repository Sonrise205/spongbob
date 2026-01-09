local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4, v5) --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), v1 (copy)
    assert(v2, "UIInstance not provided");
    assert(v2:IsA("GuiObject") or v2:IsA("UIStroke"), "UIInstance is not a GuiObject or UIStroke");
    if v3 then
        assert(typeof(v3) == "Color3", "Color is not a Color3");
    end;
    if v4 then
        assert(typeof(v4) == "number", "Transparency is not a number");
    end;
    if v5 then
        assert(typeof(v5) == "Vector2", "Offset is not a Vector2");
    end;
    local v6 = {
        UIInstance = v2, 
        Instance = v2:Clone(), 
        IsPaused = false, 
        Color = v3 or Color3.new(), 
        ColorTarget = v3 or Color3.new(), 
        ColorAcceleration = 1, 
        Transparency = v4 or 0, 
        TransparencyTarget = v4 or 0, 
        TransparencyAcceleration = 1, 
        Offset = v5 or Vector2.new(-4, 4), 
        OffsetTarget = v5 or Vector2.new(), 
        OffsetAcceleration = 1, 
        Connection = nil, 
        IsText = false
    };
    v6.Instance.Size = UDim2.new(1, 0, 1, 0);
    v6.Instance:ClearAllChildren();
    v6.Instance.Position = UDim2.new(0, v6.Offset.X, 0, v6.Offset.Y);
    if v2:IsA("TextLabel") or v2:IsA("TextBox") or v2:IsA("TextButton") then
        v6.Instance.TextColor3 = v6.Color;
        v6.IsText = true;
    end;
    v6.Instance.Parent = v6.UIInstance;
    v6.Connection = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 73 ]]
        -- upvalues: v6 (copy)
        if v6.IsPaused then
            return;
        elseif not v6.UIInstance or v6.UIInstance.Parent == nil then
            v6:Destroy();
            return;
        else
            v6.Color = v6.Color:Lerp(v6.ColorTarget, v6.ColorAcceleration);
            v6.Offset = v6.Offset:Lerp(v6.OffsetTarget, v6.OffsetAcceleration);
            v6.Transparency = v6.Transparency + (v6.TransparencyTarget - v6.Transparency) * v6.TransparencyAcceleration;
            v6.Instance.Position = UDim2.new(0, v6.Offset.X, 0, v6.Offset.Y);
            if v6.IsText then
                v6.Instance.Text = v6.UIInstance.Text;
                v6.Instance.TextTransparency = v6.Transparency;
                v6.Instance.TextColor3 = v6.Color;
            end;
            v6.Instance.ZIndex = v6.UIInstance.ZIndex - 1;
            return;
        end;
    end);
    return (setmetatable(v6, v1));
end;
v1.SetOffset = function(v8, v9, v10) --[[ Line: 101 ]] --[[ Name: SetOffset ]]
    assert(typeof(v9) == "Vector2", "Offset isn't a Vector2");
    assert(typeof(v10) == "number", "Acceleration isn't a number");
    v8.OffsetTarget = v9;
    v8.OffsetAcceleration = math.clamp(v10, 0, 1);
end;
v1.SetTransparency = function(v11, v12, v13) --[[ Line: 111 ]] --[[ Name: SetTransparency ]]
    assert(typeof(v12) == "number", "Transparency isn't a number");
    assert(typeof(v13) == "number", "Acceleration isn't a number");
    v11.TransparencyTarget = v12;
    v11.TransparencyAcceleration = math.clamp(v13, 0, 1);
end;
v1.SetColor = function(v14, v15, v16) --[[ Line: 121 ]] --[[ Name: SetColor ]]
    assert(typeof(v15) == "Color3", "Color isn't a Color3");
    assert(typeof(v16) == "number", "Acceleration isn't a number");
    v14.ColorTarget = v15;
    v14.ColorAcceleration = math.clamp(v16, 0, 1);
end;
v1.Pause = function(v17) --[[ Line: 131 ]] --[[ Name: Pause ]]
    v17.IsPaused = true;
end;
v1.Resume = function(v18) --[[ Line: 135 ]] --[[ Name: Resume ]]
    v18.IsPaused = false;
end;
v1.Destroy = function(v19) --[[ Line: 139 ]] --[[ Name: Destroy ]]
    v19.Connection:Disconnect();
    if v19.Instance then
        v19.Instance:Destroy();
        v19.Instance = nil;
    end;
end;
return table.freeze(v1);