local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Timer);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.TimeConvert);
local v5 = nil;
local v6 = nil;
return {
    primaryMenu = false, 
    Init = function(v7, v8, v9) --[[ Line: 31 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v1 (copy), v6 (ref), v2 (copy)
        v5 = v1.GetController("UIController");
        v6 = v1.GetController("DeviceTypeController");
        v7.currentMode = v9;
        v7.ui = v8;
        v7.main = v8.Main;
        v7.messageLabel = v7.main.Message;
        v7.bottomButtons = v7.main.BottomButtons;
        v7.countdownLabel = v7.main.Countdown;
        v7.dumpster = v2.new();
    end, 
    Start = function(_) --[[ Line: 46 ]] --[[ Name: Start ]]

    end, 
    Closed = function(v11) --[[ Line: 50 ]] --[[ Name: Closed ]]
        v11.dumpster:Destroy();
    end, 
    BindToClose = function(v12, v13) --[[ Line: 54 ]] --[[ Name: BindToClose ]]
        v12.dumpster:Add(v13);
    end, 
    Opened = function(_) --[[ Line: 58 ]] --[[ Name: Opened ]]

    end, 
    Prompt = function(v15, v16) --[[ Line: 64 ]] --[[ Name: Prompt ]]
        -- upvalues: v5 (ref), v4 (copy), v3 (copy), v6 (ref)
        v5:Toggle(script.Name, true);
        v15.messageLabel.Text = v16.message or "";
        for _, v18 in v15.bottomButtons:GetChildren() do
            if v18:IsA("GuiButton") then
                v18.Visible = false;
            end;
        end;
        local v19 = v16.options or v16.Options or {};
        for v20, v21 in v19 do
            local l_FirstChild_0 = v15.bottomButtons:FindFirstChild((("Button%*"):format(v20)));
            if l_FirstChild_0 then
                l_FirstChild_0.Visible = true;
                local v23 = v21.text or v21.Text;
                l_FirstChild_0.Content.Title.Text = v23;
                v23 = string.lower(v23);
                if v21.color or v21.Color then
                    l_FirstChild_0.Content.UIGradient.Color = v21.color or v21.Color;
                end;
                v15.dumpster:Add(v5:HandleButton(l_FirstChild_0, function() --[[ Line: 96 ]]
                    -- upvalues: v21 (copy), v5 (ref)
                    if v21.callback then
                        task.spawn(v21.callback);
                    end;
                    v5:Toggle(script.Name, false);
                end));
            end;
        end;
        if v16.messageTime then
            local l_messageTime_0 = v16.messageTime;
            v15.countdownLabel.Visible = true;
            v15.countdownLabel.Text = v4:Convert(l_messageTime_0);
            do
                local l_l_messageTime_0_0 = l_messageTime_0;
                v15.dumpster:Add(v3.Simple(1, function() --[[ Line: 111 ]]
                    -- upvalues: l_l_messageTime_0_0 (ref), v15 (copy), v4 (ref), v19 (copy), v5 (ref)
                    l_l_messageTime_0_0 = l_l_messageTime_0_0 - 1;
                    l_l_messageTime_0_0 = math.round(l_l_messageTime_0_0);
                    v15.countdownLabel.Text = v4:Convert(l_l_messageTime_0_0);
                    if l_l_messageTime_0_0 <= 0 then
                        local v26 = v19 and v19[2] and v19[2].callback;
                        if v26 then
                            task.spawn(v26);
                        end;
                        v5:Toggle(script.Name, false);
                    end;
                end));
            end;
        else
            v15.countdownLabel.Visible = false;
        end;
        local v28 = v6:ObserveGamepadButtonPress(Enum.KeyCode.ButtonL2, function() --[[ Line: 139 ]]
            -- upvalues: v19 (copy), v5 (ref)
            local v27 = v19 and v19[1];
            if not v27 or not v27.callback then
                return;
            else
                task.spawn(v27.callback);
                v5:Toggle(script.Name, false);
                return;
            end;
        end);
        local v30 = v6:ObserveGamepadButtonPress(Enum.KeyCode.ButtonR2, function() --[[ Line: 150 ]]
            -- upvalues: v19 (copy), v5 (ref)
            local v29 = v19 and v19[2];
            if not v29 or not v29.callback then
                return;
            else
                task.spawn(v29.callback);
                v5:Toggle(script.Name, false);
                return;
            end;
        end);
        v15.dumpster:Add(function() --[[ Line: 161 ]]
            -- upvalues: v28 (ref), v30 (ref)
            v28();
            v28 = nil;
            v30();
            v30 = nil;
        end);
    end
};