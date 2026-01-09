local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v8 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.Shime);
local v10 = require(l_ReplicatedStorage_0.DailyRewards);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v15 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v17 = require(v4.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local l_RESET_HOURS_0 = v12.DAILY_LOGIN.RESET_HOURS;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    _dayButtons = {}, 
    _rarityVisualObjects = {}, 
    Init = function(v29, v30, v31) --[[ Line: 62 ]] --[[ Name: Init ]]
        -- upvalues: v18 (ref), v4 (copy), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v25 (ref), v5 (copy)
        v18 = v4.GetController("UIController");
        v19 = v4.GetController("DataController");
        v20 = v4.GetService("PlaytimeService");
        v21 = v4.GetService("SessionService");
        v22 = v4.GetController("NPEController");
        v23 = v4.GetController("AudioController");
        v24 = v4.GetController("DeviceTypeController");
        v25 = v4.GetService("DataService");
        v29.currentMode = v31;
        v29.ui = v30;
        v29.main = v30.Main;
        v29.exitBtn = v29.main.Exit;
        v29.content = v29.main.Content;
        v29.smallRewards = v29.content.SmallRewards;
        v29.grandReward = v29.content.GrandReward;
        v29.contentPaid = v29.main.ContentPaid;
        v29.smallRewardsPaid = v29.contentPaid.SmallRewards;
        v29.grandRewardPaid = v29.contentPaid.GrandReward;
        v29.claimAllButton = v30.ClaimAll;
        v29.dumpster = v5.new();
    end, 
    Start = function(v32) --[[ Line: 91 ]] --[[ Name: Start ]]
        -- upvalues: v18 (ref), v26 (ref), v27 (ref), l_RESET_HOURS_0 (copy), v19 (ref), v4 (copy), v20 (ref), v7 (copy)
        v32.hudUI = v18:GetScreenGuiAsync("HUD"):expect();
        v26 = v18:GetModuleAsync("HUD"):expect();
        v27 = v18:GetModuleAsync("Notification"):expect();
        v18:HandleButton(v32.exitBtn, function() --[[ Line: 96 ]]
            -- upvalues: v18 (ref)
            v18:Toggle(script.Name, false);
        end);
        v32:_connectDayButtons();
        v32:_connectPaidDayButtons();
        v32:_renderRewards();
        local function v34(v33) --[[ Line: 104 ]] --[[ Name: updateDailyRewards ]]
            -- upvalues: v32 (copy), l_RESET_HOURS_0 (ref)
            v32._loginData = v33;
            v32._timeUntilRefresh = math.floor((v33.lastLogin or os.time()) + l_RESET_HOURS_0 * 3600 - DateTime.now().UnixTimestamp);
            v32:_updateDayFrames();
        end;
        v32._loginData = v19:Get(v4.Player, "DailyRewards"):expect();
        local l__loginData_0 = v32._loginData;
        v32._loginData = l__loginData_0;
        v32._timeUntilRefresh = math.floor((l__loginData_0.lastLogin or os.time()) + l_RESET_HOURS_0 * 3600 - DateTime.now().UnixTimestamp);
        v32:_updateDayFrames();
        v19:OnChanged(v4.Player, "DailyRewards", v34);
        for _, v37 in v32.ui.Type:GetChildren() do
            if v37:IsA("GuiButton") then
                v18:HandleButton(v37, function() --[[ Line: 123 ]]
                    -- upvalues: v37 (copy), v32 (copy)
                    if v37.Name == "Daily" then
                        v32.main.Title.TitleContainer.Title.Text = "Daily Rewards";
                        v32.contentPaid.Visible = false;
                        v32.content.Visible = true;
                        return;
                    else
                        if v37.Name == "Krew" then
                            v32.main.Title.TitleContainer.Title.Text = "Krew+ Rewards";
                            v32.contentPaid.Visible = true;
                            v32.content.Visible = false;
                        end;
                        return;
                    end;
                end);
            end;
        end;
        v18:HandleButton(v32.claimAllButton, function() --[[ Line: 136 ]]
            -- upvalues: v20 (ref), v18 (ref), v27 (ref)
            v20:ClaimAllDailyRewards():andThen(function(v38) --[[ Line: 137 ]]
                -- upvalues: v18 (ref), v27 (ref)
                v18:Toggle(script.Name, false);
                if not v38 then
                    v27:Notify({
                        message = "Something went wrong, unable to claim rewards", 
                        isPositive = false, 
                        duration = 4
                    });
                    return;
                else
                    v27:Notify({
                        message = "Daily rewards successfully claimed!", 
                        isPositive = true, 
                        duration = 3
                    });
                    return;
                end;
            end);
        end);
        v7.Simple(1, function() --[[ Line: 159 ]]
            -- upvalues: v32 (copy)
            if v32._timeUntilRefresh < 1 then
                return;
            else
                local l_v32_0 = v32;
                l_v32_0._timeUntilRefresh = l_v32_0._timeUntilRefresh - 1;
                return;
            end;
        end, true);
    end, 
    Opened = function(v40) --[[ Line: 168 ]] --[[ Name: Opened ]]
        -- upvalues: v26 (ref), v9 (copy)
        v40:SelectAvailableDay();
        v26:ToggleBottomLobbyFrame(false);
        local v41 = v9.new(v40.claimAllButton.Content, 1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, nil, nil, 0.5);
        v40.dumpster:Add(v41);
        v41:Play();
    end, 
    Closing = function(_) --[[ Line: 184 ]] --[[ Name: Closing ]]
        -- upvalues: v26 (ref)
        v26:ToggleBottomLobbyFrame(true);
    end, 
    Closed = function(v43) --[[ Line: 188 ]] --[[ Name: Closed ]]
        v43.dumpster:Destroy();
    end, 
    OnJoin = function(v44) --[[ Line: 192 ]] --[[ Name: OnJoin ]]
        -- upvalues: v8 (copy), v25 (ref)
        if v8.Custom(function() --[[ Line: 193 ]]
            -- upvalues: v25 (ref)
            return v25.SessionLoadCount:Get();
        end):expect() < 2 then
            return false;
        else
            return v8.Custom(function() --[[ Line: 201 ]]
                -- upvalues: v44 (copy)
                return v44._canClaimSomething;
            end):expect();
        end;
    end, 
    SelectAvailableDay = function(v45) --[[ Line: 208 ]] --[[ Name: SelectAvailableDay ]]
        -- upvalues: v24 (ref), l_GuiService_0 (copy)
        if not v24:IsConsole() then
            return;
        elseif not v45._loginData then
            return;
        else
            local l_streak_0 = v45._loginData.streak;
            local l_rewards_0 = v45._loginData.rewards;
            for v48, v49 in v45._dayButtons do
                if not l_rewards_0[v48] and l_streak_0 >= v48 then
                    l_GuiService_0.SelectedObject = v49;
                    return;
                end;
            end;
            return;
        end;
    end, 
    _connectDayButtons = function(v50) --[[ Line: 234 ]] --[[ Name: _connectDayButtons ]]
        -- upvalues: v6 (copy), v18 (ref), v20 (ref), v23 (ref)
        for _, v52 in v6.Extend(v50.smallRewards:GetChildren(), v50.grandReward:GetChildren()) do
            if v52:IsA("GuiButton") then
                local v53 = string.match(v52.Name, "%d+");
                v53 = v53 and tonumber(v53);
                if not v53 then
                    --[[ close >= 6 ]]
                else
                    v50._dayButtons[v53] = v52;
                    v52:SetAttribute("InvertClick", true);
                    do
                        local l_v53_0 = v53;
                        v18:HandleButton(v52, function() --[[ Line: 250 ]]
                            -- upvalues: v50 (copy), l_v53_0 (ref), v20 (ref), v23 (ref)
                            if not v50:_canClaimReward(l_v53_0) then
                                return;
                            else
                                v20:ClaimDailyReward(l_v53_0):andThen(function(v55) --[[ Line: 256 ]]
                                    -- upvalues: v23 (ref)
                                    if not v55 then
                                        return;
                                    else
                                        v23:PlaySound({
                                            name = "UI.DailyReward", 
                                            soundGroup = "Master.SFX.UI"
                                        });
                                        return;
                                    end;
                                end);
                                return;
                            end;
                        end);
                    end;
                end;
            end;
        end;
    end, 
    _connectPaidDayButtons = function(v56) --[[ Line: 270 ]] --[[ Name: _connectPaidDayButtons ]]
        -- upvalues: v6 (copy), v18 (ref), v20 (ref), v23 (ref)
        v56._paidDayButtons = {};
        for _, v58 in v6.Extend(v56.smallRewardsPaid:GetChildren(), v56.grandRewardPaid:GetChildren()) do
            if v58:IsA("GuiButton") then
                local v59 = string.match(v58.Name, "%d+");
                v59 = v59 and tonumber(v59);
                if not v59 then
                    --[[ close >= 6 ]]
                else
                    v56._paidDayButtons[v59] = v58;
                    v58:SetAttribute("InvertClick", true);
                    do
                        local l_v59_0 = v59;
                        v18:HandleButton(v58, function() --[[ Line: 288 ]]
                            -- upvalues: v56 (copy), l_v59_0 (ref), v20 (ref), v23 (ref)
                            if not v56:_canClaimReward(l_v59_0, true) then
                                return;
                            else
                                v20:ClaimDailyReward(l_v59_0, true):andThen(function(v61) --[[ Line: 294 ]]
                                    -- upvalues: v23 (ref)
                                    if not v61 then
                                        return;
                                    else
                                        v23:PlaySound({
                                            name = "UI.DailyReward", 
                                            soundGroup = "Master.SFX.UI"
                                        });
                                        return;
                                    end;
                                end);
                                return;
                            end;
                        end);
                    end;
                end;
            end;
        end;
    end, 
    _updateDayFrames = function(v62) --[[ Line: 308 ]] --[[ Name: _updateDayFrames ]]
        local v63 = false;
        local function v72(v64) --[[ Line: 311 ]] --[[ Name: update ]]
            -- upvalues: v62 (copy), v63 (ref)
            local l_streak_1 = v62._loginData.streak;
            local l_rewards_1 = v62._loginData.rewards;
            local l__dayButtons_0 = v62._dayButtons;
            if v64 then
                l_streak_1 = v62._loginData.KrustyKrew and v62._loginData.KrustyKrew.streak or 0;
                l_rewards_1 = v62._loginData.KrustyKrew and v62._loginData.KrustyKrew.rewards or {};
                l__dayButtons_0 = v62._paidDayButtons;
            end;
            for v68, v69 in l__dayButtons_0 do
                local v70 = l_streak_1 < v68;
                v69.Locked.Visible = v70;
                v69.Content.UIGradient.Enabled = v70;
                local l_Content_0 = v69.Content.Content;
                l_Content_0.Claimed.Visible = l_rewards_1[v68] or false;
                if v68 <= l_streak_1 and not l_rewards_1[v68] then
                    v63 = true;
                    if l_Content_0:FindFirstChild("Available") then
                        l_Content_0.Available.Visible = true;
                    end;
                elseif l_Content_0:FindFirstChild("Available") then
                    l_Content_0.Available.Visible = false;
                end;
            end;
        end;
        v72(false);
        v72(true);
        v62._canClaimSomething = v63;
    end, 
    _renderRewards = function(v73) --[[ Line: 349 ]] --[[ Name: _renderRewards ]]
        -- upvalues: v10 (copy), v14 (copy), v16 (copy), v15 (copy), v17 (copy)
        local function v84(v74) --[[ Line: 350 ]] --[[ Name: render ]]
            -- upvalues: v10 (ref), v73 (copy), v14 (ref), v16 (ref), v15 (ref), v17 (ref)
            local v75 = if v74 then v10.Paid else v10.Free;
            local v76 = if v74 then v73._paidDayButtons else v73._dayButtons;
            for v77 = 1, #v75 do
                local v78 = v76[v77];
                local v79 = v75[v77];
                if v78 then
                    local l_Content_1 = v78.Content.Content;
                    local v81 = v79.Name or v79.name;
                    local v82 = v79.extraData and v79.extraData.Shiny or false;
                    local v83 = v79.extraData and v79.extraData.Wumbo or false;
                    l_Content_1.Shiny.Visible = v82;
                    l_Content_1.Wumbo.Visible = v83;
                    l_Content_1.Amount.Text = ("x%*"):format(v79.amount or 1);
                    l_Content_1.Mystery.Visible = v79.type == "RandomUnit";
                    if v79.type == "Unit" then
                        v14:SetImage(l_Content_1.Icon, v81);
                    elseif v79.type == "RandomUnit" then
                        v16(l_Content_1.Icon, v79.pool or v79.poolName, v79.rarity);
                    else
                        l_Content_1.Icon.Image = v15:GetIconFromRewardData(v79) or "";
                    end;
                    if v79.type ~= "RandomUnit" then
                        v17.new(v78, {
                            Name = v81, 
                            IsUnit = v79.type == "Unit"
                        });
                    end;
                end;
            end;
        end;
        v84(false);
        v84(true);
    end, 
    _canClaimReward = function(v85, v86, v87) --[[ Line: 404 ]] --[[ Name: _canClaimReward ]]
        if not v85._loginData then
            return false;
        elseif not v87 then
            return v86 <= v85._loginData.streak and (not v85._loginData.rewards[v86] or false);
        else
            local l_KrustyKrew_0 = v85._loginData.KrustyKrew;
            if not l_KrustyKrew_0 then
                return false;
            else
                return v86 <= l_KrustyKrew_0.streak and (not l_KrustyKrew_0.rewards[v86] or false);
            end;
        end;
    end
};