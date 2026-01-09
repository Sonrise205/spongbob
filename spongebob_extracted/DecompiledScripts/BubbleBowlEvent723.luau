local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Tree);
local v7 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Quests);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v13 = require(l_ReplicatedStorage_0.Shared.Util.GetButtons);
local v14 = require(v4.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v15 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v17 = require(v4.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local _ = require(v4.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v19 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v20 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v21 = nil;
local v22 = nil;
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
local v33 = nil;
local v34 = {};
local v35 = {};
return {
    primaryMenu = true, 
    blur = true, 
    animatedModels = {}, 
    _pages = {}, 
    _pageButtonObjects = {}, 
    _rewardVisualizers = {}, 
    ToggleAll = {}, 
    PageChanged = v7.new(), 
    Init = function(v36, v37) --[[ Line: 77 ]] --[[ Name: Init ]]
        -- upvalues: v21 (ref), v4 (copy), v22 (ref), v23 (ref), v24 (ref), v25 (ref), v26 (ref), v27 (ref), v28 (ref), v6 (copy)
        v21 = v4.GetController("DataController");
        v22 = v4.GetController("UIController");
        v23 = v4.GetController("EventController");
        v24 = v4.GetService("ProgressionService");
        v25 = v4.GetService("EventService");
        v26 = v4.GetController("PurchaseController");
        v27 = v4.GetController("FastTravelController");
        v28 = v4.GetService("TimeService");
        v36.ui = v37;
        v36.main = v37.Main.Window;
        v36.content = v36.main.Content;
        v36.navBar = v36.content.Top.Buttons;
        v36.pagesBin = v36.content.Bin;
        v36.exitBtn = v36.main.Exit;
        v36.timerBar = v36.main.TimerBar;
        v36.titleFrame = v36.main.Title;
        local v38 = {
            "Content/UIGradient", 
            "Content/UIStroke", 
            "Content/Title/UIStroke"
        };
        v36.activeColors = {};
        v36.inactiveColors = {};
        for _, v40 in v38 do
            v36.activeColors[v40] = v6.Find(v36.navBar.Overview, v40).Color;
            v36.inactiveColors[v40] = v6.Find(v36.navBar.Collection, v40).Color;
        end;
    end, 
    Start = function(_, _) --[[ Line: 115 ]] --[[ Name: Start ]]
        -- upvalues: v29 (ref), v22 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v20 (copy), v4 (copy), v11 (copy), v34 (copy), v35 (copy), v23 (ref), v15 (copy), v13 (copy), v27 (ref)
    end, 
    Opening = function(_) --[[ Line: 218 ]] --[[ Name: Opening ]]

    end, 
    Opened = function(v44) --[[ Line: 246 ]] --[[ Name: Opened ]]
        if v44._rewardVisualizers then
            for _, v46 in v44._rewardVisualizers do
                v46:Render();
            end;
        end;
        local v47 = v44.bubbleRewardItems or {};
        for _, v49 in v47 do
            v49.Content.Backdrop:AddTag("VisualizeRarity");
            v49.Content.Glow:AddTag("VisualizeRarity");
        end;
    end, 
    Closed = function(v50) --[[ Line: 259 ]] --[[ Name: Closed ]]
        if v50._rewardVisualizers then
            for _, v52 in v50._rewardVisualizers do
                v52:ClearAll();
            end;
        end;
        local v53 = v50.bubbleRewardItems or {};
        for _, v55 in v53 do
            v55.Content.Backdrop:RemoveTag("VisualizeRarity");
            v55.Content.Glow:RemoveTag("VisualizeRarity");
        end;
        v50:SetPage("Overview");
    end, 
    SetPage = function(v56, v57) --[[ Line: 278 ]] --[[ Name: SetPage ]]
        -- upvalues: v22 (ref), v32 (ref), v6 (copy)
        if not v56._pages[v57] then
            return;
        else
            v56._currentPage = v57;
            for v58, v59 in v56._pageButtons do
                local v60 = if v58 == v57 then v56.activeColors else v56.inactiveColors;
                if v58 == v57 then
                    local l_v59_FirstChild_0 = v59:FindFirstChild("ClaimNotifier", true);
                    if v22:GetToggleState(script.Name) then
                        if l_v59_FirstChild_0 then
                            l_v59_FirstChild_0.Visible = false;
                        end;
                        v32.rightSide.Content.Event.Content.ClaimNotifier.Visible = false;
                    end;
                end;
                if not v56._pageButtonObjects[v58] then
                    v56._pageButtonObjects[v58] = {};
                end;
                for v62, v63 in v60 do
                    local v64 = v56._pageButtonObjects[v58][v62];
                    if not v64 then
                        v64 = v6.Find(v59, v62);
                        v56._pageButtonObjects[v58][v62] = v64;
                    end;
                    if v64 then
                        v64.Color = v63;
                    end;
                end;
            end;
            for v65, v66 in v56._pages do
                v66.Visible = v65 == v57;
            end;
            v56.PageChanged:Fire(v56._currentPage);
            return;
        end;
    end, 
    _initCollectionPage = function(v67) --[[ Line: 333 ]] --[[ Name: _initCollectionPage ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v19 (copy), v21 (ref), v4 (copy)
        local l_Main_0 = v67._pages.Collection.Main;
        local v69 = {};
        for _, v71 in l_Main_0:GetChildren() do
            if v71:IsA("Frame") and l_ReplicatedStorage_0.Models.Friendlies:FindFirstChild(v71.Name) then
                local _ = nil;
                local v73 = v19.new(v71, v71.Name, {
                    AnchorPoint = v71.ViewportFrame.AnchorPoint, 
                    Size = v71.ViewportFrame.Size, 
                    Position = v71.ViewportFrame.Position, 
                    ZIndex = v71.ViewportFrame.ZIndex, 
                    positionAttribute = "EventUIOffset"
                });
                v71.ViewportFrame.UIGradient.Parent = v73.viewHandler.viewport;
                v71.ViewportFrame:Destroy();
                v69[v71.Name] = v73.viewHandler.viewport;
            end;
        end;
        v21:OnChanged(v4.Player, "UnitsIndex", function(v74) --[[ Line: 385 ]] --[[ Name: updateLockedStates ]]
            -- upvalues: v69 (copy)
            for v75, v76 in v69 do
                v76.UIGradient.Enabled = v74.Index[v75] == nil;
            end;
        end, true);
    end, 
    _initQuestsPage = function(v77) --[[ Line: 394 ]] --[[ Name: _initQuestsPage ]]
        -- upvalues: v24 (ref), v34 (copy), v22 (ref), v29 (ref), v14 (copy), v12 (copy), v32 (ref), v5 (copy), v28 (ref), v16 (copy), v15 (copy), v23 (ref)
        local l_Main_1 = v77._pages.Quests.Main;
        local l_TimerBar_0 = l_Main_1.TimerBar;
        local l_Bin_0 = l_Main_1.Bin;
        local v81 = {};
        local v82 = v24:RetrieveInitialData("Quests"):expect();
        v82 = v82 and v82.BubbleBowl;
        local v83 = false;
        for _, v85 in l_Bin_0:GetChildren() do
            if v85:IsA("Frame") then
                local l_Name_0 = v85.Name;
                if v34[l_Name_0] then
                    v85.Content.ClaimNotifier.Visible = false;
                    v85.Content.Claimed.Visible = false;
                    v81[l_Name_0] = v85;
                    v22:HandleButton(v85.Content.Info.Claim, function() --[[ Line: 423 ]]
                        -- upvalues: v83 (ref), v82 (ref), l_Name_0 (copy), v24 (ref), v29 (ref)
                        if v83 then
                            return;
                        else
                            local v87 = v82 and v82[l_Name_0];
                            if not v87 or not v87.Finished or v87.Claimed then
                                return;
                            else
                                v83 = true;
                                v24:Claim("Quests", {
                                    Category = "BubbleBowl", 
                                    Name = l_Name_0
                                }):andThen(function(v88) --[[ Line: 439 ]]
                                    -- upvalues: v29 (ref)
                                    local v89 = v88 and "Quest claimed successfully!" or "Failed to claim quest!";
                                    v29:Notify({
                                        message = v89, 
                                        duration = 3, 
                                        isPositive = v88
                                    });
                                end):finally(function() --[[ Line: 447 ]]
                                    -- upvalues: v83 (ref)
                                    task.delay(0.25, function() --[[ Line: 448 ]]
                                        -- upvalues: v83 (ref)
                                        v83 = false;
                                    end);
                                end);
                                return;
                            end;
                        end;
                    end);
                end;
            end;
        end;
        local v90 = {};
        local function v106() --[[ Line: 457 ]] --[[ Name: updateQuests ]]
            -- upvalues: v22 (ref), v81 (copy), v34 (ref), v77 (copy), v14 (ref), v12 (ref), v82 (ref), v90 (copy), v32 (ref)
            local l_v22_ToggleState_0 = v22:GetToggleState(script.Name);
            local v92 = false;
            for v93, v94 in v81 do
                local v95 = v34[v93];
                if v95 then
                    if not v77._rewardVisualizers[v93] then
                        v77._rewardVisualizers[v93] = v14.new(v95.Rewards, {
                            Template = v94.Content.Reward, 
                            Parent = v94.Content, 
                            renderMethod = function(v96, v97) --[[ Line: 473 ]] --[[ Name: renderMethod ]]
                                -- upvalues: v12 (ref)
                                local l_v12_ByItemName_0 = v12:GetByItemName(v97.name);
                                if not l_v12_ByItemName_0 then
                                    return;
                                else
                                    local v99 = l_v12_ByItemName_0.icon or l_v12_ByItemName_0.Icon;
                                    if not v99 then
                                        return;
                                    else
                                        v96.Content.Icon.Image = v99;
                                        v96.Content.Amount.Text = ("x%*"):format(v97.amount or 1);
                                        return {
                                            v96.Content.Backdrop, 
                                            v96.Content.Glow
                                        };
                                    end;
                                end;
                            end
                        });
                        if l_v22_ToggleState_0 then
                            v77._rewardVisualizers[v93]:Render();
                        end;
                    end;
                    local v100 = v82 and v82[v93] or {
                        Value = 0, 
                        Finished = false, 
                        Claimed = false
                    };
                    local l_Claim_0 = v94.Content.Info.Claim;
                    local v102 = v100.Value or 0;
                    local v103 = v95.RequiredValue or 0;
                    l_Claim_0.Claimed.Visible = false;
                    l_Claim_0.NotCompleted.Amount.Text = ("%*/%*"):format(v102, v103);
                    l_Claim_0.NotCompleted.Fill.Size = UDim2.fromScale(math.clamp(v102 / v103, 0, 1), 1);
                    v94.Content.Info.Description.Text = string.gsub(v95.Description, "{x}", v103);
                    local v104 = v100.Finished or false;
                    local l_Claimed_0 = v100.Claimed;
                    l_Claim_0.Content.Visible = v104 and not l_Claimed_0;
                    l_Claim_0.NotCompleted.Visible = not v104;
                    if not v90[v93] and v104 and not l_Claimed_0 then
                        v90[v93] = os.clock();
                        v94.Content.ClaimNotifier.Visible = true;
                        task.delay(1.7, function() --[[ Line: 527 ]]
                            -- upvalues: v77 (ref), v22 (ref), v94 (copy)
                            if v77._currentPage == "Quests" and v22:GetToggleState(script.Name) then
                                v94.Content.ClaimNotifier.Visible = false;
                            end;
                        end);
                    end;
                    if l_Claimed_0 then
                        v94.Content.ClaimNotifier.Visible = false;
                        l_Claim_0.Visible = false;
                    end;
                    if v94.Content.ClaimNotifier.Visible then
                        v92 = true;
                    end;
                    v94.Content.Claimed.Visible = l_Claimed_0;
                end;
            end;
            if v77._currentPage ~= "Quests" then
                v77.navBar.Quests.ClaimNotifier.Visible = v92;
                v32.rightSide.Content.Event.Content.ClaimNotifier.Visible = v92;
                return;
            else
                if not v22:GetToggleState(script.Name) then
                    v77.navBar.Quests.ClaimNotifier.Visible = v92;
                    v32.rightSide.Content.Event.Content.ClaimNotifier.Visible = v92;
                end;
                return;
            end;
        end;
        v106();
        local v107 = v5.new();
        v107:Add(function() --[[ Line: 561 ]]
            -- upvalues: v107 (ref)
            v107 = nil;
        end);
        local l_InformProgressionUpdates_0 = v24.InformProgressionUpdates;
        v107:Add(l_InformProgressionUpdates_0:Connect(function(v109) --[[ Line: 565 ]]
            -- upvalues: v82 (ref), v106 (copy)
            if not v109 then
                return;
            else
                for v110, v111 in v109 do
                    local v112, v113 = table.unpack(string.split(v110, "."));
                    if v112 and v113 and v112 == "BubbleBowl" then
                        v82[v113] = v111;
                    end;
                end;
                v106();
                return;
            end;
        end));
        v77.PageChanged:Connect(function(v114) --[[ Line: 583 ]]
            -- upvalues: v81 (copy), v90 (copy)
            if v114 ~= "Quests" then
                return;
            else
                task.delay(1.7, function() --[[ Line: 588 ]]
                    -- upvalues: v81 (ref), v90 (ref)
                    local v115 = os.clock();
                    for v116, v117 in v81 do
                        if v117.Content.ClaimNotifier.Visible and v115 - (v90[v116] or 0) >= 1.7 then
                            v117.Content.ClaimNotifier.Visible = false;
                        end;
                    end;
                end);
                return;
            end;
        end);
        l_InformProgressionUpdates_0 = v28.NextDay;
        v107:Add(l_InformProgressionUpdates_0:Observe(function(v118) --[[ Line: 607 ]]
            -- upvalues: v77 (copy), v5 (ref), l_TimerBar_0 (copy), v16 (ref), v15 (ref)
            if not v118 then
                return;
            else
                if v77._dailyDump then
                    v77._dailyDump:Destroy();
                end;
                v77._dailyDump = v5.new();
                local v119 = math.floor((math.clamp(v118 - workspace:GetServerTimeNow(), 0, 1e999)));
                local v120 = math.clamp(1 - v119 / 86400, 0, 1);
                l_TimerBar_0.Bar.Fill.Size = UDim2.fromScale(v120, 1);
                v77._dailyDump:Add(v16.Simple(1, function() --[[ Line: 624 ]]
                    -- upvalues: v119 (ref), l_TimerBar_0 (ref), v15 (ref), v120 (ref)
                    v119 = v119 - 1;
                    l_TimerBar_0.Bar.Timer.Text = v15:FormatTimeFromSeconds(v119);
                    v120 = math.clamp(1 - v119 / 86400, 0, 1);
                    l_TimerBar_0.Bar.Fill.Size = UDim2.fromScale(v120, 1);
                end));
                v77._dailyDump:Add(function() --[[ Line: 632 ]]
                    -- upvalues: v77 (ref)
                    v77._dailyDump = nil;
                end);
                return;
            end;
        end));
        v23.EventEnded:Once(function() --[[ Line: 637 ]]
            -- upvalues: v107 (ref)
            if v107 then
                v107:Destroy();
            end;
        end);
    end, 
    _initShop = function(v121) --[[ Line: 644 ]] --[[ Name: _initShop ]]
        -- upvalues: v21 (ref), v4 (copy), v10 (copy), v15 (copy), v22 (ref), v30 (ref), v29 (ref), v31 (ref), v33 (ref), v17 (copy), v26 (ref)
        local l_Main_2 = v121._pages.Shop.Main;
        local l_Content_0 = l_Main_2.BubblePopper.Content;
        l_Content_0.TotalCurrency.Content.Amount.Text = "LOADING...";
        local v124 = 0;
        v21:OnChanged(v4.Player, ("Currency.%*"):format(v10.Currency), function(v125) --[[ Line: 655 ]]
            -- upvalues: l_Content_0 (copy), v15 (ref), v124 (ref)
            l_Content_0.TotalCurrency.Content.Amount.Text = v15:SuffixNumber(v125 or 0, true, 2);
            v124 = v125 or 0;
        end, true);
        v22:HandleButton(l_Content_0.Details, function() --[[ Line: 661 ]]
            -- upvalues: v30 (ref)
            v30:ShowDropChances("BubblePopper", script.Name);
        end);
        local v126 = v10.Shop[1].cost.amount or 0;
        l_Content_0.Options.Purchase.Content.Amount.Text = v126;
        v22:HandleButton(l_Content_0.Options.Purchase, function() --[[ Line: 668 ]]
            -- upvalues: v126 (copy), v124 (ref), v121 (copy), v29 (ref), v10 (ref), v31 (ref)
            local l_v126_0 = v126;
            local v128 = l_v126_0 <= v124;
            local v129 = math.floor(v124 / l_v126_0) or 0;
            if v121.purchaseRequestProcessing or not v128 or v129 < 1 then
                if not v128 or v129 < 1 then
                    v29:Notify({
                        text = ("You need %* more %* to purchase this!"):format(math.clamp(l_v126_0 - v124, 0, l_v126_0), v10.Currency), 
                        duration = 3, 
                        isPositive = false
                    });
                end;
                return;
            elseif v129 == 1 then
                v121:_attemptPurchaseGift(1, v129);
                return;
            else
                v31:Prompt({
                    message = "How many would you like to purchase?", 
                    maxAmount = v129, 
                    maxMessage = "You can buy a maximum of %s Bubble Capsules.", 
                    shopInfo = {
                        baseCost = l_v126_0, 
                        currencyName = v10.Currency
                    }, 
                    callback = function(v130) --[[ Line: 698 ]] --[[ Name: callback ]]
                        -- upvalues: v121 (ref), v129 (copy)
                        v121:_attemptPurchaseGift(v130, v129);
                    end
                });
                return;
            end;
        end);
        v22:HandleButton(l_Main_2.Products.MoreOffers.Main.OpenShop, function() --[[ Line: 704 ]]
            -- upvalues: v33 (ref)
            v33:OpenBubbleBowlOffers();
        end);
        local l_Rewards_0 = l_Content_0.Rewards;
        v121.bubbleRewardItems = {};
        for _, v133 in l_Rewards_0:GetChildren() do
            if v133:IsA("Frame") then
                local v134 = v133:GetAttribute("IsUnit") or false;
                local l_Name_1 = v133.Name;
                v17.new(v133, {
                    Name = l_Name_1, 
                    IsUnit = v134
                });
                table.insert(v121.bubbleRewardItems, v133);
            end;
        end;
        for _, v137 in l_Main_2:GetDescendants() do
            if v137:IsA("GuiButton") and v137.Name == "Buy" then
                local l_v137_Attribute_0 = v137:GetAttribute("PurchaseType");
                local l_v137_Attribute_1 = v137:GetAttribute("PurchaseName");
                local l_v137_Attribute_2 = v137:GetAttribute("OwnedDataKey");
                if not l_v137_Attribute_0 or not l_v137_Attribute_1 then
                    warn("no type or name", l_v137_Attribute_0, l_v137_Attribute_1, v137:GetFullName());
                else
                    local l_Product_0 = Enum.InfoType.Product;
                    local v142 = false;
                    do
                        local l_v142_0 = v142;
                        if l_v137_Attribute_0 == "Gamepasses" then
                            l_Product_0 = Enum.InfoType.GamePass;
                            v137.Owned.Visible = false;
                            v137.Content.Visible = true;
                            v26:ListenToGamepassOwned(v4.Player, l_v137_Attribute_1, function(v144) --[[ Line: 753 ]]
                                -- upvalues: v137 (copy), l_v142_0 (ref)
                                v137.Owned.Visible = v144;
                                v137.Content.Visible = not v144;
                                l_v142_0 = v144;
                            end, true);
                        elseif l_v137_Attribute_0 == "DevProducts" and l_v137_Attribute_2 ~= nil then
                            v21:OnChanged(v4.Player, l_v137_Attribute_2, function(v145) --[[ Line: 759 ]]
                                -- upvalues: v137 (copy), l_v142_0 (ref)
                                v137.Owned.Visible = v145;
                                v137.Content.Visible = not v145;
                                l_v142_0 = v145;
                            end, true);
                        end;
                        v22:HandleButton(v137, function() --[[ Line: 766 ]]
                            -- upvalues: l_v142_0 (ref), l_v137_Attribute_0 (copy), v137 (copy), v121 (copy), v26 (ref), l_v137_Attribute_1 (copy)
                            if l_v142_0 then
                                return;
                            elseif l_v137_Attribute_0 == "DevProducts" then
                                if v137:HasTag("RNGShopItem") and v121.PaidItemsRestricted then
                                    return;
                                else
                                    v26:PromptProductPurchase(l_v137_Attribute_1);
                                    return;
                                end;
                            else
                                v26:PromptGamepassPurchase(l_v137_Attribute_1);
                                return;
                            end;
                        end);
                        v26:PromiseProductInfo(l_v137_Attribute_1, l_Product_0):andThen(function(v146) --[[ Line: 783 ]]
                            -- upvalues: v137 (copy)
                            v137.Content.Amount.Text = v146.PriceInRobux;
                        end);
                    end;
                end;
            end;
        end;
    end, 
    _attemptPurchaseGift = function(v147, v148, v149) --[[ Line: 789 ]] --[[ Name: _attemptPurchaseGift ]]
        -- upvalues: v25 (ref), v29 (ref)
        if not v148 or v148 < 1 or v149 < v148 then
            return;
        elseif v147.purchaseRequestProcessing then
            return;
        else
            v147.purchaseRequestProcessing = true;
            v25:PurchaseShopItem(1, v148):andThen(function(v150, v151) --[[ Line: 800 ]]
                -- upvalues: v29 (ref)
                if not v151 then
                    return;
                else
                    v29:Notify({
                        text = v151, 
                        duration = 3, 
                        isPositive = v150
                    });
                    return;
                end;
            end):finally(function() --[[ Line: 813 ]]
                -- upvalues: v147 (copy)
                task.delay(0.15, function() --[[ Line: 814 ]]
                    -- upvalues: v147 (ref)
                    v147.purchaseRequestProcessing = false;
                end);
            end);
            return;
        end;
    end, 
    _initChallengesPage = function(v152) --[[ Line: 820 ]] --[[ Name: _initChallengesPage ]]
        -- upvalues: v24 (ref), v35 (copy), v22 (ref), v29 (ref), v14 (copy), v12 (copy), v32 (ref), v5 (copy), v23 (ref)
        local l_Bin_1 = v152._pages.Challenges.Main.Bin;
        local v154 = {};
        local v155 = v24:RetrieveInitialData("Quests"):expect();
        v155 = v155 and v155.BubbleBowlChallenge;
        local v156 = false;
        for _, v158 in l_Bin_1:GetChildren() do
            if v158:IsA("Frame") then
                local l_Name_2 = v158.Name;
                if v35[l_Name_2] then
                    v158.Content.ClaimNotifier.Visible = false;
                    v158.Claimed.Visible = false;
                    v154[l_Name_2] = v158;
                    v22:HandleButton(v158.Claim, function() --[[ Line: 848 ]]
                        -- upvalues: v156 (ref), v155 (ref), l_Name_2 (copy), v24 (ref), v29 (ref)
                        if v156 then
                            return;
                        else
                            local v160 = v155 and v155[l_Name_2];
                            if not v160 or not v160.Finished or v160.Claimed then
                                return;
                            else
                                v156 = true;
                                v24:Claim("Quests", {
                                    Category = "BubbleBowlChallenge", 
                                    Name = l_Name_2
                                }):andThen(function(v161) --[[ Line: 864 ]]
                                    -- upvalues: v29 (ref)
                                    local v162 = v161 and "Challenge claimed successfully!" or "Failed to claim challenge!";
                                    v29:Notify({
                                        message = v162, 
                                        duration = 3, 
                                        isPositive = v161
                                    });
                                end):finally(function() --[[ Line: 872 ]]
                                    -- upvalues: v156 (ref)
                                    task.delay(0.25, function() --[[ Line: 873 ]]
                                        -- upvalues: v156 (ref)
                                        v156 = false;
                                    end);
                                end);
                                return;
                            end;
                        end;
                    end);
                end;
            end;
        end;
        local v163 = {};
        local function v179() --[[ Line: 882 ]] --[[ Name: updateQuests ]]
            -- upvalues: v22 (ref), v154 (copy), v35 (ref), v152 (copy), v14 (ref), v12 (ref), v155 (ref), v163 (copy), v32 (ref)
            local l_v22_ToggleState_1 = v22:GetToggleState(script.Name);
            local v165 = false;
            for v166, v167 in v154 do
                local v168 = v35[v166];
                if v168 then
                    if not v152._rewardVisualizers[v166] then
                        v152._rewardVisualizers[v166] = v14.new(v168.Rewards, {
                            Template = v167.Content.Rewards.Template, 
                            Parent = v167.Content.Rewards, 
                            renderMethod = function(v169, v170) --[[ Line: 898 ]] --[[ Name: renderMethod ]]
                                -- upvalues: v12 (ref)
                                local l_v12_ByItemName_1 = v12:GetByItemName(v170.name);
                                if not l_v12_ByItemName_1 then
                                    return;
                                else
                                    local v172 = l_v12_ByItemName_1.icon or l_v12_ByItemName_1.Icon;
                                    if not v172 then
                                        return;
                                    else
                                        v169.Content.Icon.Image = v172;
                                        v169.Content.Amount.Text = ("x%*"):format(v170.amount or 1);
                                        return {
                                            v169.Content.Backdrop, 
                                            v169.Content.Glow
                                        };
                                    end;
                                end;
                            end
                        });
                        if l_v22_ToggleState_1 then
                            v152._rewardVisualizers[v166]:Render();
                        end;
                    end;
                    local v173 = v155 and v155[v166] or {
                        Value = 0, 
                        Finished = false, 
                        Claimed = false
                    };
                    local l_Claim_1 = v167.Claim;
                    local v175 = v173.Value or 0;
                    local v176 = v168.RequiredValue or 0;
                    l_Claim_1.NotCompleted.Amount.Text = ("%*/%*"):format(v175, v176);
                    l_Claim_1.NotCompleted.Fill.Size = UDim2.fromScale(math.clamp(v175 / v176, 0, 1), 1);
                    v167.Content.Info.Description.Text = string.gsub(v168.Description, "{x}", v176);
                    v167.Content.Info.Title.Text = v168.DisplayName;
                    local v177 = v173.Finished or false;
                    local l_Claimed_1 = v173.Claimed;
                    l_Claim_1.Content.Visible = v177 and not l_Claimed_1;
                    l_Claim_1.NotCompleted.Visible = not v177;
                    if not v163[v166] and v177 and not l_Claimed_1 then
                        v163[v166] = os.clock();
                        v167.Content.ClaimNotifier.Visible = true;
                        task.delay(1.7, function() --[[ Line: 952 ]]
                            -- upvalues: v152 (ref), v22 (ref), v167 (copy)
                            if v152._currentPage == "Quests" and v22:GetToggleState(script.Name) then
                                v167.Content.ClaimNotifier.Visible = false;
                            end;
                        end);
                    end;
                    if l_Claimed_1 then
                        v167.Content.ClaimNotifier.Visible = false;
                        l_Claim_1.Visible = false;
                    end;
                    if v167.Content.ClaimNotifier.Visible then
                        v165 = true;
                    end;
                    v167.Claimed.Visible = l_Claimed_1;
                end;
            end;
            if v152._currentPage ~= "Challenges" then
                v152.navBar.Challenges.ClaimNotifier.Visible = v165;
                v32.rightSide.Content.Event.Content.ClaimNotifier.Visible = v165;
                return;
            else
                if not l_v22_ToggleState_1 then
                    v152.navBar.Challenges.ClaimNotifier.Visible = v165;
                    v32.rightSide.Content.Event.Content.ClaimNotifier.Visible = v165;
                end;
                return;
            end;
        end;
        v179();
        local v180 = v5.new();
        v180:Add(function() --[[ Line: 986 ]]
            -- upvalues: v180 (ref)
            v180 = nil;
        end);
        local l_InformProgressionUpdates_1 = v24.InformProgressionUpdates;
        v180:Add(l_InformProgressionUpdates_1:Connect(function(v182) --[[ Line: 990 ]]
            -- upvalues: v155 (ref), v179 (copy)
            if not v182 then
                return;
            else
                for v183, v184 in v182 do
                    local v185, v186 = table.unpack(string.split(v183, "."));
                    if v185 and v186 and v185 == "BubbleBowlChallenge" then
                        v155[v186] = v184;
                    end;
                end;
                v179();
                return;
            end;
        end));
        v152.PageChanged:Connect(function(v187) --[[ Line: 1008 ]]
            -- upvalues: v32 (ref), v154 (copy), v163 (copy)
            if v187 ~= "Challenges" then
                return;
            else
                v32.rightSide.Content.Event.Content.ClaimNotifier.Visible = false;
                task.delay(1.7, function() --[[ Line: 1015 ]]
                    -- upvalues: v154 (ref), v163 (ref)
                    local v188 = os.clock();
                    for v189, v190 in v154 do
                        if v190.Content.ClaimNotifier.Visible and v188 - (v163[v189] or 0) >= 1.7 then
                            v190.Content.ClaimNotifier.Visible = false;
                        end;
                    end;
                end);
                return;
            end;
        end);
        v23.EventEnded:Once(function() --[[ Line: 1034 ]]
            -- upvalues: v180 (ref)
            if v180 then
                v180:Destroy();
            end;
        end);
    end
};