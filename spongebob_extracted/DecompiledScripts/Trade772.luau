local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TextChatService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(l_ReplicatedStorage_0.ReplicaController);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v16 = require(v4.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v17 = require(v4.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v18 = require(l_ReplicatedStorage_0.TraitsData);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.PromiseFriends);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = {
    ready = {
        stroke = Color3.fromRGB(19, 107, 37), 
        gradient = ColorSequence.new(Color3.fromHex("#beff25"), Color3.fromHex("#0ee20b"))
    }, 
    unready = {
        stroke = Color3.fromRGB(91, 26, 27), 
        gradient = ColorSequence.new(Color3.fromHex("#ff2647"), Color3.fromHex("#881616"))
    }, 
    cooldown = {
        stroke = Color3.fromRGB(35, 56, 88), 
        gradient = ColorSequence.new(Color3.fromHex("#a2bbff"), Color3.fromHex("#3e5293"))
    }
};
local v30 = {
    primaryMenu = true, 
    highPriority = true, 
    blur = true, 
    ignoreClosePrimaryMenus = true, 
    ToggleAll = {}
};
local function v32(v31) --[[ Line: 83 ]] --[[ Name: scrollToBottom ]]
    v31.CanvasPosition = Vector2.new(0, v31.AbsoluteCanvasSize.Y);
end;
v30.Init = function(v33, v34, v35) --[[ Line: 88 ]] --[[ Name: Init ]]
    -- upvalues: v20 (ref), v4 (copy), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v8 (copy), v5 (copy)
    v20 = v4.GetController("UIController");
    v21 = v4.GetService("TradingService");
    v22 = v4.GetController("UnitController");
    v23 = v4.GetController("GlobalUnitTrackerController");
    v24 = v4.GetController("GlobalMintController");
    v33.currentMode = v35;
    v33.ui = v34;
    v33.tradeMain = v33.ui.Main;
    local l_Content_0 = v33.tradeMain.Content;
    local l_Players_1 = v33.tradeMain.Players;
    v33.otherPlayerInfo = l_Players_1.OtherPlayer;
    v33.mainBottom = l_Content_0.Bottom;
    v33.hoverTooltip = v33.ui.HoverTooltip;
    v33.hoverTooltip.Visible = false;
    local l_Buttons_0 = v33.mainBottom.Buttons;
    v33.tradeReadyButton = l_Buttons_0.Accept;
    v33.tradeCancelButton = l_Buttons_0.Decline;
    v33.chatOpenButton = v33.mainBottom.Chat;
    v33.chatNotifier = v33.chatOpenButton.Notifier;
    v33.chatWindow = v33.ui.Chat;
    local l_Bottom_0 = v33.chatWindow.Bottom;
    v33.chatInput = l_Bottom_0.Input;
    v33.chatInputTextBox = v33.chatInput.TextBox;
    v33.chatSendButton = l_Bottom_0.Send;
    v33.chatCloseButton = l_Bottom_0.Close;
    v33.chatContents = v33.chatWindow.Contents;
    v33.chatTemplate = v33.chatContents.Template:Clone();
    v33.myOfferMain = l_Content_0.YourOffer;
    v33.myOfferBackdrop = v33.myOfferMain.Backdrop;
    v33.myOffer = v33.myOfferMain.Offer;
    v33.myOfferReady = v33.myOfferMain.Accepted;
    v33.otherOfferMain = l_Content_0.OtherOffer;
    v33.otherOfferBackdrop = v33.otherOfferMain.Backdrop;
    v33.otherOffer = v33.otherOfferMain.Offer;
    v33.otherOfferReady = v33.otherOfferMain.Accepted;
    v33.offerTemplate = v33.myOffer.Template:Clone();
    v33.finalOverview = v33.ui.FinalTradeOverview;
    v33.finalCountdownLabel = v33.finalOverview.Countdown;
    v33.overviewMain = v33.finalOverview.Main;
    local l_Buttons_1 = v33.overviewMain.Buttons;
    v33.overviewConfirmButton = l_Buttons_1.Confirm;
    v33.overviewDeclineButton = l_Buttons_1.Decline;
    local l_Players_2 = v33.overviewMain.Players;
    v33.overviewOtherPlayerInfo = l_Players_2.OtherPlayer;
    local l_Content_1 = v33.overviewMain.Content;
    v33.overviewMyOfferMain = l_Content_1.YourOffer;
    v33.overviewMyOfferConfirmed = v33.overviewMyOfferMain.Accepted;
    v33.overviewMyOffer = v33.overviewMyOfferMain.Offer;
    v33.overviewOtherOfferMain = l_Content_1.OtherOffer;
    v33.overviewOtherOfferConfirmed = v33.overviewOtherOfferMain.Accepted;
    v33.overviewOtherOffer = v33.overviewOtherOfferMain.Offer;
    v33.chatWindow.Visible = false;
    v33.chatNotifier.Visible = false;
    v33.myOffer.Visible = true;
    v33.otherOffer.Visible = true;
    v33.offerTemplate.Content.TowerInfo.Visible = false;
    v33.offerTemplate.Content.TowerPreview.Visible = false;
    v33.offerTemplate.Content.Icon.Visible = false;
    v33.offerTemplate.Content.Amount.Visible = false;
    v33.offerTemplate.Content.ItemName.Visible = false;
    v33.myOffer.Template:Destroy();
    v33.otherOffer.Template:Destroy();
    v33.chatContents.Template:Destroy();
    l_Players_1.You.Icon.Icon.Image = string.format(v8.PLAYER_IMAGE_URL, v4.Player.UserId);
    l_Players_2.You.Icon.Icon.Image = string.format(v8.PLAYER_IMAGE_URL, v4.Player.UserId);
    v33.myUserIdString = tostring(v4.Player.UserId);
    v33.dumpster = v5.new();
    v33.tradeReplica = nil;
    v33.chatDebounceActive = false;
end;
v30.Start = function(v43) --[[ Line: 171 ]] --[[ Name: Start ]]
    -- upvalues: v25 (ref), v20 (ref), v26 (ref), v27 (ref), v28 (ref), v21 (ref), v8 (copy), v29 (copy), l_RunService_0 (copy), v9 (copy), v4 (copy), v19 (copy), v10 (copy), v17 (copy)
    if v43.currentMode ~= "Trading" then
        return;
    else
        v25 = v20:GetModuleAsync("MessagePrompt"):expect();
        v26 = v20:GetModuleAsync("Units"):expect();
        v27 = v20:GetModuleAsync("Items"):expect();
        v28 = v20:GetModuleAsync("TradeCategories"):expect();
        v21.ResetReady:Connect(function(v44) --[[ Line: 181 ]]
            -- upvalues: v43 (copy), v8 (ref), v29 (ref), l_RunService_0 (ref)
            if not v43.tradeReplica then
                return;
            else
                local v45 = workspace:GetServerTimeNow() - v44;
                local v46 = v8.TRADING.READY_RESET_TIME - v45;
                v43.tradeReadyButton.Content.UIGradient.Color = v29.cooldown.gradient;
                v43.tradeReadyButton.Content.UIStroke.Color = v29.cooldown.stroke;
                v43.tradeReadyButton.Content.Title.UIStroke.Color = v29.cooldown.stroke;
                if v43.dumpster:Get("ReadyTimer") then
                    v43.dumpster:Remove("ReadyTimer");
                end;
                v43.dumpster:Add(l_RunService_0.RenderStepped:Connect(function(v47) --[[ Line: 197 ]]
                    -- upvalues: v46 (ref), v43 (ref), v29 (ref)
                    v46 = math.max(v46 - v47, 0);
                    if v46 <= 0 then
                        if v43.dumpster:Get("ReadyTimer") then
                            v43.dumpster:Remove("ReadyTimer");
                        end;
                        v43.tradeReadyButton.Content.Title.Text = "Ready";
                        v43.tradeReadyButton.Content.UIGradient.Color = v29.ready.gradient;
                        v43.tradeReadyButton.Content.UIStroke.Color = v29.ready.stroke;
                        v43.tradeReadyButton.Content.Title.UIStroke.Color = v29.ready.stroke;
                        return;
                    else
                        local v48 = string.format("%.1f", v46);
                        v43.tradeReadyButton.Content.Title.Text = ("(%*)"):format(v48);
                        return;
                    end;
                end), "ReadyTimer");
                return;
            end;
        end);
        v21.Confirmed:Connect(function(v49) --[[ Line: 218 ]]
            -- upvalues: v43 (copy), v8 (ref), l_RunService_0 (ref)
            if not v43.tradeReplica then
                return;
            else
                local v50 = workspace:GetServerTimeNow() - v49;
                local v51 = v8.TRADING.CONFIRM_TIME - v50;
                if v43.dumpster:Get("ConfirmTimer") then
                    v43.dumpster:Remove("ConfirmTimer");
                end;
                v43.dumpster:Add(l_RunService_0.RenderStepped:Connect(function(v52) --[[ Line: 230 ]]
                    -- upvalues: v51 (ref), v43 (ref)
                    v51 = math.max(v51 - v52, 0);
                    if v51 <= 0 then
                        if v43.dumpster:Get("ConfirmTimer") then
                            v43.dumpster:Remove("ConfirmTimer");
                        end;
                        v43.finalCountdownLabel.Text = "Processing Trade...";
                        return;
                    else
                        local v53 = string.format("%.1f", v51);
                        v43.finalCountdownLabel.Text = ("%* seconds left"):format(v53);
                        return;
                    end;
                end), "ConfirmTimer");
                return;
            end;
        end);
        v21.AddUnitFailure:Connect(function(v54, v55) --[[ Line: 248 ]]
            -- upvalues: v26 (ref)
            v26:ToggleTradingUnit({
                Name = v54, 
                UID = v55
            }, false);
        end);
        v9.NewReplicaSignal:Connect(function(v56) --[[ Line: 255 ]]
            -- upvalues: v43 (copy), v4 (ref), v8 (ref), v19 (ref), v29 (ref), v10 (ref), v20 (ref), v28 (ref), v25 (ref), v26 (ref), v27 (ref), v17 (ref)
            local l_Class_0 = v56.Class;
            if string.split(l_Class_0, "_")[1] ~= "Trade" then
                return;
            else
                v43.tradeReplica = v56;
                local l_Data_0 = v56.Data;
                local v59 = if l_Data_0.player1 == v4.Player then l_Data_0.player2 else l_Data_0.player1;
                local v60 = tostring(v59.UserId);
                v43.otherPlayerInfo.Title.Username.Text = v59.DisplayName;
                v43.otherPlayerInfo.Title.Status.Friend.Visible = false;
                v43.otherPlayerInfo.Title.Status.Verified.Visible = v59.HasVerifiedBadge;
                v43.otherPlayerInfo.Icon.Icon.Image = string.format(v8.PLAYER_IMAGE_URL, v59.UserId);
                v43.overviewOtherPlayerInfo.Title.Username.Text = v59.DisplayName;
                v43.overviewOtherPlayerInfo.Title.Status.Friend.Visible = false;
                v43.overviewOtherPlayerInfo.Title.Status.Verified.Visible = v59.HasVerifiedBadge;
                v43.overviewOtherPlayerInfo.Icon.Icon.Image = string.format(v8.PLAYER_IMAGE_URL, v59.UserId);
                v43.dumpster:AddPromise(v19(v4.Player, v59):andThen(function(v61) --[[ Line: 280 ]]
                    -- upvalues: v43 (ref)
                    v43.otherPlayerInfo.Title.Status.Friend.Visible = v61;
                    v43.overviewOtherPlayerInfo.Title.Status.Friend.Visible = v61;
                end));
                v43.dumpster:Add(v43:_onChanged("Ready", function(v62) --[[ Line: 285 ]]
                    -- upvalues: v43 (ref), v59 (copy), l_Data_0 (copy), v29 (ref)
                    for v63, v64 in v62 do
                        local v65 = v63 == v43.myUserIdString;
                        (if v65 then v43.myOfferReady else v43.otherOfferReady).Visible = v64;
                        if not v65 then
                            if v64 then
                                local v66 = ("%* wants to accept the trade"):format(v59.DisplayName);
                                v43:_systemMessage(v66);
                            end;
                        elseif not l_Data_0.ReadyLocked then
                            local v67 = v29[v64 and "unready" or "ready"];
                            v43.tradeReadyButton.Content.UIGradient.Color = v67.gradient;
                            v43.tradeReadyButton.Content.UIStroke.Color = v67.stroke;
                            v43.tradeReadyButton.Content.Title.UIStroke.Color = v67.stroke;
                            v43.tradeReadyButton.Content.Title.Text = v64 and "Unready" or "Ready";
                        end;
                    end;
                end, true));
                v43.dumpster:Add(v43:_onChanged("Confirmed", function(v68) --[[ Line: 312 ]]
                    -- upvalues: v43 (ref), v29 (ref)
                    local v69 = true;
                    for v70, v71 in v68 do
                        if not v71 then
                            v69 = false;
                        end;
                        local v72 = v70 == v43.myUserIdString;
                        (if v72 then v43.overviewMyOfferConfirmed else v43.overviewOtherOfferConfirmed).Visible = v71;
                        if v72 then
                            local v73 = v29[v71 and "unready" or "ready"];
                            v43.overviewConfirmButton.Content.UIGradient.Color = v73.gradient;
                            v43.overviewConfirmButton.Content.UIStroke.Color = v73.stroke;
                            v43.overviewConfirmButton.Content.Title.UIStroke.Color = v73.stroke;
                            v43.overviewConfirmButton.Content.Title.Text = v71 and "Unconfirm" or "Confirm";
                        end;
                    end;
                    if not v69 then
                        if v43.dumpster:Get("ConfirmTimer") then
                            v43.dumpster:Remove("ConfirmTimer");
                        end;
                        v43.finalCountdownLabel.Text = "Countdown starts when both players are Confirmed";
                    end;
                end, true));
                v43.dumpster:Add(v43:_onChanged("Items", function(v74) --[[ Line: 344 ]]
                    -- upvalues: v43 (ref), v60 (copy), v10 (ref), v4 (ref), v59 (copy)
                    local v75 = v74[v43.myUserIdString];
                    local v76 = v74[v60];
                    local v77 = #v75 + 1;
                    v10:IterateClass(v43.myOfferBackdrop, "TextButton", function(v78) --[[ Line: 351 ]]
                        -- upvalues: v77 (copy)
                        local v79 = tonumber(v78.Name);
                        if not v79 then
                            return;
                        else
                            v78.Content.Add.Visible = v79 == v77;
                            return;
                        end;
                    end);
                    v43:_reconcileItems(v4.Player, v75);
                    v43:_reconcileItems(v59, v76);
                end));
                v10:IterateClass(v43.myOfferBackdrop, "TextButton", function(v80) --[[ Line: 364 ]]
                    -- upvalues: v43 (ref), v20 (ref), l_Data_0 (copy), v28 (ref)
                    v43.dumpster:Add(v20:HandleButton(v80, function() --[[ Line: 365 ]]
                        -- upvalues: l_Data_0 (ref), v43 (ref), v80 (copy), v28 (ref)
                        if l_Data_0.Ready[v43.myUserIdString] or l_Data_0.Confirming then
                            return;
                        elseif not v80.Content.Add.Visible then
                            return;
                        else
                            v28:OpenCategory();
                            return;
                        end;
                    end));
                end);
                v43.dumpster:Add(v20:HandleButton(v43.tradeReadyButton, function() --[[ Line: 379 ]]
                    -- upvalues: l_Data_0 (copy), v43 (ref), v60 (copy), v25 (ref), v56 (copy)
                    if l_Data_0.ReadyLocked or l_Data_0.Confirming then
                        return;
                    elseif not l_Data_0.Ready[v43.myUserIdString] and #l_Data_0.Items[v60] == 0 then
                        v25:Prompt({
                            message = "Are you sure?\nYou won't get anything from this trade.", 
                            options = {
                                {
                                    text = "Yes", 
                                    callback = function() --[[ Line: 390 ]] --[[ Name: callback ]]
                                        -- upvalues: v56 (ref)
                                        v56:FireServer("Ready");
                                    end
                                }, 
                                {
                                    text = "No"
                                }
                            }
                        });
                        return;
                    else
                        v56:FireServer("Ready");
                        return;
                    end;
                end));
                v43.dumpster:Add(v20:HandleButton(v43.overviewConfirmButton, function() --[[ Line: 404 ]]
                    -- upvalues: l_Data_0 (copy), v43 (ref), v25 (ref), v56 (copy)
                    if not l_Data_0.Confirming or l_Data_0.Processing then
                        return;
                    elseif not l_Data_0.Confirmed[v43.myUserIdString] then
                        v25:Prompt({
                            message = "Are you sure?\nMake sure the trade is fair before continuing.\n\nAll trades are final.", 
                            options = {
                                {
                                    text = "Yes", 
                                    callback = function() --[[ Line: 415 ]] --[[ Name: callback ]]
                                        -- upvalues: v56 (ref)
                                        v56:FireServer("Confirm");
                                    end
                                }, 
                                {
                                    text = "No"
                                }
                            }
                        });
                        return;
                    else
                        v56:FireServer("Confirm");
                        return;
                    end;
                end));
                v43.dumpster:Add(v43:_onChanged("Confirming", function(v81) --[[ Line: 429 ]]
                    -- upvalues: l_Data_0 (copy), v43 (ref), v60 (copy)
                    if not v81 then
                        return;
                    else
                        for _, v83 in l_Data_0.Items[v43.myUserIdString] do
                            v43:_addOfferItem(v83, v43.overviewMyOffer);
                        end;
                        for _, v85 in l_Data_0.Items[v60] do
                            v43:_addOfferItem(v85, v43.overviewOtherOffer);
                        end;
                        v43.finalOverview.Visible = true;
                        v43.tradeMain.Visible = false;
                        v43:_hideUnitHoverTooltip();
                        return;
                    end;
                end));
                v43.dumpster:Add(v43:_onChanged("Processing", function(v86) --[[ Line: 448 ]]
                    -- upvalues: v43 (ref)
                    if not v86 then
                        return;
                    else
                        if v43.dumpster:Get("ConfirmTimer") then
                            v43.dumpster:Remove("ConfirmTimer");
                        end;
                        v43.finalCountdownLabel.Text = "Processing Trade...";
                        return;
                    end;
                end));
                v43.dumpster:Add(v20:HandleButton(v43.tradeCancelButton, function() --[[ Line: 460 ]]
                    -- upvalues: l_Data_0 (copy), v43 (ref)
                    if l_Data_0.Processing then
                        return;
                    else
                        v43:Cancel();
                        return;
                    end;
                end));
                v43.dumpster:Add(v20:HandleButton(v43.overviewDeclineButton, function() --[[ Line: 468 ]]
                    -- upvalues: l_Data_0 (copy), v43 (ref)
                    if not l_Data_0.Confirming or l_Data_0.Processing then
                        return;
                    else
                        v43:Cancel();
                        return;
                    end;
                end));
                v20:Toggle("MessagePrompt", false);
                v20:Toggle(script.Name, true);
                v43.tradeChannel = nil;
                local function _(v87) --[[ Line: 483 ]] --[[ Name: initChannel ]]
                    -- upvalues: v43 (ref), v4 (ref)
                    v43.tradeChannel = v87;
                    v43.dumpster:Add(v43.tradeChannel.MessageReceived:Connect(function(v88) --[[ Line: 486 ]]
                        -- upvalues: v4 (ref), v43 (ref)
                        local v89 = (v88.TextSource and v88.TextSource.UserId == v4.Player.UserId or false) and "You" or v88.TextSource and v88.TextSource.Name;
                        v43:_addChatMessage(v88.Text, v89);
                    end));
                end;
                v43.tradeChannel = l_Data_0.TextChannel;
                v43.dumpster:Add(v43.tradeChannel.MessageReceived:Connect(function(v91) --[[ Line: 486 ]]
                    -- upvalues: v4 (ref), v43 (ref)
                    local v92 = (v91.TextSource and v91.TextSource.UserId == v4.Player.UserId or false) and "You" or v91.TextSource and v91.TextSource.Name;
                    v43:_addChatMessage(v91.Text, v92);
                end));
                if not l_Data_0.CanChat then
                    v43:_systemMessage("Chat is disabled for this trade. You will still see system messages.");
                end;
                v43.dumpster:Add(v43:_onChanged("CanChat", function(v93) --[[ Line: 501 ]]
                    -- upvalues: v43 (ref), v8 (ref)
                    v43.chatInput.Visible = v93;
                    v43.chatSendButton.Visible = v93;
                    if v93 then
                        local l_SAFETY_0 = v8.TRADING.CHAT.WARNINGS.SAFETY;
                        v43:_systemMessage(l_SAFETY_0);
                    end;
                end, true));
                v43.dumpster:Add(function() --[[ Line: 512 ]]
                    -- upvalues: v43 (ref), v26 (ref), v27 (ref), v20 (ref), v10 (ref), v17 (ref)
                    v43.tradeReplica = nil;
                    v43.tradeChannel = nil;
                    v43.chatDebounceActive = false;
                    v26:StopTrading();
                    v27:StopTrading();
                    v20:Toggle("TradeCategories", false);
                    v43.finalCountdownLabel.Text = "Countdown starts when both players are Confirmed";
                    v43.finalOverview.Visible = false;
                    v43.tradeMain.Visible = true;
                    v10:IterateClass(v43.myOfferBackdrop, "TextButton", function(v95) --[[ Line: 526 ]]
                        local v96 = tonumber(v95.Name);
                        if not v96 then
                            return;
                        else
                            v95.Content.Add.Visible = v96 == 1;
                            return;
                        end;
                    end);
                    v17.deferClearBrowser(v43.chatContents, {
                        filterClass = "Frame"
                    });
                    v43.chatWindow.Visible = false;
                    v43.mainBottom.Visible = true;
                    v43.chatNotifier.Visible = false;
                    v43.chatInputTextBox.Text = "";
                    v20:Toggle(script.Name, false);
                end);
                v56:AddCleanupTask(function() --[[ Line: 545 ]]
                    -- upvalues: v43 (ref)
                    v43.dumpster:Destroy();
                end);
                return;
            end;
        end);
        v20:HandleButton(v43.chatOpenButton, function() --[[ Line: 550 ]]
            -- upvalues: v43 (copy)
            v43.chatWindow.Visible = true;
            v43.mainBottom.Visible = false;
            v43.chatNotifier.Visible = false;
            local l_chatContents_0 = v43.chatContents;
            l_chatContents_0.CanvasPosition = Vector2.new(0, l_chatContents_0.AbsoluteCanvasSize.Y);
        end);
        v20:HandleButton(v43.chatCloseButton, function() --[[ Line: 557 ]]
            -- upvalues: v43 (copy)
            v43.chatWindow.Visible = false;
            v43.mainBottom.Visible = true;
            v43.chatInputTextBox.Text = "";
        end);
        local function v101() --[[ Line: 563 ]] --[[ Name: sendChat ]]
            -- upvalues: v43 (copy), v8 (ref)
            if not v43.tradeReplica or not v43.tradeChannel then
                return;
            else
                local l_Text_0 = v43.chatInputTextBox.Text;
                if l_Text_0 == "" then
                    return;
                else
                    l_Text_0 = string.sub(l_Text_0, 1, v8.TRADING.CHAT.MAX_MESSAGE_LENGTH);
                    if #string.gsub(l_Text_0, "[%s]", "") < 1 then
                        return;
                    else
                        v43.chatInputTextBox.Text = "";
                        local v99 = v43.tradeChannel:SendAsync(l_Text_0);
                        if not v99 then
                            v43:_systemMessage(v8.TRADING.CHAT.WARNINGS.FAILURE);
                            return;
                        else
                            local v100 = {
                                Enum.TextChatMessageStatus.Unknown, 
                                Enum.TextChatMessageStatus.TextFilterFailed, 
                                Enum.TextChatMessageStatus.ModerationTimeout
                            };
                            if table.find(v100, v99.Status) then
                                v43:_systemMessage(v8.TRADING.CHAT.WARNINGS.FAILURE);
                                return;
                            elseif v99.Status == Enum.TextChatMessageStatus.Floodchecked then
                                v43:_systemMessage(v8.TRADING.CHAT.WARNINGS.DEBOUNCE);
                                return;
                            else
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v20:HandleButton(v43.chatSendButton, v101);
        v43.chatInputTextBox.FocusLost:Connect(function(v102) --[[ Line: 607 ]]
            -- upvalues: v101 (copy)
            if v102 then
                v101();
            end;
        end);
        return;
    end;
end;
v30.Opened = function(_) --[[ Line: 614 ]] --[[ Name: Opened ]]
    -- upvalues: v20 (ref)
    v20:Toggle("TradeCategories", false);
end;
v30.Closed = function(v104) --[[ Line: 618 ]] --[[ Name: Closed ]]
    v104:_hideUnitHoverTooltip();
end;
v30.AddUnitOrPet = function(v105, v106, v107) --[[ Line: 623 ]] --[[ Name: AddUnitOrPet ]]
    -- upvalues: v20 (ref)
    if not v105.tradeReplica then
        return false;
    else
        v20:Toggle(script.Name, true);
        if v105.tradeReplica.Data.Debounce[v105.myUserIdString] then
            return false;
        else
            v105.tradeReplica:FireServer("Add", {
                type = v107, 
                name = v106.Name, 
                uid = v106.UID
            });
            return true;
        end;
    end;
end;
v30.TradeUnit = function(v108, v109) --[[ Line: 645 ]] --[[ Name: TradeUnit ]]
    -- upvalues: v20 (ref)
    if not v108.tradeReplica then
        return false;
    else
        v20:Toggle(script.Name, true);
        if v108.tradeReplica.Data.Debounce[v108.myUserIdString] then
            return false;
        else
            v108.tradeReplica:FireServer("Add", {
                type = "Unit", 
                name = v109.Name, 
                uid = v109.UID
            });
            return true;
        end;
    end;
end;
v30.AddItemStack = function(v110, v111, v112) --[[ Line: 666 ]] --[[ Name: AddItemStack ]]
    -- upvalues: v20 (ref)
    if not v110.tradeReplica then
        return false;
    else
        v20:Toggle(script.Name, true);
        if v110.tradeReplica.Data.Debounce[v110.myUserIdString] then
            return false;
        else
            v110.tradeReplica:FireServer("Add", {
                type = "Inventory", 
                name = v111, 
                amount = v112
            });
            return true;
        end;
    end;
end;
v30.Cancel = function(v113) --[[ Line: 687 ]] --[[ Name: Cancel ]]
    if not v113.tradeReplica then
        return;
    else
        v113.tradeReplica:FireServer("Cancel");
        return;
    end;
end;
v30._systemMessage = function(v114, v115) --[[ Line: 698 ]] --[[ Name: _systemMessage ]]
    if v114.tradeChannel then
        v114.tradeChannel:DisplaySystemMessage(v115);
    end;
end;
v30._connectUnitOffer = function(_, v117, v118, v119) --[[ Line: 704 ]] --[[ Name: _connectUnitOffer ]]
    -- upvalues: v12 (copy), v13 (copy), v11 (copy), v18 (copy), v10 (copy)
    local v120 = v118.unitData or v118.petData;
    v119:Add(v12.new(v117.Content.TowerPreview, v118.name, {
        IsPet = v118.type == "Pet"
    }));
    v117.Content.TowerPreview.Visible = true;
    local v121 = nil;
    v121 = if v118.type == "Pet" then select(2, v13:GetRarity(v118.name)) else select(2, v11:GetRarity(v118.name));
    if v121 then
        v117.Content.Backdrop:SetAttribute("Rarity", v121);
        v117.Content.Backdrop:AddTag("VisualizeRarity");
        v117.Content.Glow:SetAttribute("Rarity", v121);
        v117.Content.Glow:AddTag("VisualizeRarity");
    end;
    local l_TowerInfo_0 = v117.Content.TowerInfo;
    l_TowerInfo_0.Visible = true;
    l_TowerInfo_0.Shiny.Visible = v120.Shiny or false;
    l_TowerInfo_0.Wumbo.Visible = v120.Mega or false;
    l_TowerInfo_0.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v120.Level or 1);
    local l_Traits_0 = l_TowerInfo_0.Traits;
    local l_ImageLabel_0 = l_Traits_0.Trait:FindFirstChildOfClass("ImageLabel");
    if l_ImageLabel_0 then
        l_ImageLabel_0:Destroy();
    end;
    local l_ImageLabel_1 = l_Traits_0.Trait2:FindFirstChildOfClass("ImageLabel");
    if l_ImageLabel_1 then
        l_ImageLabel_1:Destroy();
    end;
    l_Traits_0.Trait.Visible = v120.Trait ~= nil;
    l_Traits_0.Trait2.Visible = v120.Trait2 ~= nil;
    local v126 = true;
    if v120.Trait == nil then
        v126 = v120.Trait2 ~= nil;
    end;
    l_Traits_0.Visible = v126;
    if v120.Trait ~= nil then
        v18:CreateTraitIcon(v120.Trait.Name, l_Traits_0.Trait);
    end;
    if v120.Trait2 ~= nil then
        v18:CreateTraitIcon(v120.Trait2.Name, l_Traits_0.Trait2);
    end;
    l_TowerInfo_0.Relic.Visible = v120.Relic ~= nil;
    if v120.Relic then
        v10:CreateRelicIcon(l_TowerInfo_0.Relic, v120.Relic);
    end;
    l_TowerInfo_0.Stars.Visible = v120.Stars > 0;
    if v120.Stars > 0 then
        l_TowerInfo_0.Stars.Main.Amount.Text = v120.Stars;
        l_TowerInfo_0.Stars[tostring(2)].Visible = v120.Stars >= 2;
        l_TowerInfo_0.Stars[tostring(3)].Visible = v120.Stars >= 3;
        l_TowerInfo_0.Stars[tostring(4)].Visible = v120.Stars >= 4;
        l_TowerInfo_0.Stars[tostring(5)].Visible = v120.Stars >= 5;
    end;
