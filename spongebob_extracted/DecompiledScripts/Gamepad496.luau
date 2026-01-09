local v0 = require(script.Parent.Parent.Parent.Trove);
local v1 = require(script.Parent.Parent.Parent.Signal);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HapticService_0 = game:GetService("HapticService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local function _(v6, v7) --[[ Line: 13 ]] --[[ Name: ApplyDeadzone ]]
    if math.abs(v6) < v7 then
        return 0;
    else
        return (math.abs(v6) - v7) / (1 - v7) * math.sign(v6);
    end;
end;
local function v16() --[[ Line: 20 ]] --[[ Name: GetActiveGamepad ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v9 = nil;
    local l_l_UserInputService_0_NavigationGamepads_0 = l_UserInputService_0:GetNavigationGamepads();
    if #l_l_UserInputService_0_NavigationGamepads_0 > 1 then
        for _, v12 in ipairs(l_l_UserInputService_0_NavigationGamepads_0) do
            if v9 == nil or v12.Value < v9.Value then
                v9 = v12;
            end;
        end;
    else
        local l_l_UserInputService_0_ConnectedGamepads_0 = l_UserInputService_0:GetConnectedGamepads();
        for _, v15 in ipairs(l_l_UserInputService_0_ConnectedGamepads_0) do
            if v9 == nil or v15.Value < v9.Value then
                v9 = v15;
            end;
        end;
    end;
    if v9 and not l_UserInputService_0:GetGamepadConnected(v9) then
        v9 = nil;
    end;
    return v9;
end;
local function _(v17, v18) --[[ Line: 43 ]] --[[ Name: HeartbeatDelay ]]
    -- upvalues: l_RunService_0 (copy)
    local v19 = time();
    local v20 = nil;
    v20 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 46 ]]
        -- upvalues: v19 (copy), v17 (copy), v20 (ref), v18 (copy)
        if time() - v19 >= v17 then
            v20:Disconnect();
            v18();
        end;
    end);
    return v20;
end;
local v22 = {};
v22.__index = v22;
v22.new = function(v23) --[[ Line: 232 ]] --[[ Name: new ]]
    -- upvalues: v22 (copy), v0 (copy), v1 (copy)
    local v24 = setmetatable({}, v22);
    v24._trove = v0.new();
    v24._gamepadTrove = v24._trove:Construct(v0);
    v24.ButtonDown = v24._trove:Construct(v1);
    v24.ButtonUp = v24._trove:Construct(v1);
    v24.Connected = v24._trove:Construct(v1);
    v24.Disconnected = v24._trove:Construct(v1);
    v24.GamepadChanged = v24._trove:Construct(v1);
    v24.DefaultDeadzone = 0.05;
    v24.SupportsVibration = false;
    v24.State = {};
    v24:_setupGamepad(v23);
    v24:_setupMotors();
    return v24;
end;
v22._setupActiveGamepad = function(v25, v26) --[[ Line: 249 ]] --[[ Name: _setupActiveGamepad ]]
    -- upvalues: l_HapticService_0 (copy), l_UserInputService_0 (copy)
    local l__gamepad_0 = v25._gamepad;
    if v26 == l__gamepad_0 then
        return;
    else
        v25._gamepadTrove:Clean();
        table.clear(v25.State);
        v25.SupportsVibration = if v26 then l_HapticService_0:IsVibrationSupported(v26) else false;
        v25._gamepad = v26;
        if not v26 then
            v25.Disconnected:Fire();
            v25.GamepadChanged:Fire(nil);
            return;
        else
            for _, v29 in ipairs(l_UserInputService_0:GetGamepadState(v26)) do
                v25.State[v29.KeyCode] = v29;
            end;
            v25._gamepadTrove:Add(v25, "StopMotors");
            v25._gamepadTrove:Connect(l_UserInputService_0.InputBegan, function(v30, v31) --[[ Line: 274 ]]
                -- upvalues: v26 (copy), v25 (copy)
                if v30.UserInputType == v26 then
                    v25.ButtonDown:Fire(v30.KeyCode, v31);
                end;
            end);
            v25._gamepadTrove:Connect(l_UserInputService_0.InputEnded, function(v32, v33) --[[ Line: 280 ]]
                -- upvalues: v26 (copy), v25 (copy)
                if v32.UserInputType == v26 then
                    v25.ButtonUp:Fire(v32.KeyCode, v33);
                end;
            end);
            if l__gamepad_0 == nil then
                v25.Connected:Fire();
            end;
            v25.GamepadChanged:Fire(v26);
            return;
        end;
    end;
