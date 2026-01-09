local v0 = require(script.Parent.Parent);
local function _(v1, v2) --[[ Line: 4 ]] --[[ Name: makeLighter ]]
    return v1:Lerp(Color3.fromRGB(255, 255, 255), v2);
end;
local function v6(v4) --[[ Line: 8 ]] --[[ Name: findColorFromObject ]]
    local v5 = v4[({
        TextButton = "BackgroundColor3", 
        TextLabel = "TextColor3", 
        ImageLabel = "ImageColor3", 
        ImageButton = "ImageColor3", 
        Frame = "BackgroundColor3", 
        ScrollingFrame = "BackgroundColor3", 
        ViewportFrame = "BackgroundColor3"
    })[v4.ClassName]];
    if v5 then
        return v5;
    else
        return Color3.fromRGB(255, 255, 255);
    end;
end;
return function(v7, v8, _, v10) --[[ Line: 28 ]]
    -- upvalues: v6 (copy), v0 (copy)
    v10 = v10 or v6(v7);
    local l_v10_0 = v10;
    local v12 = v10:Lerp(Color3.fromRGB(255, 255, 255), 0.417505);
    local v13 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, l_v10_0), 
        ColorSequenceKeypoint.new(0.5, v12), 
        ColorSequenceKeypoint.new(1, v10)
    });
    local v14 = v0.Gradient.new(v7, v13, 0);
    v14:SetOffsetSpeed(v8 * 0.6, 1);
    v14:SetRotation(60, 1);
    return {
        Effects = {
            v14
        }
    };
end;