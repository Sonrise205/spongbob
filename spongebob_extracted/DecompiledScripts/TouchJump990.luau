local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v3 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserUpdateTouchJump2");
local v4 = nil;
local v5 = nil;
if v3 then
    v4 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
    v5 = require(l_CommonUtils_0:WaitForChild("CharacterUtil"));
end;
local v6 = {
    HUMANOID_STATE_ENABLED_CHANGED = "HUMANOID_STATE_ENABLED_CHANGED", 
    HUMANOID_JUMP_POWER = "HUMANOID_JUMP_POWER", 
    HUMANOID = "HUMANOID", 
    JUMP_INPUT_ENDED = "JUMP_INPUT_ENDED", 
    MENU_OPENED = "MENU_OPENED"
};
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v8 = setmetatable({}, l_BaseCharacterController_0);
v8.__index = v8;
v8.new = function() --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v8 (copy), v3 (copy), v4 (ref)
    local v9 = setmetatable(l_BaseCharacterController_0.new(), v8);
    v9.parentUIFrame = nil;
    v9.jumpButton = nil;
    if not v3 then
        v9.characterAddedConn = nil;
        v9.humanoidStateEnabledChangedConn = nil;
        v9.humanoidJumpPowerConn = nil;
        v9.humanoidParentConn = nil;
        v9.jumpPower = 0;
        v9.jumpStateEnabled = true;
        v9.humanoid = nil;
    end;
    v9.externallyEnabled = false;
    v9.isJumping = false;
    if v3 then
        v9._active = false;
        v9._connectionUtil = v4.new();
    end;
    return v9;
end;
if v3 then
    v8._reset = function(v10) --[[ Line: 83 ]] --[[ Name: _reset ]]
        v10.isJumping = false;
        v10.touchObject = nil;
        if v10.jumpButton then
            v10.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        end;
    end;
end;
v8.EnableButton = function(v11, v12) --[[ Line: 92 ]] --[[ Name: EnableButton ]]
    -- upvalues: v3 (copy), v6 (copy), l_GuiService_0 (copy), l_Players_0 (copy)
    if v3 then
        if v12 == v11._active then
            return;
        else
            if v12 then
                if not v11.jumpButton then
                    v11:Create();
                end;
                v11.jumpButton.Visible = true;
                v11._connectionUtil:trackConnection(v6.JUMP_INPUT_ENDED, v11.jumpButton.InputEnded:Connect(function(v13) --[[ Line: 108 ]]
                    -- upvalues: v11 (copy)
                    if v13 == v11.touchObject then
                        v11:_reset();
                    end;
                end));
                v11._connectionUtil:trackConnection(v6.MENU_OPENED, l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 118 ]]
                    -- upvalues: v11 (copy)
                    if v11.touchObject then
                        v11:_reset();
                    end;
                end));
            else
                if v11.jumpButton then
                    v11.jumpButton.Visible = false;
                end;
                v11._connectionUtil:disconnect(v6.JUMP_INPUT_ENDED);
                v11._connectionUtil:disconnect(v6.MENU_OPENED);
            end;
            v11:_reset();
            v11._active = v12;
            return;
        end;
    else
        if v12 then
            if not v11.jumpButton then
                v11:Create();
            end;
            local v14 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
            if v14 and v11.externallyEnabled and v11.externallyEnabled and v14.JumpPower > 0 then
                v11.jumpButton.Visible = true;
                return;
            end;
        else
            v11.jumpButton.Visible = false;
            v11.touchObject = nil;
            v11.isJumping = false;
            v11.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        end;
        return;
    end;
end;
v8.UpdateEnabled = function(v15) --[[ Line: 155 ]] --[[ Name: UpdateEnabled ]]
    -- upvalues: v3 (copy), v5 (ref)
    if v3 then
        local v16 = v5.getChild("Humanoid", "Humanoid");
        if v16 and v15.externallyEnabled and v16.JumpPower > 0 then
            v15:EnableButton(true);
            return;
        else
            v15:EnableButton(false);
            return;
        end;
    elseif v15.jumpPower > 0 and v15.jumpStateEnabled then
        v15:EnableButton(true);
        return;
    else
        v15:EnableButton(false);
        return;
    end;
end;
if v3 then
    v8._setupConfigurations = function(v17) --[[ Line: 173 ]] --[[ Name: _setupConfigurations ]]
        -- upvalues: v5 (ref), v6 (copy)
        local function v18() --[[ Line: 174 ]] --[[ Name: update ]]
            -- upvalues: v17 (copy)
            v17:UpdateEnabled();
        end;
        local v20 = v5.onChild("Humanoid", "Humanoid", function(v19) --[[ Line: 179 ]]
            -- upvalues: v17 (copy), v6 (ref), v18 (copy)
            v17:UpdateEnabled();
            v17._connectionUtil:trackConnection(v6.HUMANOID_JUMP_POWER, v19:GetPropertyChangedSignal("JumpPower"):Connect(v18));
        end);
        v17._connectionUtil:trackConnection(v6.HUMANOID, v20);
    end;
