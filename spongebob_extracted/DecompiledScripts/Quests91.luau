local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Tree);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Quests);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v13 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v15 = require(l_ReplicatedStorage_0.Shared.Util.DataUtils);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = {
    ["Content/UIGradient"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 255, 220)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 124, 222))
    }), 
    ["Content/UIStroke"] = Color3.fromRGB(16, 54, 94), 
    ["Content/Title/UIStroke"] = Color3.fromRGB(35, 56, 88)
};
local v26 = {
    ["Content/UIGradient"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(162, 187, 255)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(62, 82, 147))
    }), 
    ["Content/UIStroke"] = Color3.fromRGB(35, 56, 88), 
    ["Content/Title/UIStroke"] = Color3.fromRGB(35, 56, 88)
};
local v72 = {
    primaryMenu = true, 
    blur = true, 
    _questButtons = {
        All = {}
    }, 
    _claimsReady = {}, 
    _initialLayoutOrders = {}, 
    _shownNotifiers = {}, 
    _categoryButtons = {}, 
    rgbHandler = v14.new(), 
    Init = function(v27, v28) --[[ Line: 82 ]] --[[ Name: Init ]]
        -- upvalues: v17 (ref), v3 (copy), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref)
        v17 = v3.GetController("DataController");
        v18 = v3.GetController("UIController");
        v19 = v3.GetService("ProgressionService");
        v20 = v3.GetController("AudioController");
        v21 = v3.GetController("DeviceTypeController");
        v22 = v3.GetService("TimeService");
        v27.ui = v28;
        v27.main = v28.Main;
        v27.content = v27.main.Content;
        v27.topButtons = v27.content.Buttons;
        v27.info = v27.content.Info;
        v27.leftScroll = v27.content.Left;
        v27.rewardsFrame = v27.info.Rewards;
        v27.dailyTimer = v27.main.DailyRefreshTimer;
        v27.weeklyTimer = v27.main.WeeklyRefreshTimer;
        v27.template = v27.leftScroll.Template:Clone();
        v27.leftScroll.Template:Destroy();
    end, 
    Start = function(v29, _) --[[ Line: 107 ]] --[[ Name: Start ]]
        -- upvalues: v23 (ref), v18 (ref), v24 (ref), v8 (copy), v9 (copy), v20 (ref), v19 (ref), v6 (copy), v17 (ref), v3 (copy), v15 (copy), v16 (copy), v22 (ref), v4 (copy), l_TweenService_0 (copy), v11 (copy), v10 (copy)
        v23 = v18:GetModuleAsync("HUD"):expect();
        v24 = v18:GetModuleAsync("MessagePrompt"):expect();
        v18:HandleButton(v29.main.Exit, function() --[[ Line: 111 ]]
            -- upvalues: v18 (ref)
            v18:Toggle(script.Name, false);
        end);
        for v31, v32 in v8:GetQuests() do
            if not v32._hideFromUI then
                if not v29._questButtons[v31] then
                    v29._questButtons[v31] = {};
                end;
                for v33, v34 in v32 do
                    if typeof(v33) == "number" then
                        local v35 = v29.template:Clone();
                        v35.Name = v31 .. "_" .. v34.Name;
                        v35.Content.Info.Type.Text = v31;
                        v35.Content.Info.Title.Text = v34.DisplayName;
                        v35.Content.Info.Description.Text = v34.Description;
                        v35.Content.Info.Checkbox.BackgroundColor3 = v9.Solid.DeepPurple;
                        v35.LayoutOrder = v33;
                        v35.Parent = v29.leftScroll;
                        v18:HandleButton(v35, function() --[[ Line: 139 ]]
                            -- upvalues: v29 (copy), v9 (ref), v35 (copy), v31 (copy), v34 (copy)
                            if v29._lastQuestButton then
                                v29._lastQuestButton.Content.Info.Checkbox.BackgroundColor3 = v9.Solid.DeepPurple;
                            end;
                            v29._lastQuestButton = v35;
                            v35.Content.Info.Checkbox.BackgroundColor3 = v9.Solid.White;
                            if v35.Content.ClaimNotifier.Visible then
                                v29._shownNotifiers[v35.Name] = true;
                                v35.Content.ClaimNotifier.Visible = false;
                            end;
                            v29:SetQuest(v31, v34.Name);
                        end);
                        v29._initialLayoutOrders[v35] = v33;
                        table.insert(v29._questButtons[v31], v35);
                        table.insert(v29._questButtons.All, v35);
                    end;
                end;
            end;
        end;
        for _, v37 in v29.topButtons:GetChildren() do
            if v37:IsA("GuiButton") then
                local l_Name_0 = v37.Name;
                v18:HandleButton(v37, function() --[[ Line: 169 ]]
                    -- upvalues: l_Name_0 (copy), v18 (ref), v29 (copy)
                    if l_Name_0 == "Achievements" then
                        v18:Toggle("Achievements", true);
                        return;
                    else
                        v29:SetCategory(l_Name_0);
                        return;
                    end;
                end);
                if l_Name_0 ~= "Achievements" then
                    v29._categoryButtons[v37.Name] = v37;
                end;
            end;
        end;
        v18:HandleButton(v29.info.ClaimOptions.Claim, function() --[[ Line: 182 ]]
            -- upvalues: v29 (copy), v20 (ref), v24 (ref), v19 (ref)
            if not v29._currentQuestVisible then
                return;
            elseif not v29._currentQuestVisible.CanClaim then
                v20:PlaySound({
                    name = "UI.Error", 
                    soundGroup = "Master.SFX.UI"
                });
                v24:Prompt({
                    message = "You can't claim this quest!", 
                    options = {
                        {
                            text = "Ok"
                        }
                    }
                });
                return;
            else
                v19:Claim("Quests", {
                    Category = v29._currentQuestVisible.Type, 
                    Name = v29._currentQuestVisible.Name
                }):andThen(function(v39) --[[ Line: 209 ]]
                    -- upvalues: v20 (ref)
                    if not v39 then
                        return;
                    else
                        v20:PlaySound({
                            name = "UI.QuestAchievementReward", 
                            soundGroup = "Master.SFX.UI"
                        });
                        return;
                    end;
                end);
                return;
            end;
        end);
        v18:HandleButton(v29.info.ClaimOptions.ClaimAll, function() --[[ Line: 220 ]]
            -- upvalues: v29 (copy), v19 (ref), v24 (ref), v20 (ref)
            if not v29._currentQuestVisible then
                return;
            else
                v19:ClaimAllQuests(v29._category or "All"):andThen(function(v40) --[[ Line: 226 ]]
                    -- upvalues: v29 (ref), v24 (ref), v20 (ref)
                    if not v40 then
                        return;
                    else
                        local v41 = "Successfully claimed all quests!";
                        if v29._category ~= "All" then
                            v41 = ("Successfully claimed all %* quests!"):format(v29._category);
                        end;
                        v24:Prompt({
                            message = v41, 
                            options = {
                                {
                                    text = "Ok"
                                }
                            }
                        });
                        v20:PlaySound({
                            name = "UI.QuestAchievementReward", 
                            soundGroup = "Master.SFX.UI"
                        });
                        return;
                    end;
                end);
                return;
            end;
        end);
        local function v56(v42) --[[ Line: 251 ]] --[[ Name: updateQuests ]]
            -- upvalues: v29 (copy), v8 (ref), v6 (ref), v23 (ref)
            v29._myQuests = v42;
            v29.amountQuestsToClaim = {
                All = 0
            };
            for _, v44 in v29._questButtons.All do
                local v45, v46 = table.unpack(string.split(v44.Name, "_"));
                local v47 = v29._myQuests[v45] and v29._myQuests[v45][v46];
                local v48 = v47 and v47.Value or 0;
                local l_v8_QuestByName_0 = v8:GetQuestByName(v45, v46);
                local l_RequiredValue_0 = l_v8_QuestByName_0.RequiredValue;
                if not v29.amountQuestsToClaim[v45] then
                    v29.amountQuestsToClaim[v45] = 0;
                end;
                local v51 = false;
                if v47 and v47.Claimed then
                    v51 = true;
                    v44.LayoutOrder = 10000 + (v29._initialLayoutOrders[v44] or 0);
                    v44.Content.ClaimNotifier.Visible = false;
                    if v29._claimsReady[v45] and v29._claimsReady[v45][v46] then
                        v29._claimsReady[v45][v46] = nil;
                        if #v6.Keys(v29._claimsReady[v45]) < 1 then
                            v29._claimsReady[v45] = nil;
                        end;
                    end;
                elseif v47 and v47.Finished then
                    v44.LayoutOrder = -1000 - (v29._initialLayoutOrders[v44] or 0);
                    local l_amountQuestsToClaim_0 = v29.amountQuestsToClaim;
                    l_amountQuestsToClaim_0.All = l_amountQuestsToClaim_0.All + 1;
                    l_amountQuestsToClaim_0 = v29.amountQuestsToClaim;
                    l_amountQuestsToClaim_0[v45] = l_amountQuestsToClaim_0[v45] + 1;
                    if not v29._claimsReady[v45] then
                        v29._claimsReady[v45] = {};
                    end;
                    if v29._claimsReady[v45][v46] == nil then
                        v29._claimsReady[v45][v46] = true;
                        v23:ToggleNotifier(script.Name, true);
                    end;
                    if not v29._shownNotifiers[v44.Name] then
                        v29._shownNotifiers[v44.Name] = true;
                        v44.Content.ClaimNotifier.Visible = true;
                        v23:ToggleNotifier(script.Name, true);
                    end;
                else
                    v44.LayoutOrder = v29._initialLayoutOrders[v44] or 0;
                    v44.Content.ClaimNotifier.Visible = false;
                end;
                v44.Content.Claimed.Visible = v51;
                v44.Content.Info.Description.Text = l_v8_QuestByName_0.Description .. (" (%*/%*)"):format(v48, l_RequiredValue_0);
            end;
            for _, v54 in v29.topButtons:GetChildren() do
                if v54:IsA("GuiButton") then
                    local v55 = if v54.Name == "All" then next(v29._claimsReady) ~= nil else v29._claimsReady[v54.Name] ~= nil;
                    v54.Content.ClaimNotifier.Visible = v55;
                end;
            end;
            if v29._currentQuestVisible then
                v29:SetQuest(v29._currentQuestVisible.Type, v29._currentQuestVisible.Name, true);
            end;
            v29.info.ClaimOptions.ClaimAll.Visible = v29.amountQuestsToClaim[v29._category or "All"] >= 2;
        end;
        if not v17:IsProfileActive() then
            v3.Player:GetAttributeChangedSignal("DATA_LOADED"):Wait();
        end;
        v56((v19:RetrieveInitialData("Quests"):expect()));
        v19.InformProgressionUpdates:Connect(function(v57) --[[ Line: 339 ]]
            -- upvalues: v15 (ref), v29 (copy), v16 (ref), v56 (copy)
            if not v57 then
                return;
            else
                for v58, v59 in v57 do
                    local v60 = v15:TryGetValueFromTablePath(v29._myQuests, v58);
                    if not v60 then
                        v16:Warn("Current quest data not found for path", v58);
                    else
                        for v61, v62 in v59 do
                            if v62 == "nil" then
                                v62 = nil;
                            end;
                            v60[v61] = v62;
                        end;
                    end;
                end;
                v56(v29._myQuests);
                return;
            end;
        end);
        v22.NextDay:Observe(function(v63) --[[ Line: 399 ]]
            -- upvalues: v29 (copy), v4 (ref), l_TweenService_0 (ref), v11 (ref), v10 (ref)
            if not v63 then
                return;
            else
                if v29._dailyDump then
                    v29._dailyDump:Destroy();
                end;
                v29._dailyDump = v4.new();
                local v64 = math.floor((math.clamp(v63 - workspace:GetServerTimeNow(), 0, 1e999)));
                local v65 = l_TweenService_0:Create(v29.dailyTimer.Fill, TweenInfo.new(v64, Enum.EasingStyle.Linear), {
                    Size = UDim2.fromScale(1, 1)
                });
                local v66 = math.clamp(1 - v64 / 86400, 0, 1);
                v29.dailyTimer.Fill.Size = UDim2.fromScale(v66, 1);
                v29._dailyDump:Add(v11.Simple(1, function() --[[ Line: 421 ]]
                    -- upvalues: v64 (ref), v29 (ref), v10 (ref)
                    v64 = v64 - 1;
                    v29.dailyTimer.Timer.Text = v10:FormatTimeFromSeconds(v64);
                end));
                v65:Play();
                v29._dailyDump:Add(v65);
                return;
            end;
        end);
        v22.NextWeek:Observe(function(v67) --[[ Line: 430 ]]
            -- upvalues: v29 (copy), v4 (ref), l_TweenService_0 (ref), v11 (ref), v10 (ref)
            if not v67 then
                return;
            else
                if v29._weeklyDump then
                    v29._weeklyDump:Destroy();
                end;
                v29._weeklyDump = v4.new();
                local v68 = math.floor((math.clamp(v67 - workspace:GetServerTimeNow(), 0, 1e999)));
                local v69 = l_TweenService_0:Create(v29.weeklyTimer.Fill, TweenInfo.new(v68, Enum.EasingStyle.Linear), {
                    Size = UDim2.fromScale(1, 1)
                });
                local v70 = math.clamp(1 - v68 / 604800, 0, 1);
                v29.weeklyTimer.Fill.Size = UDim2.fromScale(v70, 1);
                v29._weeklyDump:Add(v11.Simple(1, function() --[[ Line: 453 ]]
                    -- upvalues: v68 (ref), v29 (ref), v10 (ref)
                    v68 = v68 - 1;
                    v29.weeklyTimer.Timer.Text = v10:FormatTimeFromSeconds(v68);
                end));
                v69:Play();
                v29._weeklyDump:Add(v69);
                return;
            end;
        end);
        v29:SetCategory("Daily");
        v23:ToggleNotifier(script.Name, false);
    end, 
    Opening = function(v71) --[[ Line: 466 ]] --[[ Name: Opening ]]
        v71.rgbHandler:Enable();
    end
};
v72.Opened = function(v73) --[[ Line: 470 ]] --[[ Name: Opened ]]
    -- upvalues: v72 (copy), v23 (ref)
    if v73._category then
        v72:SetCategory(v73._category, true);
    end;
    v23:ToggleNotifier("Quests", false);
    v23:ToggleBottomLobbyFrame(false);
