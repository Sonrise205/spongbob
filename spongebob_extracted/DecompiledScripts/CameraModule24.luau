local v0 = {};
v0.__index = v0;
local v1 = {
    "CameraMinZoomDistance", 
    "CameraMaxZoomDistance", 
    "CameraMode", 
    "DevCameraOcclusionMode", 
    "DevComputerCameraMode", 
    "DevTouchCameraMode", 
    "DevComputerMovementMode", 
    "DevTouchMovementMode", 
    "DevEnableMouseLock"
};
local v2 = {
    "ComputerCameraMovementMode", 
    "ComputerMovementMode", 
    "ControlMode", 
    "GamepadCameraSensitivity", 
    "MouseSensitivity", 
    "RotationType", 
    "TouchCameraMovementMode", 
    "TouchMovementMode"
};
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CommonUtils_0 = script.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraUtils_0 = require(script:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script:WaitForChild("CameraInput"));
local l_ClassicCamera_0 = require(script:WaitForChild("ClassicCamera"));
local l_OrbitalCamera_0 = require(script:WaitForChild("OrbitalCamera"));
local l_LegacyCamera_0 = require(script:WaitForChild("LegacyCamera"));
local l_VehicleCamera_0 = require(script:WaitForChild("VehicleCamera"));
local l_VRCamera_0 = require(script:WaitForChild("VRCamera"));
local l_VRVehicleCamera_0 = require(script:WaitForChild("VRVehicleCamera"));
local l_Invisicam_0 = require(script:WaitForChild("Invisicam"));
local l_Poppercam_0 = require(script:WaitForChild("Poppercam"));
local l_TransparencyController_0 = require(script:WaitForChild("TransparencyController"));
local l_MouseLockController_0 = require(script:WaitForChild("MouseLockController"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v23 = {};
local v24 = {};
local l_PlayerScripts_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerScripts");
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
l_PlayerScripts_0 = l_FlagUtil_0.getUserFlag("UserRespectLegacyCameraOptions");
v0.new = function() --[[ Line: 102 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), l_TransparencyController_0 (copy), l_MouseLockController_0 (copy), l_PlayerScripts_0 (copy), l_RunService_0 (copy), v1 (copy), v2 (copy), l_UserGameSettings_0 (copy), l_LocalPlayer_0 (copy)
    local v26 = setmetatable({}, v0);
    v26.activeCameraController = nil;
    v26.activeOcclusionModule = nil;
    v26.activeTransparencyController = nil;
    v26.activeMouseLockController = nil;
    v26.currentComputerCameraMovementMode = nil;
    v26.cameraSubjectChangedConn = nil;
    v26.cameraTypeChangedConn = nil;
    for _, v28 in pairs(l_Players_0:GetPlayers()) do
        v26:OnPlayerAdded(v28);
    end;
    l_Players_0.PlayerAdded:Connect(function(v29) --[[ Line: 123 ]]
        -- upvalues: v26 (copy)
        v26:OnPlayerAdded(v29);
    end);
    v26.activeTransparencyController = l_TransparencyController_0.new();
    v26.activeTransparencyController:Enable(true);
    v26.activeMouseLockController = l_MouseLockController_0.new();
    local l_BindableToggleEvent_0 = v26.activeMouseLockController:GetBindableToggleEvent();
    if l_BindableToggleEvent_0 then
        l_BindableToggleEvent_0:Connect(function() --[[ Line: 134 ]]
            -- upvalues: v26 (copy)
            warn("was toggled now");
            v26:OnMouseLockToggled();
        end);
    end;
    if l_PlayerScripts_0 then
        v26:ActivateCameraController();
    else
        v26:ActivateCameraController(v26:GetCameraControlChoice());
    end;
    v26:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
    v26:OnCurrentCameraChanged();
    l_RunService_0:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(v31) --[[ Line: 148 ]]
        -- upvalues: v26 (copy)
        v26:Update(v31);
    end);
    for _, v33 in pairs(v1) do
        l_Players_0.LocalPlayer:GetPropertyChangedSignal(v33):Connect(function() --[[ Line: 152 ]]
            -- upvalues: v26 (copy), v33 (copy)
            v26:OnLocalPlayerCameraPropertyChanged(v33);
        end);
    end;
    for _, v35 in pairs(v2) do
        l_UserGameSettings_0:GetPropertyChangedSignal(v35):Connect(function() --[[ Line: 158 ]]
            -- upvalues: v26 (copy), v35 (copy)
            v26:OnUserGameSettingsPropertyChanged(v35);
        end);
    end;
    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 162 ]]
        -- upvalues: v26 (copy)
        v26:OnCurrentCameraChanged();
    end);
    l_LocalPlayer_0:SetAttribute("MouseLockState", false);
    l_LocalPlayer_0:GetAttributeChangedSignal("MouseLockState"):Connect(function() --[[ Line: 168 ]]
        -- upvalues: v26 (copy)
        v26.activeMouseLockController:OnMouseLockToggled();
    end);
    return v26;
