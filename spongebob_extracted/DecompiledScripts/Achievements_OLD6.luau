local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v6 = require(l_Shared_0.Util.PathUtil);
local v7 = require(l_Shared_0.Data.Achievements);
local v8 = require(l_Shared_0.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v10 = require(v2.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v12 = require(l_Shared_0.Util.DataUtils);
local v13 = require(l_Shared_0.Modules.WWSDebug);
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = {
    Content = {
        BackgroundColor3 = Color3.fromRGB(80, 85, 150)
    }, 
    ["Content.UIStroke"] = {
        Color = Color3.fromRGB(255, 199, 156)
    }, 
    ["Content.Info.Title"] = {
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }, 
    ["Content.Info.Progression"] = {
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }
};
local v21 = {
    Content = {
        BackgroundColor3 = Color3.fromRGB(19, 22, 48)
    }, 
    ["Content.UIStroke"] = {
        Color = Color3.fromRGB(19, 22, 48)
    }, 
    ["Content.Info.Title"] = {
        TextColor3 = Color3.fromRGB(80, 85, 150)
    }, 
    ["Content.Info.Progression"] = {
        TextColor3 = Color3.fromRGB(80, 85, 150)
    }
};
local v22 = {};
local v23 = {
    primaryMenu = true, 
    blur = true, 
    _worldButtons = {}, 
    _unitButtons = {}, 
    _worldFrames = {}, 
    _unitFrames = {}, 
    _achievementPages = {}, 
    _initialLayoutOrders = {}, 
    _frameInitialOrders = {}, 
    _claimsReady = {}, 
    _shownNotifiers = {}, 
    rgbHandler = v11.new()
};
local function v31(v24, v25) --[[ Line: 100 ]] --[[ Name: changeButtonProps ]]
    -- upvalues: v6 (copy)
    for v26, v27 in v25 do
        local v28 = v6(v24, v26);
        if v28 then
            for v29, v30 in v27 do
                v28[v29] = v30;
            end;
        end;
    end;
end;
local function _(v32, v33, v34) --[[ Line: 115 ]] --[[ Name: calculateInfiniteTier ]]
    if v32 < v33 then
        return 0;
    else
        return math.floor((v32 - v33) / v34) + 1;
    end;
end;
local function _(v36, v37) --[[ Line: 123 ]] --[[ Name: getInfiniteProgress ]]
    if v37.Infinite then
        local l_Value_0 = v36.Value;
        local l_RequiredValue_0 = v37.RequiredValue;
        local v40 = v37.Interval or 100;
        local v41 = l_Value_0 < l_RequiredValue_0 and 0 or math.floor((l_Value_0 - l_RequiredValue_0) / v40) + 1;
        l_Value_0 = v37.RequiredValue + v41 * v37.Interval;
        return (v36.Value - (l_Value_0 - v37.Interval)) / v37.Interval, v41, l_Value_0;
    else
        return v36.Value / v37.RequiredValue;
    end;
end;
v23.Init = function(v43, v44, v45) --[[ Line: 140 ]] --[[ Name: Init ]]
    -- upvalues: v14 (ref), v2 (copy), v15 (ref), v16 (ref), v17 (ref), v18 (ref)
    v14 = v2.GetController("UIController");
    v15 = v2.GetController("DataController");
    v16 = v2.GetService("ProgressionService");
    v17 = v2.GetController("AudioController");
    v18 = v2.GetController("DeviceTypeController");
    v43.currentMode = v45;
    v43.ui = v44;
    v43.main = v44.Main;
    v43.content = v43.main.Content;
    v43.exitBtn = v43.main.Exit;
    v43.leftFrame = v43.content.Left;
    v43.rightFrame = v43.content.Right;
    v43.pageLayout = v43.rightFrame.UIPageLayout;
    v43.achievementTemplate = v43.rightFrame.PageTemplate.Template:Clone();
    v43.rightFrame.PageTemplate.Template:Destroy();
    v43.pageTemplate = v43.rightFrame.PageTemplate:Clone();
    v43.achievementButtonTemplate = v43.leftFrame.Template:Clone();
    v43.achievementButtonTemplate:SetAttribute("InvertClick", true);
    v43.rightFrame.PageTemplate:Destroy();
    v43.leftFrame.Template:Destroy();
end;
v23.Start = function(v46) --[[ Line: 173 ]] --[[ Name: Start ]]
    -- upvalues: v19 (ref), v14 (ref), v31 (copy), v21 (copy), v7 (copy), v8 (copy), v22 (copy), v10 (copy), v16 (ref), v17 (ref), v20 (copy), v15 (ref), v2 (copy), v12 (copy), v13 (copy)
    v19 = v14:GetModuleAsync("HUD"):expect();
    v14:HandleButton(v46.exitBtn, function() --[[ Line: 176 ]]
        -- upvalues: v14 (ref)
        v14:Toggle(script.Name, false);
    end);
    v46._lastCategoryButton = nil;
    for _, v48 in v46.main.Categories:GetChildren() do
        if v48:IsA("GuiButton") then
            v31(v48, v21);
            v14:HandleButton(v48, function() --[[ Line: 189 ]]
                -- upvalues: v46 (copy), v48 (copy)
                v46:SetCategory(v48.Name);
                v48.Content.ClaimNotifier.Visible = false;
            end);
        end;
    end;
    for v49, v50 in v7:GetAchievements() do
        v46._achievementPages[v49] = {};
        for v51, v52 in v50 do
            local l_v7_MainReward_0 = v7:GetMainReward(v49, v51);
            l_v7_MainReward_0 = l_v7_MainReward_0 and l_v7_MainReward_0[1];
            local l_v8_IconFromRewardData_0 = v8:GetIconFromRewardData(l_v7_MainReward_0 or {});
            local l_v8_RewardRarity_0 = v8:GetRewardRarity(l_v7_MainReward_0 or {});
            local v56 = v46.pageTemplate:Clone();
            v56.Name = v51;
            v56.Visible = true;
            v56.Parent = v46.rightFrame;
            v56.Progress.RewardDisplay.Content.Icon.Image = l_v8_IconFromRewardData_0 or "";
            v56.Progress.RewardDisplay.Content.Amount.Text = ("x%*"):format(l_v7_MainReward_0.amount or 1);
            if l_v8_RewardRarity_0 then
                v46.rgbHandler:AddObject(v56.Progress.RewardDisplay.Content.Backdrop, l_v8_RewardRarity_0);
                v46.rgbHandler:AddObject(v56.Progress.RewardDisplay.Content.Glow, l_v8_RewardRarity_0);
            end;
            table.insert(v22, v10.new(v56.Progress.RewardDisplay, {
                Name = l_v7_MainReward_0.name or l_v7_MainReward_0.Name
            }));
            v14:HandleButton(v56.Progress.RewardDisplay);
            v56.Progress.Claim.Content.Disabled.Visible = true;
            v56.Progress.Title.Text = "Achievement progress 0%";
            v56.Progress.ProgressBar.Fill.Size = UDim2.fromScale(0, 1);
            v46._achievementPages[v49][v51] = v56;
            v14:HandleButton(v56.Progress.Claim, function() --[[ Line: 233 ]]
                -- upvalues: v46 (copy), v51 (copy), v16 (ref), v49 (copy), v17 (ref)
                if v46._claimedMainAchievements[v51] then
                    return;
                else
                    local v57, _ = v16:Claim("Achievements", {
                        Category = v49, 
                        Name = v51, 
                        MainPrize = true
                    }):await();
                    if v57 then
                        v17:PlaySound({
                            name = "UI.QuestAchievementReward", 
                            soundGroup = "Master.SFX.UI"
                        });
                    end;
                    return;
                end;
            end);
            local v59 = v46.achievementButtonTemplate:Clone();
            v59.Name = v51;
            v59.Content.Info.Title.Text = v52._displayName or v51;
            v59.Visible = true;
            v59.LayoutOrder = v52._order or 10;
            v46._initialLayoutOrders[v51] = v59.LayoutOrder;
            v59.Content.ClaimNotifier.Visible = false;
            v59.Parent = v46.leftFrame;
            if v49 == "Worlds" then
                v46._worldButtons[v51] = v59;
            else
                v46._unitButtons[v51] = v59;
            end;
            v31(v59, v21);
            v14:HandleButton(v59, function() --[[ Line: 273 ]]
                -- upvalues: v46 (copy), v31 (ref), v21 (ref), v59 (copy), v20 (ref), v49 (copy), v51 (copy)
                if v46._lastAchievementButton then
                    v31(v46._lastAchievementButton, v21);
                end;
                v46._lastAchievementButton = v59;
                v31(v59, v20);
                v46:SetAchievementPage(v49, v51);
                if v59.Content.ClaimNotifier.Visible then
                    v46._shownNotifiers[v59.Name] = true;
                    v59.Content.ClaimNotifier.Visible = false;
                end;
            end);
            for v60 = 1, #v52 do
                local v61 = v52[v60];
                if v61 then
                    local v62 = v46.achievementTemplate:Clone();
                    v62.Name = v61.Name;
                    v62.LayoutOrder = v60;
                    v62.Visible = true;
                    v62.Description.Text = v61.Description .. (" (0/%*)"):format(v61.RequiredValue);
                    v62.Title.Text = v61.DisplayName;
                    v62.Parent = v56;
                    v46._frameInitialOrders[v62] = v60;
                    local v63 = v61.Rewards[1];
                    if v63 then
                        v62.Claim.Content.Icon.Image = v8:GetIconFromRewardData(v63) or "";
                        v62.Claim.Content.Amount.Text = ("x%*"):format(v63.amount or 1);
                        local l_v8_RewardRarity_1 = v8:GetRewardRarity(v63);
                        if l_v8_RewardRarity_1 then
                            v46.rgbHandler:AddObject(v62.Claim.Content.Backdrop, l_v8_RewardRarity_1);
                            v46.rgbHandler:AddObject(v62.Claim.Content.Glow, l_v8_RewardRarity_1);
                        end;
                    end;
                    v62.Claim.Content.Locked.Visible = true;
                    v62.Claim.Content.ClaimNotifier.Visible = false;
                    table.insert(v22, v10.new(v62.Claim, {
                        Name = v63.name or v63.Name
                    }));
                    v14:HandleButton(v62.Claim, function() --[[ Line: 329 ]]
                        -- upvalues: v46 (copy), v16 (ref), v49 (copy), v61 (copy), v51 (copy), v17 (ref)
                        if v46._messagePrompt then
                            return;
                        elseif v16:Claim("Achievements", {
                            Category = v49, 
                            Name = v61.Name, 
                            SubCategory = v51
                        }):await() then
                            v17:PlaySound({
                                name = "UI.QuestAchievementReward", 
                                soundGroup = "Master.SFX.UI"
                            });
                            return;
                        else
                            return;
                        end;
                    end);
                end;
            end;
        end;
    end;
    if not v15:IsProfileActive() then
        v2.Player:GetAttributeChangedSignal("DATA_LOADED"):Wait();
    end;
    v46._achievements = v16:RetrieveInitialData("Achievements"):expect();
    v46._claimedMainAchievements = v15:Get(v2.Player, "AchievementCategoryClaims"):expect();
    v46._playerStats = v15:Get(v2.Player, "PlayerStats"):expect();
    v15:OnChanged(v2.Player, "PlayerStats", function(v65) --[[ Line: 363 ]]
        -- upvalues: v46 (copy)
        v46._playerStats = v65;
    end);
    v16.InformProgressionUpdates:Connect(function(_, v67) --[[ Line: 367 ]]
        -- upvalues: v12 (ref), v46 (copy), v13 (ref)
        if not v67 then
            return;
        else
            for v68, v69 in v67 do
                local v70 = v12:TryGetValueFromTablePath(v46._achievements, v68);
                if not v70 then
                    v13:Warn("Current achievement data not found for path", v68);
                else
                    for v71, v72 in v69 do
                        if v72 == "nil" then
                            v72 = nil;
                        end;
                        v70[v71] = v72;
                    end;
                end;
            end;
            v46:_updateAchievements();
            return;
        end;
    end);
    v15:OnChanged(v2.Player, "AchievementCategoryClaims", function(v73) --[[ Line: 393 ]]
        -- upvalues: v46 (copy)
        v46._claimedMainAchievements = v73;
        v46:_updateAchievements();
    end);
    v46:SetCategory("Worlds");
    v46:_updateAchievements();
end;
v23.Opening = function(v74) --[[ Line: 402 ]] --[[ Name: Opening ]]
    -- upvalues: v22 (copy)
    v74.rgbHandler:Enable();
    for _, v76 in v22 do
        v76.Enabled = true;
    end;
end;
v23.Opened = function(v77) --[[ Line: 410 ]] --[[ Name: Opened ]]
    -- upvalues: v19 (ref), v18 (ref), l_GuiService_0 (copy)
    v19:ToggleNotifier("Achievements", false);
    if v18:IsConsole() then
        l_GuiService_0:Select(v77.leftFrame);
    end;
end;
v23.Closed = function(v78) --[[ Line: 418 ]] --[[ Name: Closed ]]
    -- upvalues: v22 (copy)
    if v78._shownNotifiers then
        table.clear(v78._shownNotifiers);
    end;
    if v78._claimsReady then
        table.clear(v78._claimsReady);
    end;
    v78.rgbHandler:Disable();
    for _, v80 in v22 do
        v80.Enabled = false;
    end;
end;
v23.SetCategory = function(v81, v82) --[[ Line: 434 ]] --[[ Name: SetCategory ]]
    -- upvalues: v31 (copy), v21 (copy), v20 (copy)
    if v81._lastCategoryButton then
        v31(v81._lastCategoryButton, v21);
    end;
    v81._lastCategoryButton = v81.main.Categories:FindFirstChild(v82);
    if v81._lastCategoryButton then
        v31(v81._lastCategoryButton, v20);
    end;
    for _, v84 in v81._worldButtons do
        v84.Visible = false;
    end;
    for _, v86 in v81._unitButtons do
        v86.Visible = false;
    end;
    local v87 = {};
    v87 = if v82 == "Worlds" then v81._worldButtons else v81._unitButtons;
    local v88 = nil;
    local v89 = 1e999;
    for _, v91 in v87 do
        v91.Visible = true;
        if v91.LayoutOrder < v89 then
            v88 = v91;
            v89 = v91.LayoutOrder;
        end;
    end;
    if v88 then
        if v81._lastAchievementButton then
            v31(v81._lastAchievementButton, v21);
        end;
        v81._lastAchievementButton = v88;
        v31(v88, v20);
        v81:SetAchievementPage(v82, v88.Name);
    end;
end;
v23.SetAchievementPage = function(v92, v93, v94) --[[ Line: 492 ]] --[[ Name: SetAchievementPage ]]
    local v95 = v92._achievementPages[v93][v94];
    if not v95 then
        return;
    else
        v92.pageLayout:JumpTo(v95);
        return;
    end;
end;
v23._updateAchievements = function(v96) --[[ Line: 502 ]] --[[ Name: _updateAchievements ]]
    -- upvalues: v7 (copy), v19 (ref)
    if v96._claimsReady then
        table.clear(v96._claimsReady);
    end;
    for v97, v98 in v96._achievements do
        for v99, v100 in v98 do
            local v101 = v96._achievementPages[v97][v99];
            if v101 then
                local v102 = 0;
                local v103 = false;
                local v104 = nil;
                v104 = if v97 == "Worlds" then v96._worldButtons[v99] else v96._unitButtons[v99];
                for v105, v106 in v100 do
                    local l_v7_AchievementByName_0 = v7:GetAchievementByName(v97, v99, v105);
                    local v108 = v101 and v101:FindFirstChild(v105);
                    if v108 then
                        if v106.Finished and not v106.Claimed then
                            v103 = true;
                        end;
                        local l_Value_1 = v106.Value;
                        local l_RequiredValue_1 = l_v7_AchievementByName_0.RequiredValue;
                        local _ = math.clamp(l_Value_1 / l_RequiredValue_1, 0, 1);
                        v108.Description.Text = l_v7_AchievementByName_0.Description .. (" (%*/%*)"):format(l_Value_1, l_RequiredValue_1);
                        v108.Claimed.Visible = v106.Claimed;
                        v108.Claim.Content.Locked.Visible = not v106.Finished;
                        if v106.Claimed then
                            v108.LayoutOrder = 1000 + v96._frameInitialOrders[v108];
                            v108.Claim.Content.ClaimNotifier.Visible = false;
                        elseif v106.Finished then
                            if not v96._claimsReady[v97] then
                                v96._claimsReady[v97] = {};
                            end;
                            v96._claimsReady[v97][v99] = true;
                            v108.LayoutOrder = -1000 + v96._frameInitialOrders[v108];
                            v19:ToggleNotifier(script.Name, true);
                            v108.Claim.Content.ClaimNotifier.Visible = true;
                            if v104 then
                                v104.Content.ClaimNotifier.Visible = not v96._shownNotifiers[v104.Name];
                            end;
                        else
                            v108.LayoutOrder = v96._frameInitialOrders[v108] or 1;
                        end;
                        if v106.Finished then
                            v102 = v102 + 1;
                        end;
                    end;
                end;
                local v112 = math.clamp(v102 / #v7:GetAchievements(v97, v99, true), 0, 1);
                if v104 then
                    if v112 >= 1 and not v96._claimedMainAchievements[v99] then
                        v103 = true;
                        v19:ToggleNotifier(script.Name, v103);
                    end;
                    v104.Content.ClaimNotifier.Visible = v103;
                    v104.Content.Info.Progression.Text = ("Completion: %*%%"):format((math.floor(v112 * 100)));
                end;
                v101.Progress.ProgressBar.Fill.Size = UDim2.fromScale(v112, 1);
                v101.Progress.Claim.Content.Disabled.Visible = v112 < 1;
                v101.Progress.Title.Text = ("Achievement progress %*%%"):format((math.floor(v112 * 100)));
                v101.Progress.Claimed.Visible = v96._claimedMainAchievements[v99] or false;
            end;
        end;
    end;
    for _, v114 in v96.main.Categories:GetChildren() do
        if v114:IsA("GuiButton") then
            local v115 = if v114.Name == "Worlds" then v96._claimsReady.Worlds ~= nil else v96._claimsReady.Units ~= nil;
            v114.Content.ClaimNotifier.Visible = v115;
        end;
    end;
end;
return v23;