end;
v30._connectItemOffer = function(_, v128, v129, _) --[[ Line: 774 ]] --[[ Name: _connectItemOffer ]]
    -- upvalues: v14 (copy)
    local l_v14_ByItemName_0 = v14:GetByItemName(v129.name);
    local v132 = l_v14_ByItemName_0.rarity or "Common";
    local v133 = l_v14_ByItemName_0.icon or "";
    v128.Content.Backdrop:SetAttribute("Rarity", v132);
    v128.Content.Backdrop:AddTag("VisualizeRarity");
    v128.Content.Glow:SetAttribute("Rarity", v132);
    v128.Content.Glow:AddTag("VisualizeRarity");
    v128.Content.Amount.Visible = true;
    v128.Content.Icon.Visible = true;
    v128.Content.ItemName.Visible = true;
    v128.Content.ItemName.Text = l_v14_ByItemName_0.displayName or l_v14_ByItemName_0.DisplayName or v129.name;
    v128.Content.Amount.Text = ("x%*"):format(v129.amount);
    v128.Content.Icon.Image = v133;
end;
v30._addOfferItem = function(v134, v135, v136) --[[ Line: 793 ]] --[[ Name: _addOfferItem ]]
    -- upvalues: v14 (copy), v11 (copy), v16 (copy), v20 (ref), v25 (ref)
    local v137 = v134.dumpster:Extend();
    local l_Data_1 = v134.tradeReplica.Data;
    local v139 = v134.offerTemplate:Clone();
    v139.Name = v135._id;
    v139.Visible = true;
    v139:SetAttribute("ItemType", v135.type);
    v139:SetAttribute("ItemName", v135.name);
    v139:SetAttribute("ItemUID", v135.uid);
    v139:SetAttribute("ItemAmount", v135.amount);
    v139.Parent = v136;
    v134[(not (v135.type ~= "Unit") or v135.type == "Pet") and "_connectUnitOffer" or "_connectItemOffer"](v134, v139, v135, v137);
    if v135.name and v135.type and v135.type == "Inventory" and v14:IsMount(v135.name) then
        v139.Content.MountIcon.Visible = true;
    end;
    v137:Add(function() --[[ Line: 817 ]]
        -- upvalues: v139 (copy)
        if v139 and v139.Parent then
            v139:Destroy();
        end;
    end);
    v137:AttachTo(v139);
    local v140 = {};
    if v135.type == "Unit" or v135.type == "Pet" then
        v140 = {
            Name = v135.name, 
            UID = v135.uid, 
            Data = v135.unitData or v135.petData, 
            IsPet = v135.type == "Pet", 
            UnitType = v135.type == "Unit" and v11:GetUnitValue(v135.name, "Type") or nil
        };
    else
        v16.new(v139, {
            Name = v135.name
        });
    end;
    if v136 == v134.myOffer then
        v20:HandleButton(v139, function() --[[ Line: 840 ]]
            -- upvalues: v134 (copy), v139 (copy), v25 (ref), v135 (copy)
            if not v134.tradeReplica then
                return;
            else
                v139.Content.RemoveHover.Visible = false;
                local l_Data_2 = v134.tradeReplica.Data;
                if l_Data_2.Ready[v134.myUserIdString] or l_Data_2.Confirming or l_Data_2.Processing then
                    return;
                else
                    v25:Prompt({
                        message = "Remove this item from the trade?", 
                        options = {
                            {
                                text = "Yes", 
                                callback = function() --[[ Line: 860 ]] --[[ Name: callback ]]
                                    -- upvalues: v134 (ref), v135 (ref)
                                    v134.tradeReplica:FireServer("Remove", v135._id);
                                end
                            }, 
                            {
                                text = "No"
                            }
                        }
                    });
                    return;
                end;
            end;
        end, {
            MouseEnter = function() --[[ Line: 869 ]] --[[ Name: MouseEnter ]]
                -- upvalues: l_Data_1 (copy), v134 (copy), v139 (copy)
                if l_Data_1.Ready[v134.myUserIdString] or l_Data_1.Confirming then
                    return;
                else
                    v139.Content.RemoveHover.Visible = true;
                    return;
                end;
            end, 
            MouseLeave = function() --[[ Line: 877 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v139 (copy)
                v139.Content.RemoveHover.Visible = false;
            end
        });
    end;
    v137:Add(v139.MouseEnter:Connect(function() --[[ Line: 883 ]]
        -- upvalues: v135 (copy), v134 (copy), v139 (copy), v140 (ref)
        if v135.type == "Unit" or v135.type == "Pet" then
            v134:_showUnitHoverTooltip(v139, v140);
        end;
    end));
    v137:Add(v139.MouseLeave:Connect(function() --[[ Line: 889 ]]
        -- upvalues: v135 (copy), v134 (copy), v139 (copy), v140 (ref)
        if v135.type == "Unit" or v135.type == "Pet" then
            v134:_hideUnitHoverTooltip(v139, v140);
        end;
    end));
    v137:Add(function() --[[ Line: 895 ]]
        -- upvalues: v135 (copy), v134 (copy), v139 (copy), v140 (ref)
        if v135.type == "Unit" or v135.type == "Pet" then
            v134:_hideUnitHoverTooltip(v139, v140);
        end;
    end);
    return v139;
end;
v30._reconcileItems = function(v142, v143, v144) --[[ Line: 904 ]] --[[ Name: _reconcileItems ]]
    -- upvalues: v4 (copy), v10 (copy), v6 (copy), v26 (ref), v27 (ref), v11 (copy), v13 (copy), v14 (copy)
    local v145 = {};
    local v146 = if v143 == v4.Player then v142.myOffer else v142.otherOffer;
    v10:IterateClass(v146, "TextButton", function(v147) --[[ Line: 909 ]]
        -- upvalues: v6 (ref), v144 (copy), v26 (ref), v27 (ref), v143 (copy), v4 (ref), v11 (ref), v13 (ref), v14 (ref), v142 (copy), v145 (copy)
        local l_Name_0 = v147.Name;
        if not (v6.Find(v144, function(v149) --[[ Line: 911 ]]
            -- upvalues: l_Name_0 (copy)
            return v149._id == l_Name_0;
        end) ~= nil) then
            local l_v147_Attribute_0 = v147:GetAttribute("ItemName");
            local l_v147_Attribute_1 = v147:GetAttribute("ItemAmount");
            local l_v147_Attribute_2 = v147:GetAttribute("ItemType");
            if l_v147_Attribute_2 == "Unit" or l_v147_Attribute_2 == "Pet" then
                v26:ToggleTradingUnit({
                    Name = l_v147_Attribute_0, 
                    UID = v147:GetAttribute("ItemUID")
                }, false);
            elseif l_v147_Attribute_2 == "Inventory" then
                v27:RemoveItemFromTrading(l_v147_Attribute_0, l_v147_Attribute_1);
            end;
            v147:Destroy();
            local v153 = if v143 == v4.Player then if l_v147_Attribute_2 == "Unit" then ("You removed %*"):format((v11:GetUnitValue(l_v147_Attribute_0, "FullName"))) else if l_v147_Attribute_2 == "Pet" then ("You removed %*"):format((v13:GetPetValue(l_v147_Attribute_0, "FullName"))) else ("You removed x%* %*"):format(l_v147_Attribute_1, (v14:GetDisplayName(l_v147_Attribute_0))) else if l_v147_Attribute_2 == "Unit" then ("%* removed %*"):format(v143.DisplayName, (v11:GetUnitValue(l_v147_Attribute_0, "FullName"))) else if l_v147_Attribute_2 == "Pet" then ("%* removed %*"):format(v143.DisplayName, (v13:GetPetValue(l_v147_Attribute_0, "FullName"))) else ("%* removed x%* %*"):format(v143.DisplayName, l_v147_Attribute_1, (v14:GetDisplayName(l_v147_Attribute_0)));
            v142:_systemMessage(v153);
            return;
        else
            v145[l_Name_0] = v147;
            return;
        end;
    end);
    for _, v155 in v144 do
        if not v146:FindFirstChild(v155._id) then
            local v156 = v142:_addOfferItem(v155, v146);
            v145[v155._id] = v156;
            v142:_systemMessage(if v143 == v4.Player then if v155.type == "Unit" then ("You added %*"):format((v11:GetUnitValue(v155.name, "FullName"))) else if v155.type == "Pet" then ("You added %*"):format((v13:GetPetValue(v155.name, "FullName"))) else ("You added x%* %*"):format(v155.amount, (v14:GetDisplayName(v155.name))) else if v155.type == "Unit" then ("%* added %*"):format(v143.DisplayName, (v11:GetUnitValue(v155.name, "FullName"))) else if v155.type == "Pet" then ("%* added %*"):format(v143.DisplayName, (v13:GetPetValue(v155.name, "FullName"))) else ("%* added x%* %*"):format(v143.DisplayName, v155.amount, (v14:GetDisplayName(v155.name))));
        end;
    end;
    for v157, v158 in v144 do
        local v159 = v145[v158._id];
        if v159 then
            v159.LayoutOrder = v157;
        end;
    end;
end;
v30._addChatMessage = function(v160, v161, v162) --[[ Line: 989 ]] --[[ Name: _addChatMessage ]]
    -- upvalues: v8 (copy), v10 (copy), v32 (copy)
    local v163 = v160.chatTemplate:Clone();
    v163.Name = v162 or "System";
    v163.Visible = true;
    local v164 = v162 == "You" and "SELF" or v162 and "OTHER" or "SYSTEM";
    local v165 = v8.TRADING.CHAT.COLORS[v164];
    local v166 = ("<font color=\"%*\">"):format((v10:Color3ToHex(v165)));
    local v167 = "</font>";
    if not v162 then
        v163.Username.Visible = false;
        v166 = v166 .. "<i>";
        v167 = ("</i>%*"):format(v167);
    else
        v163.Username.Text = ("%*:"):format(v162);
        v163.Username.TextColor3 = v165;
    end;
    v163.Message.Text = ("%*%*%*"):format(v166, v161, v167);
    v163.Parent = v160.chatContents;
    local l_chatNotifier_0 = v160.chatNotifier;
    local v169 = false;
    if v162 ~= nil then
        v169 = not v160.chatWindow.Visible;
    end;
    l_chatNotifier_0.Visible = v169;
    task.defer(v32, v160.chatContents);
end;
v30._showUnitHoverTooltip = function(v170, v171, v172) --[[ Line: 1016 ]] --[[ Name: _showUnitHoverTooltip ]]
    -- upvalues: v13 (copy), v11 (copy), v5 (copy), v15 (copy), v23 (ref), v24 (ref), v10 (copy), v26 (ref)
    if v170._hoveringInfo and v170._hoveringInfo.UID == v172.UID then
        return;
    else
        v170._hoveringInfo = v172;
        local v173 = v172.IsPet or false;
        local v174 = v172.Data.Level or 1;
        local v175 = nil;
        v175 = if v173 then select(2, v13:GetRarity(v172.Name)) else select(2, v11:GetRarity(v172.Name));
        if v170._hoverDumpster then
            v170._hoverDumpster:Destroy();
            v170._hoverDumpster = nil;
        end;
        v170._hoverDumpster = v5.new();
        v170._hoverDumpster:Add(v15.new(v170.hoverTooltip, v175));
        v170._hoverDumpster:Add(v15.new(v170.hoverTooltip.Content.UIStroke, v175));
        v170._hoverDumpster:Add(v15.new(v170.hoverTooltip.Content.Characteristics.UnitTags.Rarity, v175));
        local v176 = nil;
        v176 = if v173 then v13:GetPetValue(v172.Name, "FullName") else v11:GetUnitValue(v172.Name, "FullName");
        v170.hoverTooltip.Content.UnitName.UnitName.Text = v176 or v172.Name;
        v170.hoverTooltip.Content.Characteristics.UnitTags.Rarity.Text = v175;
        v170.hoverTooltip.Content.ExistingCount.Visible = false;
        v170.hoverTooltip.Content.Serial.Visible = false;
        v170.hoverTooltip.Content.MintedBy.Visible = false;
        v170._hoverDumpster:Add(v23:ApplyCountToLabel(v172.Name, v172.Data, v170.hoverTooltip.Content.ExistingCount, v173, "%s Exist", false):andThen(function(v177, v178) --[[ Line: 1069 ]]
            -- upvalues: v170 (copy)
            if not v177 then
                return;
            else
                v170.hoverTooltip.Content.ExistingCount.Visible = true;
                v170._hoverDumpster:Add(v178);
                return;
            end;
        end));
        v170._hoverDumpster:Add(v24:ApplyMintToLabel(v172.Name, v172.UID, v172.Data, v170.hoverTooltip.Content.Serial, v173 and "Pets" or "Units", "#%s"):andThen(function(v179, v180) --[[ Line: 1086 ]]
            -- upvalues: v172 (copy), v24 (ref), v170 (copy)
            if not v179 then
                return;
            else
                if v172.Data.MintedBy ~= nil then
                    v24:ApplyMintedByToLabel(v172.Data, v170.hoverTooltip.Content.MintedBy):andThen(function() --[[ Line: 1095 ]]
                        -- upvalues: v170 (ref)
                        v170.hoverTooltip.Content.MintedBy.Visible = true;
                    end);
                end;
                v170.hoverTooltip.Content.Serial.Visible = true;
                v170._hoverDumpster:Add(v180);
                return;
            end;
        end));
        v170.hoverTooltip.Content.Characteristics.UnitTags.ShinyStatus.Visible = v172.Data.Shiny or false;
        v170.hoverTooltip.Content.Characteristics.UnitTags.WumboStatus.Visible = v172.Data.Mega or false;
        v170.hoverTooltip.Content.Level.Level.RichText = true;
        v170.hoverTooltip.Content.Level.Level.Text = ("Level <font color=\"#FFFF00\">%*</font>"):format(v174);
        local v181 = nil;
        v181 = if v173 then v13:GetNextLevelCost(v172.Data) else v11:GetNextLevelCost(v172.Data);
        v170.hoverTooltip.Content.Level.XPBar.Fill.Size = UDim2.fromScale(math.clamp(v172.Data.Experience / v181, 0, 1), 1);
        v170.hoverTooltip.Content.Level.XPBar.Progression.Text = ("%*/%*"):format(math.round(v172.Data.Experience), v181);
        v170.hoverTooltip.Content.Characteristics.Stats.Values.DMG.Visible = v172.UnitType ~= "Resource";
        v170.hoverTooltip.Content.Characteristics.Stats.Values.RNG.Visible = v172.UnitType ~= "Resource";
        v170.hoverTooltip.Content.Characteristics.Stats.Values.SPA.Visible = v172.UnitType ~= "Resource";
        v170.hoverTooltip.Content.Characteristics.Stats.Values.GOLD.Visible = v172.UnitType == "Resource";
        v170.hoverTooltip.Content.Characteristics.Stats.Values.PLC.Visible = v172.UnitType == "Resource";
        if v172.UnitType == "Resource" then
            v170.hoverTooltip.Content.Characteristics.Stats.Values.GOLD.StatAmount.Text = v11:GetGold(v172.Data);
        elseif not v173 then
            v170.hoverTooltip.Content.Characteristics.Stats.Values.DMG.StatAmount.Text = v11:GetTotalDamage(v172.Data);
            v170.hoverTooltip.Content.Characteristics.Stats.Values.RNG.StatAmount.Text = v11:GetRange(v172.Data);
            v170.hoverTooltip.Content.Characteristics.Stats.Values.SPA.StatAmount.Text = v11:GetAttackCooldown(v172.Data);
        else
            local v182 = v13:GetDamageBuff(v172.Data) or 0;
            local v183 = v13:GetRangeBuff(v172.Data) or 0;
            local v184 = v13:GetCooldownBuff(v172.Data) or 0;
            local v185 = v13:GetGoldBuff(v172.Data) or 0;
            local v186 = v13:GetPlacementBuff(v172.Data) or 0;
            local function _(v187, v188, v189) --[[ Line: 1141 ]] --[[ Name: fillStatLabel ]]
                local v190 = v188 > 0 and "+" or "";
                local v191 = v189 and "" or "%";
                v187.StatAmount.Text = ("%*%*%*"):format(v190, v188, v191);
                v187.Visible = v188 ~= 0;
            end;
            local l_Values_0 = v170.hoverTooltip.Content.Characteristics.Stats.Values;
            local l_DMG_0 = l_Values_0.DMG;
            local v195 = v182 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v195, v182);
            l_DMG_0.Visible = v182 ~= 0;
            l_DMG_0 = l_Values_0.RNG;
            v195 = v183 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v195, v183);
            l_DMG_0.Visible = v183 ~= 0;
            l_DMG_0 = l_Values_0.SPA;
            v195 = v184 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v195, v184);
            l_DMG_0.Visible = v184 ~= 0;
            l_DMG_0 = l_Values_0.GOLD;
            v195 = v185 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v195, v185);
            l_DMG_0.Visible = v185 ~= 0;
            l_DMG_0 = l_Values_0.PLC;
            v195 = v186 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*"):format(v195, v186);
            l_DMG_0.Visible = v186 ~= 0;
        end;
        v170.hoverTooltip.Content.Level.Unsorted.Stars.Visible = v172.Data.Stars > 0;
        if v172.Data.Stars > 0 then
            v170.hoverTooltip.Content.Level.Unsorted.Stars.Main.Amount.Text = v172.Data.Stars;
            for v196 = 2, 5 do
                v170.hoverTooltip.Content.Level.Unsorted.Stars[tostring(v196)].Visible = v196 <= v172.Data.Stars;
            end;
        end;
        v170.hoverTooltip.Content.UnitName.AttackType.Visible = not v173;
        if not v173 then
            v170.hoverTooltip.Content.UnitName.AttackType.Icon.Image = v10:GetAttackTypeIcon(v172.UnitType);
            local l_v11_PrimaryEffect_0 = v11:GetPrimaryEffect(v172.Name);
            v170.hoverTooltip.Content.UnitName.AttackType.EffectType.Visible = l_v11_PrimaryEffect_0 ~= nil;
            if l_v11_PrimaryEffect_0 then
                v170.hoverTooltip.Content.UnitName.AttackType.EffectType.Icon.Image = v10:GetEffectIcon(l_v11_PrimaryEffect_0);
            end;
        end;
        v170.hoverTooltip.Visible = true;
        v26:AlignTooltip(v171, v170.hoverTooltip);
        return;
    end;
end;
v30._hideUnitHoverTooltip = function(v198, v199, v200) --[[ Line: 1184 ]] --[[ Name: _hideUnitHoverTooltip ]]
    if v198._hoverDumpster then
        v198._hoverDumpster:Destroy();
        v198._hoverDumpster = nil;
    end;
    if not v199 or not v200 then
        v198._hoveringInfo = nil;
        v198.hoverTooltip.Visible = false;
        return;
    elseif v198._hoveringInfo and v198._hoveringInfo.UID ~= v200.UID then
        return;
    else
        v198._hoveringInfo = nil;
        v198.hoverTooltip.Visible = false;
        return;
    end;
end;
v30._onChanged = function(v201, v202, v203, v204) --[[ Line: 1206 ]] --[[ Name: _onChanged ]]
    if not v201.tradeReplica then
        return;
    else
        if v204 and v201.tradeReplica.Data[v202] ~= nil then
            v203(v201.tradeReplica.Data[v202]);
        end;
        return v201.tradeReplica:ListenToChange(v202, v203);
    end;
end;
return v30;