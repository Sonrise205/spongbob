local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.SeasonPass);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.SeasonPassUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v12 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v14 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.SummoningPools);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v20 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v21 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v22 = require(v3.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    rgbHandler = v20.new(), 
    _rewardFrames = {}, 
    _connectionDump = v4.new(), 
    SeasonLoaded = v6.new(), 
    Init = function(v33, v34) --[[ Line: 64 ]] --[[ Name: Init ]]
        -- upvalues: v23 (ref), v3 (copy), v24 (ref), v25 (ref), v26 (ref), v27 (ref), v28 (ref)
        v23 = v3.GetController("DataController");
        v24 = v3.GetController("UIController");
        v25 = v3.GetService("SeasonPassService");
        v26 = v3.GetController("PurchaseController");
        v27 = v3.GetController("AudioController");
        v28 = v3.GetController("DeviceTypeController");
        v33.ui = v34;
        v33.main = v34.Main;
        v33.exitBtn = v33.main.Exit;
        v33.shopFrame = v33.main.Shop;
        v33.refreshTimer = v33.main.RefreshTimer;
        v33.content = v33.main.Content;
        v33.progressionFrame = v33.content.Progression;
        v33.rewardsFrame = v33.content.Rewards;
        v33.rewardsBin = v33.rewardsFrame.Bin;
        v33.rewardTypes = v33.rewardsFrame.Left;
        v33.prestigePrompt = v33.content.PrestigePrompt;
        v33.prestigeBtn = v33.prestigePrompt.Prestige;
        v33.rewardTemplate = v33.rewardsBin.Template;
        v33.rewardTemplate.Parent = nil;
        v33.premiumNoticeFrame = v33.ui.PremiumUpgradeNotice;
        v33.premiumTemplate = v33.premiumNoticeFrame.Main.Bin.Template:Clone();
        v33.premiumNoticeFrame.Main.Bin.Template:Destroy();
    end, 
    Start = function(v35, _) --[[ Line: 97 ]] --[[ Name: Start ]]
        -- upvalues: v29 (ref), v24 (ref), v25 (ref), v27 (ref), v30 (ref), v9 (copy), v31 (ref), v32 (ref), v5 (copy)
        v29 = v24:GetModuleAsync("HUD"):expect();
        v24:HandleButton(v35.exitBtn, function() --[[ Line: 100 ]]
            -- upvalues: v24 (ref)
            v24:Toggle(script.Name, false);
        end);
        v24:HandleButton(v35.progressionFrame.ClaimAll, function() --[[ Line: 104 ]]
            -- upvalues: v35 (copy), v25 (ref), v27 (ref)
            if not v35._season then
                return;
            elseif not v35._seasonData then
                return;
            elseif v35._seasonData.Level < 1 then
                return;
            else
                v25:ClaimAll():andThen(function(v37) --[[ Line: 117 ]]
                    -- upvalues: v27 (ref)
                    if not v37 then
                        return;
                    else
                        v27:PlaySound({
                            name = "UI.BattlePassReward", 
                            soundGroup = "Master.SFX.UI"
                        });
                        return;
                    end;
                end);
                return;
            end;
        end);
        v35.SeasonLoaded:Connect(function() --[[ Line: 129 ]]
            -- upvalues: v35 (copy)
            v35:InitSeason();
        end);
        local function v39() --[[ Line: 133 ]] --[[ Name: handleSeasonChange ]]
            -- upvalues: v30 (ref), v9 (ref), v35 (copy), v31 (ref), v32 (ref), v5 (ref)
            v30 = v9:GetSeasonRewards(v35._season, "Free");
            v31 = v9:GetSeasonRewards(v35._season, "Premium");
            v32 = select(2, v5.Find(v30, function(v38) --[[ Line: 137 ]]
                return v38._isMaxLevel;
            end));
            v35.SeasonLoaded:Fire();
            v35.main.Title.TitleContainer.Title.Text = ("Season %* Pass"):format(v35._season);
        end;
        v35._season = v25.Season:OnReady():expect();
        v35._seasonStart = v25.SeasonStart:OnReady():expect();
        v35._seasonEnd = v25.SeasonEnd:OnReady():expect();
        v39();
        v25.Season.Changed:Connect(function(v40) --[[ Line: 153 ]]
            -- upvalues: v35 (copy), v39 (copy)
            v35._season = v40;
            v39();
        end);
        v25.SeasonStart.Changed:Connect(function(v41) --[[ Line: 158 ]]
            -- upvalues: v35 (copy)
            v35._seasonStart = v41;
            v35:_startSeasonCountdown();
        end);
        v25.SeasonEnd.Changed:Connect(function(v42) --[[ Line: 163 ]]
            -- upvalues: v35 (copy)
            v35._seasonEnd = v42;
            v35:_startSeasonCountdown();
        end);
        v25.PassActive:Observe(function(v43) --[[ Line: 168 ]]
            -- upvalues: v35 (copy)
            v35._seasonActive = v43 or false;
            v35.shopFrame.Visible = v43;
        end);
        v25.NotifyPremiumCompensation:Connect(function(v44) --[[ Line: 173 ]]
            -- upvalues: v35 (copy)
            v35:ShowPremiumNotification(v44);
        end);
        v35:_startSeasonCountdown();
        v35:_setupShop();
        v35.rewardTypes.Free.Background.UIStroke.Enabled = false;
        v35.rewardTypes.Premium.Background.UIStroke.Enabled = false;
        v35.rgbHandler:AddObject(v35.rewardTypes.Premium.Background, "Mythic");
        v35.rgbHandler:AddObject(v35.rewardTypes.Premium.Glow, "Mythic");
        v35.rgbHandler:AddObject(v35.progressionFrame.Level, "Mythic");
        v24:HandleButton(v35.prestigeBtn, function() --[[ Line: 190 ]]
            -- upvalues: v35 (copy), v32 (ref), v25 (ref)
            if not v35._seasonData then
                return;
            elseif v35._seasonData.Level < v32 then
                return;
            else
                v25:PrestigePass();
                return;
            end;
        end);
        v24:HandleButton(v35.premiumNoticeFrame.Main.BottomButtons.Ok, function() --[[ Line: 205 ]]
            -- upvalues: v35 (copy)
            if v35.premiumNoticeDump then
                v35.premiumNoticeDump:Destroy();
            end;
        end);
    end, 
    Opening = function(v45) --[[ Line: 212 ]] --[[ Name: Opening ]]
        -- upvalues: v29 (ref)
        v45.rewardsBin.CanvasPosition = Vector2.zero;
        v45:_updateClaimedRewards();
        local v46 = v45._seasonData.Level or 0;
        local v47 = nil;
        for v48 = 1, v46 do
            if not v45._seasonData.Claims.Free[v48] or v45._seasonData.HasPremium and not v45._seasonData.Claims.Premium[v48] then
                v47 = v48;
                break;
            end;
        end;
        local v49 = v47 or v46;
        local v50 = v45._rewardFrames[math.max(1, v49 - 3)];
        if v50 then
            v45.rewardsBin.CanvasPosition = Vector2.new(v50.AbsolutePosition.X - v45.rewardsBin.AbsolutePosition.X, 0);
        end;
        v29:ToggleNotifier(script.Name, false);
        v45.rgbHandler:Enable();
    end, 
    Opened = function(v51) --[[ Line: 242 ]] --[[ Name: Opened ]]
        -- upvalues: v28 (ref), l_GuiService_0 (copy), v29 (ref)
        if v28:IsConsole() then
            l_GuiService_0.SelectedObject = v51.progressionFrame.ClaimAll;
        end;
        v29:ToggleBottomLobbyFrame(false);
    end, 
    Closing = function(_) --[[ Line: 249 ]] --[[ Name: Closing ]]
        -- upvalues: v29 (ref)
        v29:ToggleBottomLobbyFrame(true);
    end, 
    Closed = function(v53) --[[ Line: 253 ]] --[[ Name: Closed ]]
        v53.rgbHandler:Disable();
    end, 
    InitSeason = function(v54) --[[ Line: 257 ]] --[[ Name: InitSeason ]]
        -- upvalues: v32 (ref), v30 (ref), v31 (ref), v23 (ref), v3 (copy), v9 (copy), v14 (copy), v24 (ref), v29 (ref)
        if v54._seasonInited then
            return;
        else
            v54._seasonInited = true;
            for v55 = 1, v32 do
                local v56 = v54.rewardTemplate:Clone();
                v56.Name = ("Level%*"):format(v55);
                v56.LayoutOrder = v55;
                v56.TitleBar.Level.Text = ("Level %*"):format(v55);
                v56.Visible = true;
                v56.Parent = v54.rewardsBin;
                local v57 = v30[v55];
                local v58 = v31[v55];
                v54:_generateReward(v56.Free, v57, v55);
                v54:_generateReward(v56.Premium, v58, v55, true);
                v54._rewardFrames[v55] = v56;
            end;
            local v59 = nil;
            local v60 = nil;
            v23:OnChanged(v3.Player, "SeasonPass", function(v61) --[[ Line: 285 ]]
                -- upvalues: v54 (copy), v9 (ref), v32 (ref), v14 (ref), v59 (ref), v60 (ref), v24 (ref), v29 (ref)
                v54._seasonData = v61;
                if not v54._seasonData then
                    v54._seasonData = {
                        Level = 0, 
                        XP = 0, 
                        Claims = {
                            Free = {}, 
                            Premium = {}
                        }, 
                        Season = v54._season, 
                        HasPremium = false
                    };
                end;
                local v62 = math.clamp(v54._seasonData.XP or 0, 0, v9:GetXPForLevel(v32, v54._seasonData.Prestige));
                local v63 = v54._seasonData.Level or 0;
                local v64 = v9:GetXPForLevel(v63, v54._seasonData.Prestige) or 0;
                local l_v9_XPForLevel_0 = v9:GetXPForLevel(math.clamp(v63 + 1, 1, v32), v54._seasonData.Prestige);
                local v66 = math.clamp((v62 - v64) / (l_v9_XPForLevel_0 - v64), 0, 1);
                local v67 = ("Level %*"):format(v63);
                if v32 <= v63 then
                    v67 = v67 .. " (MAX)";
                    v66 = 1;
                end;
                if v54._seasonData.Prestige and v54._seasonData.Prestige >= 1 then
                    v67 = v67 .. (" (%*)"):format((v14:IntToRoman(v54._seasonData.Prestige)));
                end;
                v54.progressionFrame.Level.Text = v67;
                v54.progressionFrame.XPCount.Text = ("%*/%*"):format(v62, l_v9_XPForLevel_0);
                v54.progressionFrame.XPBar.Fill.Size = UDim2.new(v66, 0, 1, 0);
                local v68 = nil;
                for v69 = 1, v63 do
                    if not v54._seasonData.Claims.Free[v69] or v54._seasonData.HasPremium and not v54._seasonData.Claims.Premium[v69] then
                        v68 = v69;
                        break;
                    end;
                end;
                local l_v9_MaxLevel_0 = v9:GetMaxLevel(v54._seasonData.Prestige, "Free", nil, v54._seasonData.HasPremium or false);
                if l_v9_MaxLevel_0 ~= v59 then
                    v59 = l_v9_MaxLevel_0;
                    v54.rewardsBin.CanvasPosition = Vector2.zero;
                    local l_FirstChild_0 = v54.rewardsBin:FindFirstChild((("Level%*"):format(v32)));
                    local l_v9_SeasonRewards_0 = v9:GetSeasonRewards(v54._season, "Free");
                    l_v9_SeasonRewards_0 = l_v9_SeasonRewards_0 and l_v9_SeasonRewards_0[l_v9_MaxLevel_0];
                    if l_FirstChild_0 then
                        v54:_generateReward(l_FirstChild_0.Free, l_v9_SeasonRewards_0, v32, true);
                    end;
                end;
                local l_v9_MaxLevel_1 = v9:GetMaxLevel(v54._seasonData.Prestige, "Premium", nil, v54._seasonData.HasPremium or false);
                if l_v9_MaxLevel_1 ~= v60 then
                    v60 = l_v9_MaxLevel_1;
                    v54.rewardsBin.CanvasPosition = Vector2.zero;
                    local l_FirstChild_1 = v54.rewardsBin:FindFirstChild((("Level%*"):format(v32)));
                    local l_v9_SeasonRewards_1 = v9:GetSeasonRewards(v54._season, "Premium");
                    l_v9_SeasonRewards_1 = l_v9_SeasonRewards_1 and l_v9_SeasonRewards_1[l_v9_MaxLevel_1];
                    if l_FirstChild_1 then
                        v54:_generateReward(l_FirstChild_1.Premium, l_v9_SeasonRewards_1, v32, true);
                    end;
                end;
                if v32 <= v63 then
                    local v76 = true;
                    for v77 = 1, v32 do
                        if not v54._seasonData.Claims.Free[v77] then
                            v76 = false;
                            break;
                        end;
                    end;
                    if v54._seasonData.HasPremium then
                        for v78 = 1, v32 do
                            if not v54._seasonData.Claims.Premium[v78] then
                                v76 = false;
                                break;
                            end;
                        end;
                    end;
                    v54.prestigePrompt.Visible = v76;
                else
                    v54.prestigePrompt.Visible = false;
                end;
                if v68 and not v24:GetToggleState(script.Name) then
                    v29:ToggleNotifier(script.Name, true);
                end;
                if v24:GetToggleState(script.Name) then
                    v54:_updateClaimedRewards();
                end;
            end, true);
            return;
        end;
    end, 
    ShowPremiumNotification = function(v79, v80) --[[ Line: 413 ]] --[[ Name: ShowPremiumNotification ]]
        -- upvalues: v4 (copy), v22 (copy), v16 (copy), v14 (copy), v24 (ref)
        if v79.premiumNoticeDump then
            v79.premiumNoticeDump:Destroy();
        end;
        v79.premiumNoticeDump = v4.new();
        v79.premiumNoticeDump:Add(function() --[[ Line: 420 ]]
            -- upvalues: v79 (copy)
            v79.premiumNoticeFrame.Visible = false;
            v79.main.Visible = true;
            v79.premiumNoticeDump = nil;
        end);
        v79.main.Visible = false;
        local _ = v79.premiumNoticeDump:Construct(v22, v80, {
            template = v79.premiumTemplate, 
            parent = v79.premiumNoticeFrame.Main.Bin, 
            renderMethod = function(v81, v82) --[[ Line: 432 ]] --[[ Name: renderMethod ]]
                -- upvalues: v16 (ref), v14 (ref)
                local v83 = v82.extraData and v82.extraData.Shiny or false;
                local v84 = v82.extraData and (v82.extraData.Wumbo or v82.extraData.Mega) or false;
                local v85 = v82.amount or 1;
                v81.Content.Mystery.Visible = false;
                v81.Content.Shiny.Visible = v83;
                v81.Content.Wumbo.Visible = v84;
                if v82.type == "Unit" then
                    v16:SetImage(v81.Content.Icon, v82.name);
                else
                    v81.Content.Icon.Image = v14:GetIconFromRewardData(v82) or "";
                end;
                if v85 >= 100000 then
                    v81.Content.Amount.Text = ("x%*"):format((v14:SuffixNumber(v85, true, 1)));
                else
                    v81.Content.Amount.Text = ("x%*"):format((v14:CommaNumber(v85 or 1)));
                end;
                return {
                    v81.Content.Backdrop, 
                    v81.Content.Glow
                };
            end
        });
        if #v80 > 6 then
            v79.premiumNoticeFrame.Main.Bin:SetAttribute("OriginalPaddingLeft", UDim2.new(25));
            v79.premiumNoticeFrame.Main.Bin.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left;
        else
            v79.premiumNoticeFrame.Main.Bin:SetAttribute("OriginalPaddingLeft", UDim2.new(0));
            v79.premiumNoticeFrame.Main.Bin.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        end;
        v79.premiumNoticeFrame.Visible = true;
        if not v24:GetToggleState(script.Name) then
            v24:Toggle(script.Name, true);
        end;
    end, 
    _generateReward = function(v87, v88, v89, v90, v91) --[[ Line: 475 ]] --[[ Name: _generateReward ]]
        -- upvalues: v11 (copy), v16 (copy), v19 (copy), v14 (copy), v12 (copy), v24 (ref), v26 (ref), v21 (copy), v25 (ref), v27 (ref)
        local v92 = (v91 and "Premium" or "Free") .. ("_%*"):format((tostring(v90)));
        if v87._connectionDump:Get(v92) then
            v87._connectionDump:Remove(v92);
        end;
        local l_Reward_0 = v88.Reward;
        v88.Locked.Visible = true;
        v88.Claimed.Visible = false;
        local v94 = nil;
        local v95 = nil;
        local v96 = v89.amount or 1;
        local v97 = v89.name or v89.Name;
        l_Reward_0.Content.Mystery.Visible = false;
        l_Reward_0.Content.Wumbo.Visible = false;
        l_Reward_0.Content.Shiny.Visible = false;
        if v89.type == "Unit" then
            local v98 = v89.extraData or {};
            v95 = select(2, v11:GetRarity(v97));
            v16:SetImage(l_Reward_0.Content.Icon, v89.name);
            l_Reward_0.Content.Wumbo.Visible = v98.Wumbo or false;
            l_Reward_0.Content.Shiny.Visible = v98.Shiny or false;
        elseif v89.type == "RandomUnit" then
            v95 = v89.rarity or v89.Rarity;
            local v99 = v89.extraData or {};
            v87.rgbHandler:RemoveObject(l_Reward_0.Content.Mystery);
            v87.rgbHandler:AddObject(l_Reward_0.Content.Mystery, v95);
            l_Reward_0.Content.Mystery.TextTransparency = 0.35;
            l_Reward_0.Content.Mystery.Visible = true;
            l_Reward_0.Content.Wumbo.Visible = v99.Wumbo or false;
            l_Reward_0.Content.Shiny.Visible = v99.Shiny or false;
            l_Reward_0.Content.Icon.Visible = true;
            v87._connectionDump:Add(v19(l_Reward_0.Content.Icon, v89.pool or v89.poolName, v95), v92);
        else
            v94 = v14:GetIconFromRewardData(v89);
            v95 = v14:GetRewardRarity(v89);
            l_Reward_0.Content.Icon.Image = v94 or "";
        end;
        l_Reward_0.Content.Amount.Text = ("x%*"):format(v96);
        if v95 then
            v87.rgbHandler:AddObject(l_Reward_0.Content.Backdrop, v95);
            v87.rgbHandler:AddObject(l_Reward_0.Content.Glow, v95);
        else
            warn("No rarity found for reward data:", v89, "!");
        end;
        local v100 = v91 and "Premium" or "Free";
        if v95 and v89.type ~= "RandomUnit" then
            v12.new(l_Reward_0, {
                Name = v97, 
                IsUnit = v89.type == "Unit"
            });
        end;
        v24:HandleButton(l_Reward_0, function() --[[ Line: 589 ]]
            -- upvalues: v87 (copy), v90 (copy), v100 (copy), v91 (copy), v26 (ref), v21 (ref), v25 (ref), v27 (ref)
            if not v87._seasonData then
                return;
            elseif v87._seasonData.Level < v90 then
                return;
            elseif v87._seasonData.Claims[v100][v90] then
                return;
            elseif v91 and not v87._seasonData.HasPremium then
                v26:PromptGamepassPurchase(v21.SEASON_PASS_NAME);
                return;
            else
                v25:Claim(v100, v90):andThen(function(v101) --[[ Line: 612 ]]
                    -- upvalues: v27 (ref)
                    if not v101 then
                        return;
                    else
                        v27:PlaySound({
                            name = "UI.BattlePassReward", 
                            soundGroup = "Master.SFX.UI"
                        });
                        return;
                    end;
                end);
                return;
            end;
        end);
    end, 
    _startSeasonCountdown = function(v102) --[[ Line: 625 ]] --[[ Name: _startSeasonCountdown ]]
        -- upvalues: v4 (copy), v17 (copy), v14 (copy)
        if v102._seasonCountdownDump then
            v102._seasonCountdownDump:Destroy();
        end;
        v102._seasonCountdownDump = v4.new();
        v102._seasonCountdownDump:Add(function() --[[ Line: 632 ]]
            -- upvalues: v102 (copy)
            v102._seasonCountdownDump = nil;
        end);
        local v103 = 0;
        local v104 = 0;
        local v105 = "Season Ends In";
        local v106 = true;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v108 = nil;
        if l_workspace_ServerTimeNow_0 < v102._seasonStart then
            v105 = "Season Starts In";
            v106 = false;
            v108 = v102._seasonStart;
            v103 = math.clamp(v102._seasonStart - l_workspace_ServerTimeNow_0, 0, 1e999);
            v104 = v103;
        else
            v108 = v102._seasonEnd;
            v103 = math.clamp(v102._seasonEnd - l_workspace_ServerTimeNow_0, 0, 1e999);
            v104 = v103;
        end;
        v102.refreshTimer.Title.Text = v105;
        v102._seasonCountdownDump:Add(v17.Simple(1, function() --[[ Line: 658 ]]
            -- upvalues: v103 (ref), v108 (ref), v102 (copy), v104 (ref), v106 (ref), v14 (ref)
            v103 = v103 - 1;
            local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
            local v110 = nil;
            if v108 == v102._seasonStart then
                local v111 = v102._seasonStart - (v102._seasonStart - v104);
                v110 = math.clamp((v104 - v103) / v111, 0, 1);
            else
                local v112 = v108 - v102._seasonStart;
                v110 = math.clamp((l_workspace_ServerTimeNow_1 - v102._seasonStart) / v112, 0, 1);
            end;
            v102.refreshTimer.Fill.Size = UDim2.fromScale(v110, 1);
            if v103 < 1 then
                if v106 then
                    v102.refreshTimer.Title.Text = "Season Ended";
                    v102.refreshTimer.Timer.Text = "";
                end;
                return;
            else
                v102.refreshTimer.Timer.Text = v14:FormatTimeFromSeconds(v103);
                return;
            end;
        end, true));
    end, 
    _updateClaimedRewards = function(v113) --[[ Line: 692 ]] --[[ Name: _updateClaimedRewards ]]
        for v114, v115 in v113._rewardFrames do
            local v116 = v113._seasonData.Claims.Free[v114] or false;
            local v117 = v113._seasonData.Claims.Premium[v114] or false;
            local v118 = v114 <= v113._seasonData.Level;
            v115.Free.Claimed.Visible = v116;
            v115.Free.Locked.Visible = not v116 and not v118;
            v115.Premium.Claimed.Visible = v117;
            v115.Premium.Locked.Visible = not v117 and not v118;
            if not v113._seasonData.HasPremium then
                v115.Premium.Claimed.Visible = false;
                v115.Premium.Locked.Visible = true;
            end;
        end;
    end, 
    _setupShop = function(v119) --[[ Line: 713 ]] --[[ Name: _setupShop ]]
        -- upvalues: v26 (ref), v3 (copy), v21 (copy), v23 (ref), v24 (ref)
        v26:ListenToGamepassOwned(v3.Player, v21.SEASON_PASS_NAME, function(v120) --[[ Line: 714 ]]
            -- upvalues: v119 (copy)
            v119.shopFrame.PassOptions.Visible = not v120;
            v119.shopFrame.PassGifts.Visible = v120;
        end, true);
        for _, v122 in v119.shopFrame:GetDescendants() do
            if v122:IsA("GuiButton") or v122.Name == "Buy" then
                local l_v122_Attribute_0 = v122:GetAttribute("PurchaseType");
                local l_v122_Attribute_1 = v122:GetAttribute("PurchaseName");
                local l_v122_Attribute_2 = v122:GetAttribute("OwnedDataKey");
                if l_v122_Attribute_0 and l_v122_Attribute_1 then
                    local l_Product_0 = Enum.InfoType.Product;
                    local v127 = false;
                    do
                        local l_v127_0 = v127;
                        if l_v122_Attribute_0 == "Gamepasses" then
                            l_Product_0 = Enum.InfoType.GamePass;
                            v122.Owned.Visible = false;
                            v122.Content.Visible = true;
                            v26:ListenToGamepassOwned(v3.Player, l_v122_Attribute_1, function(v129) --[[ Line: 741 ]]
                                -- upvalues: v122 (copy), l_v127_0 (ref)
                                v122.Owned.Visible = v129;
                                v122.Content.Visible = not v129;
                                l_v127_0 = v129;
                            end, true);
                        elseif l_v122_Attribute_0 == "DevProducts" and l_v122_Attribute_2 ~= nil then
                            v23:OnChanged(v3.Player, l_v122_Attribute_2, function(v130) --[[ Line: 747 ]]
                                -- upvalues: v122 (copy), l_v127_0 (ref)
                                v122.Owned.Visible = v130;
                                v122.Content.Visible = not v130;
                                l_v127_0 = v130;
                            end, true);
                        end;
                        v24:HandleButton(v122, function() --[[ Line: 754 ]]
                            -- upvalues: l_v127_0 (ref), l_v122_Attribute_0 (copy), v26 (ref), l_v122_Attribute_1 (copy)
                            if l_v127_0 then
                                return;
                            elseif l_v122_Attribute_0 == "DevProducts" then
                                v26:PromptProductPurchase(l_v122_Attribute_1);
                                return;
                            else
                                v26:PromptGamepassPurchase(l_v122_Attribute_1);
                                return;
                            end;
                        end);
                        v26:PromiseProductInfo(l_v122_Attribute_1, l_Product_0):andThen(function(v131) --[[ Line: 767 ]]
                            -- upvalues: v122 (copy)
                            v122.Content.Amount.Text = v131.PriceInRobux or "[FAILED TO LOAD]";
                        end);
                    end;
                end;
            end;
        end;
    end
};