end;
v72.Closed = function(v74) --[[ Line: 479 ]] --[[ Name: Closed ]]
    if v74._shownNotifiers then
        table.clear(v74._shownNotifiers);
    end;
    if v74._tooltip then
        v74._tooltip:Destroy();
    end;
    v74.rgbHandler:Disable();
end;
v72.Closing = function(_) --[[ Line: 491 ]] --[[ Name: Closing ]]
    -- upvalues: v23 (ref)
    v23:ToggleBottomLobbyFrame(true);
end;
v72.SetCategory = function(v76, v77, v78) --[[ Line: 496 ]] --[[ Name: SetCategory ]]
    -- upvalues: v26 (copy), v25 (copy), v5 (copy), v9 (copy), v21 (ref), l_GuiService_0 (copy)
    if not v78 and v76._category == v77 then
        return;
    else
        v76._category = v77;
        v76.info.ClaimOptions.ClaimAll.Visible = v76.amountQuestsToClaim[v76._category or "All"] >= 2;
        for v79, v80 in v76._categoryButtons do
            local l_v26_0 = v26;
            if v79 == v77 then
                l_v26_0 = v25;
            end;
            for v82, v83 in l_v26_0 do
                if v5.Exists(v80, v82) then
                    v5.Find(v80, v82).Color = v83;
                end;
            end;
        end;
        for _, v85 in v76._questButtons.All do
            v85.Visible = false;
        end;
        if not v76._questButtons[v77] then
            warn("Missing buttons for category:", v77);
            return;
        else
            local v86 = nil;
            local v87 = 1e999;
            for _, v89 in v76._questButtons[v77] do
                v89.Visible = true;
                if v89.LayoutOrder < v87 then
                    v87 = v89.LayoutOrder;
                    v86 = v89;
                end;
            end;
            if v86 then
                local v90, v91 = table.unpack(string.split(v86.Name, "_"));
                if v76._lastQuestButton then
                    v76._lastQuestButton.Content.Info.Checkbox.BackgroundColor3 = v9.Solid.DeepPurple;
                end;
                v76._lastQuestButton = v86;
                v86.Content.Info.Checkbox.BackgroundColor3 = v9.Solid.White;
                v76:SetQuest(v90, v91, false);
            end;
            if v76._lastQuestButton and v21:IsConsole() then
                l_GuiService_0.SelectedObject = v76._lastQuestButton;
            end;
            v76.leftScroll.CanvasPosition = Vector2.zero;
            return;
        end;
    end;
