local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(v2.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.PromiseFriends);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v9 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedStorage_0.ReplicaController);
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = {
    blur = true, 
    primaryMenu = true, 
    openDumpster = v3.new(), 
    _buttons = {}
};
local v18 = v3.new();
local v19 = nil;
v17.Init = function(v20, v21, v22) --[[ Line: 44 ]] --[[ Name: Init ]]
    -- upvalues: v12 (ref), v2 (copy), v13 (ref), v14 (ref)
    v12 = v2.GetController("UIController");
    v13 = v2.GetController("DataController");
    v14 = v2.GetService("PartyService");
    v20.currentMode = v22;
    v20.ui = v21;
    v20.main = v21.Main;
    v20.content = v20.main.Content;
    v20.inviteContent = v20.content.InviteContent;
    v20.playerList = v20.inviteContent.PlayerList;
    v20.noPlayersLabel = v20.inviteContent.NoPlayers;
    v20.searchBox = v20.inviteContent.SearchBar.TextBox;
    v20.multiButton = v20.main.MultiButton;
    v20.activeBoost = v20.main.ActiveBoost;
    v20.partyBackground = v20.main.Background;
    v20.fillerBackground = v20.partyBackground.Filler;
    v20.template = v20.playerList.Template:Clone();
    v20.template.Content.Icon.PlayerLevel.Visible = false;
    v20.template.Content.Info.Invite.Pending.Visible = false;
    v20.playerList.Template:Destroy();
    v20.noPlayersLabel.Visible = true;
    v20.notPartyBackground = v20.content.NoPartyBackground;
    v20.currentMembers = v20.content.CurrentMembers;
    v20.memberFrameTemplate = v20.currentMembers.Template:Clone();
    v20.leaderFrameTemplate = v20.currentMembers.Template_PartyLeader:Clone();
    v20.currentMembers.Template:Destroy();
    v20.memberFrameTemplate.Content.Icon.PlayerLevel.Visible = false;
    v20.memberFrameTemplate.Content.Icon.PlayerLevel.Visible = false;
    v20.currentMembers.Template_PartyLeader:Destroy();
    v20.leaderFrameTemplate.Content.Icon.PlayerLevel.Visible = false;
    v20.leaderFrameTemplate.Content.Icon.PlayerLevel.Visible = false;
    v20.multiButton.Visible = true;
    v20.notPartyBackground.Visible = true;
    v20.inviteContent.Visible = false;
    v20.currentMembers.Visible = false;
    v20.partyBackground.Visible = false;
    v20.activeBoost.Visible = false;
    v20._multiButtonNotInPartyPos = v20.multiButton.Position;
    v20._multiButtonInPartyPos = v20.main.MultiButton_DisbandLocation.Position;
    v20.main.MultiButton_DisbandLocation:Destroy();
end;
v17.Start = function(v23) --[[ Line: 95 ]] --[[ Name: Start ]]
    -- upvalues: v15 (ref), v12 (ref), v16 (ref), v18 (copy), v2 (copy), v11 (copy), v19 (ref), v14 (ref)
    v15 = v12:GetModuleAsync("MessagePrompt"):expect();
    v16 = v12:GetModuleAsync("HUD"):expect();
    v12:HandleButton(v23.main.Exit, function() --[[ Line: 99 ]]
        -- upvalues: v12 (ref)
        v12:Toggle(script.Name, false);
    end);
    local function v27() --[[ Line: 103 ]] --[[ Name: partyChanged ]]
        -- upvalues: v18 (ref), v2 (ref), v11 (ref), v23 (copy)
        v18:Clean();
        local l_Attribute_0 = v2.Player:GetAttribute("PARTY_ID");
        if not l_Attribute_0 then
            return;
        else
            local v25 = ("Party_%*"):format(l_Attribute_0);
            if v11.ReplicaClasses[v25] then
                v23:_gotPartyReplica(v25);
                return;
            else
                local v26 = nil;
                v26 = v11.ReplicaOfClassCreated(v25, function() --[[ Line: 118 ]]
                    -- upvalues: v26 (ref), v23 (ref), v25 (copy)
                    v26:Disconnect();
                    v26 = nil;
                    v23:_gotPartyReplica(v25);
                end);
                return;
            end;
        end;
    end;
    v27();
    v2.Player:GetAttributeChangedSignal("PARTY_ID"):Connect(v27);
    v12:HandleButton(v23.multiButton, function() --[[ Line: 130 ]]
        -- upvalues: v19 (ref), v2 (ref), v15 (ref), v14 (ref)
        if v19 then
            local v28 = "Are you sure you want to leave your party?";
            if v19.Data.PartyLeader == tostring(v2.Player.UserId) then
                v28 = "Are you sure you want to disband your party?";
            end;
            v15:Prompt({
                message = v28, 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 143 ]] --[[ Name: callback ]]
                            -- upvalues: v14 (ref)
                            v14:LeaveParty();
                        end
                    }, 
                    {
                        text = "No"
                    }
                }
            });
            return;
        else
            v14:CreateParty();
            return;
        end;
    end);