end;
v0.GetCameraMovementModeFromSettings = function(_) --[[ Line: 175 ]] --[[ Name: GetCameraMovementModeFromSettings ]]
    -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
    else
        local v37 = nil;
        local v38 = nil;
        if l_UserInputService_0.TouchEnabled then
            v37 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevTouchCameraMode);
            v38 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
        else
            v37 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevComputerCameraMode);
            v38 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
        end;
        if v37 == Enum.DevComputerCameraMovementMode.UserChoice then
            return v38;
        else
            return v37;
        end;
    end;
end;
v0.ActivateOcclusionModule = function(v39, v40) --[[ Line: 200 ]] --[[ Name: ActivateOcclusionModule ]]
    -- upvalues: l_Poppercam_0 (copy), l_Invisicam_0 (copy), v24 (copy), l_Players_0 (copy)
    local v41 = nil;
    if v40 == Enum.DevCameraOcclusionMode.Zoom then
        v41 = l_Poppercam_0;
    elseif v40 == Enum.DevCameraOcclusionMode.Invisicam then
        v41 = l_Invisicam_0;
    else
        warn("CameraScript ActivateOcclusionModule called with unsupported mode");
        return;
    end;
    v39.occlusionMode = v40;
    if v39.activeOcclusionModule and v39.activeOcclusionModule:GetOcclusionMode() == v40 then
        if not v39.activeOcclusionModule:GetEnabled() then
            v39.activeOcclusionModule:Enable(true);
        end;
        return;
    else
        local l_activeOcclusionModule_0 = v39.activeOcclusionModule;
        v39.activeOcclusionModule = v24[v41];
        if not v39.activeOcclusionModule then
            v39.activeOcclusionModule = v41.new();
            if v39.activeOcclusionModule then
                v24[v41] = v39.activeOcclusionModule;
            end;
        end;
        if v39.activeOcclusionModule then
            if v39.activeOcclusionModule:GetOcclusionMode() ~= v40 then
                warn("CameraScript ActivateOcclusionModule mismatch: ", v39.activeOcclusionModule:GetOcclusionMode(), "~=", v40);
            end;
            if l_activeOcclusionModule_0 then
                if l_activeOcclusionModule_0 ~= v39.activeOcclusionModule then
                    l_activeOcclusionModule_0:Enable(false);
                else
                    warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
                end;
            end;
            if v40 == Enum.DevCameraOcclusionMode.Invisicam then
                if l_Players_0.LocalPlayer.Character then
                    v39.activeOcclusionModule:CharacterAdded(l_Players_0.LocalPlayer.Character, l_Players_0.LocalPlayer);
                end;
            else
                for _, v44 in pairs(l_Players_0:GetPlayers()) do
                    if v44 and v44.Character then
                        v39.activeOcclusionModule:CharacterAdded(v44.Character, v44);
                    end;
                end;
                v39.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
            end;
            v39.activeOcclusionModule:Enable(true);
        end;
        return;
    end;
