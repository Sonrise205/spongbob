local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v5 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v6 = nil;
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9, v10) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v6 (ref), v2 (copy), v3 (copy), v7 (copy), l_TweenService_0 (copy), v4 (copy), v5 (copy)
    if not v6 then
        v6 = v2.GetController("AudioController");
    end;
    local l_v8_0 = v8;
    if typeof(v8) == "table" then
        if not v8.button or not v8.affect then
            return;
        else
            l_v8_0 = v8.button;
            v8 = v8.affect;
        end;
    end;
    local v12 = setmetatable({
        btn = v8, 
        content = v8:FindFirstChild("Content") or v8:FindFirstChild("AnimationContainer") or v8, 
        callback = v9, 
        eventCallback = v10, 
        dumpster = v3.new()
    }, v7);
    v8.Active = true;
    v8.Selectable = true;
    v12.selected = false;
    v12.selectionOutline = v12.btn:FindFirstChild("SelectionOutline", true) or v12.btn:FindFirstChild("SelectionStroke", true);
    v12.dumpster:AttachTo(v8);
    local v13 = nil;
    local v14 = nil;
    local v15 = v8:GetAttribute("InvertClick") and -1 or 1;
    v14 = v15 * 0.05 + 1;
    v13 = v15 * 0.1 + 1;
    v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local function v21() --[[ Line: 78 ]] --[[ Name: destroyTweens ]]
        -- upvalues: v15 (ref), v16 (ref), v17 (ref), v18 (ref)
        if v15 then
            v15:Cancel();
            v15:Destroy();
        end;
        if v16 then
            v16:Cancel();
            v16:Destroy();
        end;
        if v17 then
            v17:Cancel();
            v17:Destroy();
        end;
        if v18 then
            v18:Cancel();
            v18:Destroy();
        end;
    end;
    local function v24() --[[ Line: 101 ]] --[[ Name: createTweens ]]
        -- upvalues: v8 (ref), v19 (ref), v12 (copy), v15 (ref), l_TweenService_0 (ref), v4 (ref), v14 (ref), v16 (ref), v17 (ref), v5 (ref), v13 (ref), v18 (ref), v20 (ref), v21 (copy)
        if v8 and v8.Parent and v8.Parent:FindFirstChildOfClass("UIGridLayout") then
            v19 = v12.content:FindFirstChildOfClass("UIScale") or v8:FindFirstChildOfClass("UIScale") or Instance.new("UIScale");
            v19.Parent = v12.content or v8;
            v15 = l_TweenService_0:Create(v19, v4, {
                Scale = v14
            });
            v16 = l_TweenService_0:Create(v19, v4, {
                Scale = 1
            });
            v17 = l_TweenService_0:Create(v19, v5, {
                Scale = v13
            });
            v18 = l_TweenService_0:Create(v19, v5, {
                Scale = 1
            });
            v16:Play();
            return;
        else
            v20 = v12.content and (v12.content:GetAttribute("TargetOriginalSize") or v12.content.Size) or v8:GetAttribute("TargetOriginalSize") or v8.Size;
            local v22 = UDim2.new(v20.X.Scale * v14, v20.X.Offset * v14, v20.Y.Scale * v14, v20.Y.Offset * v14);
            local v23 = UDim2.new(v20.X.Scale * v13, v20.X.Offset * v13, v20.Y.Scale * v13, v20.Y.Offset * v13);
            v21();
            v15 = l_TweenService_0:Create(v12.content or v8, v4, {
                Size = v22
            });
            v16 = l_TweenService_0:Create(v12.content or v8, v4, {
                Size = v20
            });
            v17 = l_TweenService_0:Create(v12.content or v8, v5, {
                Size = v23
            });
            v18 = l_TweenService_0:Create(v12.content or v8, v5, {
                Size = v20
            });
            return;
        end;
    end;
    v24();
    v12.dumpster:Add(v8:GetAttributeChangedSignal("TargetOriginalSize"):Connect(v24));
    v12.dumpster:Add(v8:GetAttributeChangedSignal("ForceHover"):Connect(function() --[[ Line: 143 ]]
        -- upvalues: v8 (ref), v15 (ref)
        if not v8:GetAttribute("ForceHover") then
            return;
        else
            v8:SetAttribute("ForceHover", nil);
            v15:Play();
            return;
        end;
    end));
    local function _() --[[ Line: 152 ]] --[[ Name: processSelected ]]
        -- upvalues: v12 (copy)
        if v12.selectionOutline then
            v12.selectionOutline.Enabled = v12.selected or false;
        end;
    end;
    v12.selected = v8:GetAttribute("Selected") or false;
    if v12.selectionOutline then
        v12.selectionOutline.Enabled = v12.selected or false;
    end;
    v12.dumpster:Add(v12.btn:GetAttributeChangedSignal("Selected"):Connect(function() --[[ Line: 161 ]]
        -- upvalues: v12 (copy), v8 (ref)
        v12.selected = v8:GetAttribute("Selected") or false;
        if v12.selectionOutline then
            v12.selectionOutline.Enabled = v12.selected or false;
        end;
    end));
    v12.dumpster:Add(l_v8_0:GetAttributeChangedSignal("Disabled"):Connect(function() --[[ Line: 166 ]]
        -- upvalues: l_v8_0 (ref), v17 (ref), v15 (ref), v16 (ref), v18 (ref)
        if l_v8_0:GetAttribute("Disabled") then
            v17:Cancel();
            v15:Cancel();
            v16:Cancel();
            v18:Play();
        end;
    end));
    v12.dumpster:Connect(l_v8_0.MouseButton1Down, function() --[[ Line: 175 ]]
        -- upvalues: l_v8_0 (ref), v17 (ref)
        if l_v8_0:GetAttribute("NoClickTweens") or l_v8_0:GetAttribute("Disabled") then
            return;
        else
            v17:Play();
            return;
        end;
    end);
    v12.dumpster:Connect(l_v8_0.MouseButton1Up, function() --[[ Line: 183 ]]
        -- upvalues: l_v8_0 (ref), v18 (ref)
        if l_v8_0:GetAttribute("NoClickTweens") or l_v8_0:GetAttribute("Disabled") then
            return;
        else
            v18:Play();
            return;
        end;
    end);
    v12.dumpster:Connect(l_v8_0.Activated, function() --[[ Line: 191 ]]
        -- upvalues: l_v8_0 (ref), v6 (ref), v9 (copy)
        if not l_v8_0:GetAttribute("NoDefaultSound") then
            v6:PlaySound({
                name = "UI.Click", 
                soundGroup = "Master.SFX.UI"
            });
        end;
        if v9 then
            v9();
        end;
    end);
    v12.dumpster:Connect(l_v8_0.MouseEnter, function() --[[ Line: 217 ]]
        -- upvalues: l_v8_0 (ref), v12 (copy), v6 (ref), v15 (ref)
        if l_v8_0:GetAttribute("NoHover") or l_v8_0:GetAttribute("Disabled") then
            return;
        else
            if v12.selectionOutline then
                v12.selectionOutline.Enabled = true;
            end;
            if not l_v8_0:GetAttribute("NoDefaultSound") then
                v6:PlaySound({
                    name = "UI.Hover", 
                    soundGroup = "Master.SFX.UI"
                });
            end;
            v15:Play();
            return;
        end;
    end);
    v12.dumpster:Connect(l_v8_0.MouseLeave, function() --[[ Line: 236 ]]
        -- upvalues: l_v8_0 (ref), v18 (ref), v12 (copy), v16 (ref)
        if l_v8_0:GetAttribute("NoHover") or l_v8_0:GetAttribute("Disabled") then
            v18:Play();
            return;
        else
            if not v12.selected and v12.selectionOutline ~= nil then
                v12.selectionOutline.Enabled = false;
            end;
            v16:Play();
            return;
        end;
    end);
    if v10 then
        for v26, v27 in v10 do
            v12.dumpster:Add(l_v8_0[v26]:Connect(v27));
        end;
    end;
    v12.dumpster:Add(function() --[[ Line: 256 ]]
        -- upvalues: v21 (copy), v15 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v12 (copy), v8 (ref), v20 (ref)
        v21();
        v15 = nil;
        v16 = nil;
        v17 = nil;
        v18 = nil;
        if v19 and v19.Parent then
            v19.Scale = 1;
            v19 = nil;
        end;
        local v28 = v12.content or v8;
        if v28 and v28.Parent and v20 then
            v28.Size = v20;
        end;
        v12.btn = nil;
        v12.content = nil;
        v12.selectionOutline = nil;
    end);
    return v12;
end;
v7.Destroy = function(v29) --[[ Line: 282 ]] --[[ Name: Destroy ]]
    v29.dumpster:Destroy();
    v29.dumpster = nil;
end;
return v7;