end;
v17.Opening = function(v29) --[[ Line: 158 ]] --[[ Name: Opening ]]
    -- upvalues: l_Players_0 (copy)
    v29.searchBox.Text = "";
    v29.openDumpster:Connect(l_Players_0.PlayerAdded, function(v30) --[[ Line: 161 ]]
        -- upvalues: v29 (copy)
        if not v29.searchTerm or v29.searchTerm == "" or string.find(string.lower(v30.DisplayName), v29.searchTerm) or string.find(string.lower(v30.Name), v29.searchTerm) then
            v29:_addPlayer(v30.UserId);
        end;
    end);
    v29.openDumpster:Connect(v29.searchBox:GetPropertyChangedSignal("Text"), function() --[[ Line: 169 ]]
        -- upvalues: v29 (copy)
        v29:_filterPlayersBySearch(v29.searchBox.Text);
    end);
    v29:_filterPlayersBySearch();
end;
v17.Opened = function(_) --[[ Line: 176 ]] --[[ Name: Opened ]]
    -- upvalues: v16 (ref)
    v16:ToggleBottomLobbyFrame(false);
end;
v17.Closed = function(v32) --[[ Line: 180 ]] --[[ Name: Closed ]]
    -- upvalues: v4 (copy)
    v32.openDumpster:Clean();
    v4.deferClearBrowser(v32.playerList, {
        filterClass = "Frame"
    });
end;
v17.Closing = function(_) --[[ Line: 188 ]] --[[ Name: Closing ]]
    -- upvalues: v16 (ref)
    v16:ToggleBottomLobbyFrame(true);