end;
v0.ShouldUseVehicleCamera = function(v45) --[[ Line: 279 ]] --[[ Name: ShouldUseVehicleCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return false;
    else
        local l_CameraType_0 = l_CurrentCamera_0.CameraType;
        local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
        local v49 = true;
        if l_CameraType_0 ~= Enum.CameraType.Custom then
            v49 = l_CameraType_0 == Enum.CameraType.Follow;
        end;
        local v50 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat") or false;
        local v51 = v45.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam;
        return v50 and v49 and v51;
    end;
end;
v0.ActivateCameraController = function(v52, v53, v54) --[[ Line: 295 ]] --[[ Name: ActivateCameraController ]]
    -- upvalues: l_PlayerScripts_0 (copy), l_LegacyCamera_0 (copy), l_VRService_0 (copy), l_VRCamera_0 (copy), l_ClassicCamera_0 (copy), l_OrbitalCamera_0 (copy), l_VRVehicleCamera_0 (copy), l_VehicleCamera_0 (copy), v23 (copy)
    if l_PlayerScripts_0 then
        v54 = workspace.CurrentCamera.CameraType;
        v53 = v52:GetCameraMovementModeFromSettings();
    end;
    local v55 = nil;
    if l_PlayerScripts_0 and true or v54 ~= nil then
        if v54 == Enum.CameraType.Scriptable then
            if v52.activeCameraController then
                v52.activeCameraController:Enable(false);
                v52.activeCameraController = nil;
            end;
            return;
        elseif v54 == Enum.CameraType.Custom then
            v53 = v52:GetCameraMovementModeFromSettings();
        elseif v54 == Enum.CameraType.Track then
            v53 = Enum.ComputerCameraMovementMode.Classic;
        elseif v54 == Enum.CameraType.Follow then
            v53 = Enum.ComputerCameraMovementMode.Follow;
        elseif v54 == Enum.CameraType.Orbital then
            v53 = Enum.ComputerCameraMovementMode.Orbital;
        elseif v54 == Enum.CameraType.Attach or v54 == Enum.CameraType.Watch or v54 == Enum.CameraType.Fixed then
            v55 = l_LegacyCamera_0;
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", v54);
        end;
    end;
    if not v55 then
        if l_VRService_0.VREnabled then
            v55 = l_VRCamera_0;
        elseif v53 == Enum.ComputerCameraMovementMode.Classic or v53 == Enum.ComputerCameraMovementMode.Follow or v53 == Enum.ComputerCameraMovementMode.Default or v53 == Enum.ComputerCameraMovementMode.CameraToggle then
            v55 = l_ClassicCamera_0;
        elseif v53 == Enum.ComputerCameraMovementMode.Orbital then
            v55 = l_OrbitalCamera_0;
        else
            warn("ActivateCameraController did not select a module.");
            return;
        end;
    end;
    if v52:ShouldUseVehicleCamera() then
        v55 = if l_VRService_0.VREnabled then l_VRVehicleCamera_0 else l_VehicleCamera_0;
    end;
    local v56 = nil;
    if not v23[v55] then
        v56 = v55.new();
        v23[v55] = v56;
    else
        v56 = v23[v55];
        if v56.Reset then
            v56:Reset();
        end;
    end;
    if v52.activeCameraController then
        if v52.activeCameraController ~= v56 then
            v52.activeCameraController:Enable(false);
            v52.activeCameraController = v56;
            v52.activeCameraController:Enable(true);
        elseif not v52.activeCameraController:GetEnabled() then
            v52.activeCameraController:Enable(true);
        end;
    elseif v56 ~= nil then
        v52.activeCameraController = v56;
        v52.activeCameraController:Enable(true);
    end;
    if v52.activeCameraController then
        if l_PlayerScripts_0 then
            v52.activeCameraController:SetCameraMovementMode(v53);
            v52.activeCameraController:SetCameraType(v54);
            return;
        elseif v53 ~= nil then
            v52.activeCameraController:SetCameraMovementMode(v53);
            return;
        elseif v54 ~= nil then
            v52.activeCameraController:SetCameraType(v54);
        end;
    end;
end;
v0.OnCameraSubjectChanged = function(v57) --[[ Line: 407 ]] --[[ Name: OnCameraSubjectChanged ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v59 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if v57.activeTransparencyController then
        v57.activeTransparencyController:SetSubject(v59);
    end;
    if v57.activeOcclusionModule then
        v57.activeOcclusionModule:OnCameraSubjectChanged(v59);
    end;
    v57:ActivateCameraController(nil, l_CurrentCamera_1.CameraType);
end;
v0.OnCameraTypeChanged = function(v60, v61) --[[ Line: 422 ]] --[[ Name: OnCameraTypeChanged ]]
    -- upvalues: l_UserInputService_0 (copy), l_CameraUtils_0 (copy)
    if v61 == Enum.CameraType.Scriptable and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
        l_CameraUtils_0.restoreMouseBehavior();
    end;
    v60:ActivateCameraController(nil, v61);
end;
v0.OnCurrentCameraChanged = function(v62) --[[ Line: 434 ]] --[[ Name: OnCurrentCameraChanged ]]
    local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
    if not l_CurrentCamera_2 then
        return;
    else
        if v62.cameraSubjectChangedConn then
            v62.cameraSubjectChangedConn:Disconnect();
        end;
        if v62.cameraTypeChangedConn then
            v62.cameraTypeChangedConn:Disconnect();
        end;
        v62.cameraSubjectChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 446 ]]
            -- upvalues: v62 (copy), l_CurrentCamera_2 (copy)
            v62:OnCameraSubjectChanged(l_CurrentCamera_2.CameraSubject);
        end);
        v62.cameraTypeChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 450 ]]
            -- upvalues: v62 (copy), l_CurrentCamera_2 (copy)
            v62:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
        end);
        v62:OnCameraSubjectChanged(l_CurrentCamera_2.CameraSubject);
        v62:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
        return;
    end;
