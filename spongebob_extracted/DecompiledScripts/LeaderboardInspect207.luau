local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v8 = require(l_ReplicatedStorage_0.Packages.Signal);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local l_R_0 = Enum.KeyCode.R;
local l_ButtonB_0 = Enum.KeyCode.ButtonB;
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    CloseLeaderboard = v8.new(), 
    Init = function(v18, v19, v20) --[[ Line: 43 ]] --[[ Name: Init ]]
        -- upvalues: v12 (ref), v5 (copy), v13 (ref), v14 (ref), v15 (ref), v6 (copy)
        v12 = v5.GetController("UIController");
        v13 = v5.GetService("GameService");
        v14 = v5.GetController("DeviceTypeController");
        v15 = v5.GetService("BarnacleService");
        v18.currentMode = v20;
        v18.ui = v19;
        v18.main = v19.Main;
        v18.button = v18.main.Button;
        v18.keyCodeFrame = v18.button.KeyCode;
        v18.keyCodeIcon = v18.keyCodeFrame.Icon;
        v18.keyCodeKeybind = v18.keyCodeFrame.Keybind;
        v18.dumpster = v6.new();
    end, 
    Start = function(v21) --[[ Line: 61 ]] --[[ Name: Start ]]
        -- upvalues: v12 (ref), l_PreferredInput_0 (copy), l_UserInputService_0 (copy), l_R_0 (copy), l_ButtonB_0 (copy)
        v12:HandleButton(v21.button, function() --[[ Line: 62 ]]
            -- upvalues: v21 (copy)
            v21:_close();
        end);
        l_PreferredInput_0.Observe(function(v22) --[[ Line: 66 ]]
            -- upvalues: v21 (copy), l_UserInputService_0 (ref), l_R_0 (ref), l_ButtonB_0 (ref)
            if v22 == "Touch" then
                v21.keyCodeFrame.Visible = false;
                return;
            else
                v21.keyCodeFrame.Visible = true;
                v21.keyCodeIcon.Visible = v22 == "Gamepad";
                v21.keyCodeKeybind.Visible = v22 == "MouseKeyboard";
                v21.currentInput = v22;
                if v22 == "MouseKeyboard" then
                    v21.keyCodeKeybind.Text = l_UserInputService_0:GetStringForKeyCode(l_R_0);
                    return;
                else
                    if v22 == "Gamepad" then
                        v21.keyCodeIcon.Image = l_UserInputService_0:GetImageForKeyCode(l_ButtonB_0);
                    end;
                    return;
                end;
            end;
        end);
    end, 
    Opened = function(v23) --[[ Line: 86 ]] --[[ Name: Opened ]]
        -- upvalues: l_GuiService_0 (copy), l_GamepadService_0 (copy), l_UserInputService_0 (copy), l_R_0 (copy), l_ButtonB_0 (copy)
        if v23.currentInput == "Gamepad" then
            l_GuiService_0.SelectedObject = nil;
            l_GamepadService_0:EnableGamepadCursor(nil);
            l_GuiService_0.SelectedObject = nil;
        end;
        v23.dumpster:Add(l_UserInputService_0.InputEnded:Connect(function(v24, v25) --[[ Line: 93 ]]
            -- upvalues: l_R_0 (ref), l_ButtonB_0 (ref), v23 (copy)
            if v25 then
                return;
            else
                if v24.KeyCode == l_R_0 or v24.KeyCode == l_ButtonB_0 then
                    v23:_close();
                end;
                return;
            end;
        end));
    end, 
    Closed = function(v26) --[[ Line: 104 ]] --[[ Name: Closed ]]
        -- upvalues: l_GamepadService_0 (copy)
        l_GamepadService_0:DisableGamepadCursor();
        v26.dumpster:Destroy();
        v26.CloseLeaderboard:Fire();
    end, 
    _close = function(_) --[[ Line: 115 ]] --[[ Name: _close ]]
        -- upvalues: v12 (ref)
        v12:Toggle(script.Name, false);
    end
};