end;
v17._gotPartyReplica = function(v34, v35) --[[ Line: 195 ]] --[[ Name: _gotPartyReplica ]]
    -- upvalues: v19 (ref), v11 (copy), v8 (copy), v9 (copy), v7 (copy), v2 (copy), l_Players_0 (copy), v16 (ref), v18 (copy), v6 (copy), v13 (ref), v5 (copy), v12 (ref), v15 (ref), v14 (ref)
    v19 = v11.ReplicaClasses[v35];
    local function _() --[[ Line: 198 ]] --[[ Name: makeButtonRed ]]
        -- upvalues: v34 (copy), v8 (ref)
        v34.multiButton.Position = v34._multiButtonInPartyPos;
        v34.multiButton.Holder.UIGradient.Color = v8.Gradient.RedConfirmation;
        v34.multiButton.Holder.UIStroke.Color = v8.Solid.RedConfirmationOutline;
        v34.multiButton.Holder.Title.UIStroke.Color = v8.Solid.RedConfirmationOutline;
    end;
    local function v39() --[[ Line: 206 ]] --[[ Name: loadStats ]]
        -- upvalues: v9 (ref), v19 (ref), v7 (ref), v34 (copy)
        local v37 = #v9.Keys(v19.Data.Players);
        local v38 = math.round((v7.PARTIES.PARTY_BOOSTS[v37] or 0) * 100);
        v34.activeBoost.Content.Boost.Text = ("+%*%% BOOST"):format(v38);
        v34.currentMembers.Title.Text = ("Party Members (%*/%*)"):format(v37, v7.PARTIES.MAX_PARTY_SIZE);
    end;
    v39();
    v34.activeBoost.Visible = true;
    v34.currentMembers.Visible = true;
    v34.partyBackground.Visible = true;
    v34.notPartyBackground.Visible = false;
    if v19.Data.PartyLeader == tostring(v2.Player.UserId) then
        v34.multiButton.Holder.Title.Text = "Disband";
        v34.inviteContent.Visible = true;
        v34.multiButton.Position = v34._multiButtonInPartyPos;
        v34.multiButton.Holder.UIGradient.Color = v8.Gradient.RedConfirmation;
        v34.multiButton.Holder.UIStroke.Color = v8.Solid.RedConfirmationOutline;
        v34.multiButton.Holder.Title.UIStroke.Color = v8.Solid.RedConfirmationOutline;
    else
        v34.multiButton.Holder.Title.Text = "Leave";
        v34.inviteContent.Visible = false;
        v34.multiButton.Position = v34._multiButtonInPartyPos;
        v34.multiButton.Holder.UIGradient.Color = v8.Gradient.RedConfirmation;
        v34.multiButton.Holder.UIStroke.Color = v8.Solid.RedConfirmationOutline;
        v34.multiButton.Holder.Title.UIStroke.Color = v8.Solid.RedConfirmationOutline;
    end;
    if v19.Data.PartyLeader == tostring(v2.Player.UserId) then
        v34.fillerBackground.Visible = true;
    else
        v34.fillerBackground.Visible = false;
    end;
    local function v50(v40) --[[ Line: 241 ]] --[[ Name: loadPartyMember ]]
        -- upvalues: l_Players_0 (ref), v34 (copy), v16 (ref), v19 (ref), v18 (ref), v7 (ref), v6 (ref), v2 (ref), v13 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(v40)));
        if not l_l_Players_0_PlayerByUserId_0 then
            return;
        elseif v34.currentMembers:FindFirstChild(v40) then
            return;
        else
            v16:UpdatePartyDisplay(v19.Data);
            local v42 = v40 == v19.Data.PartyLeader and v34.leaderFrameTemplate:Clone() or v34.memberFrameTemplate:Clone();
            v42.Name = v40;
            v42.Content.Icon.PlayerLevel.Visible = false;
            v42.Parent = v34.currentMembers;
            v18:Add(v42);
            if v40 == v19.Data.PartyLeader then
                v42.LayoutOrder = 0;
            else
                v42.LayoutOrder = 1;
            end;
            local l_Content_0 = v42.Content;
            local l_Icon_0 = l_Content_0.Icon;
            local l_Info_0 = l_Content_0.Info;
            local l_Status_0 = l_Info_0.Status;
            l_Icon_0.Icon.Image = string.format(v7.PLAYER_IMAGE_URL, l_l_Players_0_PlayerByUserId_0.UserId);
            l_Info_0.DisplayName.Text = l_l_Players_0_PlayerByUserId_0.DisplayName;
            l_Info_0.Username.Text = ("@%*"):format(l_l_Players_0_PlayerByUserId_0.Name);
            l_Status_0.Verified.Visible = l_l_Players_0_PlayerByUserId_0.HasVerifiedBadge;
            l_Status_0.Friend.Visible = false;
            v34.openDumpster:AddPromise(v6(v2.Player, l_l_Players_0_PlayerByUserId_0):andThen(function(v47) --[[ Line: 277 ]]
                -- upvalues: l_Status_0 (copy)
                l_Status_0.Friend.Visible = v47;
            end));
            local v48 = v13:Get(l_l_Players_0_PlayerByUserId_0, "PlayerStats"):expect();
            l_Icon_0.PlayerLevel.Prestige.Image = v5:GetPrestigeIcon(v48.Prestige, v48.Level) or "";
            l_Icon_0.PlayerLevel.Prestige.Visible = v48.Prestige >= 1;
            l_Icon_0.PlayerLevel.PlayerLevel.Text = ("LVL %*"):format(v48.Level);
            l_Icon_0.PlayerLevel.Visible = true;
            v42.Content.Info.Kick.Visible = v19.Data.PartyLeader == tostring(v2.Player.UserId);
            if v2.Player == l_l_Players_0_PlayerByUserId_0 then
                v42.Content.Info.Kick.Visible = false;
            end;
            if v42.Content.Info.Kick.Visible then
                v12:HandleButton(v42.Content.Info.Kick, function() --[[ Line: 296 ]]
                    -- upvalues: l_l_Players_0_PlayerByUserId_0 (copy), v15 (ref), v14 (ref)
                    local v49 = ("Are you sure you want to kick %* from the party?"):format(l_l_Players_0_PlayerByUserId_0.DisplayName);
                    v15:Prompt({
                        message = v49, 
                        options = {
                            {
                                text = "Yes", 
                                callback = function() --[[ Line: 304 ]] --[[ Name: callback ]]
                                    -- upvalues: v14 (ref), l_l_Players_0_PlayerByUserId_0 (ref)
                                    v14:KickPlayer(l_l_Players_0_PlayerByUserId_0);
                                end
                            }, 
                            {
                                text = "No"
                            }
                        }
                    });
                end);
            end;
            return;
        end;
    end;
    for v51, _ in v19.Data.Players do
        v50(v51);
    end;
    v18:Add(v19:ListenToChange("Players", function() --[[ Line: 322 ]]
        -- upvalues: v39 (copy), v19 (ref), v50 (copy), v34 (copy)
        v39();
        for v53, _ in v19.Data.Players do
            v50(v53);
        end;
        for _, v56 in v34.currentMembers:GetChildren() do
            if v56:IsA("Frame") and not v19.Data.Players[v56.Name] then
                v56:Destroy();
            end;
        end;
        v34:_filterPlayersBySearch(v34.searchBox.Text);
    end));
    v18:Add(v19:ListenToChange("OutgoingInvites", function() --[[ Line: 343 ]]
        -- upvalues: v34 (copy), v19 (ref)
        for v57, v58 in v34._buttons do
            if not v19.Data.OutgoingInvites[v57] and v58:FindFirstChild("Pending") then
                v58.Pending.Visible = false;
            end;
        end;
    end));
    v18:Add(function() --[[ Line: 352 ]]
        -- upvalues: v19 (ref), v34 (copy), v8 (ref), v16 (ref)
        v19 = nil;
        v34.inviteContent.Visible = false;
        v34.currentMembers.Visible = false;
        v34.partyBackground.Visible = false;
        v34.activeBoost.Visible = false;
        v34.notPartyBackground.Visible = true;
        v34.multiButton.Holder.Title.Text = "Create";
        v34.multiButton.Holder.UIGradient.Color = v8.Gradient.GreenConfirmation;
        v34.multiButton.Holder.UIStroke.Color = v8.Solid.GreenConfirmationOutline;
        v34.multiButton.Holder.Title.UIStroke.Color = v8.Solid.GreenConfirmationOutline;
        v34.multiButton.Position = v34._multiButtonNotInPartyPos;
        v34:_filterPlayersBySearch(v34.searchBox.Text);
        v16:UpdatePartyDisplay(nil);
    end);
    v19:AddCleanupTask(function() --[[ Line: 371 ]]
        -- upvalues: v18 (ref)
        v18:Clean();
    end);
