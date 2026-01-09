local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = require(v2.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.PromiseFriends);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = {};
local v18 = {};
return {
    primaryMenu = true, 
    blur = true, 
    _buttons = {}, 
    searchTerm = "", 
    ToggleAll = {}, 
    Init = function(v19, v20, v21) --[[ Line: 52 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v2 (copy), v11 (ref), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v9 (copy), v3 (copy)
        v10 = v2.GetController("UIController");
        v11 = v2.GetController("DataController");
        v12 = v2.GetService("TradingService");
        v13 = v2.GetController("TreasureController");
        v14 = v2.GetController("VDayGiftController");
        v15 = v2.GetController("BubblePopperController");
        v19.currentMode = v21;
        v19.ui = v20;
        v19.main = v20.Main;
        v19.exitButton = v19.main.Exit;
        v19.content = v19.main.Content;
        v19.noPlayersLabel = v19.content.NoPlayers;
        v19.playerList = v19.content.PlayerList;
        v19.template = v19.playerList.Template:Clone();
        v19.playerList.Template:Destroy();
        v19.template.Content.Icon.PlayerLevel.Visible = false;
        v19.template.Content.Info.Trade.Pending.Visible = false;
        v19.noPlayersLabel.Visible = true;
        v19.searchBox = v19.main.Bottom.SearchBar.TextBox;
        local _ = v9:GetForCTUnix({
            year = 2025, 
            month = 4, 
            day = 25, 
            hour = 17
        });
        v19.dumpster = v3.new();
    end, 
    Start = function(v23) --[[ Line: 89 ]] --[[ Name: Start ]]
        -- upvalues: v16 (ref), v10 (ref), v12 (ref), v17 (copy), v18 (copy), l_Players_0 (copy)
        v16 = v10:GetModuleAsync("MessagePrompt"):expect();
        v10:HandleButton(v23.exitButton, function() --[[ Line: 92 ]]
            -- upvalues: v10 (ref)
            v10:Toggle(script.Name, false);
        end);
        v12.TradeRequest:Connect(function(v24, v25) --[[ Line: 96 ]]
            -- upvalues: v17 (ref), v23 (copy)
            v17[v24] = v25;
            local l_FirstChild_0 = v23.playerList:FindFirstChild(v24);
            if not l_FirstChild_0 then
                return;
            else
                l_FirstChild_0.Content.Info.Trade.Request.Title.Text = "Accept";
                l_FirstChild_0.LayoutOrder = 1;
                return;
            end;
        end);
        v12.RequestCleared:Connect(function(v27, v28) --[[ Line: 108 ]]
            -- upvalues: v17 (ref), v18 (ref), v23 (copy)
            if v17[v27] == v28 then
                v17[v27] = nil;
            end;
            if v18[v27] then
                v18[v27] = nil;
            end;
            local l_FirstChild_1 = v23.playerList:FindFirstChild(v27);
            if not l_FirstChild_1 then
                return;
            else
                local l_Trade_0 = l_FirstChild_1.Content.Info.Trade;
                l_Trade_0.Request.Title.Text = "Trade";
                l_Trade_0.Pending.Visible = false;
                return;
            end;
        end);
        l_Players_0.PlayerRemoving:Connect(function(v31) --[[ Line: 128 ]]
            -- upvalues: v17 (ref), v18 (ref), v23 (copy)
            if v17[v31.UserId] then
                v17[v31.UserId] = nil;
            end;
            if v18[v31.UserId] then
                v18[v31.UserId] = nil;
            end;
            local l_FirstChild_2 = v23.playerList:FindFirstChild(v31.UserId);
            if l_FirstChild_2 then
                l_FirstChild_2:Destroy();
            end;
        end);
    end, 
    Opening = function(v33) --[[ Line: 144 ]] --[[ Name: Opening ]]
        -- upvalues: v10 (ref), l_Players_0 (copy)
        v10:Toggle("TradeInbound", false);
        v33.searchBox.Text = "";
        v33.dumpster:Connect(l_Players_0.PlayerAdded, function(v34) --[[ Line: 149 ]]
            -- upvalues: v33 (copy)
            if not v33.searchTerm or v33.searchTerm == "" or string.find(string.lower(v34.DisplayName), v33.searchTerm) or string.find(string.lower(v34.Name), v33.searchTerm) then
                v33:_addPlayer(v34.UserId);
            end;
        end);
        v33.dumpster:Connect(v33.searchBox:GetPropertyChangedSignal("Text"), function() --[[ Line: 157 ]]
            -- upvalues: v33 (copy)
            v33:FilterPlayersBySearch(v33.searchBox.Text);
        end);
        v33:FilterPlayersBySearch();
    end, 
    Closed = function(v35) --[[ Line: 189 ]] --[[ Name: Closed ]]
        -- upvalues: v5 (copy)
        v35.dumpster:Destroy();
        v5.deferClearBrowser(v35.playerList, {
            filterClass = "Frame"
        });
        v35.searchBox.Text = "";
    end, 
    CanOpen = function(_) --[[ Line: 199 ]] --[[ Name: CanOpen ]]
        -- upvalues: v11 (ref), v2 (copy), v7 (copy), v6 (copy), v16 (ref)
        local v37 = v11:Get(v2.Player, "PlayerStats"):expect();
        if not v7:MeetsLevelRequirement(v37, v6.TRADING.LEVEL_REQUIREMENT) then
            v16:Prompt({
                message = ("You must be level %* to trade"):format(v6.TRADING.LEVEL_REQUIREMENT), 
                options = {
                    {
                        text = "Ok"
                    }
                }
            });
            return false;
        else
            return true;
        end;
    end, 
    Send = function(v38, v39) --[[ Line: 218 ]] --[[ Name: Send ]]
        -- upvalues: v17 (copy), v6 (copy), v16 (ref), v12 (ref), v18 (copy)
        if not v38:_verifyOpening() then
            return;
        else
            local l_UserId_0 = v39.UserId;
            local v41 = v38._buttons[tostring(l_UserId_0)];
            if v17[l_UserId_0] then
                if v39:GetAttribute(v6.TRADING.ATTRIBUTE) then
                    v16:Prompt({
                        message = "This player is already in a trade", 
                        options = {
                            {
                                text = "Ok"
                            }
                        }
                    });
                    return;
                else
                    v12:AcceptTradeRequest(v17[l_UserId_0]);
                    v17[l_UserId_0] = nil;
                    if v41 then
                        v41.Request.Title.Text = "Trade";
                        v41.Pending.Visible = false;
                    end;
                    return;
                end;
            elseif v18[l_UserId_0] then
                v16:Prompt({
                    message = "You've already sent a request to this player", 
                    options = {
                        {
                            text = "Ok"
                        }
                    }
                });
                return;
            else
                local v42, v43 = v12:SendTradeRequest(v39):expect();
                if not v42 then
                    if v43 then
                        v16:Prompt({
                            message = v43, 
                            options = {
                                {
                                    text = "Ok"
                                }
                            }
                        });
                    end;
                    return;
                else
                    v16:Prompt({
                        message = "Trade request sent", 
                        options = {
                            {
                                text = "Ok"
                            }
                        }
                    });
                    v18[l_UserId_0] = true;
                    if v41 then
                        v41.Pending.Visible = true;
                        v41.LayoutOrder = 2;
                    end;
                    return;
                end;
            end;
        end;
    end, 
    FilterPlayersBySearch = function(v44, v45) --[[ Line: 297 ]] --[[ Name: FilterPlayersBySearch ]]
        -- upvalues: v5 (copy), l_Players_0 (copy), v2 (copy), v7 (copy), v17 (copy), v18 (copy)
        v44.searchTerm = string.lower(v45 or "");
        v5.deferClearBrowser(v44.playerList, {
            filterClass = "Frame"
        });
        local v46 = {};
        for _, v48 in ipairs(l_Players_0:GetPlayers()) do
            if v48 ~= v2.Player then
                local v49 = string.lower(v48.DisplayName);
                local v50 = string.lower(v48.Name);
                if v7:IsStringEmpty(v44.searchTerm) or string.find(v49, v44.searchTerm) or string.find(v50, v44.searchTerm) then
                    table.insert(v46, v48.UserId);
                end;
            end;
        end;
        table.sort(v46, function(v51, v52) --[[ Line: 322 ]]
            -- upvalues: v17 (ref), v18 (ref)
            if v17[v51] and not v17[v52] then
                return true;
            elseif v17[v52] and not v17[v51] then
                return false;
            elseif v18[v51] and not v18[v52] then
                return true;
            elseif v18[v52] and not v18[v51] then
                return false;
            else
                return;
            end;
        end);
        if v44._loadDemandDump then
            v44._loadDemandDump:Destroy();
        end;
        v44.playerList.CanvasPosition = Vector2.zero;
        v44._loadDemandDump = v5.loadOnDemand(v46, v44.playerList, v44.dumpster, function(v53) --[[ Line: 345 ]]
            -- upvalues: v44 (copy)
            v44:_addPlayer(v53);
        end);
        if v44._loadDemandDump then
            v44._loadDemandDump:Add(function() --[[ Line: 350 ]]
                -- upvalues: v44 (copy)
                v44._loadDemandDump = nil;
            end);
        end;
        v44.noPlayersLabel.Visible = #v46 == 0;
    end, 
    _addPlayer = function(v54, v55) --[[ Line: 360 ]] --[[ Name: _addPlayer ]]
        -- upvalues: l_Players_0 (copy), v2 (copy), v11 (ref), v7 (copy), v6 (copy), v17 (copy), v18 (copy), v8 (copy), v10 (ref)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v55);
        if l_l_Players_0_PlayerByUserId_0 == v2.Player or not v54:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_0) then
            return;
        elseif v54.playerList:FindFirstChild(l_l_Players_0_PlayerByUserId_0.UserId) then
            return;
        elseif not l_l_Players_0_PlayerByUserId_0:GetAttribute("DATA_LOADED") then
            v54.dumpster:Add(l_l_Players_0_PlayerByUserId_0:GetAttributeChangedSignal("DATA_LOADED"):Once(function() --[[ Line: 371 ]]
                -- upvalues: v54 (copy), l_l_Players_0_PlayerByUserId_0 (copy)
                v54:_addPlayer(l_l_Players_0_PlayerByUserId_0.UserId);
            end));
            return;
        elseif v11:Get(l_l_Players_0_PlayerByUserId_0, "_tradeBanned"):expect() then
            return;
        elseif not v54:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_0) then
            return;
        else
            local v57 = v11:Get(l_l_Players_0_PlayerByUserId_0, "PlayerStats"):expect();
            if not v57 or not v7:MeetsLevelRequirement(v57, v6.TRADING.LEVEL_REQUIREMENT) then
                return;
            elseif not v54:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_0) then
                return;
            else
                local v58 = v54.template:Clone();
                v58.Name = v55;
                v58.LayoutOrder = v17[v55] and 1 or v18[v55] and 2 or 3;
                local l_Content_0 = v58.Content;
                local l_Icon_0 = l_Content_0.Icon;
                local l_Info_0 = l_Content_0.Info;
                local l_Status_0 = l_Info_0.Status;
                local l_Trade_1 = l_Info_0.Trade;
                v58.Parent = v54.playerList;
                v54.noPlayersLabel.Visible = false;
                local v64 = v54.dumpster:Extend();
                v54._buttons[tostring(v55)] = l_Trade_1;
                v64:Add(function() --[[ Line: 417 ]]
                    -- upvalues: v54 (copy), v55 (copy)
                    v54._buttons[tostring(v55)] = nil;
                end);
                v64:AttachTo(v58);
                v64:Add(function() --[[ Line: 423 ]]
                    -- upvalues: l_Players_0 (ref), v54 (copy)
                    if #l_Players_0:GetPlayers() < 2 then
                        v54.noPlayersLabel.Visible = true;
                    end;
                end);
                l_Icon_0.Icon.Image = string.format(v6.PLAYER_IMAGE_URL, l_l_Players_0_PlayerByUserId_0.UserId);
                l_Info_0.DisplayName.Text = l_l_Players_0_PlayerByUserId_0.DisplayName;
                l_Info_0.Username.Text = ("@%*"):format(l_l_Players_0_PlayerByUserId_0.Name);
                l_Status_0.Verified.Visible = l_l_Players_0_PlayerByUserId_0.HasVerifiedBadge;
                l_Status_0.Friend.Visible = false;
                v54.dumpster:AddPromise(v8(v2.Player, l_l_Players_0_PlayerByUserId_0):andThen(function(v65) --[[ Line: 435 ]]
                    -- upvalues: l_Status_0 (copy)
                    l_Status_0.Friend.Visible = v65;
                end));
                l_Icon_0.PlayerLevel.Prestige.Image = v7:GetPrestigeIcon(v57.Prestige, v57.Level) or "";
                l_Icon_0.PlayerLevel.Prestige.Visible = v57.Prestige >= 1;
                l_Icon_0.PlayerLevel.PlayerLevel.Text = ("LVL %*"):format(v57.Level);
                l_Icon_0.PlayerLevel.Visible = true;
                if v17[v55] then
                    l_Trade_1.Request.Title.Text = "Accept";
                end;
                if v18[v55] then
                    l_Trade_1.Pending.Visible = true;
                end;
                v10:HandleButton(l_Trade_1, function() --[[ Line: 452 ]]
                    -- upvalues: v54 (copy), l_l_Players_0_PlayerByUserId_0 (copy)
                    v54:Send(l_l_Players_0_PlayerByUserId_0);
                end);
                return;
            end;
        end;
    end, 
    _verifyPlayerAncestry = function(_, v67) --[[ Line: 457 ]] --[[ Name: _verifyPlayerAncestry ]]
        return (v67 and v67.Parent) ~= nil;
    end, 
    _verifyOpening = function(_) --[[ Line: 461 ]] --[[ Name: _verifyOpening ]]
        -- upvalues: v13 (ref), v14 (ref), v15 (ref)
        if v13:IsOpening() then
            return false;
        elseif v14:IsOpening() then
            return false;
        elseif v15:IsOpening() then
            return false;
        else
            return true;
        end;
    end
};