local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v4 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7, v8, v9) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v5 (copy), l_TweenService_0 (copy), v3 (copy), v4 (copy)
    if not v7 or v7 < 0 then
        v7 = 0;
    end;
    local l_v6_0 = v6;
    if typeof(v6) == "table" then
        if not v6.button or not v6.affect then
            return;
        else
            l_v6_0 = v6.button;
            v6 = v6.affect;
        end;
    end;
    local v11 = setmetatable({
        btn = v6, 
        holdGradient = v6:FindFirstChild("HoldGradient", true), 
        callback = v8, 
        eventCallback = v9, 
        dumpster = v2.new()
    }, v5);
    if not v11.holdGradient then
        v11.holdGradient = Instance.new("UIGradient");
        v11.holdGradient.Name = "HoldGradient";
        v11.holdGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(0.0485, 1)
        });
        v11.holdGradient.Offset = Vector2.zero;
        v11.holdGradient.Parent = v11.btn;
    end;
    if v7 <= 0 then
        v11.holdGradient.Enabled = false;
    end;
    v11.dumpster:AttachTo(v6);
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local function v24() --[[ Line: 92 ]] --[[ Name: createTweens ]]
        -- upvalues: v6 (ref), v12 (ref), l_TweenService_0 (ref), v3 (ref), v13 (ref), v14 (ref), v4 (ref), v15 (ref), v7 (ref), v16 (ref), v11 (copy), v17 (ref)
        if v6.Parent:FindFirstChildOfClass("UIGridLayout") then
            local v18 = v6:FindFirstChildOfClass("UIScale") or Instance.new("UIScale");
            v18.Parent = v6;
            v12 = l_TweenService_0:Create(v18, v3, {
                Scale = 1.05
            });
            v13 = l_TweenService_0:Create(v18, v3, {
                Scale = 1
            });
            v14 = l_TweenService_0:Create(v18, v4, {
                Scale = 1.1
            });
            v15 = l_TweenService_0:Create(v18, v4, {
                Scale = 1
            });
            v13:Play();
            return;
        else
            local v19 = v6:GetAttribute("TargetOriginalSize") or v6.Size;
            local v20 = UDim2.new(v19.X.Scale * 1.05, v19.X.Offset * 1.05, v19.Y.Scale * 1.05, v19.Y.Offset * 1.05);
            local v21 = UDim2.new(v19.X.Scale * 1.1, v19.X.Offset * 1.1, v19.Y.Scale * 1.1, v19.Y.Offset * 1.1);
            if v12 then
                v12:Cancel();
                v12:Destroy();
            end;
            if v13 then
                v13:Cancel();
                v13:Destroy();
            end;
            if v14 then
                v14:Cancel();
                v14:Destroy();
            end;
            if v15 then
                v15:Cancel();
                v15:Destroy();
            end;
            v12 = l_TweenService_0:Create(v6, v3, {
                Size = v20
            });
            v13 = l_TweenService_0:Create(v6, v3, {
                Size = v19
            });
            v14 = l_TweenService_0:Create(v6, v4, {
                Size = v21
            });
            v15 = l_TweenService_0:Create(v6, v4, {
                Size = v19
            });
            local v22 = TweenInfo.new(v7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
            local v23 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            v16 = l_TweenService_0:Create(v11.holdGradient, v22, {
                Offset = Vector2.new(1, 0)
            });
            v17 = l_TweenService_0:Create(v11.holdGradient, v23, {
                Offset = Vector2.new(0, 0)
            });
            v13:Play();
            return;
        end;
    end;
    v24();
    v11.dumpster:Add(v6:GetAttributeChangedSignal("TargetOriginalSize"):Connect(v24));
    v11.dumpster:Connect(l_v6_0.MouseButton1Down, function() --[[ Line: 165 ]]
        -- upvalues: v14 (ref), v7 (ref), v16 (ref)
        v14:Play();
        if v7 > 0 then
            v16:Play();
        end;
    end);
    v11.dumpster:Connect(l_v6_0.MouseButton1Up, function() --[[ Line: 173 ]]
        -- upvalues: v15 (ref), v7 (ref), v17 (ref)
        v15:Play();
        if v7 > 0 then
            v17:Play();
        end;
    end);
    local function _() --[[ Line: 181 ]] --[[ Name: doButtonClickCallback ]]
        -- upvalues: v11 (copy), v8 (copy)
        if v11.holdGradient then
            v11.holdGradient.Offset = Vector2.zero;
        end;
        if v8 then
            v8();
        end;
    end;
    v11.dumpster:Connect(l_v6_0.MouseButton1Click, function() --[[ Line: 195 ]]
        -- upvalues: v7 (ref), v11 (copy), v8 (copy)
        if v7 > 0 then
            return;
        else
            if v11.holdGradient then
                v11.holdGradient.Offset = Vector2.zero;
            end;
            if v8 then
                v8();
            end;
            return;
        end;
    end);
    v11.dumpster:Connect(v16.Completed, function(v26) --[[ Line: 203 ]]
        -- upvalues: v11 (copy), v8 (copy)
        if v26 ~= Enum.PlaybackState.Completed then
            return;
        else
            if v11.holdGradient then
                v11.holdGradient.Offset = Vector2.zero;
            end;
            if v8 then
                v8();
            end;
            return;
        end;
    end);
    v11.dumpster:Connect(l_v6_0.MouseEnter, function() --[[ Line: 211 ]]
        -- upvalues: v12 (ref)
        v12:Play();
    end);
    v11.dumpster:Connect(l_v6_0.MouseLeave, function() --[[ Line: 219 ]]
        -- upvalues: v13 (ref)
        v13:Play();
    end);
    if v9 then
        for v27, v28 in pairs(v9) do
            v11.dumpster:Add(l_v6_0[v27]:Connect(v28));
        end;
    end;
    return v11;
end;
v5.Destroy = function(v29) --[[ Line: 233 ]] --[[ Name: Destroy ]]
    v29.dumpster:Destroy();
    v29.dumpster = nil;
end;
return v5;