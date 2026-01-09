local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4, v5) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), v1 (copy)
    assert(v2, "UIInstance not provided");
    assert(v2:IsA("GuiObject") or v2:IsA("UIStroke"), "UIInstance is not a GuiObject or UIStroke");
    assert(v3, "Size not provided");
    assert(typeof(v3) == "number", "Size is not a number");
    if v4 then
        assert(typeof(v4) == "Color3", "Color is not a Color3");
    end;
    if v5 then
        assert(typeof(v5) == "number", "Transparency is not a number");
    end;
    local v6 = {
        UIInstance = v2, 
        Instance = v2:FindFirstChildWhichIsA("UIStroke") or Instance.new("UIStroke"), 
        IsPaused = false, 
        Color = v4 or Color3.new(1, 1, 1), 
        ColorTarget = v4 or Color3.new(1, 1, 1), 
        ColorAcceleration = 1, 
        Transparency = v5 or 0, 
        TransparencyTarget = v5 or 0, 
        TransparencyAcceleration = 1, 
        Size = v3, 
        SizeTarget = v3, 
        SizeAcceleration = 1, 
        Connection = nil, 
        IsText = false
    };
    if v2:IsA("TextLabel") or v2:IsA("TextBox") or v2:IsA("TextButton") then
        v6.IsText = true;
    end;
    v6.Instance.Parent = v6.UIInstance;
    v6.Connection = l_RunService_0.Heartbeat:Connect(function(v7) --[[ Line: 70 ]]
        -- upvalues: v6 (copy)
        if v6.IsPaused then
            return;
        elseif not v6.UIInstance or v6.UIInstance.Parent == nil then
            v6:Destroy();
            return;
        else
            v6.Color = v6.Color:Lerp(v6.ColorTarget, v6.ColorAcceleration * v7);
            v6.Size = v6.Size + (v6.SizeTarget - v6.Size) * v6.SizeAcceleration * v7;
            v6.Transparency = v6.Transparency + (v6.TransparencyTarget - v6.Transparency) * v6.TransparencyAcceleration * v7;
            v6.Instance.Transparency = v6.Transparency;
            v6.Instance.Color = v6.Color;
            v6.Instance.Thickness = v6.Size;
            return;
        end;
    end);
    return (setmetatable(v6, v1));
end;
v1.SetSize = function(v8, v9, v10) --[[ Line: 92 ]] --[[ Name: SetSize ]]
    assert(typeof(v9) == "number", "Size isn't a number");
    assert(typeof(v10) == "number", "Acceleration isn't a number");
    v8.SizeTarget = v9;
    v8.SizeAcceleration = math.clamp(v10, 0, 1);
end;
v1.SetTransparency = function(v11, v12, v13) --[[ Line: 102 ]] --[[ Name: SetTransparency ]]
    assert(typeof(v12) == "number", "Transparency isn't a number");
    assert(typeof(v13) == "number", "Acceleration isn't a number");
    v11.TransparencyTarget = v12;
    v11.TransparencyAcceleration = math.clamp(v13, 0, 1);
end;
v1.SetColor = function(v14, v15, v16) --[[ Line: 112 ]] --[[ Name: SetColor ]]
    assert(typeof(v15) == "Color3", "Color isn't a Color3");
    assert(typeof(v16) == "number", "Acceleration isn't a number");
    v14.ColorTarget = v15;
    v14.ColorAcceleration = math.clamp(v16, 0, 1);
end;
v1.Pause = function(v17) --[[ Line: 122 ]] --[[ Name: Pause ]]
    v17.IsPaused = true;
end;
v1.Resume = function(v18) --[[ Line: 126 ]] --[[ Name: Resume ]]
    v18.IsPaused = false;
end;
v1.Destroy = function(v19) --[[ Line: 130 ]] --[[ Name: Destroy ]]
    v19.Connection:Disconnect();
    if v19.Instance then
        v19.Instance:Destroy();
        v19.Instance = nil;
    end;
end;
return table.freeze(v1);