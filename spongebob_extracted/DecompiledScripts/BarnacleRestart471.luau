local _ = game:GetService("GuiService");
local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local l_R_0 = Enum.KeyCode.R;
local l_ButtonY_0 = Enum.KeyCode.ButtonY;
return {
    primaryMenu = false, 
    Init = function(v16, v17, v18) --[[ Line: 42 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v4 (copy), v11 (ref), v12 (ref), v13 (ref), v5 (copy)
        v10 = v4.GetController("UIController");
        v11 = v4.GetService("GameService");
        v12 = v4.GetController("DeviceTypeController");
        v13 = v4.GetService("BarnacleService");
        v16.currentMode = v18;
        v16.ui = v17;
        v16.main = v17.Main;
        v16.button = v16.main.Button;
        v16.keyCodeFrame = v16.button.KeyCode;
        v16.keyCodeIcon = v16.keyCodeFrame.Icon;
        v16.keyCodeKeybind = v16.keyCodeFrame.Keybind;
        v16.dumpster = v5.new();
    end, 
    Start = function(v19) --[[ Line: 60 ]] --[[ Name: Start ]]
        -- upvalues: v10 (ref), v13 (ref), l_PreferredInput_0 (copy), l_UserInputService_0 (copy), l_R_0 (copy), l_ButtonY_0 (copy)
        v10:HandleButton(v19.button, function() --[[ Line: 61 ]]
            -- upvalues: v13 (ref)
            v13.Restart:Fire();
        end);
        l_PreferredInput_0.Observe(function(v20) --[[ Line: 65 ]]
            -- upvalues: v19 (copy), l_UserInputService_0 (ref), l_R_0 (ref), l_ButtonY_0 (ref)
            if v20 == "Touch" then
                v19.keyCodeFrame.Visible = false;
                return;
            else
                v19.keyCodeFrame.Visible = true;
                v19.keyCodeIcon.Visible = v20 == "Gamepad";
                v19.keyCodeKeybind.Visible = v20 == "MouseKeyboard";
                if v20 == "MouseKeyboard" then
                    v19.keyCodeKeybind.Text = l_UserInputService_0:GetStringForKeyCode(l_R_0);
                    return;
                else
                    if v20 == "Gamepad" then
                        v19.keyCodeIcon.Image = l_UserInputService_0:GetImageForKeyCode(l_ButtonY_0);
                    end;
                    return;
                end;
            end;
        end);
    end, 
    Opened = function(v21) --[[ Line: 84 ]] --[[ Name: Opened ]]
        -- upvalues: l_UserInputService_0 (copy), l_R_0 (copy), l_ButtonY_0 (copy), v13 (ref)
        v21.dumpster:Add(l_UserInputService_0.InputEnded:Connect(function(v22, v23) --[[ Line: 85 ]]
            -- upvalues: l_R_0 (ref), l_ButtonY_0 (ref), v13 (ref)
            if v23 then
                return;
            else
                if v22.KeyCode == l_R_0 or v22.KeyCode == l_ButtonY_0 then
                    v13.Restart:Fire();
                end;
                return;
            end;
        end));
    end, 
    Closed = function(v24) --[[ Line: 96 ]] --[[ Name: Closed ]]
        v24.dumpster:Destroy();
    end
};