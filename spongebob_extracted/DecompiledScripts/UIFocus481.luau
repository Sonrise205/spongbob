local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Fusion);
local l_peek_0 = v4.peek;
local l_Children_0 = v4.Children;
local v7 = l_RunService_0:IsRunning();
local v8 = Vector2.new(16, 16);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v10 = {
    ClassName = "UIFocus"
};
v10.__index = v10;
local function v12(v11) --[[ Line: 32 ]] --[[ Name: DeferAttachScreenGui ]]
    -- upvalues: v7 (copy), l_LocalPlayer_0 (copy)
    return task.defer(function() --[[ Line: 33 ]]
        -- upvalues: v7 (ref), l_LocalPlayer_0 (ref), v11 (copy)
        if not v7 then
            return;
        else
            v11.Parent = l_LocalPlayer_0:FindFirstChild("PlayerGui");
            return;
        end;
    end);
end;
v10.new = function(v13) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy), v12 (copy), v10 (copy), l_peek_0 (copy)
    local v14 = v3.new();
    local v15 = v4.scoped(v4);
    if not v13 then
        v13 = v15:New("ScreenGui")({
            Name = "UI_FOCUS", 
            ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets, 
            IgnoreGuiInset = true, 
            ResetOnSpawn = false, 
            DisplayOrder = 10
        });
        v14:Add(v12(v13));
    end;
    local v16 = setmetatable({}, v10);
    v16._targetSize = v15:Value(Vector2.zero);
    v16._targetPos = v15:Value(Vector2.zero);
    v16._targetGui = v15:Value(nil);
    v16._screenGui = v13;
    v16._dumpster = v14;
    v16._scope = v15;
    v15:Observer(v16._targetGui):onBind(function() --[[ Line: 64 ]]
        -- upvalues: v14 (copy), l_peek_0 (ref), v16 (copy)
        if v14:Get("AbsSizeObserver") then
            v14:Remove("AbsSizeObserver");
        end;
        if v14:Get("AbsPosObserver") then
            v14:Remove("AbsPosObserver");
        end;
        local v17 = l_peek_0(v16._targetGui);
        if not v17 then
            return;
        else
            v16._targetPos:set(v17.AbsolutePosition);
            v14:Add(v17:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 79 ]]
                -- upvalues: v16 (ref), v17 (copy)
                v16._targetPos:set(v17.AbsolutePosition);
            end), "AbsPosObserver");
            v16._targetSize:set(v17.AbsoluteSize);
            v14:Add(v17:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 84 ]]
                -- upvalues: v16 (ref), v17 (copy)
                v16._targetSize:set(v17.AbsoluteSize);
            end), "AbsSizeObserver");
            return;
        end;
    end);
    v16._dumpster:Add(v15, nil, "doCleanup");
    v16:_setupUI();
    return v16;
end;
v10.Destroy = function(v18) --[[ Line: 99 ]] --[[ Name: Destroy ]]
    v18._dumpster:Destroy();
end;
v10.SetTarget = function(v19, v20) --[[ Line: 104 ]] --[[ Name: SetTarget ]]
    v19._targetGui:set(v20);
end;
v10._setupUI = function(v21) --[[ Line: 109 ]] --[[ Name: _setupUI ]]
    -- upvalues: v8 (copy), l_Children_0 (copy)
    local l__scope_0 = v21._scope;
    local _ = l__scope_0:New("Frame")({
        Name = "FocusFrame", 
        AnchorPoint = Vector2.new(0, 0), 
        BackgroundTransparency = 1, 
        Parent = v21._screenGui, 
        ZIndex = 99, 
        Size = l__scope_0:Spring(l__scope_0:Computed(function(v23) --[[ Line: 120 ]]
            -- upvalues: v21 (copy), v8 (ref)
            local v24 = v23(v21._targetSize);
            return UDim2.fromOffset(v24.X + v8.X, v24.Y + v8.Y);
        end), 20, 1), 
        Position = l__scope_0:Spring(l__scope_0:Computed(function(v25) --[[ Line: 124 ]]
            -- upvalues: v21 (copy), v8 (ref)
            local v26 = v25(v21._targetPos);
            return UDim2.fromOffset(v26.X - v8.X / 2, v26.Y - v8.Y / 2);
        end), 20, 1), 
        [l_Children_0] = {
            l__scope_0:New("UICorner")({
                CornerRadius = UDim.new(0, 8)
            }), 
            l__scope_0:New("UIStroke")({
                Color = Color3.fromRGB(40, 40, 40), 
                Thickness = 10000, 
                Transparency = l__scope_0:Spring(l__scope_0:Computed(function(v27) --[[ Line: 135 ]]
                    -- upvalues: v21 (copy)
                    if v27(v21._targetGui) then
                        return 0.1;
                    else
                        return 1;
                    end;
                end), 20, 1)
            })
        }
    });
end;
return (v10.new());