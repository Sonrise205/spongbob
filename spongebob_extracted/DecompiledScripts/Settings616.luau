local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedFirst_0.AutoScaler);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = ColorSequence.new(Color3.fromRGB(75, 255, 55), Color3.fromRGB(21, 161, 66));
local v13 = ColorSequence.new(Color3.fromRGB(255, 44, 72), Color3.fromRGB(176, 23, 69));
local v14 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
return {
    primaryMenu = true, 
    blur = true, 
    Init = function(v15, v16, v17) --[[ Line: 37 ]] --[[ Name: Init ]]
        -- upvalues: v8 (ref), v3 (copy), v9 (ref), v10 (ref), v11 (ref), l_TweenService_0 (copy), v14 (copy)
        v15.currentMode = v17;
        v8 = v3.GetController("DataController");
        v9 = v3.GetController("UIController");
        v10 = v3.GetService("GameService");
        v11 = v3.GetService("SettingsService");
        v15.ui = v16;
        v15.main = v16.Main;
        v15.settingsMain = v15.main.SettingsWindow.Inner;
        v15.exitBtn = v15.settingsMain.Exit;
        v15.content = v15.settingsMain.Content;
        v15.bin = v15.content.Bin;
        v15.gameplaySettings = v15.bin.Gameplay;
        v15.lobbyTeleport = v15.bin.LobbyTeleport;
        v15.tradingToggle = v15.gameplaySettings.Trading.Toggle;
        v15.partyToggle = v15.gameplaySettings.PartyInvites.Toggle;
        v15._settingsTweens = {};
        v15._settingsFrames = {};
        for _, v19 in v15.gameplaySettings:GetChildren() do
            if v19:IsA("Frame") and not v19:GetAttribute("MultiToggle") then
                local l_Toggle_0 = v19:FindFirstChild("Toggle");
                l_Toggle_0 = l_Toggle_0 and l_Toggle_0:FindFirstChild("Background");
                if l_Toggle_0 then
                    v15._settingsFrames[v19.Name] = v19;
                    v15._settingsTweens[v19.Name] = {
                        On = l_TweenService_0:Create(l_Toggle_0, v14, {
                            AnchorPoint = Vector2.new(1, 0), 
                            Position = UDim2.fromScale(1, 0)
                        }), 
                        Off = l_TweenService_0:Create(l_Toggle_0, v14, {
                            AnchorPoint = Vector2.new(0, 0), 
                            Position = UDim2.fromScale(0, 0)
                        })
                    };
                end;
            end;
        end;
        local v21 = false;
        for _, v23 in v15.content:GetDescendants() do
            local l_v23_Attribute_0 = v23:GetAttribute("VisibleModes");
            if l_v23_Attribute_0 and typeof(l_v23_Attribute_0) == "string" then
                l_v23_Attribute_0 = string.split(l_v23_Attribute_0, ",");
                v23.Visible = table.find(l_v23_Attribute_0, v17) ~= nil;
                if v23.Visible and v23.Parent == v15.gameplaySettings then
                    v21 = true;
                end;
            end;
        end;
        v15.lobbyTeleport.Hint.Visible = v15.currentMode == "Game";
        v15.bin.Line.Visible = v15.lobbyTeleport.Visible and v21;
        v15.gameplaySettings.Visible = v21;
        v15.settingsMain.Parent.Position = UDim2.fromScale(0.5, v15.currentMode == "Cave" and 0.5 or 0.45);
        if v15.bin.AbsoluteSize.Y >= 560 then
            v15.bin.AutomaticSize = Enum.AutomaticSize.None;
            v15.bin:SetAttribute("OriginalSize", UDim2.new(1, 0, 0, 560));
            v15.bin.AutomaticCanvasSize = Enum.AutomaticSize.Y;
        end;
    end, 
    Start = function(v25, _) --[[ Line: 124 ]] --[[ Name: Start ]]
        -- upvalues: v9 (ref), v10 (ref), v8 (ref), v3 (copy), v12 (copy), v13 (copy), v11 (ref), v14 (copy), v6 (copy)
        v9:HandleButton(v25.exitBtn, function() --[[ Line: 125 ]]
            -- upvalues: v9 (ref)
            v9:Toggle(script.Name, false);
        end);
        v9:HandleButton(v25.lobbyTeleport.Inner.Teleport, function() --[[ Line: 129 ]]
            -- upvalues: v10 (ref)
            v10:ReturningToLobby();
        end);
        v25._mySettings = v8:Get(v3.Player, "Settings"):expect();
        v8:OnChanged(v3.Player, "Settings", function(v27) --[[ Line: 136 ]]
            -- upvalues: v25 (copy)
            v25._mySettings = v27;
        end);
        for v28, v29 in v25._settingsFrames do
            local l_ToggleButton_0 = v29.ToggleButton;
            local l_Background_0 = v29.Toggle.Background;
            local v32 = v25._mySettings[v28] or false;
            l_Background_0.AnchorPoint = if v32 then Vector2.new(1, 0) else Vector2.new(0, 0);
            l_Background_0.Position = UDim2.fromScale(v32 and 1 or 0, 0);
            l_Background_0.UIGradient.Color = if v32 then v12 else v13;
            local v33 = false;
            do
                local l_v33_0 = v33;
                v9:HandleButton(l_ToggleButton_0, function() --[[ Line: 151 ]]
                    -- upvalues: l_v33_0 (ref), v11 (ref), v28 (copy), l_Background_0 (copy), v12 (ref), v13 (ref), v25 (copy), v14 (ref)
                    if l_v33_0 then
                        return;
                    else
                        l_v33_0 = true;
                        local v35 = v11:ToggleSetting(v28):expect();
                        if v35 == nil then
                            l_v33_0 = false;
                            return;
                        else
                            l_Background_0.UIGradient.Color = v35 and v12 or v13;
                            v25._settingsTweens[v28][v35 and "On" or "Off"]:Play();
                            task.delay(v14.Time / 2, function() --[[ Line: 169 ]]
                                -- upvalues: l_v33_0 (ref)
                                l_v33_0 = false;
                            end);
                            return;
                        end;
                    end;
                end);
            end;
        end;
        local v36 = false;
        local function _(v37) --[[ Line: 178 ]] --[[ Name: updateTradingState ]]
            -- upvalues: v25 (copy), v6 (ref), v13 (ref), v12 (ref)
            v37 = v37 or v25._mySettings.Trading;
            v25.tradingToggle.Title.Text = v6.TRADING.SETTINGS[v37];
            v25.tradingToggle.UIGradient.Color = if v37 == 3 then v13 else v12;
        end;
        local v39 = nil or v25._mySettings.Trading;
        v25.tradingToggle.Title.Text = v6.TRADING.SETTINGS[v39];
        v25.tradingToggle.UIGradient.Color = if v39 == 3 then v13 else v12;
        v9:HandleButton(v25.tradingToggle, function() --[[ Line: 186 ]]
            -- upvalues: v36 (ref), v11 (ref), v25 (copy), v6 (ref), v13 (ref), v12 (ref)
            if v36 then
                return;
            else
                v36 = true;
                local v40 = v11:ToggleSetting("Trading"):expect() or v25._mySettings.Trading;
                v25.tradingToggle.Title.Text = v6.TRADING.SETTINGS[v40];
                v25.tradingToggle.UIGradient.Color = if v40 == 3 then v13 else v12;
                v36 = false;
                return;
            end;
        end);
        v39 = false;
        local function _(v41) --[[ Line: 200 ]] --[[ Name: updatePartyState ]]
            -- upvalues: v25 (copy), v6 (ref), v13 (ref), v12 (ref)
            v41 = v41 or v25._mySettings.PartyInvites;
            v25.partyToggle.Title.Text = v6.TRADING.SETTINGS[v41] or v6.TRADING.SETTINGS[1];
            v25.partyToggle.UIGradient.Color = if v41 == 3 then v13 else v12;
        end;
        local v43 = nil or v25._mySettings.PartyInvites;
        v25.partyToggle.Title.Text = v6.TRADING.SETTINGS[v43] or v6.TRADING.SETTINGS[1];
        v25.partyToggle.UIGradient.Color = if v43 == 3 then v13 else v12;
        v9:HandleButton(v25.partyToggle, function() --[[ Line: 208 ]]
            -- upvalues: v39 (ref), v11 (ref), v25 (copy), v6 (ref), v13 (ref), v12 (ref)
            if v39 then
                return;
            else
                v39 = true;
                local v44 = v11:ToggleSetting("PartyInvites"):expect() or v25._mySettings.PartyInvites;
                v25.partyToggle.Title.Text = v6.TRADING.SETTINGS[v44] or v6.TRADING.SETTINGS[1];
                v25.partyToggle.UIGradient.Color = if v44 == 3 then v13 else v12;
                v39 = false;
                return;
            end;
        end);
    end
};