end;
v17._filterPlayersBySearch = function(v59, v60) --[[ Line: 376 ]] --[[ Name: _filterPlayersBySearch ]]
    -- upvalues: v4 (copy), l_Players_0 (copy), v2 (copy), v5 (copy)
    v59.searchTerm = string.lower(v60 or "");
    v4.deferClearBrowser(v59.playerList, {
        filterClass = "Frame"
    });
    local v61 = {};
    for _, v63 in l_Players_0:GetPlayers() do
        if v63 ~= v2.Player then
            local v64 = string.lower(v63.DisplayName);
            local v65 = string.lower(v63.Name);
            if v5:IsStringEmpty(v59.searchTerm) or string.find(v64, v59.searchTerm) or string.find(v65, v59.searchTerm) then
                table.insert(v61, v63.UserId);
            end;
        end;
    end;
    if v59._loadDemandDump then
        v59._loadDemandDump:Destroy();
    end;
    v59.playerList.CanvasPosition = Vector2.zero;
    v59._loadDemandDump = v4.loadOnDemand(v61, v59.playerList, v59.openDumpster, function(v66) --[[ Line: 407 ]]
        -- upvalues: v59 (copy)
        v59:_addPlayer(v66);
    end);
    if v59._loadDemandDump then
        v59._loadDemandDump:Add(function() --[[ Line: 412 ]]
            -- upvalues: v59 (copy)
            v59._loadDemandDump = nil;
        end);
    end;
    v59.noPlayersLabel.Visible = #v61 == 0;
