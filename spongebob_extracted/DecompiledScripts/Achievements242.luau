local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local _ = require(l_Shared_0.Util.PathUtil);
local _ = require(l_Shared_0.Util.GetButtons);
local v8 = require(l_Shared_0.Util.RandomUnitDisplay);
local v9 = require(l_Shared_0.Data.Variables);
local v10 = require(l_Shared_0.Data.Achievements);
local v11 = require(l_Shared_0.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v15 = require(v2.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v17 = require(l_Shared_0.Util.DataUtils);
local v18 = require(l_Shared_0.Modules.WWSDebug);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local _ = {
    Value = 0, 
    Finished = false, 
    Claimed = false
};
return {
    primaryMenu = true, 
    blur = true, 
    rgbHandler = v16.new(), 
    hoverTooltips = {}, 
    shownNotifiers = {}, 
    Init = function(v27, v28) --[[ Line: 65 ]] --[[ Name: Init ]]
        -- upvalues: v22 (ref), v2 (copy), v20 (ref), v21 (ref), v23 (ref), v24 (ref)
        v22 = v2.GetService("ProgressionService");
        v20 = v2.GetController("DataController");
        v21 = v2.GetController("UIController");
        v23 = v2.GetController("AudioController");
        v24 = v2.GetController("DeviceTypeController");
        v27.ui = v28;
        v27.main = v28.Main;
        v27.content = v27.main.Content;
        v27.exitBtn = v27.main.Exit;
        v27.leftFrame = v27.content.Left;
        v27.rightFrame = v27.content.Right;
        v27.pageLayout = v27.rightFrame.UIPageLayout;
        v27.pageTemplate = v27.rightFrame.PageTemplate:Clone();
        v27.rightFrame.PageTemplate:Destroy();
    end, 
    Start = function(v29, _) --[[ Line: 87 ]] --[[ Name: Start ]]
        -- upvalues: v25 (ref), v21 (ref), v22 (ref), v20 (ref), v2 (copy), v10 (copy), v9 (copy), v4 (copy), v17 (copy), v18 (copy)
        v25 = v21:GetModuleAsync("HUD"):expect();
        v29._achievements = v22:RetrieveInitialData("Achievements"):expect();
        v29._claimedMainAchievements = v20:Get(v2.Player, "AchievementCategoryClaims"):expect();
        v29.achievementFrames = {};
        v29.achievementPages = {};
        v29.achievementCategoryButtons = {};
        for v31, _ in v10:GetAchievements() do
            v29.achievementPages[v31] = {};
        end;
        for _, v34 in v29.leftFrame:GetChildren() do
            if v34:IsA("GuiButton") then
                local v35, v36 = table.unpack(string.split(v34.Name, "_"));
                if v9.RARITIES_FROM_NAME[v36] or v36 == "Limited" then
                    v29.rgbHandler:AddObject(v34.Content.Info.Emblem, v36);
                end;
                if not v29.achievementCategoryButtons[v35] then
                    v29.achievementCategoryButtons[v35] = {};
                end;
                if not v29.achievementCategoryButtons[v35][v36] then
                    v29.achievementCategoryButtons[v35][v36] = v34;
                end;
                local l_v10_DisplayName_0 = v10:GetDisplayName(v35, v36);
                if l_v10_DisplayName_0 then
                    v34.Content.Info.Details.Title.Text = l_v10_DisplayName_0;
                end;
                v34.Content.Claimed.Visible = false;
                v34.Content.ClaimNotifier.Visible = false;
                v34.Content.Disabled.Visible = false;
                local l_Disabled_0 = v34.Content.Disabled;
                l_Disabled_0.ZIndex = l_Disabled_0.ZIndex + 1;
                v29:_createAchievementPage(v35, v36);
                v21:HandleButton(v34, function() --[[ Line: 138 ]]
                    -- upvalues: v29 (copy), v35 (copy), v36 (copy)
                    v29:SetPage(v35, v36);
                end);
            end;
        end;
        v21:HandleButton(v29.exitBtn, function() --[[ Line: 146 ]]
            -- upvalues: v21 (ref)
            v21:Toggle(script.Name, false);
        end);
        v29:SetPage("Worlds", "ConchStreet");
        v22.InformProgressionUpdates:Connect(function(_, v40) --[[ Line: 153 ]]
            -- upvalues: v4 (ref), v17 (ref), v29 (copy), v18 (ref)
            if not v40 or #v4.Keys(v40) < 1 then
                return;
            else
                for v41, v42 in v40 do
                    local v43 = v17:TryGetValueFromTablePath(v29._achievements, v41);
                    if not v43 then
                        v18:Warn("Current achievement data not found for path", v41);
                    else
                        for v44, v45 in v42 do
                            if v45 == "nil" then
                                v45 = nil;
                            end;
                            v43[v44] = v45;
                        end;
                    end;
                end;
                v29:_updateAchievements();
                return;
            end;
        end);
        v20:OnChanged(v2.Player, "AchievementCategoryClaims", function(v46) --[[ Line: 179 ]]
            -- upvalues: v29 (copy)
            v29._claimedMainAchievements = v46;
            v29:_updateAchievements();
        end);
        v29:_updateAchievements();
    end, 
    Opening = function(v47) --[[ Line: 188 ]] --[[ Name: Opening ]]
        v47.rgbHandler:Enable();
        for _, v49 in v47.hoverTooltips do
            v49.Enabled = true;
        end;
    end, 
    Opened = function(v50) --[[ Line: 196 ]] --[[ Name: Opened ]]
        -- upvalues: v25 (ref), v24 (ref), l_GuiService_0 (copy)
        v25:ToggleNotifier("Achievements", false);
        if v24:IsConsole() then
            l_GuiService_0:Select(v50.leftFrame);
        end;
        if v50._pageName then
            v50:SetPage(v50._pageType, v50._pageName);
        end;
    end, 
    Closed = function(v51) --[[ Line: 208 ]] --[[ Name: Closed ]]
        v51.rgbHandler:Disable();
        for _, v53 in v51.hoverTooltips do
            v53.Enabled = false;
        end;
    end, 
    SetPage = function(v54, v55, v56) --[[ Line: 217 ]] --[[ Name: SetPage ]]
        -- upvalues: v21 (ref), v25 (ref)
        if not v55 or not v54.achievementPages[v55] then
            return;
        else
            local v57 = v54.achievementPages[v55][v56];
            if not v57 then
                return;
            else
                local v58 = ("%*_%*"):format(v55, v56);
                v54._pageType = v55;
                v54._pageName = v56;
                for _, v60 in v54.leftFrame:GetChildren() do
                    if v60:IsA("GuiButton") then
                        v60.Content.Disabled.Visible = v58 ~= v60.Name;
                        if v58 == v60.Name then
                            v60.Content.ClaimNotifier.Visible = false;
                        end;
                    end;
                end;
                local v61 = v54.achievementFrames[v55] and v54.achievementFrames[v55][v56];
                if v21:GetToggleState(script.Name) and v61 then
                    task.delay(1.7, function() --[[ Line: 249 ]]
                        -- upvalues: v61 (copy), v54 (copy), v55 (copy), v56 (copy)
                        local v62 = os.clock();
                        for v63, v64 in v61 do
                            if v64.Claim.Content.ClaimNotifier.Visible and v62 - (v54.shownNotifiers[v55][v56][v63] or 0) >= 1.7 then
                                v64.Claim.Content.ClaimNotifier.Visible = false;
                            end;
                        end;
                    end);
                end;
                if v21:GetToggleState(script.Name) then
                    v25:ToggleNotifier("Achievements", false);
                end;
                v57.CanvasPosition = Vector2.zero;
                v54.pageLayout:JumpTo(v57);
                return;
            end;
        end;
    end, 
    IsWorldAchievementCompleted = function(v65, v66) --[[ Line: 276 ]] --[[ Name: IsWorldAchievementCompleted ]]
        -- upvalues: v10 (copy)
        return (v65:_getAmountCompleted("Worlds", v66) or 0) >= (v10:GetTotalAchievements("Worlds", v66) or 0);
    end, 
    _createAchievementPage = function(v67, v68, v69) --[[ Line: 282 ]] --[[ Name: _createAchievementPage ]]
        -- upvalues: v10 (copy), v11 (copy), v19 (copy), l_ReplicatedStorage_0 (copy), v8 (copy), v14 (copy), v13 (copy), v15 (copy), v21 (ref), v22 (ref), v23 (ref)
        if not v68 or not v69 then
            return;
        elseif not v10:GetAchievements(v68, v69) then
            return;
        elseif not v67.achievementPages[v68] then
            return;
        else
            if not v67.achievementFrames[v68] then
                v67.achievementFrames[v68] = {};
            end;
            if not v67.achievementFrames[v68][v69] then
                v67.achievementFrames[v68][v69] = {};
            end;
            if not v67.shownNotifiers[v68] then
                v67.shownNotifiers[v68] = {};
            end;
            local v70 = v67.pageTemplate:Clone();
            v70.Name = v68 .. "_" .. v69;
            v70.Visible = true;
            v70.Parent = v67.rightFrame;
            v67.achievementPages[v68][v69] = v70;
            local v71 = v70.Template:Clone();
            v71.Claim.Content.ClaimNotifier.Visible = false;
            v71.Claim.Content.Locked.Visible = true;
            v70.Template:Destroy();
            v70.Progress.ProgressBar.Fill.Size = UDim2.fromScale(0, 1);
            local l_v10_MainReward_0 = v10:GetMainReward(v68, v69);
            l_v10_MainReward_0 = l_v10_MainReward_0 and l_v10_MainReward_0[1];
            if l_v10_MainReward_0 then
                local l_v11_IconFromRewardData_0 = v11:GetIconFromRewardData(l_v10_MainReward_0 or {});
                local l_v11_RewardRarity_0 = v11:GetRewardRarity(l_v10_MainReward_0 or {});
                v70.Progress.Visible = true;
                v70.Progress.RewardDisplay.Content.Mystery.Visible = l_v10_MainReward_0.type == "RandomUnit";
                if l_v10_MainReward_0.extraData then
                    v70.Progress.RewardDisplay.Content.Shiny.Visible = l_v10_MainReward_0.extraData.Shiny or false;
                    v70.Progress.RewardDisplay.Content.Wumbo.Visible = l_v10_MainReward_0.extraData.Wumbo or false;
                    local l_Stars_0 = v70.Progress.RewardDisplay.Content.Stars;
                    local v76 = true;
                    if l_v10_MainReward_0.extraData.Stars == nil then
                        v76 = false;
                    end;
                    l_Stars_0.Visible = v76;
                else
                    v70.Progress.RewardDisplay.Content.Shiny.Visible = false;
                    v70.Progress.RewardDisplay.Content.Wumbo.Visible = false;
                    v70.Progress.RewardDisplay.Content.Stars.Visible = false;
                end;
                if l_v10_MainReward_0.name and l_v10_MainReward_0.type and l_v10_MainReward_0.type == "Inventory" and v19:IsMount(l_v10_MainReward_0.name) then
                    l_ReplicatedStorage_0.GUI.MountIcon:Clone().Parent = v70.Progress.RewardDisplay.Content;
                end;
                if l_v10_MainReward_0.type == "RandomUnit" then
                    l_v11_RewardRarity_0 = l_v10_MainReward_0.rarity or l_v10_MainReward_0.Rarity;
                    v8(v70.Progress.RewardDisplay.Content.Icon, l_v10_MainReward_0.poolName or l_v10_MainReward_0.pool, l_v11_RewardRarity_0, 1, function() --[[ Line: 357 ]]
                        -- upvalues: v70 (copy)
                        v70.Progress.RewardDisplay.Content.Icon.Visible = false;
                    end);
                else
                    if l_v10_MainReward_0.type == "Unit" then
                        local v77 = select(2, v14:GetRarity(l_v10_MainReward_0.name));
                        v13.new(v70.Progress.RewardDisplay.Content, l_v10_MainReward_0.name, {
                            ImageColor3 = if v77 == "Secret" then Color3.new(0, 0, 0) else Color3.new(1, 1, 1)
                        });
                        v70.Progress.RewardDisplay.Content.Icon.Visible = false;
                        v70.Progress.RewardDisplay.Content.Backdrop:SetAttribute("Rarity", v77);
                        v70.Progress.RewardDisplay.Content.Backdrop:AddTag("VisualizeRarity");
                        v70.Progress.RewardDisplay.Content.Glow:SetAttribute("Rarity", v77);
                        v70.Progress.RewardDisplay.Content.Glow:AddTag("VisualizeRarity");
                    else
                        v70.Progress.RewardDisplay.Content.Icon.Image = l_v11_IconFromRewardData_0 or "";
                    end;
                    table.insert(v67.hoverTooltips, v15.new(v70.Progress.RewardDisplay, {
                        Name = l_v10_MainReward_0.name or l_v10_MainReward_0.Name, 
                        IsUnit = l_v10_MainReward_0.type == "Unit"
                    }));
                end;
                v70.Progress.RewardDisplay:SetAttribute("InvertClick", true);
                v21:HandleButton(v70.Progress.RewardDisplay);
                v70.Progress.RewardDisplay.Content.Amount.Text = ("x%*"):format(l_v10_MainReward_0.amount or 1);
                if l_v11_RewardRarity_0 then
                    v67.rgbHandler:AddObject(v70.Progress.RewardDisplay.Content.Backdrop, l_v11_RewardRarity_0);
                    v67.rgbHandler:AddObject(v70.Progress.RewardDisplay.Content.Glow, l_v11_RewardRarity_0);
                end;
                v70.Progress.Claim:SetAttribute("InvertClick", true);
                v21:HandleButton(v70.Progress.Claim, function() --[[ Line: 400 ]]
                    -- upvalues: v67 (copy), v69 (copy), v22 (ref), v68 (copy), v23 (ref)
                    if v67._claimedMainAchievements[v69] then
                        return;
                    else
                        local _, v79 = v22:Claim("Achievements", {
                            Category = v68, 
                            Name = v69, 
                            MainPrize = true
                        }):await();
                        if v79 == true then
                            v23:PlaySound({
                                name = "UI.QuestAchievementReward", 
                                soundGroup = "Master.SFX.UI"
                            });
                        end;
                        return;
                    end;
                end);
            else
                v70.Progress.Visible = false;
            end;
            local l_v10_Achievements_0 = v10:GetAchievements(v68, v69);
            if not l_v10_Achievements_0 then
                return;
            else
                for v81 = 1, #l_v10_Achievements_0 do
                    local v82 = l_v10_Achievements_0[v81];
                    if v82 then
                        local v83 = v71:Clone();
                        v83.Name = v82.Name;
                        v83.LayoutOrder = v81;
                        v83.Visible = true;
                        v83.Description.Text = v82.Description .. (" (0/%*)"):format(v82.RequiredValue);
                        v83.Title.Text = v82.DisplayName;
                        v83.Parent = v70;
                        local v84 = v82.Rewards[1];
                        if v84 then
                            v83.Claim.Content.Amount.Text = ("x%*"):format(v84.amount or 1);
                            local v85 = v84.Rarity or v84.rarity or v11:GetRewardRarity(v84);
                            if v84.type == "Unit" then
                                v85 = select(2, v14:GetRarity(v84.name)) or v85;
                                v13.new(v83.Claim.Content, v84.name, {
                                    ImageColor3 = if v85 == "Secret" then Color3.new(0, 0, 0) else Color3.new(1, 1, 1)
                                });
                                v83.Claim.Content.Icon.Visible = false;
                            else
                                v83.Claim.Content.Icon.Image = v11:GetIconFromRewardData(v84) or "";
                                v83.Claim.Content.Icon.Visible = true;
                            end;
                            if v85 then
                                v67.rgbHandler:AddObject(v83.Claim.Content.Backdrop, v85);
                                v67.rgbHandler:AddObject(v83.Claim.Content.Glow, v85);
                            end;
                            v83.Claim.Content.Mystery.Visible = v84.type == "RandomUnit";
                            if v84.name and v84.type and v84.type == "Inventory" and v19:IsMount(v84.name) then
                                l_ReplicatedStorage_0.GUI.MountIcon:Clone().Parent = v83.Claim.Content;
                            end;
                            if v84.extraData then
                                v83.Claim.Content.Shiny.Visible = v84.extraData.Shiny or false;
                                v83.Claim.Content.Wumbo.Visible = v84.extraData.Wumbo or false;
                            else
                                v83.Claim.Content.Shiny.Visible = false;
                                v83.Claim.Content.Wumbo.Visible = false;
                            end;
                            if v84.type == "RandomUnit" then
                                v8(v83.Claim.Content.Icon, v84.poolName or v84.pool, v85, 1);
                            else
                                table.insert(v67.hoverTooltips, v15.new(v83.Claim, {
                                    Name = v84.name or v84.Name, 
                                    IsUnit = v84.type == "Unit"
                                }));
                            end;
                        end;
                        v83.Claim:SetAttribute("InvertClick", true);
                        v21:HandleButton(v83.Claim, function() --[[ Line: 508 ]]
                            -- upvalues: v22 (ref), v68 (copy), v82 (copy), v69 (copy), v23 (ref)
                            local _, v87 = v22:Claim("Achievements", {
                                Category = v68, 
                                Name = v82.Name, 
                                SubCategory = v69
                            }):await();
                            if v87 == true then
                                v23:PlaySound({
                                    name = "UI.QuestAchievementReward", 
                                    soundGroup = "Master.SFX.UI"
                                });
                                return;
                            else
                                return;
                            end;
                        end);
                        v67.achievementFrames[v68][v69][v82.Name] = v83;
                    end;
                end;
                v71 = nil;
                return;
            end;
        end;
    end, 
    _getAmountCompleted = function(v88, v89, v90) --[[ Line: 531 ]] --[[ Name: _getAmountCompleted ]]
        -- upvalues: v10 (copy)
        local v91 = 0;
        if not v89 or not v90 then
            return v91;
        elseif not v88._achievements or not v88._achievements[v89] or not v88._achievements[v89][v90] then
            return v91;
        else
            for v92, v93 in v88._achievements[v89][v90] do
                if v10:GetAchievementByName(v89, v90, v92) then
                    if v93.Claimed then
                        v91 = v91 + 1;
                    elseif v93.Finished then
                        v91 = v91 + 1;
                    end;
                end;
            end;
            return v91;
        end;
    end, 
    _updateAchievements = function(v94) --[[ Line: 560 ]] --[[ Name: _updateAchievements ]]
        local v95 = v94._achievements or {};
        for v96, v97 in v95 do
            for v98, v99 in v97 do
                v94:_updateAchievementDisplay(v96, v98, v99);
            end;
        end;
    end, 
    _updateAchievementDisplay = function(v100, v101, v102, v103) --[[ Line: 569 ]] --[[ Name: _updateAchievementDisplay ]]
        -- upvalues: v10 (copy), v18 (copy), v11 (copy), v21 (ref), v25 (ref)
        local v104 = v100.achievementPages[v101] and v100.achievementPages[v101][v102];
        local v105 = v100.achievementFrames[v101] and v100.achievementFrames[v101][v102];
        local v106 = v100.achievementCategoryButtons[v101][v102];
        if not v104 or not v105 or not v106 then
            return;
        else
            if not v100.shownNotifiers[v101][v102] then
                v100.shownNotifiers[v101][v102] = {};
            end;
            local v107 = v100:_getAmountCompleted(v101, v102);
            local v108 = v10:GetTotalAchievements(v101, v102) or 0;
            local v109 = math.clamp(v107 / v108, 0, 1);
            local v110 = v100._claimedMainAchievements[v102] or false;
            v106.Content.Info.Details.Completion.Text = ("%*%%"):format((math.floor(v109 * 100)));
            v106.Content.Claimed.Visible = v110;
            if v110 then
                v106.LayoutOrder = v106.LayoutOrder + 10000;
            end;
            v104.Progress.Title.Text = ("Achievement Progress: %*%%"):format((math.floor(v109 * 100)));
            v104.Progress.Claimed.Visible = v110;
            v104.Progress.Claim.Visible = not v110;
            v104.Progress.Claim.Content.Disabled.Visible = v107 < v108;
            if v110 then
                v104.Progress.ProgressBar.Fill.Size = UDim2.fromScale(1, 1);
            else
                v104.Progress.ProgressBar.Fill.Size = UDim2.fromScale(v109, 1);
            end;
            local v111 = false;
            for v112, v113 in v103 do
                local l_v10_AchievementByName_0 = v10:GetAchievementByName(v101, v102, v112);
                local v115 = v105[v112];
                if l_v10_AchievementByName_0 then
                    if not v115 then
                        v18:Warn("Missing achievement frame config for ", v101, v102, v112);
                    else
                        local v116 = l_v10_AchievementByName_0.RequiredValue or 0;
                        local v117 = v113.Value or 0;
                        local v118 = v113.Claimed or false;
                        local v119 = v113.Finished or false;
                        if v118 or v119 then
                            v119 = true;
                            v116 = v117;
                        end;
                        local v120 = (" (%*/%*)"):format(v11:CommaNumber(v117), (v11:CommaNumber(v116)));
                        v115.Description.Text = l_v10_AchievementByName_0.Description .. v120;
                        v115.Claimed.Visible = v118;
                        v115.Claim.Content.Locked.Visible = not v118 and not v119;
                        if v119 and not v118 and not v100.shownNotifiers[v101][v102][v112] then
                            v100.shownNotifiers[v101][v102][v112] = os.clock();
                            v115.Claim.Content.ClaimNotifier.Visible = true;
                            v111 = true;
                            if not v21:GetToggleState(script.Name) then
                                v25:ToggleNotifier("Achievements", true);
                            end;
                            task.delay(1.7, function() --[[ Line: 651 ]]
                                -- upvalues: v100 (copy), v102 (copy), v21 (ref), v115 (copy)
                                if v100._pageName == v102 and v21:GetToggleState(script.Name) then
                                    v115.Claim.Content.ClaimNotifier.Visible = false;
                                end;
                            end);
                        elseif v118 or not v119 then
                            v115.Claim.Content.ClaimNotifier.Visible = false;
                        end;
                        if v118 then
                            v115.LayoutOrder = v115.LayoutOrder + 1000;
                        elseif not v118 and v119 then
                            v115.LayoutOrder = v115.LayoutOrder - 1000;
                        end;
                    end;
                end;
            end;
            if v111 then
                v100.achievementCategoryButtons[v101][v102].Content.ClaimNotifier.Visible = true;
            end;
            return;
        end;
    end
};