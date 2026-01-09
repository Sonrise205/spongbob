local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Timer);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.TimeConvert);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
return {
    primaryMenu = false, 
    Init = function(v9, v10, v11) --[[ Line: 33 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v1 (copy), v6 (ref), v7 (ref), v8 (ref), v2 (copy)
        v5 = v1.GetController("UIController");
        v6 = v1.GetController("DeviceTypeController");
        v7 = v1.GetService("NotificationService");
        v8 = v1.GetController("DataController");
        v9.currentMode = v11;
        v9.ui = v10;
        v9.main = v10.Main;
        v9.messageLabel = v9.main.Message;
        v9.closeButton = v9.ui.Close;
        v9.bottomButtons = v9.main.BottomButtons;
        v9.countdownLabel = v9.main.Countdown;
        v9.button1 = v9.bottomButtons.Button1;
        v9.dumpster = v2.new();
    end, 
    Start = function(v12) --[[ Line: 53 ]] --[[ Name: Start ]]
        -- upvalues: v7 (ref)
        v7.Prompt:Connect(function(v13) --[[ Line: 54 ]]
            -- upvalues: v12 (copy)
            v12:Prompt(v13);
        end);
    end, 
    Closed = function(v14) --[[ Line: 59 ]] --[[ Name: Closed ]]
        v14.dumpster:Destroy();
    end, 
    BindToClose = function(v15, v16) --[[ Line: 63 ]] --[[ Name: BindToClose ]]
        v15.dumpster:Add(v16);
    end, 
    OnJoin = function(_) --[[ Line: 67 ]] --[[ Name: OnJoin ]]
        -- upvalues: v8 (ref), v1 (copy)
        return #v8:Get(v1.Player, "OnJoinMessageQueue"):expect() > 0;
    end, 
    Opened = function(v18) --[[ Line: 73 ]] --[[ Name: Opened ]]
        -- upvalues: v8 (ref), v1 (copy), v7 (ref)
        local v19 = v8:Get(v1.Player, "OnJoinMessageQueue"):expect();
        if #v19 < 1 then
            return;
        else
            local function v20() --[[ Line: 79 ]] --[[ Name: processQueue ]]
                -- upvalues: v19 (copy), v7 (ref), v18 (copy), v20 (copy)
                local v21 = table.remove(v19, 1);
                if not v21 then
                    return;
                else
                    v7.ReceivedOnJoinMessage:Fire();
                    v18:Prompt({
                        message = v21, 
                        options = {
                            {
                                text = "OK", 
                                callback = function() --[[ Line: 91 ]] --[[ Name: callback ]]
                                    -- upvalues: v19 (ref), v20 (ref)
                                    if #v19 > 0 then
                                        v20();
                                    end;
                                end
                            }
                        }
                    });
                    return;
                end;
            end;
            v20();
            return;
        end;
    end, 
    Prompt = function(v22, v23) --[[ Line: 105 ]] --[[ Name: Prompt ]]
        -- upvalues: v5 (ref), v4 (copy), v3 (copy), v6 (ref)
        v5:Toggle(script.Name, true);
        v22.messageLabel.Text = v23.message or "";
        v22.messageLabel.TextXAlignment = v23.textXAlignment or Enum.TextXAlignment.Center;
        for _, v25 in v22.bottomButtons:GetChildren() do
            if v25:IsA("GuiButton") then
                v25.Visible = false;
            end;
        end;
        local v26 = v23.options or v23.Options or {};
        for v27, v28 in v26 do
            if v27 <= 2 then
                local l_FirstChild_0 = v22.bottomButtons:FindFirstChild((("Button%*"):format(v27)));
                if v23.multiChoice and v27 == 2 then
                    l_FirstChild_0 = v22.button1:Clone();
                    l_FirstChild_0.Parent = v22.bottomButtons;
                    v22.dumpster:Add(l_FirstChild_0);
                end;
                if l_FirstChild_0 then
                    l_FirstChild_0.Visible = true;
                    local v30 = v28.text or v28.Text;
                    l_FirstChild_0.Content.Title.Text = v30;
                    v30 = string.lower(v30);
                    if v28.color or v28.Color then
                        l_FirstChild_0.Content.UIGradient.Color = v28.color or v28.Color;
                    end;
                    v22.dumpster:Add(v5:HandleButton(l_FirstChild_0, function() --[[ Line: 148 ]]
                        -- upvalues: v28 (copy), v5 (ref)
                        if v28.callback then
                            task.spawn(v28.callback);
                        end;
                        v5:Toggle(script.Name, false);
                    end));
                end;
            end;
        end;
        if v23.messageTime then
            local l_messageTime_0 = v23.messageTime;
            v22.countdownLabel.Visible = true;
            v22.countdownLabel.Text = v4:Convert(l_messageTime_0);
            do
                local l_l_messageTime_0_0 = l_messageTime_0;
                v22.dumpster:Add(v3.Simple(1, function() --[[ Line: 163 ]]
                    -- upvalues: l_l_messageTime_0_0 (ref), v22 (copy), v4 (ref), v26 (copy), v5 (ref)
                    l_l_messageTime_0_0 = l_l_messageTime_0_0 - 1;
                    l_l_messageTime_0_0 = math.round(l_l_messageTime_0_0);
                    v22.countdownLabel.Text = v4:Convert(l_l_messageTime_0_0);
                    if l_l_messageTime_0_0 <= 0 then
                        local v33 = v26 and v26[2] and v26[2].callback;
                        if v33 then
                            task.spawn(v33);
                        end;
                        v5:Toggle(script.Name, false);
                    end;
                end));
            end;
        else
            v22.countdownLabel.Visible = false;
        end;
        v22.dumpster:Add(v5:HandleButton(v22.closeButton, function() --[[ Line: 182 ]]
            -- upvalues: v26 (copy), v5 (ref)
            local v34 = v26 and (v26[3] and v26[3].callback or v26[2] and v26[2].callback);
            if v34 then
                task.spawn(v34);
            end;
            v5:Toggle(script.Name, false);
        end));
        local v36 = v6:ObserveGamepadButtonPress(Enum.KeyCode.ButtonL2, function() --[[ Line: 191 ]]
            -- upvalues: v26 (copy), v5 (ref)
            local v35 = v26 and v26[1];
            if not v35 or not v35.callback then
                return;
            else
                task.spawn(v35.callback);
                v5:Toggle(script.Name, false);
                return;
            end;
        end);
        local v38 = v6:ObserveGamepadButtonPress(Enum.KeyCode.ButtonR2, function() --[[ Line: 202 ]]
            -- upvalues: v26 (copy), v5 (ref)
            local v37 = v26 and v26[2];
            if not v37 or not v37.callback then
                return;
            else
                task.spawn(v37.callback);
                v5:Toggle(script.Name, false);
                return;
            end;
        end);
        v22.dumpster:Add(function() --[[ Line: 213 ]]
            -- upvalues: v36 (ref), v38 (ref)
            v36();
            v36 = nil;
            v38();
            v38 = nil;
        end);
    end
};