end;
v17._addPlayer = function(v67, v68) --[[ Line: 421 ]] --[[ Name: _addPlayer ]]
    -- upvalues: l_Players_0 (copy), v2 (copy), v13 (ref), v19 (ref), v7 (copy), v6 (copy), v5 (copy), v12 (ref), v14 (ref)
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v68);
    if l_l_Players_0_PlayerByUserId_1 == v2.Player or not v67:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_1) then
        return;
    elseif v67.playerList:FindFirstChild(l_l_Players_0_PlayerByUserId_1.UserId) then
        return;
    elseif not l_l_Players_0_PlayerByUserId_1:GetAttribute("DATA_LOADED") then
        v67.openDumpster:Add(l_l_Players_0_PlayerByUserId_1:GetAttributeChangedSignal("DATA_LOADED"):Once(function() --[[ Line: 432 ]]
            -- upvalues: v67 (copy), l_l_Players_0_PlayerByUserId_1 (copy)
            v67:_addPlayer(l_l_Players_0_PlayerByUserId_1.UserId);
        end));
        return;
    elseif not v67:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_1) then
        return;
    else
        local v70 = v13:Get(l_l_Players_0_PlayerByUserId_1, "PlayerStats"):expect();
        if not v67:_verifyPlayerAncestry(l_l_Players_0_PlayerByUserId_1) then
            return;
        elseif v19 and v19.Data.Players[tostring(v68)] then
            return;
        else
            local v71 = v67.template:Clone();
            v71.Name = v68;
            v71.LayoutOrder = 1;
            if v19 and v19.Data.OutgoingRequests and v19.Data.OutgoingRequests[v68] then
                v71.LayoutOrder = 2;
            end;
            local l_Content_1 = v71.Content;
            local l_Icon_1 = l_Content_1.Icon;
            local l_Info_1 = l_Content_1.Info;
            local l_Status_1 = l_Info_1.Status;
            local l_Invite_0 = l_Info_1.Invite;
            v71.Parent = v67.playerList;
            v67.noPlayersLabel.Visible = false;
            local v77 = v67.openDumpster:Extend();
            v67._buttons[tostring(v68)] = l_Invite_0;
            v77:Add(function() --[[ Line: 474 ]]
                -- upvalues: v67 (copy), v68 (copy)
                v67._buttons[tostring(v68)] = nil;
            end);
            v77:AttachTo(v71);
            v77:Add(function() --[[ Line: 480 ]]
                -- upvalues: l_Players_0 (ref), v67 (copy)
                if #l_Players_0:GetPlayers() < 2 then
                    v67.noPlayersLabel.Visible = true;
                end;
            end);
            l_Icon_1.Icon.Image = string.format(v7.PLAYER_IMAGE_URL, l_l_Players_0_PlayerByUserId_1.UserId);
            l_Info_1.DisplayName.Text = l_l_Players_0_PlayerByUserId_1.DisplayName;
            l_Info_1.Username.Text = ("@%*"):format(l_l_Players_0_PlayerByUserId_1.Name);
            l_Status_1.Verified.Visible = l_l_Players_0_PlayerByUserId_1.HasVerifiedBadge;
            l_Status_1.Friend.Visible = false;
            v77:AddPromise(v6(v2.Player, l_l_Players_0_PlayerByUserId_1):andThen(function(v78) --[[ Line: 492 ]]
                -- upvalues: l_Status_1 (copy)
                l_Status_1.Friend.Visible = v78;
            end));
            l_Icon_1.PlayerLevel.Prestige.Image = v5:GetPrestigeIcon(v70.Prestige, v70.Level) or "";
            l_Icon_1.PlayerLevel.Prestige.Visible = v70.Prestige >= 1;
            l_Icon_1.PlayerLevel.PlayerLevel.Text = ("LVL %*"):format(v70.Level);
            l_Icon_1.PlayerLevel.Visible = true;
            if v19 and v19.Data.OutgoingRequests and v19.Data.OutgoingRequests[v68] then
                l_Invite_0.Pending.Visible = true;
            else
                l_Invite_0.Pending.Visible = false;
            end;
            v12:HandleButton(l_Invite_0, function() --[[ Line: 507 ]]
                -- upvalues: v14 (ref), l_l_Players_0_PlayerByUserId_1 (copy), l_Invite_0 (copy)
                v14:SendPartyInvite(l_l_Players_0_PlayerByUserId_1):andThen(function(v79) --[[ Line: 508 ]]
                    -- upvalues: l_Invite_0 (ref)
                    if v79 then
                        l_Invite_0.Pending.Visible = true;
                    end;
                end);
            end);
            return;
        end;
    end;
end;
v17._verifyPlayerAncestry = function(_, v81) --[[ Line: 516 ]] --[[ Name: _verifyPlayerAncestry ]]
    return (v81 and v81.Parent) ~= nil;
end;
return v17;