end;
if not v3 then
    v8.HumanoidChanged = function(v21, v22) --[[ Line: 195 ]] --[[ Name: HumanoidChanged ]]
        -- upvalues: l_Players_0 (copy)
        local v23 = l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
        if v23 then
            if v22 == "JumpPower" then
                v21.jumpPower = v23.JumpPower;
                v21:UpdateEnabled();
                return;
            elseif v22 == "Parent" and not v23.Parent then
                v21.humanoidChangeConn:Disconnect();
            end;
        end;
    end;
    v8.HumanoidStateEnabledChanged = function(v24, v25, v26) --[[ Line: 210 ]] --[[ Name: HumanoidStateEnabledChanged ]]
        if v25 == Enum.HumanoidStateType.Jumping then
            v24.jumpStateEnabled = v26;
            v24:UpdateEnabled();
        end;
    end;
    v8.CharacterAdded = function(v27, v28) --[[ Line: 217 ]] --[[ Name: CharacterAdded ]]
        if v27.humanoidChangeConn then
            v27.humanoidChangeConn:Disconnect();
            v27.humanoidChangeConn = nil;
        end;
        v27.humanoid = v28:FindFirstChildOfClass("Humanoid");
        while not v27.humanoid do
            v28.ChildAdded:wait();
            v27.humanoid = v28:FindFirstChildOfClass("Humanoid");
        end;
        v27.humanoidJumpPowerConn = v27.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() --[[ Line: 229 ]]
            -- upvalues: v27 (copy)
            v27.jumpPower = v27.humanoid.JumpPower;
            v27:UpdateEnabled();
        end);
        v27.humanoidParentConn = v27.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 234 ]]
            -- upvalues: v27 (copy)
            if not v27.humanoid.Parent then
                v27.humanoidJumpPowerConn:Disconnect();
                v27.humanoidJumpPowerConn = nil;
                v27.humanoidParentConn:Disconnect();
                v27.humanoidParentConn = nil;
            end;
        end);
        v27.jumpPower = v27.humanoid.JumpPower;
        v27.jumpStateEnabled = true;
        v27:UpdateEnabled();
    end;
    v8.SetupCharacterAddedFunction = function(v29) --[[ Line: 252 ]] --[[ Name: SetupCharacterAddedFunction ]]
        -- upvalues: l_Players_0 (copy)
        v29.characterAddedConn = l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v30) --[[ Line: 253 ]]
            -- upvalues: v29 (copy)
            v29:CharacterAdded(v30);
        end);
        if l_Players_0.LocalPlayer.Character then
            v29:CharacterAdded(l_Players_0.LocalPlayer.Character);
        end;
    end;
end;
v8.Enable = function(v31, v32, v33) --[[ Line: 262 ]] --[[ Name: Enable ]]
    -- upvalues: v3 (copy)
    if v33 then
        v31.parentUIFrame = v33;
    end;
    v31.externallyEnabled = v32;
    if v3 then
        v31:UpdateEnabled();
        if v32 then
            v31:_setupConfigurations();
            return;
        else
            v31._connectionUtil:disconnectAll();
            return;
        end;
    else
        v31:EnableButton(v32);
        return;
    end;
end;
v8.Create = function(v34) --[[ Line: 280 ]] --[[ Name: Create ]]
    -- upvalues: v3 (copy), l_GuiService_0 (copy)
    if not v34.parentUIFrame then
        return;
    else
        if v34.jumpButton then
            v34.jumpButton:Destroy();
            v34.jumpButton = nil;
        end;
        if v34.absoluteSizeChangedConn then
            v34.absoluteSizeChangedConn:Disconnect();
            v34.absoluteSizeChangedConn = nil;
        end;
        v34.jumpButton = Instance.new("ImageButton");
        v34.jumpButton.Name = "JumpButton";
        v34.jumpButton.Visible = false;
        v34.jumpButton.BackgroundTransparency = 1;
        v34.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
        v34.jumpButton.ImageRectOffset = Vector2.new(1, 146);
        v34.jumpButton.ImageRectSize = Vector2.new(144, 144);
        local function v37() --[[ Line: 303 ]] --[[ Name: ResizeJumpButton ]]
            -- upvalues: v34 (copy)
            local v35 = math.min(v34.parentUIFrame.AbsoluteSize.x, v34.parentUIFrame.AbsoluteSize.y) <= 500;
            local v36 = v35 and 70 or 120;
            v34.jumpButton.Size = UDim2.new(0, v36, 0, v36);
            v34.jumpButton.Position = v35 and UDim2.new(1, -(v36 * 1.5 - 10), 1, -v36 - 20) or UDim2.new(1, -(v36 * 1.5 - 10), 1, -v36 * 1.75);
        end;
        v37();
        v34.absoluteSizeChangedConn = v34.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(v37);
        v34.touchObject = nil;
        v34.jumpButton.InputBegan:connect(function(v38) --[[ Line: 317 ]]
            -- upvalues: v34 (copy)
            if v34.touchObject or v38.UserInputType ~= Enum.UserInputType.Touch or v38.UserInputState ~= Enum.UserInputState.Begin then
                return;
            else
                v34.touchObject = v38;
                v34.jumpButton.ImageRectOffset = Vector2.new(146, 146);
                v34.isJumping = true;
                return;
            end;
        end);
        if not v3 then
            local function _() --[[ Line: 331 ]]
                -- upvalues: v34 (copy)
                v34.touchObject = nil;
                v34.isJumping = false;
                v34.jumpButton.ImageRectOffset = Vector2.new(1, 146);
            end;
            v34.jumpButton.InputEnded:connect(function(v40) --[[ Line: 337 ]]
                -- upvalues: v34 (copy)
                if v40 == v34.touchObject then
                    v34.touchObject = nil;
                    v34.isJumping = false;
                    v34.jumpButton.ImageRectOffset = Vector2.new(1, 146);
                end;
            end);
            l_GuiService_0.MenuOpened:connect(function() --[[ Line: 343 ]]
                -- upvalues: v34 (copy)
                if v34.touchObject then
                    v34.touchObject = nil;
                    v34.isJumping = false;
                    v34.jumpButton.ImageRectOffset = Vector2.new(1, 146);
                end;
            end);
            if not v34.characterAddedConn then
                v34:SetupCharacterAddedFunction();
            end;
        end;
        v34.jumpButton.Parent = v34.parentUIFrame;
        return;
    end;
end;
return v8;