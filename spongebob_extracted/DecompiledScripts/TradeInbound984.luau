local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
return {
    primaryMenu = false, 
    Init = function(v14, v15, v16) --[[ Line: 39 ]] --[[ Name: Init ]]
        -- upvalues: v7 (ref), v3 (copy), v8 (ref), v9 (ref), v10 (ref), v11 (ref), v12 (ref), v13 (ref), v4 (copy)
        v7 = v3.GetController("UIController");
        v8 = v3.GetService("TradingService");
        v9 = v3.GetController("DeviceTypeController");
        v10 = v3.GetController("TreasureController");
        v11 = v3.GetController("VDayGiftController");
        v12 = v3.GetController("BubblePopperController");
        v13 = v3.GetController("CutsceneController");
        v14.currentMode = v16;
        v14.ui = v15;
        v14.main = v15.Main;
        v14.messageLabel = v14.main.Message;
        local l_Buttons_0 = v14.main.Buttons;
        v14.openButton = l_Buttons_0.Open;
        v14.ignoreButton = l_Buttons_0.Ignore;
        v14.dumpster = v4.new();
    end, 
    Start = function(v18) --[[ Line: 60 ]] --[[ Name: Start ]]
        -- upvalues: v8 (ref), v13 (ref), v10 (ref), v11 (ref), v12 (ref), v7 (ref)
        v8.TradeRequest:Connect(function(v19, _) --[[ Line: 61 ]]
            -- upvalues: v13 (ref), v10 (ref), v11 (ref), v12 (ref), v18 (copy)
            if v13:IsPlaying() then
                return;
            elseif v10:IsOpening() then
                return;
            elseif v11:IsOpening() then
                return;
            elseif v12:IsOpening() then
                return;
            else
                v18:Open(v19);
                return;
            end;
        end);
        v7:HandleButton(v18.openButton, function() --[[ Line: 81 ]]
            -- upvalues: v7 (ref)
            v7:Toggle(script.Name, false);
            v7:Toggle("TradeRequest", true);
        end);
        v7:HandleButton(v18.ignoreButton, function() --[[ Line: 86 ]]
            -- upvalues: v7 (ref)
            v7:Toggle(script.Name, false);
        end);
    end, 
    Opened = function(v21) --[[ Line: 91 ]] --[[ Name: Opened ]]
        -- upvalues: v9 (ref), l_GuiService_0 (copy)
        v21.dumpster:Add(v9:ObserveGamepadButtonPress(Enum.KeyCode.DPadUp, function() --[[ Line: 92 ]]
            -- upvalues: l_GuiService_0 (ref), v21 (copy)
            l_GuiService_0.SelectedObject = v21.openButton;
        end));
    end, 
    Closed = function(v22) --[[ Line: 97 ]] --[[ Name: Closed ]]
        v22.dumpster:Destroy();
    end, 
    Open = function(v23, v24) --[[ Line: 103 ]] --[[ Name: Open ]]
        -- upvalues: v7 (ref), l_Players_0 (copy), v6 (copy)
        if v7:GetToggleState("TradeRequest") then
            return;
        else
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v24);
            if not l_l_Players_0_PlayerByUserId_0 or not l_l_Players_0_PlayerByUserId_0.Parent then
                return;
            else
                v23.messageLabel.Text = ("Incoming Trade from\n%*"):format(l_l_Players_0_PlayerByUserId_0.DisplayName);
                v7:Toggle(script.Name, true);
                if v23.dumpster:Get("Hide") then
                    v23.dumpster:Remove("Hide", true);
                end;
                v23.dumpster:Add(task.delay(v6.TRADING.NOTIFICATION_TIME, function() --[[ Line: 120 ]]
                    -- upvalues: v23 (copy), v7 (ref)
                    if v23.dumpster:Get("Hide") then
                        v23.dumpster:Remove("Hide", true);
                    end;
                    v7:Toggle(script.Name, false);
                end), "Hide");
                return;
            end;
        end;
    end
};