local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_UserService_0 = game:GetService("UserService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v14 = nil;
local v15 = utf8.char(57344);
return {
    primaryMenu = true, 
    blur = true, 
    Init = function(v16, v17, v18) --[[ Line: 42 ]] --[[ Name: Init ]]
        -- upvalues: v14 (ref), v6 (copy)
        v14 = v6.GetController("UIController");
        v16.currentMode = v18;
        v16.ui = v17;
        v16.main = v17.Main;
        v16.content = v16.main.Content;
        v16.exitBtn = v16.main.Exit;
        v16.loadout = v16.content.Loadout;
        v16.info = v16.content.Info;
        v16.searchBar = v16.content.SearchBar;
        v16.titlesBtn = v16.content.Titles;
        v16.playerIcon = v16.content.PlayerIcon;
        v16.playerName = v16.content.PlayerName;
        v16.playerDisplayName = v16.content.PlayerDisplayName;
        v16.playerLevel = v16.playerIcon.PlayerLevel;
    end, 
    Start = function(_) --[[ Line: 64 ]] --[[ Name: Start ]]
        -- upvalues: v14 (ref), v6 (copy)
    end, 
    LoadProfile = function(v20, v21) --[[ Line: 87 ]] --[[ Name: LoadProfile ]]
        -- upvalues: v6 (copy), v9 (copy), l_UserService_0 (copy), v15 (copy), v11 (copy)
        local v22 = v20:_getPlayerData(if v21:match("^%s*$") then v6.Player.Name else v21:match("^%s*(.-)%s*$"));
        local v23 = v22 and v22.data;
        local v24 = v22 and v22.userId;
        if not v23 then
            v20.searchBar.Text = "";
            v20.searchBar.PlaceholderText = "Player hasn't played!";
            task.delay(2, function() --[[ Line: 103 ]]
                -- upvalues: v20 (copy)
                v20.searchBar.PlaceholderText = "Search By Username";
            end);
            return;
        else
            v20.titlesBtn.Visible = v24 == v6.Player.UserId;
            v9.retryWithDelay(function() --[[ Line: 112 ]]
                -- upvalues: l_UserService_0 (ref), v24 (copy)
                return l_UserService_0:GetUserInfosByUserIdsAsync({
                    v24
                });
            end, 10, 1):andThen(function(v25) --[[ Line: 114 ]]
                -- upvalues: v20 (copy), v15 (ref)
                v25 = v25[1];
                v20.playerName.Text = v25.Username .. if v25.HasVerifiedBadge then v15 else "";
                v20.playerDisplayName.Text = ("@%*"):format(v25.DisplayName);
            end);
            v20.playerIcon.Image = string.format(v11.PLAYER_IMAGE_URL, v24);
            v20.playerLevel.Text = ("Lvl. %*"):format(v23.PlayerStats.Level or 1);
            for _, v27 in v20.info:GetChildren() do
                if v27:IsA("Frame") then
                    local v28 = v23[v27:GetAttribute("DataKey") or v27.Name] or 0;
                    v27.Value.Text = string.format("%03d", v28);
                end;
            end;
            return;
        end;
    end, 
    _getPlayerData = function(_, _) --[[ Line: 140 ]] --[[ Name: _getPlayerData ]]
        return nil;
    end
};