end;
v0.OnLocalPlayerCameraPropertyChanged = function(v64, v65) --[[ Line: 458 ]] --[[ Name: OnLocalPlayerCameraPropertyChanged ]]
    -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy)
    if v65 == "CameraMode" then
        if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
            if not v64.activeCameraController or v64.activeCameraController:GetModuleName() ~= "ClassicCamera" then
                v64:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
            end;
            if v64.activeCameraController then
                v64.activeCameraController:UpdateForDistancePropertyChange();
                return;
            end;
        elseif l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
            local l_v64_CameraMovementModeFromSettings_0 = v64:GetCameraMovementModeFromSettings();
            v64:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v64_CameraMovementModeFromSettings_0));
            return;
        else
            warn("Unhandled value for property player.CameraMode: ", l_Players_0.LocalPlayer.CameraMode);
            return;
        end;
    elseif v65 == "DevComputerCameraMode" or v65 == "DevTouchCameraMode" then
        local l_v64_CameraMovementModeFromSettings_1 = v64:GetCameraMovementModeFromSettings();
        v64:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v64_CameraMovementModeFromSettings_1));
        return;
    elseif v65 == "DevCameraOcclusionMode" then
        v64:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
        return;
    elseif v65 == "CameraMinZoomDistance" or v65 == "CameraMaxZoomDistance" then
        if v64.activeCameraController then
            v64.activeCameraController:UpdateForDistancePropertyChange();
            return;
        end;
    elseif v65 == "DevTouchMovementMode" then
        return;
    elseif v65 == "DevComputerMovementMode" then
        return;
    elseif v65 == "DevEnableMouseLock" then

    end;
end;
v0.OnUserGameSettingsPropertyChanged = function(v68, v69) --[[ Line: 502 ]] --[[ Name: OnUserGameSettingsPropertyChanged ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v69 == "ComputerCameraMovementMode" then
        local l_v68_CameraMovementModeFromSettings_0 = v68:GetCameraMovementModeFromSettings();
        v68:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v68_CameraMovementModeFromSettings_0));
    end;
end;
v0.Update = function(v71, v72) --[[ Line: 515 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraInput_0 (copy)
    if v71.activeCameraController then
        v71.activeCameraController:UpdateMouseBehavior();
        local v73, v74 = v71.activeCameraController:Update(v72);
        if v71.activeOcclusionModule then
            local v75, v76 = v71.activeOcclusionModule:Update(v72, v73, v74);
            v73 = v75;
            v74 = v76;
        end;
        local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
        l_CurrentCamera_3.CFrame = v73;
        l_CurrentCamera_3.Focus = v74;
        if v71.activeTransparencyController then
            v71.activeTransparencyController:Update(v72);
        end;
        if l_CameraInput_0.getInputEnabled() then
            l_CameraInput_0.resetInputForFrameEnd();
        end;
    end;
end;
if not l_PlayerScripts_0 then
    v0.GetCameraControlChoice = function(_) --[[ Line: 544 ]] --[[ Name: GetCameraControlChoice ]]
        -- upvalues: l_Players_0 (copy), l_UserInputService_0 (copy), l_CameraUtils_0 (copy), l_UserGameSettings_0 (copy)
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_1 then
            if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch or l_UserInputService_0.TouchEnabled then
                if l_LocalPlayer_1.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                    return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
                else
                    return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_LocalPlayer_1.DevTouchCameraMode);
                end;
            elseif l_LocalPlayer_1.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
                local v80 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(v80);
            else
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_LocalPlayer_1.DevComputerCameraMode);
            end;
        else
            return;
        end;
    end;
end;
v0.OnCharacterAdded = function(v81, v82, v83) --[[ Line: 568 ]] --[[ Name: OnCharacterAdded ]]
    if v81.activeOcclusionModule then
        v81.activeOcclusionModule:CharacterAdded(v82, v83);
    end;
end;
v0.OnCharacterRemoving = function(v84, v85, v86) --[[ Line: 574 ]] --[[ Name: OnCharacterRemoving ]]
    if v84.activeOcclusionModule then
        v84.activeOcclusionModule:CharacterRemoving(v85, v86);
    end;
end;
v0.OnPlayerAdded = function(v87, v88) --[[ Line: 580 ]] --[[ Name: OnPlayerAdded ]]
    v88.CharacterAdded:Connect(function(v89) --[[ Line: 581 ]]
        -- upvalues: v87 (copy), v88 (copy)
        v87:OnCharacterAdded(v89, v88);
    end);
    v88.CharacterRemoving:Connect(function(v90) --[[ Line: 584 ]]
        -- upvalues: v87 (copy), v88 (copy)
        v87:OnCharacterRemoving(v90, v88);
    end);
end;
v0.OnMouseLockToggled = function(v91) --[[ Line: 589 ]] --[[ Name: OnMouseLockToggled ]]
    if v91.activeMouseLockController then
        local l_IsMouseLocked_0 = v91.activeMouseLockController:GetIsMouseLocked();
        local l_MouseLockOffset_0 = v91.activeMouseLockController:GetMouseLockOffset();
        if v91.activeCameraController then
            v91.activeCameraController:SetIsMouseLocked(l_IsMouseLocked_0);
            v91.activeCameraController:SetMouseLockOffset(l_MouseLockOffset_0);
        end;
    end;
end;
local _ = v0.new();
return {};