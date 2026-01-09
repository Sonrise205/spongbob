local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent);
local function _(v2, v3) --[[ Line: 5 ]] --[[ Name: makeLighter ]]
    return v2:Lerp(Color3.fromRGB(255, 255, 255), v3);
end;
local function v7(v5) --[[ Line: 9 ]] --[[ Name: findColorFromObject ]]
    local v6 = v5[({
        TextButton = "BackgroundColor3", 
        TextLabel = "TextColor3", 
        ImageLabel = "ImageColor3", 
        ImageButton = "ImageColor3", 
        Frame = "BackgroundColor3", 
        ScrollingFrame = "BackgroundColor3", 
        ViewportFrame = "BackgroundColor3"
    })[v5.ClassName]];
    if v6 then
        return v6;
    else
        return Color3.fromRGB(255, 255, 255);
    end;
end;
return function(v8, v9, v10, v11) --[[ Line: 29 ]]
    -- upvalues: v7 (copy), v1 (copy), l_RunService_0 (copy)
    v11 = v11 or v7(v8);
    local l_v11_0 = v11;
    local v13 = v11:Lerp(Color3.fromRGB(255, 255, 255), 0.6);
    local v14 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, l_v11_0), 
        ColorSequenceKeypoint.new(0.5, v13), 
        ColorSequenceKeypoint.new(1, v11)
    });
    local v15 = v1.Stroke.new(v8, v10);
    local v16 = v1.Gradient.new(v15.Instance, v14, 0);
    local v17 = 0.75;
    local v18 = nil;
    v18 = l_RunService_0.Heartbeat:Connect(function(v19) --[[ Line: 48 ]]
        -- upvalues: v15 (copy), v18 (ref), v17 (ref), v9 (copy), v16 (copy)
        if not v15.Instance or v15.Instance.Parent == nil then
            v18:Disconnect();
        end;
        v17 = v17 + v9 * v19;
        v16:SetRotation(v17, 1);
    end);
    return {
        Effects = {
            v16, 
            v15
        }, 
        Connections = {
            v18
        }
    };
end;