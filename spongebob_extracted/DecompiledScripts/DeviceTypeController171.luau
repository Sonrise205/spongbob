local l_CollectionService_0 = game:GetService("CollectionService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v8 = require(l_Packages_0.Knit);
local v9 = require(l_Packages_0.Signal);
local v10 = require(l_Packages_0.Input);
local l_PreferredInput_0 = v10.PreferredInput;
local v12 = v10.Gamepad.new();
local v13 = require(l_ReplicatedFirst_0.PlaceIds);
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = {
    MouseKeyboard = "PC", 
    Touch = "Mobile", 
    Gamepad = "Console"
};
local v19 = v8.CreateController({
    Name = script.Name, 
    DeviceChanged = v9.new(), 
    GamepadButtonPressed = v9.new(), 
    _gamepadObservers = {}
});
v19.KnitInit = function(_) --[[ Line: 53 ]] --[[ Name: KnitInit ]]
    -- upvalues: v14 (ref), v8 (copy), v15 (ref), v16 (ref)
    v14 = v8.GetController("UIController");
    v15 = v8.GetController("TowerController");
    v16 = v8.GetService("RobloxEventService");
end;
v19.KnitStart = function(v21) --[[ Line: 59 ]] --[[ Name: KnitStart ]]
    -- upvalues: v13 (copy), v17 (ref), v14 (ref), l_PreferredInput_0 (copy), v18 (copy), v12 (copy), v15 (ref), l_GuiService_0 (copy), l_UserInputService_0 (copy), l_CollectionService_0 (copy), v16 (ref), v8 (copy), l_ReplicatedStorage_0 (copy)
    v21.isGamePlace = v13:GetDestination() == "Game";
    if v13:GetDestination() ~= "AFK" then
        v17 = v14:GetModuleAsync("HUD"):expect();
    end;
    l_PreferredInput_0.Observe(function(v22) --[[ Line: 66 ]]
        -- upvalues: v21 (copy), v18 (ref)
        v21.DeviceChanged:Fire(v18[v22] or v22);
    end);
    v12.ButtonDown:Connect(function(v23, v24) --[[ Line: 70 ]]
        -- upvalues: v21 (copy), v14 (ref), v15 (ref), l_GuiService_0 (ref), v17 (ref)
        if v21._gamepadObservers[v23] then
            for _, v26 in pairs(v21._gamepadObservers[v23]) do
                task.spawn(v26, v24);
            end;
        end;
        v21.GamepadButtonPressed:Fire(v24);
        local v27 = v14:IsPrimaryMenuOpen();
        local v28 = v15:IsBuildModeActive();
        local l_SelectedObject_0 = l_GuiService_0.SelectedObject;
        if v17 then
            if v23 == Enum.KeyCode.DPadLeft and not v27 and not l_SelectedObject_0 then
                v17:SelectSide("Left");
            elseif v23 == Enum.KeyCode.DPadRight and not v27 and not l_SelectedObject_0 then
                v17:SelectSide("Right");
            end;
        end;
        if v24 then
            return;
        else
            local l_v14_ToggleState_0 = v14:GetToggleState("Apology");
            if v23 == Enum.KeyCode.ButtonB and v27 and not v28 and not l_v14_ToggleState_0 then
                v14:ClosePrimaryMenus():andThen(function() --[[ Line: 99 ]]
                    -- upvalues: l_GuiService_0 (ref)
                    l_GuiService_0.SelectedObject = nil;
                end);
            end;
            return;
        end;
    end);
    local function v36(v31, v32) --[[ Line: 105 ]] --[[ Name: handleVisuals ]]
        -- upvalues: v21 (copy), l_UserInputService_0 (ref)
        v32 = v32 or v21:IsConsole();
        local v33 = v31:GetAttribute("KeyCode") or v31:GetAttribute("Keycode");
        v31.Visible = v32 and v33 ~= nil;
        if not v32 or not v33 then
            return;
        else
            local v34 = Enum.KeyCode[v33];
            if not v34 then
                v31.Visible = false;
                return;
            else
                local v35 = v31:FindFirstChild("Icon") or v31;
                if v35:IsA("ImageLabel") or v35:IsA("ImageButton") then
                    v35.BackgroundTransparency = 1;
                    v35.ScaleType = Enum.ScaleType.Fit;
                    v35.Image = l_UserInputService_0:GetImageForKeyCode(v34);
                end;
                return;
            end;
        end;
    end;
    local function v41(_) --[[ Line: 133 ]] --[[ Name: setupGamepadVisuals ]]
        -- upvalues: v21 (copy), l_CollectionService_0 (ref), v36 (copy)
        local v38 = v21:IsConsole();
        for _, v40 in l_CollectionService_0:GetTagged("GamepadVisual") do
            v36(v40, v38);
        end;
    end;
    local v42 = v21:IsConsole();
    for _, v44 in l_CollectionService_0:GetTagged("GamepadVisual") do
        v36(v44, v42);
    end;
    l_CollectionService_0:GetInstanceAddedSignal("GamepadVisual"):Connect(function(v45) --[[ Line: 143 ]]
        -- upvalues: v36 (copy)
        v36(v45);
    end);
    v21.DeviceChanged:Connect(v41);
    v14:OnLoaded(function() --[[ Line: 149 ]]
        -- upvalues: v16 (ref), v21 (copy)
        v16.ReportScreenSize:Fire(v21:IsSmallScreen());
    end);
    v42 = nil;
    v8.Player:GetAttributeChangedSignal("MouseLockState"):Connect(function() --[[ Line: 154 ]]
        -- upvalues: v8 (ref), v42 (ref), l_UserInputService_0 (ref), l_ReplicatedStorage_0 (ref)
        if not (v8.Player:GetAttribute("MouseLockState") or false) then
            if v42 then
                v42:Destroy();
                v42 = nil;
            end;
            return;
        elseif l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
            if v42 then
                v42:Destroy();
                v42 = nil;
            end;
            return;
        else
            v42 = l_ReplicatedStorage_0.GUI.MouseLock:Clone();
            v42.Enabled = true;
            v42.Parent = v8.PlayerGui;
            return;
        end;
    end);
end;
v19.GetDeviceType = function(_) --[[ Line: 183 ]] --[[ Name: GetDeviceType ]]
    -- upvalues: v18 (copy), l_PreferredInput_0 (copy)
    return v18[l_PreferredInput_0.Current] or l_PreferredInput_0.Current;
end;
v19.GetRemappedInput = function(_, v48) --[[ Line: 212 ]] --[[ Name: GetRemappedInput ]]
    -- upvalues: v18 (copy)
    return v18[v48] or v48;
end;
v19.TogglePlayerControls = function(_, v50) --[[ Line: 216 ]] --[[ Name: TogglePlayerControls ]]
    -- upvalues: v8 (copy)
    if v50 == nil then
        v50 = true;
    end;
    local l_FirstChild_0 = v8.Player.PlayerScripts:FindFirstChild("PlayerModule", true);
    if not l_FirstChild_0 then
        warn("PlayerModule not found, cannot toggle controls");
        return;
    else
        l_FirstChild_0 = require(l_FirstChild_0);
        if v50 then
            l_FirstChild_0:GetControls():Enable();
            return;
        else
            l_FirstChild_0:GetControls():Disable();
            return;
        end;
    end;
end;
v19.IsMobile = function(v52) --[[ Line: 236 ]] --[[ Name: IsMobile ]]
    return v52:GetDeviceType() == "Mobile";
end;
v19.IsConsole = function(v53) --[[ Line: 240 ]] --[[ Name: IsConsole ]]
    return v53:GetDeviceType() == "Console";
end;
v19.IsSmallScreen = function(v54) --[[ Line: 244 ]] --[[ Name: IsSmallScreen ]]
    if v54.isSmallScreen ~= nil then
        return v54.isSmallScreen;
    else
        local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
        v54.isSmallScreen = math.min(l_ViewportSize_0.X, l_ViewportSize_0.Y) < 500;
        return v54.isSmallScreen;
    end;
end;
v19.ObserveGamepadButtonPress = function(v56, v57, v58) --[[ Line: 257 ]] --[[ Name: ObserveGamepadButtonPress ]]
    -- upvalues: l_HttpService_0 (copy)
    if not v56._gamepadObservers then
        v56._gamepadObservers = {};
    end;
    if not v56._gamepadObservers[v57] then
        v56._gamepadObservers[v57] = {};
    end;
    local v59 = l_HttpService_0:GenerateGUID();
    v56._gamepadObservers[v57][v59] = v58;
    return function() --[[ Line: 271 ]]
        -- upvalues: v56 (copy), v57 (copy), v59 (copy)
        v56._gamepadObservers[v57][v59] = nil;
    end;
end;
return v19;