end;
v22._setupGamepad = function(v34, v35) --[[ Line: 292 ]] --[[ Name: _setupGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), v16 (copy)
    if v35 then
        v34._trove:Connect(l_UserInputService_0.GamepadConnected, function(v36) --[[ Line: 296 ]]
            -- upvalues: v35 (copy), v34 (copy)
            if v36 == v35 then
                v34:_setupActiveGamepad(v35);
            end;
        end);
        v34._trove:Connect(l_UserInputService_0.GamepadDisconnected, function(v37) --[[ Line: 302 ]]
            -- upvalues: v35 (copy), v34 (copy)
            if v37 == v35 then
                v34:_setupActiveGamepad(nil);
            end;
        end);
        if l_UserInputService_0:GetGamepadConnected(v35) then
            v34:_setupActiveGamepad(v35);
            return;
        end;
    else
        local function v39() --[[ Line: 314 ]] --[[ Name: CheckToSetupActive ]]
            -- upvalues: v16 (ref), v34 (copy)
            local v38 = v16();
            if v38 ~= v34._gamepad then
                v34:_setupActiveGamepad(v38);
            end;
        end;
        v34._trove:Connect(l_UserInputService_0.GamepadConnected, v39);
        v34._trove:Connect(l_UserInputService_0.GamepadDisconnected, v39);
        v34:_setupActiveGamepad((v16()));
    end;
end;
v22._setupMotors = function(v40) --[[ Line: 327 ]] --[[ Name: _setupMotors ]]
    v40._setMotorIds = {};
    for _, v42 in ipairs(Enum.VibrationMotor:GetEnumItems()) do
        v40._setMotorIds[v42] = 0;
    end;
end;
v22.GetThumbstick = function(v43, v44, v45) --[[ Line: 349 ]] --[[ Name: GetThumbstick ]]
    local l_Position_0 = v43.State[v44].Position;
    local v47 = v45 or v43.DefaultDeadzone;
    local l_new_0 = Vector2.new;
    local l_X_0 = l_Position_0.X;
    local v50 = math.abs(l_X_0) < v47 and 0 or (math.abs(l_X_0) - v47) / (1 - v47) * math.sign(l_X_0);
    local l_Y_0 = l_Position_0.Y;
    return l_new_0(v50, math.abs(l_Y_0) < v47 and 0 or (math.abs(l_Y_0) - v47) / (1 - v47) * math.sign(l_Y_0));
end;
v22.GetTrigger = function(v52, v53, v54) --[[ Line: 371 ]] --[[ Name: GetTrigger ]]
    local l_Z_0 = v52.State[v53].Position.Z;
    local v56 = v54 or v52.DefaultDeadzone;
    if math.abs(l_Z_0) < v56 then
        return 0;
    else
        return (math.abs(l_Z_0) - v56) / (1 - v56) * math.sign(l_Z_0);
    end;
end;
v22.IsButtonDown = function(v57, v58) --[[ Line: 389 ]] --[[ Name: IsButtonDown ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:IsGamepadButtonDown(v57._gamepad, v58);
end;
v22.IsMotorSupported = function(v59, v60) --[[ Line: 408 ]] --[[ Name: IsMotorSupported ]]
    -- upvalues: l_HapticService_0 (copy)
    return l_HapticService_0:IsMotorSupported(v59._gamepad, v60);
end;
v22.SetMotor = function(v61, v62, v63) --[[ Line: 422 ]] --[[ Name: SetMotor ]]
    -- upvalues: l_HapticService_0 (copy)
    local l__setMotorIds_0 = v61._setMotorIds;
    l__setMotorIds_0[v62] = l__setMotorIds_0[v62] + 1;
    l__setMotorIds_0 = v61._setMotorIds[v62];
    l_HapticService_0:SetMotor(v61._gamepad, v62, v63);
    return l__setMotorIds_0;
end;
v22.PulseMotor = function(v65, v66, v67, v68) --[[ Line: 454 ]] --[[ Name: PulseMotor ]]
    -- upvalues: l_RunService_0 (copy)
    local v69 = v65:SetMotor(v66, v67);
    local function v70() --[[ Line: 456 ]]
        -- upvalues: v65 (copy), v66 (copy), v69 (copy)
        if v65._setMotorIds[v66] ~= v69 then
            return;
        else
            v65:StopMotor(v66);
            return;
        end;
    end;
    local v71 = time();
    local v72 = nil;
    local v73;
    do
        local l_v72_0 = v72;
        l_v72_0 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 46 ]]
            -- upvalues: v71 (copy), v68 (copy), l_v72_0 (ref), v70 (copy)
            if time() - v71 >= v68 then
                l_v72_0:Disconnect();
                v70();
            end;
        end);
        v73 = l_v72_0;
    end;
    v65._gamepadTrove:Add(v73);
end;
v22.StopMotor = function(v75, v76) --[[ Line: 476 ]] --[[ Name: StopMotor ]]
    v75:SetMotor(v76, 0);
end;
v22.StopMotors = function(v77) --[[ Line: 490 ]] --[[ Name: StopMotors ]]
    for _, v79 in ipairs(Enum.VibrationMotor:GetEnumItems()) do
        if v77:IsMotorSupported(v79) then
            v77:StopMotor(v79);
        end;
    end;
end;
v22.IsConnected = function(v80) --[[ Line: 502 ]] --[[ Name: IsConnected ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v80._gamepad then
        return (l_UserInputService_0:GetGamepadConnected(v80._gamepad));
    else
        return false;
    end;
end;
v22.GetUserInputType = function(v81) --[[ Line: 511 ]] --[[ Name: GetUserInputType ]]
    return v81._gamepad;
end;
v22.SetAutoSelectGui = function(_, v83) --[[ Line: 533 ]] --[[ Name: SetAutoSelectGui ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0.AutoSelectGuiEnabled = v83;
end;
v22.IsAutoSelectGuiEnabled = function(_) --[[ Line: 542 ]] --[[ Name: IsAutoSelectGuiEnabled ]]
    -- upvalues: l_GuiService_0 (copy)
    return l_GuiService_0.AutoSelectGuiEnabled;
end;
v22.Destroy = function(v85) --[[ Line: 549 ]] --[[ Name: Destroy ]]
    v85._trove:Destroy();
end;
return v22;