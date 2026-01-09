local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Utf8Library);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.PromiseUserInfo);
local v13 = require(v2.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    blur = true, 
    Init = function(v19, v20) --[[ Line: 47 ]] --[[ Name: Init ]]
        -- upvalues: v14 (ref), v2 (copy), v15 (ref), v16 (ref), v17 (ref), v3 (copy), l_Players_0 (copy)
        v14 = v2.GetController("DataController");
        v15 = v2.GetController("UIController");
        v16 = v2.GetService("GiftService");
        v17 = v2.GetController("PurchaseController");
        v19.ui = v20;
        v19.main = v20.Main;
        v19.mainFrame = v19.main.MainMenu;
        v19.cancelBtn = v19.mainFrame.BottomButtons.Cancel;
        v19.meBtn = v19.mainFrame.BottomButtons.Me;
        v19.giftBtn = v19.mainFrame.BottomButtons.Gift;
        v19.sendFrame = v19.main.SendFrame;
        v19.sendBtn = v19.sendFrame.BottomButtons.Send;
        v19.cancelSendBtn = v19.sendFrame.BottomButtons.Cancel;
        v19.playerNameLabel = v19.sendFrame.PlayerName;
        v19.inputFrame = v19.sendFrame.InputBox.TextBox;
        v19.playerIcon = v19.sendFrame.PlayerIcon;
        v19.playerList = v19.sendFrame.ServerList.Bin;
        v19.noPlayersLabel = v19.playerList.Parent.NoPlayers;
        v19.template = v19.playerList.Template:Clone();
        v19.playerList.Template:Destroy();
        v19.noPlayersLabel.Visible = true;
        v19.dumpster = v3.new();
        v19:Reset();
        l_Players_0.PlayerRemoving:Connect(function(v21) --[[ Line: 81 ]]
            -- upvalues: v19 (copy)
            local l_FirstChild_0 = v19.playerList:FindFirstChild(v21.UserId);
            if l_FirstChild_0 then
                l_FirstChild_0:Destroy();
            end;
        end);
    end, 
    Start = function(v23, _) --[[ Line: 91 ]] --[[ Name: Start ]]
        -- upvalues: v18 (ref), v15 (ref), l_Players_0 (copy), v5 (copy), v13 (copy), v16 (ref), v2 (copy)
        v18 = v15:GetModuleAsync("MessagePrompt"):expect();
        v23.dumpster:Connect(l_Players_0.PlayerAdded, function(v25) --[[ Line: 94 ]]
            -- upvalues: v23 (copy)
            v23:_addPlayer(v25.UserId);
        end);
        local v27 = v5.Map(l_Players_0:GetPlayers(), function(v26) --[[ Line: 98 ]]
            return v26.UserId;
        end);
        v13.loadOnDemand(v27, v23.playerList, v23.dumpster, function(v28) --[[ Line: 102 ]]
            -- upvalues: v23 (copy)
            v23:_addPlayer(v28);
        end);
        v15:HandleButton(v23.sendBtn, function() --[[ Line: 106 ]]
            -- upvalues: v23 (copy), v18 (ref), v16 (ref), v15 (ref)
            if not v23._giftName or not v23._userInfo or not v23._userInfo.Username then
                warn("couldnt send because something is missing");
                return;
            else
                v18:Prompt({
                    message = ("Are you sure you want to send this gift to @%*?"):format(v23._userInfo.Username), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 118 ]] --[[ Name: callback ]]
                                -- upvalues: v23 (ref), v16 (ref), v18 (ref), v15 (ref)
                                local l__giftName_0 = v23._giftName;
                                local l_Username_0 = v23._userInfo.Username;
                                v16:UseGift(l__giftName_0, l_Username_0):andThen(function(v31) --[[ Line: 122 ]]
                                    -- upvalues: l_Username_0 (copy), v18 (ref)
                                    local v32 = ("Successfully sent gift to @%*!"):format(l_Username_0);
                                    if not v31 then
                                        v32 = ("Failed to send gift to @%*!"):format(l_Username_0);
                                    end;
                                    v18:Prompt({
                                        message = v32, 
                                        options = {
                                            {
                                                text = "Ok"
                                            }
                                        }
                                    });
                                end);
                                v15:Toggle(script.Name, false);
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
                return;
            end;
        end);
        v15:HandleButton(v23.mainFrame.Exit, function() --[[ Line: 145 ]]
            -- upvalues: v15 (ref)
            v15:Toggle(script.Name, false);
        end);
        v15:HandleButton(v23.cancelSendBtn, function() --[[ Line: 149 ]]
            -- upvalues: v15 (ref)
            v15:Toggle(script.Name, false);
        end);
        v15:HandleButton(v23.giftBtn, function() --[[ Line: 153 ]]
            -- upvalues: v23 (copy)
            v23.mainFrame.Visible = false;
            v23.sendFrame.Visible = true;
        end);
        v15:HandleButton(v23.cancelBtn, function() --[[ Line: 158 ]]
            -- upvalues: v15 (ref)
            v15:Toggle(script.Name, false);
        end);
        v15:HandleButton(v23.meBtn, function() --[[ Line: 162 ]]
            -- upvalues: v23 (copy), v18 (ref), v16 (ref), v2 (ref), v15 (ref)
            if v23.hasThisGamepass then
                v18:Prompt({
                    message = "You already own this gamepass! You can send it to someone else or trade it.", 
                    options = {
                        {
                            text = "Ok"
                        }
                    }
                });
                return;
            else
                v18:Prompt({
                    message = "Are you sure you want to use this gift on yourself?", 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 178 ]] --[[ Name: callback ]]
                                -- upvalues: v23 (ref), v16 (ref), v2 (ref), v18 (ref), v15 (ref)
                                local l__giftName_1 = v23._giftName;
                                v16:UseGift(l__giftName_1, v2.Player.Name):andThen(function(v34, v35) --[[ Line: 181 ]]
                                    -- upvalues: v18 (ref)
                                    local v36 = "Successfully redeemed the gift!";
                                    if not v34 then
                                        v36 = "Failed to redeem the gift!";
                                        if v35 then
                                            v36 = v36 .. ("\n(%*)"):format(v35);
                                        end;
                                    end;
                                    v18:Prompt({
                                        message = v36, 
                                        options = {
                                            {
                                                text = "Ok"
                                            }
                                        }
                                    });
                                end);
                                v15:Toggle(script.Name, false);
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
                return;
            end;
        end);
        v23.inputFrame.FocusLost:Connect(function(v37) --[[ Line: 208 ]]
            -- upvalues: v23 (copy)
            if not v37 then
                return;
            else
                v23:QueryPlayer(v23.inputFrame.Text);
                return;
            end;
        end);
    end, 
    Opening = function(v38) --[[ Line: 217 ]] --[[ Name: Opening ]]
        -- upvalues: l_Players_0 (copy), v5 (copy), v13 (copy)
        v38.dumpster:Connect(l_Players_0.PlayerAdded, function(v39) --[[ Line: 220 ]]
            -- upvalues: v38 (copy)
            v38:_addPlayer(v39.UserId);
        end);
        local v41 = v5.Map(l_Players_0:GetPlayers(), function(v40) --[[ Line: 224 ]]
            return v40.UserId;
        end);
        v13.loadOnDemand(v41, v38.playerList, v38.dumpster, function(v42) --[[ Line: 228 ]]
            -- upvalues: v38 (copy)
            v38:_addPlayer(v42);
        end);
    end, 
    Closed = function(v43) --[[ Line: 233 ]] --[[ Name: Closed ]]
        -- upvalues: v13 (copy)
        v43.dumpster:Clean();
        v43:Reset();
        v13.deferClearBrowser(v43.playerList, {
            filterClass = "Frame"
        });
    end, 
    OpenGift = function(v44, v45) --[[ Line: 243 ]] --[[ Name: OpenGift ]]
        -- upvalues: v9 (copy), v17 (ref), v2 (copy), v15 (ref)
        if not v45 then
            return;
        else
            local l_v9_ByItemName_0 = v9:GetByItemName(v45);
            if not l_v9_ByItemName_0 then
                return;
            else
                v44._giftName = v45;
                v44.mainFrame.GiftName.Text = l_v9_ByItemName_0.DisplayName or l_v9_ByItemName_0.displayName;
                v44.mainFrame.GiftIcon.Image = l_v9_ByItemName_0.Icon or l_v9_ByItemName_0.icon or "";
                v44.mainFrame.GiftIcon.Amount.Text = "";
                v44.sendFrame.Gift.GiftName.Text = l_v9_ByItemName_0.DisplayName or l_v9_ByItemName_0.displayName;
                v44.sendFrame.Gift.GiftIcon.Image = l_v9_ByItemName_0.Icon or l_v9_ByItemName_0.icon or "";
                v44.sendFrame.Gift.GiftIcon.Amount.Text = "";
                if v9:IsCurrencyGift(v45) then
                    local l_v17_Product_0 = v17:GetProduct(l_v9_ByItemName_0.currencyPackName);
                    local v48 = l_v17_Product_0 and l_v17_Product_0.purchaseData and l_v17_Product_0.purchaseData.currency;
                    if v48 then
                        local l_name_0 = v48.name;
                        local l_amount_0 = v48.amount;
                        local l_v9_ByItemName_1 = v9:GetByItemName(l_name_0);
                        if l_v9_ByItemName_1 then
                            if not l_v9_ByItemName_1.displayName and not l_v9_ByItemName_1.DisplayName then
                                local _ = l_name_0;
                            end;
                            v44.mainFrame.GiftName.Text = l_v9_ByItemName_0.displayName or l_v9_ByItemName_0.DisplayName;
                            v44.sendFrame.Gift.GiftName.Text = l_v9_ByItemName_0.displayName or l_v9_ByItemName_0.DisplayName;
                            v44.mainFrame.GiftIcon.Amount.Text = ("x%*"):format(l_amount_0);
                            v44.sendFrame.Gift.GiftIcon.Amount.Text = ("x%*"):format(l_amount_0);
                        end;
                    end;
                end;
                v44.hasThisGamepass = v17:HasGamepass(v2.Player, l_v9_ByItemName_0.gamepassName or v45) or false;
                v44.meBtn.Content.Disabled.Visible = v44.hasThisGamepass;
                v15:Toggle(script.Name, true);
                return;
            end;
        end;
    end, 
    Reset = function(v53) --[[ Line: 294 ]] --[[ Name: Reset ]]
        v53.mainFrame.Visible = true;
        v53.sendFrame.Visible = false;
        v53._giftName = nil;
        v53.inputFrame.Text = "";
        v53:QueryPlayer();
    end, 
    QueryPlayer = function(v54, v55) --[[ Line: 302 ]] --[[ Name: QueryPlayer ]]
        -- upvalues: v11 (copy), v4 (copy), l_Players_0 (copy), v12 (copy), v8 (copy)
        if v11:IsStringEmpty(v55) then
            v54:_noResult();
            return;
        else
            v54._targetUserId = v4.retryWithDelay(function() --[[ Line: 308 ]]
                -- upvalues: v4 (ref), l_Players_0 (ref), v55 (copy)
                return v4.try(function() --[[ Line: 309 ]]
                    -- upvalues: l_Players_0 (ref), v55 (ref)
                    return l_Players_0:GetUserIdFromNameAsync(v55);
                end);
            end, 10, 2):expect();
            if not v54._targetUserId then
                v54:_noResult();
                return;
            else
                v54._userInfo = v12:GetUserInfo(v54._targetUserId):expect();
                if not v54._userInfo then
                    v54:_noResult();
                    return;
                else
                    v54.playerNameLabel.Text = v54._userInfo.Username;
                    if v54._userInfo.HasVerifiedBadge then
                        local l_playerNameLabel_0 = v54.playerNameLabel;
                        l_playerNameLabel_0.Text = l_playerNameLabel_0.Text .. (" %*"):format(v8.Verified);
                    end;
                    v54.playerIcon.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v54._targetUserId);
                    v54.playerIcon.ImageColor3 = Color3.new(1, 1, 1);
                    return;
                end;
            end;
        end;
    end, 
    _noResult = function(v57) --[[ Line: 338 ]] --[[ Name: _noResult ]]
        v57._targetUserId = nil;
        v57._userInfo = nil;
        v57.playerNameLabel.Text = "";
        v57.playerIcon.Image = "rbxthumb://type=AvatarHeadShot&id=1&w=150&h=150";
        v57.playerIcon.ImageColor3 = Color3.new(0, 0, 0);
    end, 
    _verifyPlayerAncestry = function(_, v59) --[[ Line: 346 ]] --[[ Name: _verifyPlayerAncestry ]]
        return (v59 and v59.Parent) ~= nil;
    end, 
    _addPlayer = function(v60, v61) --[[ Line: 350 ]] --[[ Name: _addPlayer ]]
        -- upvalues: l_Players_0 (copy), v2 (copy), v14 (ref), v7 (copy), v8 (copy), v11 (copy), v15 (ref)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v61);
        if l_l_Players_0_PlayerByUserId_0 == v2.Player or not v60:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_0) then
            return;
        elseif v60.playerList:FindFirstChild(l_l_Players_0_PlayerByUserId_0.UserId) then
            return;
        elseif not l_l_Players_0_PlayerByUserId_0:GetAttribute("DATA_LOADED") then
            v60.dumpster:Add(l_l_Players_0_PlayerByUserId_0:GetAttributeChangedSignal("DATA_LOADED"):Once(function() --[[ Line: 362 ]]
                -- upvalues: v60 (copy), l_l_Players_0_PlayerByUserId_0 (copy)
                v60:_addPlayer(l_l_Players_0_PlayerByUserId_0.UserId);
            end));
            return;
        elseif not v60:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_0) then
            return;
        else
            local v63 = v14:Get(l_l_Players_0_PlayerByUserId_0, "PlayerStats"):expect();
            if not v60:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_0) then
                return;
            else
                local v64 = v60.template:Clone();
                v64.Name = v61;
                local l_Content_0 = v64.Content;
                local l_Icon_0 = l_Content_0.Icon;
                local l_Info_0 = l_Content_0.Info;
                local l_Gift_0 = l_Info_0.Gift;
                v64.Parent = v60.playerList;
                v60.noPlayersLabel.Visible = false;
                local v69 = v60.dumpster:Extend();
                v69:AttachTo(v64);
                v69:Add(function() --[[ Line: 394 ]]
                    -- upvalues: l_Players_0 (ref), v60 (copy)
                    if #l_Players_0:GetPlayers() < 2 then
                        v60.noPlayersLabel.Visible = true;
                    end;
                end);
                l_Icon_0.Icon.Image = string.format(v7.PLAYER_IMAGE_URL, l_l_Players_0_PlayerByUserId_0.UserId);
                l_Info_0.DisplayName.Text = l_l_Players_0_PlayerByUserId_0.DisplayName;
                l_Info_0.Username.Text = ("@%*"):format(l_l_Players_0_PlayerByUserId_0.Name) .. if l_l_Players_0_PlayerByUserId_0.HasVerifiedBadge then ("%*"):format(v8.Verified) else "";
                l_Icon_0.PlayerLevel.Prestige.Image = v11:GetPrestigeIcon(v63.Prestige, v63.Level);
                l_Icon_0.PlayerLevel.Prestige.Visible = v63.Prestige >= 1;
                l_Icon_0.PlayerLevel.PlayerLevel.Text = ("LVL %*"):format(v63.Level);
                l_Icon_0.PlayerLevel.Visible = true;
                v15:HandleButton(l_Gift_0, function() --[[ Line: 411 ]]
                    -- upvalues: v60 (copy), l_l_Players_0_PlayerByUserId_0 (copy)
                    v60:QueryPlayer(l_l_Players_0_PlayerByUserId_0.Name);
                end);
                return;
            end;
        end;
    end
};