end;
v72.SetQuest = function(v92, v93, v94, v95) --[[ Line: 565 ]] --[[ Name: SetQuest ]]
    -- upvalues: v8 (copy), v4 (copy), v10 (copy), v13 (copy)
    if not v93 or not v94 then
        if v92._currentQuestVisible then
            v92._currentQuestVisible = nil;
        end;
        v92.info.Visible = false;
        return;
    else
        local v96 = v92._myQuests[v93] and v92._myQuests[v93][v94];
        local v97 = v96 and v96.Value or 0;
        local l_v8_QuestByName_1 = v8:GetQuestByName(v93, v94);
        local l_RequiredValue_1 = l_v8_QuestByName_1.RequiredValue;
        local v100 = false;
        local v101 = false;
        if v96 and v96.Claimed then
            v100 = false;
            v101 = true;
        elseif v96 and v96.Finished then
            v100 = true;
        end;
        v92._currentQuestVisible = {
            Type = v93, 
            Name = v94, 
            CanClaim = v100
        };
        v92.info.Title.Text = l_v8_QuestByName_1.DisplayName;
        v92.info.Description.Text = l_v8_QuestByName_1.Description .. (" (%*/%*)"):format(v97, l_RequiredValue_1);
        v92.info.Progress.Text = ("Progress: %*/%*"):format(v97, l_RequiredValue_1);
        v92.info.ClaimOptions.Claim.Content.Disabled.Visible = not v100;
        v92.info.ClaimOptions.Claim.Content.Title.Text = not v101 and "Claim" or "Claimed";
        if v95 then
            return;
        else
            if v92._visualDump then
                v92._visualDump:Destroy();
            end;
            v92._visualDump = v4.new();
            v92._visualDump:Add(function() --[[ Line: 617 ]]
                -- upvalues: v92 (copy)
                if v92._tooltip then
                    v92._tooltip:Destroy();
                end;
                v92._visualDump = nil;
            end);
            for _, v103 in v92.rewardsFrame:GetChildren() do
                if v103:IsA("GuiButton") then
                    v103.Visible = false;
                end;
            end;
            local v104 = 1;
            for _, v106 in l_v8_QuestByName_1.Rewards do
                if v106.type ~= "Experience" then
                    local l_FirstChild_0 = v92.rewardsFrame:FindFirstChild(v104);
                    if l_FirstChild_0 then
                        local l_v10_RewardRarity_0 = v10:GetRewardRarity(v106);
                        local l_l_FirstChild_0_Attribute_0 = l_FirstChild_0:GetAttribute("LastRarity");
                        if l_v10_RewardRarity_0 and l_v10_RewardRarity_0 ~= l_l_FirstChild_0_Attribute_0 then
                            if l_l_FirstChild_0_Attribute_0 ~= nil then
                                v92.rgbHandler:RemoveObject(l_FirstChild_0.Content.Backdrop);
                                v92.rgbHandler:RemoveObject(l_FirstChild_0.Content.Glow);
                            end;
                            v92.rgbHandler:AddObject(l_FirstChild_0.Content.Backdrop, l_v10_RewardRarity_0);
                            v92.rgbHandler:AddObject(l_FirstChild_0.Content.Glow, l_v10_RewardRarity_0);
                        end;
                        l_FirstChild_0:SetAttribute("LastRarity", l_v10_RewardRarity_0);
                        l_FirstChild_0.Content.Icon.Image = v10:GetIconFromRewardData(v106) or "";
                        l_FirstChild_0.Content.Amount.Text = ("x%*"):format(v106.amount or 1);
                        l_FirstChild_0.Visible = true;
                        v92._visualDump:Add(v13.new(l_FirstChild_0, {
                            Name = v106.name or v106.Name
                        }));
                        v104 = v104 + 1;
                    end;
                end;
            end;
            v92.info.Visible = true;
            return;
        end;
    end;
end;
return v72;