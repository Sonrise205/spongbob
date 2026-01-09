local l_CollectionService_0 = game:GetService("CollectionService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local _ = game:GetService("AnalyticsService");
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v10 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v11 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local v13 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.UnlimitedPack);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.TreasurePack);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.SecretTreasurePack);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.BoostedSecretTreasurePack);
local v20 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v21 = require(v8.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v22 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v23 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v24 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v25 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v26 = require(l_ReplicatedStorage_0.Shared.Data.FoodShared);
local v27 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v28 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v29 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v30 = require(l_ReplicatedStorage_0.RNGRolls);
local v31 = require(l_ReplicatedStorage_0.Shared.Data.ChallengerCratePack);
local v32 = require(l_ReplicatedStorage_0.Shared.Data.GemsProgressionPack);
local v33 = require(l_ReplicatedStorage_0.Shared.Data.DNDCratePacks);
local v34 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v36 = require(v8.Player.PlayerScripts.Knit.Components.MenuZone);
local v37 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v38 = require(v8.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v39 = require(l_ReplicatedStorage_0.Shared.Data.ChestForeverPackJackpots);
local v40 = require(l_ReplicatedStorage_0.Shared.Data.ChestForeverPack);
local _ = require(l_ReplicatedStorage_0.TraitsData);
local v42 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v229 = {
    primaryMenu = true, 
    blur = true, 
    _spinObjects = {}, 
    rgbHandler = v25.new(), 
    rarityVisuals = {}, 
    ToggleAll = {}, 
    Init = function(v61, v62, _) --[[ Line: 102 ]] --[[ Name: Init ]]
        -- upvalues: v43 (ref), v8 (copy), v44 (ref), v45 (ref), v46 (ref), v47 (ref), v48 (ref), v49 (ref), v50 (ref), v51 (ref), v52 (ref), v53 (ref), v54 (ref), v55 (ref), v58 (ref), v36 (copy)
        v43 = v8.GetController("UIController");
        v44 = v8.GetController("DataController");
        v45 = v8.GetController("PurchaseController");
        v46 = v8.GetService("UnitService");
        v47 = v8.GetService("RewardService");
        v48 = v8.GetController("DeviceTypeController");
        v49 = v8.GetService("TreasureService");
        v50 = v8.GetController("AudioController");
        v51 = v8.GetService("SeasonPassService");
        v52 = v8.GetController("EventController");
        v53 = v8.GetService("AnalyticReportService");
        v54 = v8.GetController("VideoAdController");
        v55 = v8.GetController("KrustyKrewController");
        v58 = v8.GetService("LimitedUnitService");
        v61.ui = v62;
        v61.main = v62.Main;
        v61.exitBtn = v61.main.Exit;
        v61.content = v61.main.Content;
        v61.bin = v61.content.Bin;
        for _, v65 in v61.ui:GetDescendants() do
            local l_v65_Attribute_0 = v65:GetAttribute("SpinSpeed");
            if l_v65_Attribute_0 then
                local l_UIGradient_0 = v65:FindFirstChildOfClass("UIGradient");
                if l_UIGradient_0 then
                    l_UIGradient_0:SetAttribute("SpinSpeed", l_v65_Attribute_0);
                    table.insert(v61._spinObjects, l_UIGradient_0);
                end;
            end;
        end;
        v36.MenuOpened:Connect(function(v68) --[[ Line: 144 ]]
            -- upvalues: v61 (copy)
            if v68 == "Shop" then
                v61.bin.CanvasPosition = Vector2.new(0, 0);
            end;
        end);
    end, 
    Start = function(v69) --[[ Line: 152 ]] --[[ Name: Start ]]
        -- upvalues: v59 (ref), v43 (ref), v56 (ref), v57 (ref), v60 (ref), v24 (copy), v8 (copy), l_CollectionService_0 (copy), v23 (copy), v51 (ref), v22 (copy), v20 (copy)
        v59 = v43:GetModuleAsync("ChestDrops"):expect();
        v56 = v43:GetModuleAsync("Notification"):expect();
        v57 = v43:GetModuleAsync("HUD"):expect();
        v60 = v43:GetModuleAsync("HUD"):expect();
        v69.PolicyInfo = v24(v8.Player):expect();
        if not v69.PolicyInfo then
            v8.Player:Kick("Failed to get policy info. (Please rejoin)");
            return;
        else
            v69.PaidItemsRestricted = v69.PolicyInfo.ArePaidRandomItemsRestricted or false;
            v43:HandleButton(v69.exitBtn, function() --[[ Line: 170 ]]
                -- upvalues: v43 (ref)
                v43:Toggle(script.Name, false);
            end);
            local function v71(v70) --[[ Line: 174 ]] --[[ Name: handleRNGItem ]]
                -- upvalues: v69 (copy)
                if v69.PaidItemsRestricted then
                    v70.Visible = false;
                end;
            end;
            for _, v73 in l_CollectionService_0:GetTagged("RNGShopItem") do
                task.spawn(v71, v73);
            end;
            l_CollectionService_0:GetInstanceAddedSignal("RNGShopItem"):Connect(v71);
            task.spawn(function() --[[ Line: 190 ]]
                -- upvalues: v69 (copy)
                v69:_connectWhalePurchases();
            end);
            for _, v75 in v69.bin:GetChildren() do
                if v75:IsA("Frame") then
                    if v75:GetAttribute("IsRNG") and v69.PaidItemsRestricted then
                        if not v75:HasTag("RNGShopItem") then
                            v75:AddTag("RNGShopItem");
                        end;
                    elseif v75:GetAttribute("GenericFrame") then
                        v69:_connectPurchases(v75);
                    end;
                end;
            end;
            v69:_connectFreeStorage();
            v69:_setupLuckBooster();
            v69:_setupCodesFrame();
            v69:_setupNavBar();
            v69:_setupKrustyKrew();
            if v69.bin:FindFirstChild("HotOffers") and v69.bin.HotOffers.Bin:FindFirstChild("SecretChestsOffer") then
                v69:_setupSecretTreasurePack(v69.bin.HotOffers.Bin.SecretChestsOffer);
            end;
            if v69.bin:FindFirstChild("NewArrivals") and v69.bin.NewArrivals.Bin:FindFirstChild("BoostedSecretChests") then
                v69:_setupBoostedSecretTreasurePack(v69.bin.NewArrivals.Bin.BoostedSecretChests);
            end;
            if v69.bin:FindFirstChild("ProgressiveGemPack") then
                v69.bin.ProgressiveGemPack.Visible = false;
            end;
            if v69.bin:FindFirstChild("DragonCapsules") then
                v69:_setupDragonCapsulePack(v69.bin.DragonCapsules);
            end;
            if v69.bin:FindFirstChild("ChestForeverPack") then
                v69:_setupChestForeverPack(v69.bin.ChestForeverPack);
            end;
            if v69.bin:FindFirstChild("NewArrivals") and v69.bin.NewArrivals.Bin:FindFirstChild("ExoticChest") then
                v69:_setupExoticChestChances(v69.bin.NewArrivals.Bin.ExoticChest);
            end;
            if v69.bin:FindFirstChild("PetOffers") and v69.bin.PetOffers.Bin:FindFirstChild("PetEquip") then
                v69:_setupPetEquipOffer(v69.bin.PetOffers.Bin.PetEquip);
            end;
            if v69.bin:FindFirstChild("OPChestBundle") then
                v69:_setupOPChestBundle(v69.bin.OPChestBundle.LargeBin.Main);
            end;
            v69:_setupPrismaticOffer(v69.bin.CruiseCrate, "CruiseCrate", {
                expireOn = v23.CHRISTMAS_START - 1
            });
            v69:_setupPrismaticOffer(v69.bin.SnowCrate, "SnowCrate", {
                startOn = v23.CHRISTMAS_START, 
                expireOn = v23.CHRISTMAS_DEAL_ENDS
            });
            v69:_setupPlaytimeCrate(v69.bin.HolidayCrate, "HolidayCrate");
            v69:_setupLimitedOffersFrame();
            for _, v77 in l_CollectionService_0:GetTagged("LootInfoButton") do
                if v77:IsDescendantOf(v69.ui) then
                    local v78 = v77:GetAttribute("RNGType") or v77:GetAttribute("LootType") or "TreasureChest";
                    v43:HandleButton(v77, function() --[[ Line: 375 ]]
                        -- upvalues: v69 (copy), v59 (ref), v78 (copy)
                        v69._lastCanvasPosition = v69.bin.CanvasPosition;
                        v59:ShowDropChances(v78, script.Name);
                    end);
                end;
            end;
            v51.SeasonEnd:Observe(function(v79) --[[ Line: 383 ]]
                -- upvalues: v69 (copy), v22 (ref), v20 (ref)
                if not v79 then
                    v69.bin.SeasonPass.Header.Timer.Text = "Season Ended";
                    return;
                else
                    local v80 = math.clamp(v79 - workspace:GetServerTimeNow(), 0, 1e999);
                    if v80 <= 1 then
                        v69.bin.SeasonPass.Header.Timer.Text = "Season Ended";
                        return;
                    else
                        local v81 = nil;
                        v81 = v22.Simple(1, function() --[[ Line: 399 ]]
                            -- upvalues: v80 (ref), v69 (ref), v81 (ref), v20 (ref)
                            v80 = v80 - 1;
                            if v80 < 1 then
                                v69.bin.SeasonPass.Header.Timer.Text = "Season Ended";
                                v81:Disconnect();
                                v81 = nil;
                                return;
                            else
                                v69.bin.SeasonPass.Header.Timer.Text = ("Season Ends In %*"):format((v20:FormatTimeFromSeconds(v80)));
                                return;
                            end;
                        end);
                        return;
                    end;
                end;
            end);
            v51.PassActive:Observe(function(v82) --[[ Line: 413 ]]
                -- upvalues: v69 (copy)
                v82 = v82 or false;
                v69._seasonPassActive = v82;
                v69.bin.SeasonPass.Visible = v82;
            end);
            local l_SeasonPass_0 = v69.bin.SeasonPass;
            l_SeasonPass_0.Bin.PassOptions.PremiumPass.Main.Header.SeasonNumber.Text = ("Season %*"):format(v23.SEASON or 0);
            l_SeasonPass_0.Bin.PassOptions.PremiumBundle.Main.Header.SeasonNumber.Text = ("Season %*"):format(v23.SEASON or 0);
            v69:_setupOneTimePacks();
            v69:_setupCrateOfferFrame();
            return;
        end;
    end, 
    Opening = function(v84) --[[ Line: 444 ]] --[[ Name: Opening ]]
        -- upvalues: l_CollectionService_0 (copy), v26 (copy), v20 (copy)
        for _, v86 in v84._spinObjects do
            v86:AddTag("UISpin");
        end;
        for _, v88 in v84.rarityVisuals do
            v88:AddTag("VisualizeRarity");
        end;
        if v84.krustyRewardVisuals then
            for _, v90 in v84.krustyRewardVisuals do
                v90:AddTag("VisualizeRarity");
            end;
        end;
        if v84.hydraCrateVisuals then
            for _, v92 in v84.hydraCrateVisuals do
                v92:AddTag("VisualizeRarity");
            end;
        end;
        for _, v94 in l_CollectionService_0:GetTagged("FoodXPShower") do
            if v94:IsDescendantOf(v84.ui) then
                local l_v94_Attribute_0 = v94:GetAttribute("FoodName");
                local l_v94_Attribute_1 = v94:GetAttribute("FormatString");
                if not l_v94_Attribute_0 or not l_v94_Attribute_1 then
                    v94:RemoveTag("FoodXPShower");
                else
                    local v97 = v26:GetXP(l_v94_Attribute_0) or 0;
                    v94.Text = string.format(l_v94_Attribute_1, v20:SuffixNumber(v97, false, false));
                end;
            end;
        end;
        v84.rgbHandler:Enable();
        v84:_setupVideoAdsPack();
    end, 
    Opened = function(v98) --[[ Line: 488 ]] --[[ Name: Opened ]]
        -- upvalues: v48 (ref), l_GuiService_0 (copy), v57 (ref)
        if v48:IsConsole() then
            l_GuiService_0.SelectedObject = v98.bin;
        end;
        v57:ToggleNotifier("Shop", false);
    end, 
    Closed = function(v99) --[[ Line: 496 ]] --[[ Name: Closed ]]
        -- upvalues: v60 (ref)
        for _, v101 in v99._spinObjects do
            v101:RemoveTag("UISpin");
        end;
        for _, v103 in v99.rarityVisuals do
            v103:RemoveTag("VisualizeRarity");
        end;
        if v99.krustyRewardVisuals then
            for _, v105 in v99.krustyRewardVisuals do
                v105:RemoveTag("VisualizeRarity");
            end;
        end;
        if v99.krustyDetailsPage then
            v99.krustyDetailsPage.Visible = false;
        end;
        v99.main.Visible = true;
        v60:ToggleUnitsBar(true, 0);
        v99.rgbHandler:Disable();
    end, 
    OpenBubbleBowlOffers = function(v106) --[[ Line: 523 ]] --[[ Name: OpenBubbleBowlOffers ]]
        -- upvalues: v43 (ref)
        v106._lastCanvasPosition = Vector2.yAxis * (v106.bin.AbsoluteCanvasSize.Y * 0.0693);
        v43:Toggle(script.Name, true);
    end, 
    _setupNavBar = function(v107) --[[ Line: 530 ]] --[[ Name: _setupNavBar ]]
        -- upvalues: v43 (ref), l_TweenService_0 (copy)
        local l_NavBar_0 = v107.main.NavBar;
        local l_bin_0 = v107.bin;
        for _, v111 in (l_NavBar_0:GetChildren()) do
            if v111:IsA("TextButton") then
                local l_Name_0 = v111.Name;
                v43:HandleButton(v111, function() --[[ Line: 537 ]]
                    -- upvalues: l_Name_0 (copy), l_bin_0 (copy), l_TweenService_0 (ref)
                    local v113 = nil;
                    v113 = l_Name_0 == "Exclusive" and "NewArrivals" or l_Name_0 == "Gamepasses" and "Featured" or l_Name_0;
                    local l_l_bin_0_FirstChild_0 = l_bin_0:FindFirstChild(v113);
                    if not l_l_bin_0_FirstChild_0 then
                        warn((("Target frame %* not found in Shop bin."):format(l_Name_0)));
                        return;
                    else
                        local l_AbsolutePosition_0 = l_bin_0.AbsolutePosition;
                        local v116 = l_l_bin_0_FirstChild_0.AbsolutePosition - l_AbsolutePosition_0;
                        local v117 = l_bin_0.CanvasPosition.Y + v116.Y;
                        local v118 = math.abs(v116.Y) * 2.0E-5 + 0.1;
                        local v119 = TweenInfo.new(v118, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                        l_TweenService_0:Create(l_bin_0, v119, {
                            CanvasPosition = Vector2.new(0, v117)
                        }):Play();
                        return;
                    end;
                end);
            end;
        end;
    end, 
    _setupCodesFrame = function(v120) --[[ Line: 565 ]] --[[ Name: _setupCodesFrame ]]
        -- upvalues: v8 (copy), v43 (ref), v37 (copy), v50 (ref)
        local v121 = v8.GetService("PromoCodeService");
        local v122 = false;
        local l_Main_0 = v120.bin.Codes.Bin.Main;
        local l_TextBox_0 = l_Main_0.InputCode.TextBox;
        local l_Redeem_0 = l_Main_0.InputCode.Redeem;
        local l_PlaceholderText_0 = l_TextBox_0.PlaceholderText;
        local l_PlaceholderColor3_0 = l_TextBox_0.PlaceholderColor3;
        v43:HandleButton(l_Redeem_0, function() --[[ Line: 577 ]]
            -- upvalues: v122 (ref), l_TextBox_0 (copy), v121 (copy), v37 (ref), v50 (ref), l_PlaceholderText_0 (copy), l_PlaceholderColor3_0 (copy)
            if v122 then
                return;
            else
                v122 = true;
                l_TextBox_0.Interactable = false;
                local _, v129, v130 = v121:Redeem(l_TextBox_0.Text):await();
                local v131 = "Successfully Redeemed!";
                local v132 = "UI.Success";
                local l_Green_0 = v37.Solid.Green;
                if not v129 then
                    v131 = v130 or "Code Invalid!";
                    v132 = "UI.Error";
                    l_Green_0 = v37.Solid.Red;
                end;
                if v132 ~= "" then
                    v50:PlaySound({
                        name = v132, 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                l_TextBox_0.Text = "";
                l_TextBox_0.PlaceholderText = v131;
                l_TextBox_0.PlaceholderColor3 = l_Green_0;
                task.wait(1.5);
                l_TextBox_0.PlaceholderText = l_PlaceholderText_0;
                l_TextBox_0.PlaceholderColor3 = l_PlaceholderColor3_0;
                v122 = false;
                l_TextBox_0.Interactable = true;
                return;
            end;
        end);
    end, 
    _setupSandCratesFrame = function(v134) --[[ Line: 617 ]] --[[ Name: _setupSandCratesFrame ]]
        -- upvalues: v52 (ref), l_ReplicatedStorage_0 (copy), v30 (copy), v20 (copy), v27 (copy), v43 (ref), v21 (copy), v22 (copy), v23 (copy), v45 (ref), v44 (ref), v8 (copy), v56 (ref)
        if not v52:IsActive() then
            return;
        else
            local v135 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
            local l_SandCrates_0 = v134.bin:FindFirstChild("SandCrates");
            if not l_SandCrates_0 then
                return;
            else
                local l_v30_RarityPool_0 = v30:GetRarityPool("SandCrate");
                local l_v30_LootPool_0 = v30:GetLootPool("SandCrate");
                local v139 = {};
                for v140, v141 in l_v30_RarityPool_0 do
                    table.insert(v139, {
                        rarity = v140, 
                        weight = v141.weight or v141.Weight or 1
                    });
                end;
                table.sort(v139, function(v142, v143) --[[ Line: 640 ]]
                    return v142.weight > v143.weight;
                end);
                local v144 = 0;
                for _, v146 in v139 do
                    for _, v148 in l_v30_LootPool_0[v146.rarity] do
                        v144 = v144 + 1;
                        local l_type_0 = v148.type;
                        local l_FirstChild_0 = l_SandCrates_0.LargeBin.Main.Bin:FindFirstChild(v144);
                        if l_FirstChild_0 then
                            local v151 = v148 and v148.extraData;
                            local v152 = nil;
                            if l_type_0 == "Inventory" then
                                v152 = v20:GetRewardRarity(v148);
                            elseif l_type_0 == "Unit" then
                                v152 = select(2, v27:GetRarity(v148.name or v148.Name, true));
                                if v151 then
                                    v151.Name = v148.name or v148.Name;
                                    v151.Mega = v151.Wumbo or false;
                                    v151.Shiny = v151.Shiny or false;
                                    if not v151.Level then
                                        v151.Level = 1;
                                    end;
                                end;
                            else
                                warn("Invalid reward type in SandCrate loot pool:", l_type_0);
                                continue;
                            end;
                            l_FirstChild_0.Backdrop:SetAttribute("Rarity", v152 or "Common");
                            l_FirstChild_0.Glow:SetAttribute("Rarity", v152 or "Common");
                            table.insert(v134.rarityVisuals, l_FirstChild_0.Backdrop);
                            table.insert(v134.rarityVisuals, l_FirstChild_0.Glow);
                            if v43:GetToggleState(script.Name) then
                                l_FirstChild_0.Backdrop:AddTag("VisualizeRarity");
                                l_FirstChild_0.Glow:AddTag("VisualizeRarity");
                            end;
                            local l_new_0 = v21.new;
                            local l_l_FirstChild_0_0 = l_FirstChild_0;
                            local v155 = {
                                Name = v148.name or v148.Name, 
                                UnitData = v151, 
                                IsUnit = v151 ~= nil
                            };
                            local v156;
                            if v151 then
                                v156 = {};
                                local v157 = false;
                                if v151.Shiny == false then
                                    v157 = v151.Wumbo == false;
                                end;
                                v156.Normal = v157;
                                v156.Shiny = v151.Shiny or false;
                                v156.Mega = v151.Wumbo or false;
                                v157 = false;
                                if v151.Shiny == true then
                                    v157 = v151.Wumbo == true;
                                end;
                                v156.ShinyMega = v157;
                            else
                                v156 = nil;
                            end;
                            v155.ExtraData = v156;
                            l_new_0(l_l_FirstChild_0_0, v155);
                            l_FirstChild_0.Inner.Chance.Text = ("%*%%"):format(v148.weight or 1);
                        end;
                    end;
                end;
                l_SandCrates_0.Visible = true;
                local l_LargeBin_0 = l_SandCrates_0.LargeBin;
                local l_Header_0 = l_SandCrates_0.Header;
                local v160 = v135.EVENT_END.UnixTimestamp - workspace:GetServerTimeNow();
                task.delay(v160, function() --[[ Line: 704 ]]
                    -- upvalues: l_SandCrates_0 (copy)
                    l_SandCrates_0.Visible = false;
                end);
                local l_Timer_0 = l_Header_0.Timer;
                v22.Simple(1, function() --[[ Line: 709 ]]
                    -- upvalues: v160 (ref), l_Timer_0 (copy), v20 (ref)
                    v160 = v160 - 1;
                    if v160 < 86400 then
                        l_Timer_0.Text = ("Offer ends in %*"):format((v20:FormatTimeFromSeconds(v160)));
                        return;
                    else
                        local v162 = math.floor(v160 / 86400);
                        l_Timer_0.Text = ("Offer ends in %* %*"):format(v162, v162 == 1 and "day" or "days");
                        return;
                    end;
                end);
                if not v134.PaidItemsRestricted then
                    local v163 = {};
                    for v164 = 1, v23.MAX_SAND_CRATES_PRODUCT_TIER do
                        v163[v164] = v45:GetProduct((("SandCrate%*"):format(v164))).purchaseData.reward.amount;
                    end;
                    local l_Buy_0 = l_LargeBin_0.Main.Buttons.Buy;
                    local v166 = v44:Get(v8.Player, "ProgressiveSandCrates"):expect() or 1;
                    local l_v163_0 = v163 --[[ copy: 11 -> 26 ]];
                    local l_l_Buy_0_0 = l_Buy_0 --[[ copy: 13 -> 27 ]];
                    do
                        local l_v166_0 = v166;
                        local function _() --[[ Line: 729 ]] --[[ Name: updatePrice ]]
                            -- upvalues: v45 (ref), l_v166_0 (ref), l_v163_0 (copy), l_l_Buy_0_0 (copy)
                            v45:PromiseProductInfo(("SandCrate%*"):format(l_v166_0), Enum.InfoType.Product):andThen(function(v170) --[[ Line: 730 ]]
                                -- upvalues: l_v163_0 (ref), l_v166_0 (ref), l_l_Buy_0_0 (ref)
                                local v171 = l_v163_0[l_v166_0];
                                l_l_Buy_0_0.Content.Amount.Text = v170.PriceInRobux;
                                l_l_Buy_0_0.Title.Text = ("%* %*"):format(v171, v171 == 1 and "Crate" or "Crates");
                            end);
                        end;
                        v45:PromiseProductInfo(("SandCrate%*"):format(l_v166_0), Enum.InfoType.Product):andThen(function(v173) --[[ Line: 730 ]]
                            -- upvalues: l_v163_0 (copy), l_v166_0 (ref), l_l_Buy_0_0 (copy)
                            local v174 = l_v163_0[l_v166_0];
                            l_l_Buy_0_0.Content.Amount.Text = v173.PriceInRobux;
                            l_l_Buy_0_0.Title.Text = ("%* %*"):format(v174, v174 == 1 and "Crate" or "Crates");
                        end);
                        v44:OnChanged(v8.Player, "ProgressiveSandCrates", function(v175) --[[ Line: 738 ]]
                            -- upvalues: l_v166_0 (ref), v45 (ref), l_v163_0 (copy), l_l_Buy_0_0 (copy)
                            l_v166_0 = v175;
                            v45:PromiseProductInfo(("SandCrate%*"):format(l_v166_0), Enum.InfoType.Product):andThen(function(v176) --[[ Line: 730 ]]
                                -- upvalues: l_v163_0 (ref), l_v166_0 (ref), l_l_Buy_0_0 (ref)
                                local v177 = l_v163_0[l_v166_0];
                                l_l_Buy_0_0.Content.Amount.Text = v176.PriceInRobux;
                                l_l_Buy_0_0.Title.Text = ("%* %*"):format(v177, v177 == 1 and "Crate" or "Crates");
                            end);
                        end, true);
                        v43:HandleButton(l_Buy_0, function() --[[ Line: 743 ]]
                            -- upvalues: v45 (ref), l_v166_0 (ref)
                            v45:PromptProductPurchase((("SandCrate%*"):format(l_v166_0)));
                        end);
                    end;
                end;
                local l_Free_0 = l_LargeBin_0.Main.Buttons.Free;
                local l_TextDisplay_0 = l_Free_0.Content.TextDisplay;
                local l_TimeForFreeCrate_0 = v135.TimeForFreeCrate;
                v44:OnChanged(v8.Player, "FreeSandCrateAccumulatedTime", function(v181) --[[ Line: 751 ]]
                    -- upvalues: l_TimeForFreeCrate_0 (copy), v20 (ref), l_TextDisplay_0 (copy), l_Free_0 (copy)
                    local v182 = math.floor(v181 / l_TimeForFreeCrate_0);
                    local v183 = l_TimeForFreeCrate_0 - v181 % l_TimeForFreeCrate_0;
                    local v184 = v20:FormatTimeFromSeconds(v183);
                    if v182 >= 1 then
                        l_TextDisplay_0.TextColor3 = Color3.fromRGB(255, 255, 255);
                        l_Free_0.Content.Fill.Size = UDim2.fromScale(1, 1);
                        l_TextDisplay_0.Text = ("Claim (%*)"):format(v182);
                        l_Free_0.Title.Text = ("Next crate in %*"):format(v184);
                        return;
                    else
                        local v185 = math.clamp(v181 / l_TimeForFreeCrate_0, 0, 1);
                        l_TextDisplay_0.TextColor3 = Color3.fromRGB(200, 200, 200);
                        l_Free_0.Content.Fill.Size = UDim2.fromScale(v185, 1);
                        local v186 = l_TimeForFreeCrate_0 / 60;
                        l_Free_0.Title.Text = string.upper((("Free crate every %* minutes"):format(v186)));
                        l_TextDisplay_0.Text = ("%*"):format(v184);
                        return;
                    end;
                end, true);
                local v187 = v8.GetService("SandCrateService");
                local v188 = false;
                v43:HandleButton(l_Free_0, function() --[[ Line: 776 ]]
                    -- upvalues: v188 (ref), v56 (ref), v44 (ref), v8 (ref), v135 (copy), v187 (copy)
                    if v188 then
                        v56:Notify({
                            message = "System is processing your request, wait a moment.", 
                            duration = 2, 
                            isPositive = false
                        });
                        return;
                    elseif (v44:Get(v8.Player, "FreeSandCrateAccumulatedTime"):expect() or 0) < v135.TimeForFreeCrate then
                        v56:Notify({
                            message = "Can't claim yet, wait a bit longer.", 
                            duration = 2, 
                            isPositive = false
                        });
                        return;
                    else
                        v188 = true;
                        v187:ClaimFreeCrates():finally(function() --[[ Line: 797 ]]
                            -- upvalues: v188 (ref)
                            v188 = false;
                        end);
                        return;
                    end;
                end);
                return;
            end;
        end;
    end, 
    _setupLuckBooster = function(v189) --[[ Line: 803 ]] --[[ Name: _setupLuckBooster ]]
        -- upvalues: v44 (ref), v8 (copy), l_TweenService_0 (copy), v23 (copy), v45 (ref), v43 (ref)
        local l_SummonLuck_0 = v189.bin.SummonLuck;
        local l_LuckBoosts_0 = l_SummonLuck_0.Bin.Main.LuckBoosts;
        l_LuckBoosts_0.Luck1.Text = "1x";
        l_LuckBoosts_0.Luck2.Text = "2x";
        local v192 = v44:Get(v8.Player, "ProgressiveSummonLuck"):expect() or 0;
        l_LuckBoosts_0.Luck1.Text = ("%*x"):format((math.pow(2, v192)));
        l_LuckBoosts_0.Luck2.Text = ("%*x"):format((math.pow(2, v192 + 1)));
        local v193 = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, true, 0.15);
        local v194 = l_TweenService_0:Create(l_LuckBoosts_0.Luck2, v193, {
            Size = UDim2.fromScale(0, l_LuckBoosts_0.Luck2.Size.Y.Scale * 1.4)
        });
        local function v196() --[[ Line: 828 ]] --[[ Name: updatePrice ]]
            -- upvalues: v192 (ref), v23 (ref), l_SummonLuck_0 (copy), v45 (ref)
            if v192 == #v23.SUMMONING.PROGRESSIVE_LUCK_BOOSTS then
                l_SummonLuck_0.Bin.Main.Buy.Visible = false;
                return;
            else
                l_SummonLuck_0.Bin.Main.Buy.Visible = true;
                v45:PromiseProductInfo(("SummonLuck%*"):format(v192 + 1), Enum.InfoType.Product):andThen(function(v195) --[[ Line: 836 ]]
                    -- upvalues: l_SummonLuck_0 (ref)
                    l_SummonLuck_0.Bin.Main.Buy.Content.Amount.Text = v195.PriceInRobux;
                end);
                return;
            end;
        end;
        v196();
        v44:OnChanged(v8.Player, "ProgressiveSummonLuck", function(v197) --[[ Line: 843 ]]
            -- upvalues: v192 (ref), l_LuckBoosts_0 (copy), v196 (copy), v43 (ref), v45 (ref), v194 (copy)
            v192 = v197;
            l_LuckBoosts_0.Luck1.Text = ("%*x"):format((math.pow(2, v197)));
            l_LuckBoosts_0.Luck2.Text = ("%*x"):format((math.pow(2, v197 + 1)));
            v196();
            if not v43:GetToggleState(script.Name) then
                return;
            else
                if v45.promptingPurchase then
                    v45.PurchasePromptClosed:Wait();
                end;
                v194:Play();
                return;
            end;
        end);
        v43:HandleButton(l_SummonLuck_0.Bin.Main.Buy, function() --[[ Line: 862 ]]
            -- upvalues: v45 (ref), v192 (ref)
            v45:PromptProductPurchase((("SummonLuck%*"):format(v192 + 1)));
        end);
    end, 
    _setupForeverPack = function(v198) --[[ Line: 867 ]] --[[ Name: _setupForeverPack ]]
        -- upvalues: v16 (copy), v27 (copy), v29 (copy), v15 (copy), v20 (copy), v45 (ref), v43 (ref), v47 (ref), v44 (ref), v8 (copy), v22 (copy)
        local l_Header_1 = v198.bin.UnlimitedOffer.Bin.Main.Header;
        local l_ScrollingFrame_0 = v198.bin.UnlimitedOffer.Bin.Main.ScrollingFrame;
        local l_Template_0 = l_ScrollingFrame_0.Template;
        l_Template_0.Parent = nil;
        local v202 = {};
        for v203, v204 in v16 do
            local v205 = l_Template_0:Clone();
            v205.Name = "Tier" .. v203;
            v205.LayoutOrder = v203;
            v205.Visible = true;
            local v206 = nil;
            local v207 = nil;
            if v204.reward.type == "Unit" then
                v206 = select(2, v27:GetRarity(v204.reward.name));
                v29:SetImage(v205.Container.Inner.Icon, v204.reward.name);
            else
                local l_v15_ByItemName_0 = v15:GetByItemName(v204.reward.name);
                v207 = l_v15_ByItemName_0 and l_v15_ByItemName_0.icon;
                v206 = v20:GetRewardRarity(v204.reward);
                v205.Container.Inner.Icon.Image = v207 or "";
            end;
            if v206 then
                v198.rgbHandler:AddObject(v205.Container.Inner.Backdrop, v206);
            end;
            v205.Container.Amount.Text = ("x%*"):format(v204.reward.amount or 1);
            if v204.isFree then
                v205.Container.Buy.Content.Free.Visible = true;
                v205.Container.Buy.Content.Robux.Visible = false;
            else
                v45:PromiseProductInfo(v204.purchaseName, Enum.InfoType.Product):andThen(function(v209) --[[ Line: 905 ]]
                    -- upvalues: v205 (copy)
                    v205.Container.Buy.Content.Robux.Amount.Text = v209.PriceInRobux or "???";
                    v205.Container.Buy.Content.Free.Visible = false;
                    v205.Container.Buy.Content.Robux.Visible = true;
                end);
            end;
            v43:HandleButton(v205.Container.Buy, function() --[[ Line: 912 ]]
                -- upvalues: v203 (copy), v198 (copy), v16 (ref), v47 (ref), v45 (ref)
                if v203 > v198.foreverPackData.Tier then
                    return;
                else
                    local v210 = v16[v198.foreverPackData.Tier];
                    if not v210 then
                        return;
                    elseif v210.isFree then
                        v47:ClaimTier(v203);
                        return;
                    else
                        v45:PromptProductPurchase(v210.purchaseName);
                        return;
                    end;
                end;
            end);
            v205.Parent = l_ScrollingFrame_0;
            v202[v203] = v205;
        end;
        local v211 = 1;
        local v212 = #v202;
        local function v216() --[[ Line: 938 ]] --[[ Name: updateOrder ]]
            -- upvalues: v202 (copy), v211 (ref), v212 (copy)
            for v213, v214 in v202 do
                local v215 = (v213 - v211 + v212) % v212;
                if v213 < v211 then
                    v215 = v215 + v212;
                end;
                v214.Container.Buy.Content.Disabled.Visible = v213 ~= v211;
                v214.LayoutOrder = v215;
            end;
        end;
        local v217 = v44:Get(v8.Player, "ForeverPack"):expect();
        v198.foreverPackData = v217;
        v211 = v217 and v217.Tier or 1;
        local v218 = math.floor(v217.StartTime + 86400 - workspace:GetServerTimeNow());
        if v217.StartTime > 0 then
            v216();
        end;
        v44:OnChanged(v8.Player, "ForeverPack", function(v219) --[[ Line: 965 ]]
            -- upvalues: v211 (ref), v198 (copy), v218 (ref), v216 (copy)
            v211 = v219.Tier or 1;
            v198.foreverPackData = v219;
            v218 = math.floor(v219.StartTime + 86400 - workspace:GetServerTimeNow());
            v216();
        end, true);
        v22.Simple(1, function() --[[ Line: 973 ]]
            -- upvalues: v218 (ref), l_Header_1 (copy), v20 (ref)
            if v218 < 1 then
                return;
            else
                v218 = v218 - 1;
                l_Header_1.Timer.Text = ("Resets in %*"):format((v20:FormatTimeFromSeconds(v218)));
                return;
            end;
        end);
    end, 
    _setupVideoAdsPackDisplayVisual = function(v220, v221, v222, v223, v224) --[[ Line: 984 ]] --[[ Name: _setupVideoAdsPackDisplayVisual ]]
        -- upvalues: v27 (copy), v29 (copy), v15 (copy), v20 (copy), v43 (ref), v54 (ref)
        local l_Buy_1 = v221.Container.Buy;
        v221.LayoutOrder = v222;
        v221.Visible = true;
        local v226 = nil;
        local v227 = nil;
        if v223.reward.type == "Unit" then
            v226 = select(2, v27:GetRarity(v223.reward.name));
            v29:SetImage(v221.Container.Inner.Icon, v223.reward.name);
        else
            local l_v15_ByItemName_1 = v15:GetByItemName(v223.reward.name);
            v227 = l_v15_ByItemName_1 and l_v15_ByItemName_1.icon;
            v226 = v20:GetRewardRarity(v223.reward);
            v221.Container.Inner.Icon.Image = v227 or "";
        end;
        if v226 then
            v220.rgbHandler:AddObject(v221.Container.Inner.Backdrop, v226);
        end;
        v221.Container.Amount.Text = ("x%*"):format(v223.reward.amount or 1);
        if l_Buy_1:FindFirstChild("Content") then
            l_Buy_1.Content.Free.Visible = true;
            l_Buy_1.Content.Robux.Visible = false;
        end;
        if not v224 then
            v43:HandleButton(l_Buy_1, function() --[[ Line: 1015 ]]
                -- upvalues: v222 (copy), v220 (copy), v54 (ref)
                if v222 > v220.videoAdsPackData.Tier then
                    return;
                else
                    v54:PromiseWatchVideoAd("VideoAdsPackProduct"):catch(warn);
                    return;
                end;
            end);
        end;
    end
};
local v230 = {};
local v231 = nil;
v229._setupVideoAdsPack = function(v232) --[[ Line: 1027 ]] --[[ Name: _setupVideoAdsPack ]]
    -- upvalues: v54 (ref), l_ReplicatedStorage_0 (copy), v44 (ref), v8 (copy), v10 (copy), v230 (ref), v231 (ref), v22 (copy), v20 (copy)
    local l_VideoAds_0 = v232.bin.VideoAds;
    local v234, v235 = v54:PromiseCanWatchAds():await();
    if not v234 or not v235 then
        l_VideoAds_0.Visible = false;
        warn("Video Ads Frame visibility set to false due to not being eligibile |", v235);
        return;
    else
        local l_Bin_0 = l_VideoAds_0.Bin;
        local l_ProgressiveRewards_0 = l_Bin_0.ProgressiveRewards;
        local l_ScrollingFrame_1 = l_ProgressiveRewards_0.Main.ScrollingFrame;
        local l_DisplayTemplate_0 = l_VideoAds_0.Templates.DisplayTemplate;
        l_DisplayTemplate_0.Visible = false;
        local v240 = require(l_ReplicatedStorage_0.Shared.Data.VideoAdsPack);
        local l_GrandPrizeFrame_0 = l_Bin_0.FinalReward.Main.GrandPrizeFrame;
        local v242 = 10;
        local function v249() --[[ Line: 1048 ]] --[[ Name: setupVideoAdsFrames ]]
            -- upvalues: v44 (ref), v8 (ref), v240 (copy), v10 (ref), v230 (ref), v242 (ref), l_DisplayTemplate_0 (copy), v232 (copy), l_ScrollingFrame_1 (copy), l_GrandPrizeFrame_0 (copy)
            local v243 = if v44:Get(v8.Player, "ClaimedVideoAdsPackUniquePrize"):expect() then v240.SecondRewards else v240.FirstRewards;
            if not v10.IsEmpty(v230) then
                for _, v245 in v230 do
                    v245:Destroy();
                end;
                v230 = {};
            end;
            v242 = #v243;
            for v246, v247 in v243 do
                local v248 = l_DisplayTemplate_0:Clone();
                v232:_setupVideoAdsPackDisplayVisual(v248, v246, v247);
                v248.Parent = l_ScrollingFrame_1;
                v230[v246] = v248;
            end;
            v232:_setupVideoAdsPackDisplayVisual(l_GrandPrizeFrame_0, v242, v243[v242], true);
        end;
        local v250 = 1;
        local _ = function() --[[ Line: 1073 ]] --[[ Name: updateOrder ]]
            -- upvalues: v54 (ref), v230 (ref), v250 (ref)
            v54:PromiseCanWatchAds():andThen(function(v251, _) --[[ Line: 1075 ]]
                -- upvalues: v230 (ref), v250 (ref)
                for v253, v254 in v230 do
                    if v253 < v250 then
                        v254.Visible = false;
                    else
                        v254.Container.Buy.Content.Disabled.Visible = not v251 or v253 ~= v250;
                    end;
                end;
            end):catch(warn);
        end;
        local v256 = v44:Get(v8.Player, "VideoAdsPack"):expect();
        v232.videoAdsPackData = v256;
        v250 = v256 and v256.Tier or 1;
        v249();
        local v257 = math.floor(v256.StartTime + 86400 - workspace:GetServerTimeNow());
        v44:OnChanged(v8.Player, "VideoAdsPack", function(v258) --[[ Line: 1093 ]]
            -- upvalues: v250 (ref), v232 (copy), v242 (ref), l_GrandPrizeFrame_0 (copy), v257 (ref), v249 (copy), v54 (ref), v230 (ref)
            v250 = v258.Tier or 1;
            v232.videoAdsPackData = v258;
            local v259 = math.max(v250 - 1, 0);
            local v260 = math.clamp(v259 / v242, 0, 1);
            l_GrandPrizeFrame_0.Container.Buy.Claim.Text = v242 < v250 and "Claimed!" or ("%*/%*"):format(v259, v242);
            l_GrandPrizeFrame_0.Container.Buy.Unsorted.StockBar.Size = UDim2.fromScale(v260, 1);
            v257 = math.floor(v258.StartTime + 86400 - workspace:GetServerTimeNow());
            if v250 == 1 then
                v249();
            end;
            v54:PromiseCanWatchAds():andThen(function(v261, _) --[[ Line: 1075 ]]
                -- upvalues: v230 (ref), v250 (ref)
                for v263, v264 in v230 do
                    if v263 < v250 then
                        v264.Visible = false;
                    else
                        v264.Container.Buy.Content.Disabled.Visible = not v261 or v263 ~= v250;
                    end;
                end;
            end):catch(warn);
        end, true);
        v44:OnChanged(v8.Player, "ClaimedVideoAdsPackUniquePrize", function(_) --[[ Line: 1110 ]]
            -- upvalues: v249 (copy)
            v249();
        end);
        if v231 then
            v231:Disconnect();
            v231 = nil;
        end;
        v231 = v22.Simple(1, function() --[[ Line: 1118 ]]
            -- upvalues: v257 (ref), l_ProgressiveRewards_0 (copy), v20 (ref)
            if v257 < 1 then
                return;
            else
                v257 = v257 - 1;
                l_ProgressiveRewards_0.Main.RefreshTime.Timer.Text = ("%*"):format((v20:FormatTimeFromSeconds(v257)));
                return;
            end;
        end);
        l_VideoAds_0.Visible = true;
        return;
    end;
end;
v229._setupTreasurePack = function(v266) --[[ Line: 1130 ]] --[[ Name: _setupTreasurePack ]]
    -- upvalues: v17 (copy), v27 (copy), v29 (copy), v15 (copy), v20 (copy), v45 (ref), v43 (ref), v21 (copy), v44 (ref), v8 (copy), v22 (copy), v59 (ref)
    local l_Header_2 = v266.bin.DailyTreasureOffer.Bin.Main.Header;
    local l_Info_0 = v266.bin.DailyTreasureOffer.Bin.Main.Info;
    local l_ScrollingFrame_2 = v266.bin.DailyTreasureOffer.Bin.Main.ScrollingFrame;
    local l_Template_1 = l_ScrollingFrame_2.Template;
    l_Template_1.Parent = nil;
    local v271 = {};
    for v272, v273 in v17 do
        local v274 = l_Template_1:Clone();
        v274.Name = "Tier" .. v272;
        v274.LayoutOrder = v272;
        v274.Visible = true;
        local v275 = nil;
        local v276 = nil;
        if v273.reward.type == "Unit" then
            v275 = select(2, v27:GetRarity(v273.reward.name));
            v29:SetImage(v274.Container.Inner.Icon, v273.reward.name);
        else
            local l_v15_ByItemName_2 = v15:GetByItemName(v273.reward.name);
            v276 = l_v15_ByItemName_2 and l_v15_ByItemName_2.icon;
            v275 = v20:GetRewardRarity(v273.reward);
            v274.Container.Inner.Icon.Image = v276 or "";
        end;
        if v275 then
            v266.rgbHandler:AddObject(v274.Container.Inner.Backdrop, v275);
        end;
        v274.Container.Amount.Text = ("x%*"):format(v273.reward.amount or 1);
        if v273.isFree then
            v274.Container.Buy.Content.Free.Visible = true;
            v274.Container.Buy.Content.Robux.Visible = false;
        else
            v45:PromiseProductInfo(v273.purchaseName, Enum.InfoType.Product):andThen(function(v278) --[[ Line: 1169 ]]
                -- upvalues: v274 (copy)
                v274.Container.Buy.Content.Robux.Amount.Text = v278.PriceInRobux or "???";
                v274.Container.Buy.Content.Free.Visible = false;
                v274.Container.Buy.Content.Robux.Visible = true;
            end);
        end;
        v43:HandleButton(v274.Container.Buy, function() --[[ Line: 1176 ]]
            -- upvalues: v272 (copy), v266 (copy), v17 (ref), v45 (ref)
            if v272 > v266.treasurePackData.Tier then
                return;
            else
                local v279 = v17[v266.treasurePackData.Tier];
                if not v279 then
                    return;
                else
                    v45:PromptProductPurchase(v279.purchaseName);
                    return;
                end;
            end;
        end);
        local v280 = v17[v272];
        v21.new(v274, {
            Name = v280.reward.name
        });
        v274.Parent = l_ScrollingFrame_2;
        v271[v272] = v274;
    end;
    local v281 = 1;
    local v282 = #v271;
    local function v286() --[[ Line: 1230 ]] --[[ Name: updateOrder ]]
        -- upvalues: v271 (copy), v281 (ref), v282 (copy)
        for v283, v284 in v271 do
            local v285 = (v283 - v281 + v282) % v282;
            if v283 < v281 then
                v285 = v285 + v282;
            end;
            v284.Container.Buy.Content.Disabled.Visible = v283 ~= v281;
            v284.LayoutOrder = v285;
        end;
    end;
    local v287 = v44:Get(v8.Player, "TreasurePack"):expect();
    v266.treasurePackData = v287;
    v281 = v287 and v287.Tier or 1;
    local v288 = math.floor(v287.StartTime + 86400 - workspace:GetServerTimeNow());
    if v287.StartTime > 0 then
        v286();
    end;
    v44:OnChanged(v8.Player, "TreasurePack", function(v289) --[[ Line: 1257 ]]
        -- upvalues: v281 (ref), v266 (copy), v288 (ref), v286 (copy)
        v281 = v289.Tier or 1;
        v266.treasurePackData = v289;
        v288 = math.floor(v289.StartTime + 86400 - workspace:GetServerTimeNow());
        v286();
    end, true);
    v22.Simple(1, function() --[[ Line: 1265 ]]
        -- upvalues: v288 (ref), l_Header_2 (copy), v20 (ref)
        if v288 < 1 then
            return;
        else
            v288 = v288 - 1;
            l_Header_2.Timer.Text = ("Resets in %*"):format((v20:FormatTimeFromSeconds(v288)));
            return;
        end;
    end);
    v43:HandleButton(l_Info_0, function() --[[ Line: 1275 ]]
        -- upvalues: v59 (ref)
        v59:OpenFromShop();
    end);
end;
v229._setupProgressiveGemsPack = function(v290, v291) --[[ Line: 1281 ]] --[[ Name: _setupProgressiveGemsPack ]]
    -- upvalues: v32 (copy), v44 (ref), v8 (copy), v20 (copy), v22 (copy)
    local l_Main_1 = v291.LargeBin.Offer.Main;
    local l_Header_3 = l_Main_1.Header;
    local l_Buy_2 = l_Main_1.PurchaseOptions.Buy;
    local l_Gift_0 = l_Main_1.PurchaseOptions.Gift;
    local v296 = 1;
    local v297 = #v32;
    local v298 = 0;
    local v299 = false;
    v44:OnChanged(v8.Player, "GemProgressionPack", function(v300) --[[ Line: 1292 ]]
        -- upvalues: v296 (ref), v298 (ref), v297 (copy), v299 (ref), v32 (ref), l_Header_3 (copy), v20 (ref), l_Buy_2 (copy), l_Gift_0 (copy)
        v296 = v300.Tier or 1;
        v298 = v300.StartTime + 86400 - workspace:GetServerTimeNow();
        local l_v296_0 = v296;
        if v297 < v296 then
            v299 = true;
            l_v296_0 = v297;
        else
            v299 = false;
        end;
        if v32[l_v296_0] and v32[l_v296_0].purchaseName then
            local v302 = v32[l_v296_0].reward.amount or 1;
            l_Header_3.Number.Text = v20:CommaNumber(v302);
            l_Header_3.Title.Text = v20:Pluralize("Gem", v302, false);
            l_Buy_2:SetAttribute("PurchaseName", v32[l_v296_0].purchaseName);
            l_Gift_0:SetAttribute("PurchaseName", (("GemProgressionPack%*Gift"):format(l_v296_0)));
            l_Buy_2.Owned.Visible = false;
            l_Buy_2.Content.Visible = true;
        else
            l_Buy_2.Owned.Visible = true;
            l_Buy_2.Content.Visible = false;
        end;
        if v299 then
            l_Buy_2.Owned.Visible = true;
            l_Buy_2.Content.Visible = false;
        end;
    end, true);
    v22.Simple(1, function() --[[ Line: 1326 ]]
        -- upvalues: v298 (ref), v296 (ref), v291 (copy), v20 (ref)
        v298 = v298 - 1;
        if v296 < 1 then
            v291.LargeBin.Offer.Countdown.Visible = false;
            return;
        elseif v298 < 1 then
            v291.LargeBin.Offer.Countdown.Visible = false;
            return;
        else
            v291.LargeBin.Offer.Countdown.Text = ("Resets In: %*"):format((v20:FormatTimeFromSeconds(v298)));
            v291.LargeBin.Offer.Countdown.Visible = true;
            return;
        end;
    end);
    v290:_handlePurchaseButton(l_Buy_2, function() --[[ Line: 1343 ]]
        -- upvalues: v299 (ref)
        return not v299;
    end, function(v303) --[[ Line: 1345 ]]
        -- upvalues: l_Buy_2 (copy)
        l_Buy_2.Content.Amount.Original.OriginalAmount.Text = v303 * 2;
    end);
end;
v229._setupSecretTreasurePack = function(v304, v305) --[[ Line: 1350 ]] --[[ Name: _setupSecretTreasurePack ]]
    -- upvalues: v18 (copy), v44 (ref), v8 (copy), v20 (copy), v22 (copy)
    local l_Main_2 = v305.Main;
    local l_Header_4 = l_Main_2.Header;
    local l_Buy_3 = l_Main_2.Buy;
    local l_Gift_1 = l_Main_2.Gift;
    local v310 = 1;
    local v311 = #v18;
    local v312 = 0;
    local v313 = false;
    v44:OnChanged(v8.Player, "SecretTreasurePack", function(v314) --[[ Line: 1361 ]]
        -- upvalues: v310 (ref), v312 (ref), v311 (copy), v313 (ref), v18 (ref), l_Header_4 (copy), v20 (ref), l_Buy_3 (copy), l_Gift_1 (copy)
        v310 = v314.Tier or 1;
        v312 = v314.StartTime + 86400 - workspace:GetServerTimeNow();
        local l_v310_0 = v310;
        if v311 < v310 then
            v313 = true;
            l_v310_0 = v311;
        else
            v313 = false;
        end;
        if v18[l_v310_0] and v18[l_v310_0].purchaseName then
            local v316 = v18[l_v310_0].reward.amount or 1;
            l_Header_4.Number.Text = v316;
            l_Header_4.Title.Text = v20:Pluralize("Secret Chest", v316, false);
            l_Buy_3:SetAttribute("PurchaseName", v18[l_v310_0].purchaseName);
            l_Gift_1:SetAttribute("PurchaseName", (("SecretChestOffer%*Gift"):format(l_v310_0)));
            l_Buy_3.Owned.Visible = false;
            l_Buy_3.Content.Visible = true;
        else
            l_Buy_3.Owned.Visible = true;
            l_Buy_3.Content.Visible = false;
        end;
        if v313 then
            l_Buy_3.Owned.Visible = true;
            l_Buy_3.Content.Visible = false;
        end;
    end, true);
    v22.Simple(1, function() --[[ Line: 1395 ]]
        -- upvalues: v312 (ref), v310 (ref), l_Main_2 (copy), v20 (ref)
        v312 = v312 - 1;
        if v310 < 1 then
            l_Main_2.Countdown.Visible = false;
            return;
        elseif v312 < 1 then
            l_Main_2.Countdown.Visible = false;
            return;
        else
            l_Main_2.Countdown.Text = ("Resets In: %*"):format((v20:FormatTimeFromSeconds(v312)));
            l_Main_2.Countdown.Visible = true;
            return;
        end;
    end);
    v304:_handlePurchaseButton(l_Buy_3, function() --[[ Line: 1412 ]]
        -- upvalues: v313 (ref)
        return not v313;
    end);
end;
v229._setupChallengerCratePack = function(v317, v318) --[[ Line: 1417 ]] --[[ Name: _setupChallengerCratePack ]]
    -- upvalues: v31 (copy), v44 (ref), v8 (copy), v20 (copy), v22 (copy)
    local l_EliteChallengeBundle_0 = v318.Bin.Main.EliteChallengeBundle;
    local l_Header_5 = l_EliteChallengeBundle_0.Header;
    local l_Buy_4 = l_EliteChallengeBundle_0.Buy;
    local v322 = 1;
    local v323 = #v31;
    local v324 = 0;
    local v325 = false;
    v317:_handlePurchaseButton(l_Buy_4, function() --[[ Line: 1427 ]]
        -- upvalues: v325 (ref)
        return not v325;
    end);
    v44:OnChanged(v8.Player, "ChallengeCratePack", function(v326) --[[ Line: 1431 ]]
        -- upvalues: v322 (ref), v324 (ref), v323 (copy), v325 (ref), v31 (ref), l_Header_5 (copy), v20 (ref), l_Buy_4 (copy), v318 (copy)
        v322 = v326.Tier or 1;
        v324 = v326.StartTime + 86400 - workspace:GetServerTimeNow();
        local l_v322_0 = v322;
        if v323 < v322 then
            v325 = true;
            l_v322_0 = v323;
        else
            v325 = false;
        end;
        if v31[l_v322_0] and v31[l_v322_0].purchaseName then
            local v328 = v31[l_v322_0].reward.amount or 1;
            l_Header_5.Title.Text = v328 .. " " .. v20:Pluralize("Crate", v328, false);
            l_Buy_4:SetAttribute("PurchaseName", v31[l_v322_0].purchaseName);
            l_Buy_4.Owned.Visible = false;
            l_Buy_4.Content.Visible = true;
        else
            l_Buy_4.Owned.Visible = true;
            l_Buy_4.Content.Visible = false;
        end;
        v318.Visible = not v325;
        if v325 then
            l_Buy_4.Owned.Visible = true;
            l_Buy_4.Content.Visible = false;
        end;
    end, true);
    v22.Simple(1, function() --[[ Line: 1466 ]]
        -- upvalues: v324 (ref), v322 (ref), l_EliteChallengeBundle_0 (copy), v20 (ref)
        v324 = v324 - 1;
        if v322 < 1 then
            l_EliteChallengeBundle_0.Countdown.Visible = false;
            return;
        elseif v324 < 1 then
            l_EliteChallengeBundle_0.Countdown.Visible = false;
            return;
        else
            l_EliteChallengeBundle_0.Countdown.Text = ("Resets In: %*"):format((v20:FormatTimeFromSeconds(v324)));
            l_EliteChallengeBundle_0.Countdown.Visible = true;
            return;
        end;
    end);
end;
v229._handlePurchaseButton = function(_, v330, v331, v332) --[[ Line: 1484 ]] --[[ Name: _handlePurchaseButton ]]
    -- upvalues: v45 (ref), v8 (copy), v44 (ref), v43 (ref)
    local l_v330_Attribute_0 = v330:GetAttribute("PurchaseName");
    local l_v330_Attribute_1 = v330:GetAttribute("PurchaseType");
    local l_v330_Attribute_2 = v330:GetAttribute("OwnedDataKey");
    local l_v330_Attribute_3 = v330:GetAttribute("OwnedItemKey");
    if not l_v330_Attribute_0 or not l_v330_Attribute_1 then
        return;
    else
        local l_Product_0 = Enum.InfoType.Product;
        local v338 = false;
        local function v345() --[[ Line: 1497 ]] --[[ Name: update ]]
            -- upvalues: l_v330_Attribute_0 (ref), v330 (copy), l_v330_Attribute_1 (ref), l_v330_Attribute_2 (ref), l_v330_Attribute_3 (ref), v338 (ref), l_Product_0 (ref), v45 (ref), v8 (ref), v44 (ref), v332 (copy)
            l_v330_Attribute_0 = v330:GetAttribute("PurchaseName");
            l_v330_Attribute_1 = v330:GetAttribute("PurchaseType");
            l_v330_Attribute_2 = v330:GetAttribute("OwnedDataKey");
            l_v330_Attribute_3 = v330:GetAttribute("OwnedItemKey");
            v338 = false;
            if not l_v330_Attribute_0 or not l_v330_Attribute_1 then
                return;
            else
                if l_v330_Attribute_1 ~= "DevProducts" then
                    l_Product_0 = Enum.InfoType.GamePass;
                    v330.Owned.Visible = v338;
                    v45:ListenToGamepassOwned(v8.Player, l_v330_Attribute_0, function(v339) --[[ Line: 1512 ]]
                        -- upvalues: v330 (ref), v338 (ref)
                        v330.Owned.Visible = v339;
                        v330.Content.Visible = not v339;
                        v338 = v339;
                    end, true);
                elseif l_v330_Attribute_1 == "DevProducts" then
                    if l_v330_Attribute_2 ~= nil then
                        v44:OnChanged(v8.Player, l_v330_Attribute_2, function(v340) --[[ Line: 1519 ]]
                            -- upvalues: v330 (ref), v338 (ref)
                            v330.Owned.Visible = v340;
                            v330.Content.Visible = not v340;
                            v338 = v340;
                        end, true);
                    end;
                    if l_v330_Attribute_3 ~= nil then
                        v44:OnChanged(v8.Player, "Inventory", function(v341) --[[ Line: 1527 ]]
                            -- upvalues: l_v330_Attribute_3 (ref), v330 (ref), v338 (ref)
                            local v342 = v341[l_v330_Attribute_3] ~= nil;
                            v330.Owned.Visible = v342;
                            v330.Content.Visible = not v342;
                            v338 = v342;
                        end, true);
                    end;
                end;
                local l_FirstChild_1 = v330.Content:FindFirstChild("Amount", true);
                if l_FirstChild_1 then
                    v45:PromiseProductInfo(l_v330_Attribute_0, l_Product_0):andThen(function(v344) --[[ Line: 1539 ]]
                        -- upvalues: v330 (ref), l_FirstChild_1 (ref), v332 (ref)
                        if not v330.Parent then
                            return;
                        else
                            if not l_FirstChild_1:IsA("TextLabel") then
                                l_FirstChild_1 = l_FirstChild_1:FindFirstChild("Amount");
                            end;
                            l_FirstChild_1.Text = v344.PriceInRobux or "???";
                            if v332 and typeof(v332) == "function" then
                                task.spawn(v332, v344.PriceInRobux);
                            end;
                            return;
                        end;
                    end);
                end;
                return;
            end;
        end;
        v345();
        v330:GetAttributeChangedSignal("PurchaseName"):Connect(v345);
        v330:GetAttributeChangedSignal("PurchaseType"):Connect(v345);
        v330:GetAttributeChangedSignal("OwnedDataKey"):Connect(v345);
        v330:GetAttributeChangedSignal("OwnedItemKey"):Connect(v345);
        v43:HandleButton(v330, function() --[[ Line: 1564 ]]
            -- upvalues: v338 (ref), v331 (copy), v330 (copy), l_v330_Attribute_1 (ref), v45 (ref), l_v330_Attribute_0 (ref)
            if v338 then
                return;
            elseif v331 ~= nil and not v331(v330) then
                return;
            elseif l_v330_Attribute_1 == "DevProducts" then
                v45:PromptProductPurchase(l_v330_Attribute_0);
                return;
            else
                v45:PromptGamepassPurchase(l_v330_Attribute_0);
                return;
            end;
        end);
        return;
    end;
end;
v229._connectPurchases = function(v346, v347) --[[ Line: 1581 ]] --[[ Name: _connectPurchases ]]
    for _, v349 in v347:GetDescendants() do
        if v349:IsA("GuiButton") and not v349:GetAttribute("IgnoreInitialSetup") then
            v346:_handlePurchaseButton(v349);
        end;
    end;
end;
v229._connectFreeStorage = function(v350) --[[ Line: 1599 ]] --[[ Name: _connectFreeStorage ]]
    -- upvalues: v44 (ref), v8 (copy), v23 (copy), v45 (ref), v43 (ref), v46 (ref)
    local l_Bin_1 = v350.bin["Unit Storage"].Bin;
    local l_Main_3 = l_Bin_1.Storage100.Main;
    local l_Buy_5 = l_Main_3.PurchaseOptions.Buy;
    local l_Gift_2 = l_Main_3.PurchaseOptions.Gift;
    local v355 = v44:Get(v8.Player, "ClaimedFreeStorage"):expect() or false;
    local v356 = v44:Get(v8.Player, "StorageUpgrades"):expect() or 0;
    local v357 = v23.MAX_STORAGE_UPGRADE <= v356;
    local function _() --[[ Line: 1609 ]] --[[ Name: updateVisuals ]]
        -- upvalues: l_Buy_5 (copy), v355 (ref), v357 (ref), l_Gift_2 (copy), l_Bin_1 (copy), l_Main_3 (copy), v356 (ref), v23 (ref)
        l_Buy_5.Content.Free.Visible = not v355;
        l_Buy_5.Content.Robux.Visible = v355;
        l_Buy_5.Content.Disabled.Visible = v357;
        l_Gift_2.Visible = v355;
        l_Bin_1.FreeGiftMessage.Visible = not v355;
        l_Main_3.UpgradeCount.Count.Text = ("(%*/%*)"):format(v356, v23.MAX_STORAGE_UPGRADE);
        l_Main_3.UpgradeCount.Visible = v355;
    end;
    l_Buy_5.Content.Free.Visible = not v355;
    l_Buy_5.Content.Robux.Visible = v355;
    l_Buy_5.Content.Disabled.Visible = v357;
    l_Gift_2.Visible = v355;
    l_Bin_1.FreeGiftMessage.Visible = not v355;
    l_Main_3.UpgradeCount.Count.Text = ("(%*/%*)"):format(v356, v23.MAX_STORAGE_UPGRADE);
    l_Main_3.UpgradeCount.Visible = v355;
    v45:PromiseProductInfo("StorageUpgrade", Enum.InfoType.Product):andThen(function(v359) --[[ Line: 1621 ]]
        -- upvalues: l_Buy_5 (copy)
        l_Buy_5.Content.Robux.Amount.Text = v359.PriceInRobux;
    end);
    v44:OnChanged(v8.Player, "ClaimedFreeStorage", function(v360) --[[ Line: 1625 ]]
        -- upvalues: v355 (ref), l_Buy_5 (copy), v357 (ref), l_Gift_2 (copy), l_Bin_1 (copy), l_Main_3 (copy), v356 (ref), v23 (ref)
        v355 = v360;
        l_Buy_5.Content.Free.Visible = not v355;
        l_Buy_5.Content.Robux.Visible = v355;
        l_Buy_5.Content.Disabled.Visible = v357;
        l_Gift_2.Visible = v355;
        l_Bin_1.FreeGiftMessage.Visible = not v355;
        l_Main_3.UpgradeCount.Count.Text = ("(%*/%*)"):format(v356, v23.MAX_STORAGE_UPGRADE);
        l_Main_3.UpgradeCount.Visible = v355;
    end);
    v44:OnChanged(v8.Player, "StorageUpgrades", function(v361) --[[ Line: 1630 ]]
        -- upvalues: v356 (ref), v357 (ref), v23 (ref), l_Buy_5 (copy), v355 (ref), l_Gift_2 (copy), l_Bin_1 (copy), l_Main_3 (copy)
        v356 = v361;
        v357 = v356 >= v23.MAX_STORAGE_UPGRADE;
        l_Buy_5.Content.Free.Visible = not v355;
        l_Buy_5.Content.Robux.Visible = v355;
        l_Buy_5.Content.Disabled.Visible = v357;
        l_Gift_2.Visible = v355;
        l_Bin_1.FreeGiftMessage.Visible = not v355;
        l_Main_3.UpgradeCount.Count.Text = ("(%*/%*)"):format(v356, v23.MAX_STORAGE_UPGRADE);
        l_Main_3.UpgradeCount.Visible = v355;
    end);
    local v362 = false;
    v43:HandleButton(l_Buy_5, function() --[[ Line: 1638 ]]
        -- upvalues: v362 (ref), v355 (ref), v46 (ref), v357 (ref), v45 (ref)
        if v362 then
            return;
        elseif not v355 then
            v362 = true;
            v46:ClaimFreeStorageGift():andThen(function() --[[ Line: 1646 ]]
                -- upvalues: v362 (ref)
                v362 = false;
            end):catch(function() --[[ Line: 1648 ]]
                -- upvalues: v362 (ref)
                v362 = false;
            end);
            return;
        elseif v357 then
            return;
        else
            v45:PromptProductPurchase("StorageUpgrade");
            return;
        end;
    end);
    local l_l_Gift_2_Attribute_0 = l_Gift_2:GetAttribute("PurchaseName");
    v43:HandleButton(l_Gift_2, function() --[[ Line: 1664 ]]
        -- upvalues: l_l_Gift_2_Attribute_0 (copy), v45 (ref)
        if not l_l_Gift_2_Attribute_0 then
            return;
        else
            v45:PromptProductPurchase(l_l_Gift_2_Attribute_0);
            return;
        end;
    end);
end;
v229._setupDailyTreasure = function(v364) --[[ Line: 1673 ]] --[[ Name: _setupDailyTreasure ]]
    -- upvalues: v44 (ref), v8 (copy), v22 (copy), v20 (copy), v43 (ref), v49 (ref), v50 (ref)
    local l_Main_4 = v364.bin.FreeDailyChest.LargeBin.Main;
    local l_Header_6 = l_Main_4.Header;
    local l_Buy_6 = l_Main_4.Buy;
    local _ = l_Main_4.Info;
    local v369 = false;
    local v370 = false;
    local v371 = v44:Get(v8.Player, "LastDailyTreasure"):expect() or 0;
    local v372 = 86400;
    local function _() --[[ Line: 1687 ]] --[[ Name: update ]]
        -- upvalues: v372 (ref), v371 (ref), v369 (ref)
        v372 = math.clamp(86400 - (workspace:GetServerTimeNow() - v371), 0, 86400);
        v369 = v372 < 1;
    end;
    v22.Simple(1, function() --[[ Line: 1693 ]]
        -- upvalues: v372 (ref), v369 (ref), v370 (ref), l_Buy_6 (copy), l_Header_6 (copy), v20 (ref)
        v372 = v372 - 1;
        v369 = v372 < 1;
        if v370 then
            l_Buy_6.Content.Disabled.Visible = true;
        else
            l_Buy_6.Content.Disabled.Visible = not v369;
        end;
        if v372 < 1 then
            l_Header_6.DailyRefresh.Timer.Text = "Available Now!";
            return;
        else
            l_Header_6.DailyRefresh.Timer.Text = ("Claim in: %*"):format((v20:FormatTimeFromSeconds(v372)));
            return;
        end;
    end);
    v372 = math.clamp(86400 - (workspace:GetServerTimeNow() - v371), 0, 86400);
    v369 = v372 < 1;
    v44:OnChanged(v8.Player, "LastDailyTreasure", function(v374) --[[ Line: 1713 ]]
        -- upvalues: v371 (ref), v372 (ref), v369 (ref)
        v371 = v374;
        v372 = math.clamp(86400 - (workspace:GetServerTimeNow() - v371), 0, 86400);
        v369 = v372 < 1;
    end);
    v43:HandleButton(l_Buy_6, function() --[[ Line: 1718 ]]
        -- upvalues: v370 (ref), v369 (ref), l_Buy_6 (copy), v49 (ref), v50 (ref)
        if v370 or not v369 then
            return;
        else
            v370 = true;
            l_Buy_6.Content.Disabled.Visible = true;
            v49:ClaimDailyTreasure():andThen(function(v375) --[[ Line: 1726 ]]
                -- upvalues: v50 (ref)
                if not v375 then
                    return;
                else
                    v50:PlaySound({
                        name = "UI.Success", 
                        soundGroup = "Master.SFX.UI"
                    });
                    return;
                end;
            end):finally(function() --[[ Line: 1735 ]]
                -- upvalues: v370 (ref)
                task.delay(3, function() --[[ Line: 1736 ]]
                    -- upvalues: v370 (ref)
                    v370 = false;
                end);
            end);
            return;
        end;
    end);
end;
v229._setupOneTimePacks = function(v376) --[[ Line: 1744 ]] --[[ Name: _setupOneTimePacks ]]
    -- upvalues: v44 (ref), v8 (copy)
    local l_FeaturedBundles_0 = v376.bin.FeaturedBundles;
    local l_Bin_2 = l_FeaturedBundles_0.Bin;
    v44:OnChanged(v8.Player, "PacksPurchased", function(v379) --[[ Line: 1748 ]] --[[ Name: update ]]
        -- upvalues: l_Bin_2 (copy), l_FeaturedBundles_0 (copy)
        for _, v381 in l_Bin_2:GetChildren() do
            if v381:IsA("Frame") then
                if v379[v381.Name] then
                    v381.Visible = false;
                else
                    local l_v381_Attribute_0 = v381:GetAttribute("DependantBundle");
                    if not l_v381_Attribute_0 then
                        v381.Visible = true;
                    else
                        v381.Visible = v379[l_v381_Attribute_0] or false;
                    end;
                end;
            end;
        end;
        local v383 = 0;
        for _, v385 in l_Bin_2:GetChildren() do
            if v385:IsA("Frame") and v385.Visible then
                v383 = v383 + 1;
            end;
        end;
        l_FeaturedBundles_0.Visible = v383 > 0;
    end, true);
end;
v229._connectWhalePurchases = function(v386) --[[ Line: 1788 ]] --[[ Name: _connectWhalePurchases ]]
    -- upvalues: v8 (copy), v53 (ref), v45 (ref), v44 (ref)
    local l_ExoticBundle_0 = v386.bin.ExoticBundle;
    local v388 = false;
    local function v389() --[[ Line: 1792 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v388 (ref), v8 (ref), l_ExoticBundle_0 (copy), v53 (ref)
        v388 = v8.Player:GetAttribute("IsWhale") or false;
        l_ExoticBundle_0.Visible = v388;
        if v388 then
            v53:ReportWhaleShopOffer();
        end;
    end;
    v388 = v8.Player:GetAttribute("IsWhale") or false;
    l_ExoticBundle_0.Visible = v388;
    if v388 then
        v53:ReportWhaleShopOffer();
    end;
    v8.Player:GetAttributeChangedSignal("IsWhale"):Connect(v389);
    local l_v45_Product_0 = v45:GetProduct("ExoticBundle");
    local v391 = l_v45_Product_0 and l_v45_Product_0.purchaseData.bundle.maxPurchases or 1e999;
    v44:OnChanged(v8.Player, "BundlePurchases", function(v392) --[[ Line: 1810 ]]
        -- upvalues: l_ExoticBundle_0 (copy), v388 (ref), v391 (copy)
        local v393 = v392.ExoticBundle or 0;
        l_ExoticBundle_0.Visible = v388 and v393 < v391;
    end, true);
end;
v229._setupDragonCapsulePack = function(v394, v395) --[[ Line: 1936 ]] --[[ Name: _setupDragonCapsulePack ]]
    -- upvalues: v33 (copy), v44 (ref), v8 (copy), v20 (copy), v22 (copy), v52 (ref), v30 (copy), v29 (copy), v27 (copy), v21 (copy)
    local l_Main_5 = v395.Bin.Main;
    local l_Header_7 = v395.Header;
    local l_DragonCapsuleBundle_0 = l_Main_5.DragonCapsuleBundle;
    local l_Buy_7 = l_DragonCapsuleBundle_0.Buy;
    local l_Units_0 = l_Main_5.Units;
    local l_VariantChances_0 = l_Main_5.VariantChances;
    local v402 = 1;
    local v403 = #v33;
    local v404 = 0;
    local v405 = false;
    if v395:HasTag("RNGShopItem") and v394.PaidItemsRestricted then
        return;
    else
        v44:OnChanged(v8.Player, "DNDCratePacks", function(v406) --[[ Line: 1956 ]]
            -- upvalues: v402 (ref), v404 (ref), v403 (copy), v405 (ref), v33 (ref), l_DragonCapsuleBundle_0 (copy), v20 (ref), l_Buy_7 (copy)
            v402 = v406.Tier or 1;
            v404 = v406.StartTime + 86400 - workspace:GetServerTimeNow();
            local l_v402_0 = v402;
            if v403 < v402 then
                v405 = true;
                l_v402_0 = v403;
            else
                v405 = false;
            end;
            if v33[l_v402_0] and v33[l_v402_0].purchaseName then
                local v408 = v33[l_v402_0].reward.amount or 1;
                local v409 = v33[l_v402_0].freeAmount or 0;
                local v410 = math.clamp(v408 - v409, 0, v408);
                if v409 > 0 then
                    l_DragonCapsuleBundle_0.Header.Bonus.Text = ("(%* + %* BONUS)"):format(v410, v409);
                else
                    l_DragonCapsuleBundle_0.Header.Bonus.Text = "";
                end;
                l_DragonCapsuleBundle_0.Header.Title.Text = v20:CommaNumber(v408) .. " " .. v20:Pluralize("Capsule", v408);
                l_Buy_7:SetAttribute("PurchaseName", v33[l_v402_0].purchaseName);
                l_Buy_7.Owned.Visible = false;
                l_Buy_7.Content.Visible = true;
            else
                l_Buy_7.Owned.Visible = true;
                l_Buy_7.Content.Visible = false;
            end;
            if v405 then
                l_Buy_7.Owned.Visible = true;
                l_Buy_7.Content.Visible = false;
            end;
        end, true);
        v22.Simple(1, function() --[[ Line: 2000 ]]
            -- upvalues: v404 (ref), v402 (ref), l_DragonCapsuleBundle_0 (copy), v20 (ref)
            v404 = v404 - 1;
            if v402 < 1 then
                l_DragonCapsuleBundle_0.Countdown.Visible = false;
                return;
            elseif v404 < 1 then
                l_DragonCapsuleBundle_0.Countdown.Visible = false;
                return;
            else
                l_DragonCapsuleBundle_0.Countdown.Text = ("Resets In: %*"):format((v20:FormatTimeFromSeconds(v404)));
                l_DragonCapsuleBundle_0.Countdown.Visible = true;
                return;
            end;
        end);
        v52:ObserveTimeLeft(function(v411, _) --[[ Line: 2017 ]]
            -- upvalues: l_Header_7 (copy), v20 (ref), v394 (copy), v395 (copy)
            l_Header_7.Timer.Text = ("Event Ends In %*"):format((v20:FormatTimeFromSeconds(v411, true)));
            v394.bin.NewArrivals.Visible = v411 >= 1;
            v395.Visible = v411 >= 1;
        end);
        v394:_handlePurchaseButton(l_Buy_7, function() --[[ Line: 2023 ]]
            -- upvalues: v405 (ref)
            return not v405;
        end, function(_) --[[ Line: 2025 ]]

        end);
        local l_v30_RarityPool_1 = v30:GetRarityPool("DragonEgg");
        local l_v30_LootPool_1 = v30:GetLootPool("DragonEgg");
        local l_v30_VariantPool_0 = v30:GetVariantPool("DragonEgg");
        local v417 = {};
        for v418, v419 in l_v30_RarityPool_1 do
            table.insert(v417, {
                rarity = v418, 
                weight = v419.weight
            });
        end;
        table.sort(v417, function(v420, v421) --[[ Line: 2046 ]]
            return v420.weight > v421.weight;
        end);
        local v422 = 1;
        for _, v424 in v417 do
            for _, v426 in l_v30_LootPool_1[v424.rarity] do
                local l_l_Units_0_FirstChild_0 = l_Units_0:FindFirstChild((tostring(v422)));
                if l_l_Units_0_FirstChild_0 then
                    v29:SetImage(l_l_Units_0_FirstChild_0.Inner.Icon, v426.Name or v426.name);
                    l_l_Units_0_FirstChild_0.Inner.Chance.Text = ("%*%%"):format(v426.weight or 0);
                    l_l_Units_0_FirstChild_0.Inner.Icon.ImageColor3 = v424.rarity == "Secret" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1);
                    local v428 = select(2, v27:GetRarity(v426.Name or v426.name));
                    v394.rgbHandler:AddObject(l_l_Units_0_FirstChild_0.Backdrop, v428);
                    v394.rgbHandler:AddObject(l_l_Units_0_FirstChild_0.Glow, v428);
                    v21.new(l_l_Units_0_FirstChild_0, {
                        Name = v426.Name or v426.name, 
                        IsUnit = true, 
                        IsSecretUnit = function() --[[ Line: 2074 ]] --[[ Name: IsSecretUnit ]]
                            -- upvalues: v424 (copy)
                            return v424.rarity == "Secret";
                        end
                    });
                    v422 = v422 + 1;
                end;
            end;
        end;
        local v429 = l_v30_VariantPool_0 or {};
        for v430, v431 in v429 do
            local l_weight_0 = v431.weight;
            if l_weight_0 then
                local l_l_VariantChances_0_FirstChild_0 = l_VariantChances_0:FindFirstChild(v430);
                if l_l_VariantChances_0_FirstChild_0 then
                    l_l_VariantChances_0_FirstChild_0.Amount.Text = ("%*%%"):format(l_weight_0);
                end;
            end;
        end;
        return;
    end;
end;
v229._setupHydraCrateOffer = function(v434) --[[ Line: 2101 ]] --[[ Name: _setupHydraCrateOffer ]]
    -- upvalues: v30 (copy), v27 (copy), v21 (copy), v34 (copy), v22 (copy), v20 (copy)
    local l_HydraCrates_0 = v434.bin:FindFirstChild("HydraCrates");
    local l_v30_RarityPool_2 = v30:GetRarityPool("HydraCrate");
    local l_v30_LootPool_2 = v30:GetLootPool("HydraCrate");
    v434.hydraCrateVisuals = {};
    if not l_v30_RarityPool_2 or not l_HydraCrates_0 then
        return;
    elseif v434.PaidItemsRestricted then
        l_HydraCrates_0:Destroy();
        return;
    else
        local v438 = {};
        for v439, v440 in l_v30_RarityPool_2 do
            table.insert(v438, {
                rarity = v439, 
                weight = v440.weight or v440.Weight or 1
            });
        end;
        table.sort(v438, function(v441, v442) --[[ Line: 2128 ]]
            return v441.weight > v442.weight;
        end);
        for v443, v444 in v438 do
            local l_FirstChild_2 = l_HydraCrates_0.LargeBin.Main.Bin:FindFirstChild(v443);
            if l_FirstChild_2 then
                local v446 = l_v30_LootPool_2[v444.rarity] and table.clone(l_v30_LootPool_2[v444.rarity][1]);
                local v447 = v446 and v446.extraData;
                local v448 = select(2, v27:GetRarity(v446.name or v446.Name, true));
                if v448 then
                    l_FirstChild_2.Backdrop:SetAttribute("Rarity", v448);
                    l_FirstChild_2.Glow:SetAttribute("Rarity", v448);
                    table.insert(v434.hydraCrateVisuals, l_FirstChild_2.Backdrop);
                    table.insert(v434.hydraCrateVisuals, l_FirstChild_2.Glow);
                end;
                if v447 then
                    v447.Name = v446.name or v446.Name;
                    v447.Mega = v447.Wumbo or false;
                    v447.Shiny = v447.Shiny or false;
                    if not v447.Level then
                        v447.Level = 1;
                    end;
                end;
                local l_new_1 = v21.new;
                local l_l_FirstChild_2_0 = l_FirstChild_2;
                local v451 = {
                    Name = v446.name or v446.Name, 
                    UnitData = v447, 
                    IsUnit = true
                };
                local v452 = {};
                local v453 = false;
                if v447.Shiny == false then
                    v453 = v447.Wumbo == false;
                end;
                v452.Normal = v453;
                v452.Shiny = v447.Shiny or false;
                v452.Mega = v447.Wumbo or false;
                v453 = false;
                if v447.Shiny == true then
                    v453 = v447.Wumbo == true;
                end;
                v452.ShinyMega = v453;
                v451.ExtraData = v452;
                l_new_1 = l_new_1(l_l_FirstChild_2_0, v451);
                l_FirstChild_2.Inner.Chance.Text = ("%*%%"):format(v444.weight or 1);
            end;
        end;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v455 = math.clamp(v34:GetForCTUnix({
            year = 2025, 
            month = 5, 
            day = 19, 
            hour = 23, 
            minute = 59, 
            second = 59
        }) - l_workspace_ServerTimeNow_0, 0, 1e999);
        if v455 < 1 then
            l_HydraCrates_0.Visible = false;
            return;
        else
            local v456 = nil;
            v456 = v22.Simple(1, function() --[[ Line: 2187 ]]
                -- upvalues: v455 (ref), v456 (ref), l_HydraCrates_0 (copy), v20 (ref)
                if v455 < 1 then
                    v456:Disconnect();
                    v456 = nil;
                    l_HydraCrates_0.Visible = false;
                    return;
                else
                    v455 = v455 - 1;
                    l_HydraCrates_0.Header.Timer.Text = ("Offer Ends In %*"):format((v20:SecondsToClock(v455)));
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v229._setupExoticChestChances = function(_, v458) --[[ Line: 2200 ]] --[[ Name: _setupExoticChestChances ]]
    -- upvalues: v30 (copy), v38 (copy)
    local l_Units_1 = v458.Main.Units;
    local l_Template_2 = l_Units_1.Template;
    local l_Exotic_0 = v30:GetLootPool("TreasureChest").Exotic;
    v38.new(l_Exotic_0, {
        template = l_Template_2, 
        parent = l_Units_1
    });
end;
v229._setupPetEquipOffer = function(v462, v463) --[[ Line: 2214 ]] --[[ Name: _setupPetEquipOffer ]]
    -- upvalues: v44 (ref), v8 (copy), v23 (copy)
    local l_Main_6 = v463.Main;
    local l_Count_0 = l_Main_6.UpgradeCount.Count;
    local l_Buy_8 = l_Main_6.PurchaseOptions.Buy;
    local v467 = false;
    v44:OnChanged(v8.Player, "PurchasedPetSlots", function(v468) --[[ Line: 2221 ]]
        -- upvalues: v467 (ref), v23 (ref), l_Buy_8 (copy), l_Count_0 (copy)
        v467 = v23.PETS.MAX_PURCHASED_SLOTS <= v468;
        l_Buy_8.Content.Disabled.Visible = v467;
        l_Count_0.Text = ("(%*/%*)"):format(v468, v23.PETS.MAX_PURCHASED_SLOTS);
    end, true);
    v462:_handlePurchaseButton(l_Buy_8, function() --[[ Line: 2227 ]]
        -- upvalues: v467 (ref)
        return not v467;
    end);
end;
v229._setupOPChestBundle = function(v469, v470) --[[ Line: 2232 ]] --[[ Name: _setupOPChestBundle ]]
    -- upvalues: v45 (ref), v44 (ref), v8 (copy)
    local l_Buy_9 = v470.Buttons.Buy;
    local l_v45_Product_1 = v45:GetProduct("AllInOneBundle");
    local v473 = l_v45_Product_1 and l_v45_Product_1.purchaseData.bundle.maxPurchases;
    local v474 = false;
    v44:OnChanged(v8.Player, "BundlePurchases", function(v475) --[[ Line: 2240 ]]
        -- upvalues: v474 (ref), v473 (copy), l_Buy_9 (copy)
        v474 = (v475.OPChestBundle or 0) >= v473;
        l_Buy_9.Content.Unsorted.Disabled.Visible = v474;
        l_Buy_9.Glow_Buy.Visible = not v474;
        l_Buy_9.Discount.Visible = not v474;
    end, true);
    v469:_handlePurchaseButton(l_Buy_9, function() --[[ Line: 2248 ]]
        -- upvalues: v474 (ref)
        return not v474;
    end);
end;
v229._setupChestForeverPack = function(v476, v477) --[[ Line: 2253 ]] --[[ Name: _setupChestForeverPack ]]
    -- upvalues: v44 (ref), v8 (copy), v10 (copy), l_TweenService_0 (copy), v11 (copy), v40 (copy), v39 (copy), v45 (ref), v27 (copy), v29 (copy), v20 (copy), v43 (ref), v47 (ref), v50 (ref), v21 (copy), v22 (copy)
    local l_ScrollingFrame_3 = v477.Bin.Main.ScrollingFrame;
    l_ScrollingFrame_3.ScrollingEnabled = false;
    l_ScrollingFrame_3.CanvasPosition = Vector2.zero;
    l_ScrollingFrame_3:GetPropertyChangedSignal("ScrollingEnabled"):Connect(function() --[[ Line: 2258 ]]
        -- upvalues: l_ScrollingFrame_3 (copy)
        l_ScrollingFrame_3.ScrollingEnabled = false;
        l_ScrollingFrame_3.CanvasPosition = Vector2.zero;
    end);
    local l_Template_3 = l_ScrollingFrame_3.Template;
    l_Template_3.Visible = false;
    local v480 = true;
    local v481 = -42;
    local v482 = v44:Get(v8.Player, "ChestForeverPack"):expect();
    local v483 = v482.Pass or 1;
    local v484 = v482.Tier or 1;
    local v485 = nil;
    local function _() --[[ Line: 2281 ]] --[[ Name: getAllItems ]]
        -- upvalues: v10 (ref), l_ScrollingFrame_3 (copy)
        return (v10.Filter(l_ScrollingFrame_3:GetChildren(), function(v486) --[[ Line: 2282 ]]
            return v486:IsA("CanvasGroup") and v486.Name ~= "Template";
        end));
    end;
    local function v493() --[[ Line: 2289 ]] --[[ Name: layoutItems ]]
        -- upvalues: v10 (ref), l_ScrollingFrame_3 (copy), l_Template_3 (copy), v481 (ref), v485 (ref)
        local v489 = v10.Filter(l_ScrollingFrame_3:GetChildren(), function(v488) --[[ Line: 2282 ]]
            return v488:IsA("CanvasGroup") and v488.Name ~= "Template";
        end);
        local l_X_0 = l_Template_3.AbsoluteSize.X;
        for v491, v492 in v489 do
            v492.Position = UDim2.new(0, (v491 - 1) * (l_X_0 + v481), 0.5, 0);
            v492.Container.Buy.Content.Disabled.Visible = v491 ~= 1;
            if v491 == 1 then
                v485 = v492;
            end;
        end;
    end;
    local function v494() --[[ Line: 2304 ]] --[[ Name: calculatePadding ]]
        -- upvalues: l_ScrollingFrame_3 (copy), v481 (ref), v493 (copy)
        v481 = -42 * (l_ScrollingFrame_3.AbsoluteSize.X / 1099.196);
        v493();
    end;
    local function v504() --[[ Line: 2312 ]] --[[ Name: shiftItemsToLeft ]]
        -- upvalues: l_Template_3 (copy), v10 (ref), l_ScrollingFrame_3 (copy), v481 (ref), l_TweenService_0 (ref), v11 (ref)
        local l_X_1 = l_Template_3.AbsoluteSize.X;
        local v497 = v10.Filter(l_ScrollingFrame_3:GetChildren(), function(v496) --[[ Line: 2282 ]]
            return v496:IsA("CanvasGroup") and v496.Name ~= "Template";
        end);
        local v498 = {};
        for _, v500 in v497 do
            local l_Position_0 = v500.Position;
            local v502 = UDim2.new(0, l_Position_0.X.Offset - (l_X_1 + v481), 0.5, 0);
            local v503 = l_TweenService_0:Create(v500, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = v502
            });
            table.insert(v498, v11.fromEvent(v503.Completed));
            v503:Play();
        end;
        return v11.allSettled(v498);
    end;
    local function v514() --[[ Line: 2335 ]] --[[ Name: createNewItem ]]
        -- upvalues: v484 (ref), v40 (ref), v482 (ref), v39 (ref), l_Template_3 (copy), l_ScrollingFrame_3 (copy), v45 (ref), v476 (copy), v27 (ref), v29 (ref), v20 (ref), v43 (ref), v480 (ref), v47 (ref)
        local _ = v484;
        local v506 = v40[v484];
        local v507 = v506 and v506.isFree or false;
        local v508 = v506 and v506.purchaseName;
        local v509 = v506 and v506.reward;
        if v482.JackpotIndex and v482.JackpotIndex == v484 then
            v509 = v39[math.clamp(v482.Pass or 1, 1, #v39)][1];
        end;
        if not v509 then
            warn("Failed to get ChestForeverPack data for index:", v484);
            return;
        else
            local v510 = l_Template_3:Clone();
            v510.Name = "Item_" .. v484;
            v510.Container.Buy.Content.Free.Visible = v507;
            v510.Container.Buy.Content.Robux.Visible = not v507;
            v510.Container.Inner.Shiny.Visible = false;
            v510.Container.Inner.Wumbo.Visible = false;
            v510.Container.Inner.Stars.Visible = false;
            v510.Container.Inner.Trait.Visible = false;
            v510.Visible = true;
            v510.Parent = l_ScrollingFrame_3;
            if v508 then
                v45:PromiseProductInfo(v508, Enum.InfoType.Product):andThen(function(v511) --[[ Line: 2365 ]]
                    -- upvalues: v510 (copy), v476 (ref)
                    if not v510:IsDescendantOf(v476.ui) then
                        return;
                    else
                        v510.Container.Buy.Content.Robux.Amount.Text = v511.PriceInRobux or 0;
                        return;
                    end;
                end):catch(function() --[[ Line: 2371 ]]
                    -- upvalues: v510 (copy), v476 (ref)
                    if not v510:IsDescendantOf(v476.ui) then
                        return;
                    else
                        v510.Container.Buy.Content.Robux.Amount.Text = "FAILED";
                        return;
                    end;
                end);
            end;
            local v512 = v509.rarity or v509.Rarity;
            local v513 = nil;
            if v509.type == "Unit" then
                v512 = select(2, v27:GetRarity(v509.name));
                v29:SetImage(v510.Container.Inner.Icon, v509.name);
                v510.Container.Amount.Text = "";
                if v509.extraData then
                    v510.Container.Inner.Shiny.Visible = v509.extraData.Shiny or false;
                    v510.Container.Inner.Wumbo.Visible = v509.extraData.Wumbo or false;
                    v510.Container.Inner.Stars.Visible = v509.extraData.Stars or false;
                    v510.Container.Inner.Trait.Visible = v509.extraData.Trait ~= nil;
                end;
            else
                v512 = v512 or v20:GetRewardRarity(v509);
                v513 = v20:GetIconFromRewardData(v509) or "";
                v510.Container.Inner.Icon.Image = v513;
                v510.Container.Amount.Text = ("x%*"):format(v509.amount or v509.Amount or 1);
            end;
            v476.rgbHandler:AddObject(v510.Container.Inner.Backdrop, v512);
            v43:HandleButton(v510.Container.Buy, function() --[[ Line: 2403 ]]
                -- upvalues: v480 (ref), v510 (copy), v47 (ref)
                if not v480 then
                    return;
                elseif v510.Position.X.Offset ~= 0 then
                    return;
                else
                    v47:ClaimTier("ChestForeverPack");
                    return;
                end;
            end);
            v484 = v484 + 1;
            if v484 > #v40 then
                v484 = 1;
            end;
            return;
        end;
    end;
    l_ScrollingFrame_3:GetPropertyChangedSignal("AbsoluteSize"):Connect(v494);
    local v515 = math.floor(v482.StartTime + 57600 - workspace:GetServerTimeNow());
    v44:OnChanged(v8.Player, "ChestForeverPack", function(v516) --[[ Line: 2431 ]]
        -- upvalues: v482 (ref), v515 (ref), v483 (ref), v484 (ref), v504 (copy), v10 (ref), l_ScrollingFrame_3 (copy), v514 (copy), v481 (ref), v493 (copy), v480 (ref), l_TweenService_0 (ref), v485 (ref), v50 (ref)
        local v517 = v482.Tier or 1;
        local v518 = v516.Tier or 1;
        if v482.StartTime ~= v516.StartTime then
            v515 = math.floor(v516.StartTime + 57600 - workspace:GetServerTimeNow());
        end;
        v482 = v516;
        if v483 < (v482.Pass or 1) then
            v483 = v482.Pass or 1;
            v484 = 1;
            v504():await();
            local v520 = v10.Filter(l_ScrollingFrame_3:GetChildren(), function(v519) --[[ Line: 2282 ]]
                return v519:IsA("CanvasGroup") and v519.Name ~= "Template";
            end);
            if v520 then
                for _, v522 in v520 do
                    v522:Destroy();
                end;
                table.clear(v520);
                v520 = nil;
            end;
            v514();
            v514();
            v514();
            v514();
            v514();
            v514();
            v481 = -42 * (l_ScrollingFrame_3.AbsoluteSize.X / 1099.196);
            v493();
            return;
        elseif v517 ~= v518 and v517 < v518 then
            v480 = false;
            local v523 = TweenInfo.new(0.25);
            local v524 = l_TweenService_0:Create(v485, v523, {
                GroupTransparency = 1
            });
            v524:Play();
            v50:PlaySound({
                name = "UI.Special_Notification", 
                soundGroup = "Master.SFX.UI", 
                properties = {
                    Volume = 1
                }
            });
            v524.Completed:Wait();
            v524:Destroy();
            v524 = nil;
            v485:Destroy();
            v485 = nil;
            v504():await();
            if v483 == (v482.Pass or 1) then
                v514();
                v493();
                v480 = true;
            end;
            return;
        else
            v480 = true;
            v483 = 1;
            v484 = 1;
            local v526 = v10.Filter(l_ScrollingFrame_3:GetChildren(), function(v525) --[[ Line: 2282 ]]
                return v525:IsA("CanvasGroup") and v525.Name ~= "Template";
            end);
            if v526 then
                for _, v528 in v526 do
                    v528:Destroy();
                end;
                table.clear(v526);
                v526 = nil;
            end;
            v514();
            v514();
            v514();
            v514();
            v514();
            v514();
            v481 = -42 * (l_ScrollingFrame_3.AbsoluteSize.X / 1099.196);
            v493();
            return;
        end;
    end);
    local v529 = v39[1][1];
    if v529 then
        local v530 = v529.name or v529.Name;
        local v531 = select(2, v27:GetRarity(v530));
        local v532 = v529.extraData or {};
        local l_Reward_0 = v477.Bin.Main.Bottom.Reward;
        l_Reward_0.Inner.Shiny.Visible = v532.Shiny or false;
        l_Reward_0.Inner.Wumbo.Visible = v532.Wumbo or false;
        local l_Stars_0 = l_Reward_0.Inner.Stars;
        local v535 = true;
        if v532.Stars == nil then
            v535 = false;
        end;
        l_Stars_0.Visible = v535;
        v29:SetImage(l_Reward_0.Inner.Icon, v530);
        v21.new(l_Reward_0, {
            IsUnit = true, 
            Name = v530, 
            IsSecretUnit = function() --[[ Line: 2576 ]] --[[ Name: IsSecretUnit ]]
                return false;
            end, 
            UnitData = {
                Name = v530, 
                Shiny = v532.Shiny or false, 
                Mega = v532.Wumbo or false, 
                Stars = v532.Stars or 0, 
                Level = 1
            }
        });
        v476.rgbHandler:AddObject(l_Reward_0.Backdrop, v531);
        v476.rgbHandler:AddObject(l_Reward_0.Glow, v531);
    end;
    v22.Simple(1, function() --[[ Line: 2593 ]]
        -- upvalues: v515 (ref), v477 (copy), v20 (ref)
        v515 = v515 - 1;
        v477.Bin.Main.Header.Timer.Text = ("Resets In %*"):format((v20:SecondsToClock(v515)));
    end);
    v514();
    v514();
    v514();
    v514();
    v514();
    v514();
    v481 = -42 * (l_ScrollingFrame_3.AbsoluteSize.X / 1099.196);
    v493();
end;
v229._setupBoostedSecretTreasurePack = function(v536, v537) --[[ Line: 2605 ]] --[[ Name: _setupBoostedSecretTreasurePack ]]
    -- upvalues: v19 (copy), v30 (copy), v42 (copy), v27 (copy), v29 (copy), v21 (copy), v44 (ref), v8 (copy), v20 (copy), v22 (copy)
    local l_Main_7 = v537.Main;
    local l_Header_8 = l_Main_7.Header;
    local l_Buy_10 = l_Main_7.Buy;
    local l_Gift_3 = l_Main_7.Gift;
    local v542 = 1;
    local v543 = #v19;
    local v544 = 0;
    local v545 = false;
    local v546 = l_Main_7.Units.Template:Clone();
    l_Main_7.Units.Template:Destroy();
    local l_v30_LootPool_3 = v30:GetLootPool("TreasureChest");
    l_v30_LootPool_3 = l_v30_LootPool_3 and l_v30_LootPool_3.BoostedSecret;
    if l_v30_LootPool_3 then
        l_v30_LootPool_3 = table.clone(l_v30_LootPool_3);
        table.sort(l_v30_LootPool_3, function(v548, v549) --[[ Line: 2625 ]]
            return v548.weight > v549.weight;
        end);
    end;
    for v550 = 1, #l_v30_LootPool_3 do
        local v551 = l_v30_LootPool_3[v550];
        if v551 then
            local v552 = v546:Clone();
            v552.Visible = true;
            v552.LayoutOrder = v550;
            v552.Name = tostring(v550);
            v552.Parent = l_Main_7.Units;
            local v553 = v551.name or v551.Name;
            local v554 = v551.extraData or {};
            local v555 = nil;
            if v551.type == "RandomUnit" then
                v555 = v551.rarity or v551.Rarity;
                v42(v552.Inner.Icon, v551.pool, v551.rarity, 1);
            else
                v555 = select(2, v27:GetRarity(v553));
                v29:SetImage(v552.Inner.Icon, v553);
            end;
            v552.Inner.Mystery.Visible = v551.type == "RandomUnit";
            v552.Inner.Stars.Main.Amount.Text = tostring(v554.Stars or 0);
            v552.Inner.Chance.Text = ("%*%%"):format(v551.weight);
            v552.Inner.Shiny.Visible = v554.Shiny or false;
            v552.Inner.Wumbo.Visible = v554.Wumbo or v554.Mega or false;
            v552.Inner.Stars.Visible = (v554.Stars or 0) >= 1;
            if v551.type ~= "RandomUnit" then
                v21.new(v552, {
                    Name = v553, 
                    IsUnit = true, 
                    IsSecretUnit = function() --[[ Line: 2668 ]] --[[ Name: IsSecretUnit ]]
                        return false;
                    end, 
                    UnitData = {
                        Name = v553, 
                        Shiny = v554.Shiny or false, 
                        Mega = v554.Wumbo or v554.Mega or false, 
                        Stars = v554.Stars or 0
                    }
                });
            end;
            v536.rgbHandler:AddObject(v552.Backdrop, v555);
            v536.rgbHandler:AddObject(v552.Glow, v555);
        end;
    end;
    v44:OnChanged(v8.Player, "BoostedSecretTreasurePack", function(v556) --[[ Line: 2682 ]]
        -- upvalues: v542 (ref), v544 (ref), v543 (copy), v545 (ref), v19 (ref), l_Header_8 (copy), v20 (ref), l_Buy_10 (copy), l_Gift_3 (copy)
        v542 = v556.Tier or 1;
        v544 = v556.StartTime + 86400 - workspace:GetServerTimeNow();
        local l_v542_0 = v542;
        if v543 < v542 then
            v545 = true;
            l_v542_0 = v543;
        else
            v545 = false;
        end;
        if v19[l_v542_0] and v19[l_v542_0].purchaseName then
            local v558 = v19[l_v542_0].reward.amount or 1;
            l_Header_8.Number.Text = v558;
            l_Header_8.Title.Text = v20:Pluralize("Secret Chest", v558, false);
            l_Buy_10:SetAttribute("PurchaseName", v19[l_v542_0].purchaseName);
            l_Gift_3:SetAttribute("PurchaseName", (("BoostedSecretChestOffer%*Gift"):format(l_v542_0)));
            l_Buy_10.Owned.Visible = false;
            l_Buy_10.Content.Visible = true;
        else
            l_Buy_10.Owned.Visible = true;
            l_Buy_10.Content.Visible = false;
        end;
        if v545 then
            l_Buy_10.Owned.Visible = true;
            l_Buy_10.Content.Visible = false;
        end;
    end, true);
    v22.Simple(1, function() --[[ Line: 2716 ]]
        -- upvalues: v544 (ref), v542 (ref), l_Main_7 (copy), v20 (ref)
        v544 = v544 - 1;
        if v542 < 1 then
            l_Main_7.Countdown.Visible = false;
            return;
        elseif v544 < 1 then
            l_Main_7.Countdown.Visible = false;
            return;
        else
            l_Main_7.Countdown.Text = ("Resets In: %*"):format((v20:FormatTimeFromSeconds(v544)));
            l_Main_7.Countdown.Visible = true;
            return;
        end;
    end);
    v536:_handlePurchaseButton(l_Buy_10, function() --[[ Line: 2733 ]]
        -- upvalues: v545 (ref)
        return not v545;
    end);
end;
v229._setupKrustyKrew = function(v559) --[[ Line: 2738 ]] --[[ Name: _setupKrustyKrew ]]
    -- upvalues: v23 (copy), v43 (ref), v60 (ref), v21 (copy), v44 (ref), v8 (copy)
    local l_KrustyKrewPass_0 = v559.bin.KrustyKrewPass;
    local l_KrewDetails_0 = v559.ui.KrewDetails;
    local l_Main_8 = l_KrewDetails_0.Main;
    local l_Inner_0 = l_Main_8.Inner;
    local l_PurchaseOptions_0 = l_Inner_0.PurchaseOptions;
    local l_Expiration_0 = l_Inner_0.Expiration;
    local l_Message_0 = l_Expiration_0.Message;
    local l_Bar_0 = l_Inner_0.LoyaltyGifts.ProgressBar.Bar;
    local l_UIGradient_1 = l_Bar_0.Fill.UIGradient;
    local l_Rewards_0 = l_Bar_0.Rewards;
    local l_Main_9 = l_KrustyKrewPass_0.LargeBin.Main;
    local l_Details_0 = l_Main_9.Buttons.Details;
    local l_ClaimNotifier_0 = l_Details_0.ClaimNotifier;
    local l_KREW_PLUS_0 = v23.KREW_PLUS;
    v43:HandleButton(l_Details_0, function() --[[ Line: 2755 ]]
        -- upvalues: v559 (copy), l_KrewDetails_0 (copy), l_ClaimNotifier_0 (copy), v60 (ref)
        v559.main.Visible = false;
        l_KrewDetails_0.Visible = true;
        l_ClaimNotifier_0.Visible = false;
        v60:ToggleUnitsBar(false, 0);
    end);
    v43:HandleButton(l_Main_8.Exit, function() --[[ Line: 2763 ]]
        -- upvalues: l_KrewDetails_0 (copy), v559 (copy), v60 (ref)
        l_KrewDetails_0.Visible = false;
        v559.main.Visible = true;
        v60:ToggleUnitsBar(true, 0.2);
    end);
    v559:_connectPurchases(l_PurchaseOptions_0);
    local function v582(v574) --[[ Line: 2772 ]] --[[ Name: setupRewardFrame ]]
        -- upvalues: l_KREW_PLUS_0 (copy), v21 (ref)
        local _ = v574.Button;
        local v576 = tonumber(v574.Name);
        local v577 = l_KREW_PLUS_0.REWARDS[v576];
        local l_reward_0 = v577.reward;
        local v579 = l_reward_0.type == "Unit";
        local v580 = l_reward_0.extraData or {};
        local v581 = if v579 then {
            Name = l_reward_0.name, 
            Shiny = v580.Shiny or false, 
            Mega = v580.Wumbo or false, 
            Stars = v580.Stars or 0, 
            Level = 1
        } else nil;
        v21.new(v574, {
            IsUnit = v579, 
            Name = l_reward_0.name, 
            UnitData = v581, 
            IsSecretUnit = function() --[[ Line: 2796 ]] --[[ Name: IsSecretUnit ]]
                return false;
            end
        });
        return v577;
    end;
    for _, v584 in l_Main_9.Details.Conditions:GetChildren() do
        if v584:IsA("Frame") then
            v582(v584);
        end;
    end;
    local v585 = {};
    for _, v587 in l_Rewards_0:GetChildren() do
        if v587:IsA("Frame") then
            local l_Button_1 = v587.Button;
            v585[v582(v587).monthsRequired] = l_Button_1.Content.Claimed;
        end;
    end;
    v44:OnChanged(v8.Player, l_KREW_PLUS_0.DATA_KEY, function(v589) --[[ Line: 2829 ]]
        -- upvalues: l_Expiration_0 (copy), l_Message_0 (copy), l_UIGradient_1 (copy), v585 (copy), l_ClaimNotifier_0 (copy), l_KrewDetails_0 (copy)
        l_Expiration_0.Visible = workspace:GetServerTimeNow() < v589.expiration;
        l_Message_0.Text = ("HEADS UP! YOUR CURRENT MEMBERSHIP WILL EXPIRE ON %*"):format((DateTime.fromUnixTimestamp(v589.expiration):FormatLocalTime("LL", "en-us")));
        local v590 = v589.months == 0 and 0 or (v589.months - 1) % 12 + 1;
        local v591 = -(1 - v590 / 12);
        l_UIGradient_1.Offset = Vector2.new(v591, 0);
        for v592, v593 in v585 do
            v593.Visible = v592 <= v590;
        end;
        l_ClaimNotifier_0.Visible = not l_KrewDetails_0.Visible;
    end, true);
end;
v229._setupCrateOfferFrame = function(v594) --[[ Line: 2857 ]] --[[ Name: _setupCrateOfferFrame ]]
    -- upvalues: v23 (copy), v30 (copy), v13 (copy), v20 (copy), v27 (copy), v28 (copy), v43 (ref), v21 (copy), v44 (ref), v8 (copy), v22 (copy), v56 (ref)
    local l_CrateOffer_0 = v594.bin:FindFirstChild("CrateOffer");
    if not l_CrateOffer_0 then
        return;
    elseif v23.FREE_CRATE == "CoralGift" then
        l_CrateOffer_0.Visible = false;
        return;
    else
        local l_v30_RarityPool_3 = v30:GetRarityPool(v23.FREE_CRATE);
        local l_v30_LootPool_4 = v30:GetLootPool(v23.FREE_CRATE);
        local v598 = {};
        for v599, v600 in l_v30_RarityPool_3 do
            table.insert(v598, {
                rarity = v599, 
                weight = v600.weight or v600.Weight or 1
            });
        end;
        table.sort(v598, function(v601, v602) --[[ Line: 2880 ]]
            return v601.weight > v602.weight;
        end);
        local v603 = v13.new();
        local v604 = 0;
        for _, v606 in v598 do
            for _, v608 in l_v30_LootPool_4[v606.rarity] do
                v604 = v604 + 1;
                local l_type_1 = v608.type;
                local l_FirstChild_3 = l_CrateOffer_0.LargeBin.Main.Bin:FindFirstChild(v604);
                if l_FirstChild_3 then
                    local v611 = v608 and v608.extraData;
                    local v612 = nil;
                    if l_type_1 == "Inventory" then
                        v612 = v20:GetRewardRarity(v608);
                    elseif l_type_1 == "Unit" then
                        v612 = select(2, v27:GetRarity(v608.name or v608.Name));
                        if v611 then
                            v611.Name = v608.name or v608.Name;
                            v611.Mega = v611.Wumbo or false;
                            v611.Shiny = v611.Shiny or false;
                            if not v611.Level then
                                v611.Level = 1;
                            end;
                        end;
                    elseif l_type_1 == "Pet" then
                        v612 = select(2, v28:GetRarity(v608.name or v608.Name));
                        if v611 then
                            v611.Name = v608.name or v608.Name;
                            v611.Mega = v611.Wumbo or false;
                            v611.Shiny = v611.Shiny or false;
                            if not v611.Level then
                                v611.Level = 1;
                            end;
                        end;
                    else
                        warn(("Invalid reward type in %* loot pool:"):format(v23.FREE_CRATE), l_type_1);
                        continue;
                    end;
                    local l_Pity_0 = l_FirstChild_3.Inner:FindFirstChild("Pity");
                    local l_pityAmount_0 = v608.pityAmount;
                    if l_Pity_0 and l_pityAmount_0 then
                        l_Pity_0.Visible = true;
                        v603:Connect(function(v615) --[[ Line: 2934 ]]
                            -- upvalues: l_Pity_0 (copy), l_pityAmount_0 (copy)
                            l_Pity_0.Amount.Text = ("%*/%*"):format(v615 % l_pityAmount_0, l_pityAmount_0);
                        end);
                    end;
                    l_FirstChild_3.Backdrop:SetAttribute("Rarity", v612 or "Common");
                    l_FirstChild_3.Glow:SetAttribute("Rarity", v612 or "Common");
                    table.insert(v594.rarityVisuals, l_FirstChild_3.Backdrop);
                    table.insert(v594.rarityVisuals, l_FirstChild_3.Glow);
                    if v43:GetToggleState(script.Name) then
                        l_FirstChild_3.Backdrop:AddTag("VisualizeRarity");
                        l_FirstChild_3.Glow:AddTag("VisualizeRarity");
                    end;
                    local l_new_2 = v21.new;
                    local l_l_FirstChild_3_0 = l_FirstChild_3;
                    local v618 = {
                        Name = v608.name or v608.Name, 
                        UnitData = v611, 
                        IsUnit = l_type_1 == "Unit", 
                        IsPet = l_type_1 == "Pet", 
                        IsSecretUnit = function() --[[ Line: 2953 ]] --[[ Name: IsSecretUnit ]]
                            return false;
                        end
                    };
                    local v619;
                    if v611 then
                        v619 = {};
                        local v620 = false;
                        if v611.Shiny == false then
                            v620 = v611.Wumbo == false;
                        end;
                        v619.Normal = v620;
                        v619.Shiny = v611.Shiny or false;
                        v619.Mega = v611.Wumbo or false;
                        v620 = false;
                        if v611.Shiny == true then
                            v620 = v611.Wumbo == true;
                        end;
                        v619.ShinyMega = v620;
                    else
                        v619 = nil;
                    end;
                    v618.ExtraData = v619;
                    l_new_2(l_l_FirstChild_3_0, v618);
                    l_FirstChild_3.Inner.Chance.Text = ("%*%%"):format(v608.weight or 1);
                end;
            end;
        end;
        v44:OnChanged(v8.Player, {
            "ChestPity", 
            v23.FREE_CRATE
        }, function(v621) --[[ Line: 2968 ]]
            -- upvalues: v603 (copy)
            v603:Fire(v621 or 0);
        end, true);
        l_CrateOffer_0.Visible = true;
        local l_LargeBin_1 = l_CrateOffer_0.LargeBin;
        local l_Header_9 = l_CrateOffer_0.Header;
        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
        local l_FREE_CRATE_EXPIRE_TIME_0 = v23.FREE_CRATE_EXPIRE_TIME;
        local v626 = v23.FREE_CRATE_START_TIME or l_workspace_ServerTimeNow_1;
        local v627 = l_FREE_CRATE_EXPIRE_TIME_0 - l_workspace_ServerTimeNow_1;
        local v628 = v626 - l_workspace_ServerTimeNow_1;
        if v627 > 1 then
            l_CrateOffer_0.Visible = false;
            task.delay(v628, function() --[[ Line: 2986 ]]
                -- upvalues: l_LargeBin_1 (copy), v23 (ref), v44 (ref), v8 (ref), v20 (ref), l_CrateOffer_0 (copy)
                local l_Free_1 = l_LargeBin_1.Main.Buttons.Free;
                local l_TextDisplay_1 = l_Free_1.Content.TextDisplay;
                local l_FREE_CRATE_TIME_0 = v23.FREE_CRATE_TIME;
                v44:OnChanged(v8.Player, {
                    "FreeCrateData", 
                    v23.FREE_CRATE, 
                    "Playtime"
                }, function(v632) --[[ Line: 2991 ]]
                    -- upvalues: l_FREE_CRATE_TIME_0 (copy), v20 (ref), l_TextDisplay_1 (copy), l_Free_1 (copy)
                    local v633 = math.floor(v632 / l_FREE_CRATE_TIME_0);
                    local v634 = l_FREE_CRATE_TIME_0 - v632 % l_FREE_CRATE_TIME_0;
                    local v635 = v20:FormatTimeFromSeconds(v634);
                    if v633 >= 1 then
                        l_TextDisplay_1.TextColor3 = Color3.fromRGB(255, 255, 255);
                        l_Free_1.Content.Fill.Size = UDim2.fromScale(1, 1);
                        l_TextDisplay_1.Text = ("Claim (%*)"):format(v633);
                        l_Free_1.Title.Text = ("Next crate in %*"):format(v635);
                        return;
                    else
                        local v636 = math.clamp(v632 / l_FREE_CRATE_TIME_0, 0, 1);
                        l_TextDisplay_1.TextColor3 = Color3.fromRGB(200, 200, 200);
                        l_Free_1.Content.Fill.Size = UDim2.fromScale(v636, 1);
                        local v637 = l_FREE_CRATE_TIME_0 / 60;
                        l_Free_1.Title.Text = string.upper((("Free crate every %* minutes"):format(v637)));
                        l_TextDisplay_1.Text = ("%*"):format(v635);
                        return;
                    end;
                end, true);
                l_CrateOffer_0.Visible = true;
            end);
        end;
        task.delay(v627, function() --[[ Line: 3016 ]]
            -- upvalues: l_CrateOffer_0 (copy)
            l_CrateOffer_0.Visible = false;
        end);
        local l_Timer_1 = l_Header_9.Timer;
        v22.Simple(1, function() --[[ Line: 3021 ]]
            -- upvalues: v627 (ref), l_Timer_1 (copy), v20 (ref)
            v627 = v627 - 1;
            if v627 < 86400 then
                l_Timer_1.Text = ("Offer ends in %*"):format((v20:FormatTimeFromSeconds(v627)));
                return;
            else
                local v639 = math.floor(v627 / 86400);
                l_Timer_1.Text = ("Offer ends in %* %*"):format(v639, v639 == 1 and "day" or "days");
                return;
            end;
        end);
        if v594.PaidItemsRestricted then
            for _, v641 in l_CrateOffer_0.LargeBin.Main.Buttons:GetChildren() do
                if v641:IsA("GuiButton") then
                    v641.Visible = v641:GetAttribute("PurchaseName") == nil;
                end;
            end;
        end;
        local l_Free_2 = l_LargeBin_1.Main.Buttons.Free;
        local l_TextDisplay_2 = l_Free_2.Content.TextDisplay;
        local l_FREE_CRATE_TIME_1 = v23.FREE_CRATE_TIME;
        v44:OnChanged(v8.Player, {
            "FreeCrateData", 
            v23.FREE_CRATE, 
            "Playtime"
        }, function(v645) --[[ Line: 3046 ]]
            -- upvalues: l_FREE_CRATE_TIME_1 (copy), v20 (ref), l_TextDisplay_2 (copy), l_Free_2 (copy)
            local v646 = math.floor(v645 / l_FREE_CRATE_TIME_1);
            local v647 = l_FREE_CRATE_TIME_1 - v645 % l_FREE_CRATE_TIME_1;
            local v648 = v20:FormatTimeFromSeconds(v647);
            if v646 >= 1 then
                l_TextDisplay_2.TextColor3 = Color3.fromRGB(255, 255, 255);
                l_Free_2.Content.Fill.Size = UDim2.fromScale(1, 1);
                l_TextDisplay_2.Text = ("Claim (%*)"):format(v646);
                l_Free_2.Title.Text = ("Next crate in %*"):format(v648);
                return;
            else
                local v649 = math.clamp(v645 / l_FREE_CRATE_TIME_1, 0, 1);
                l_TextDisplay_2.TextColor3 = Color3.fromRGB(200, 200, 200);
                l_Free_2.Content.Fill.Size = UDim2.fromScale(v649, 1);
                local v650 = l_FREE_CRATE_TIME_1 / 60;
                l_Free_2.Title.Text = string.upper((("Free crate every %* minutes"):format(v650)));
                l_TextDisplay_2.Text = ("%*"):format(v648);
                return;
            end;
        end, true);
        local v651 = v8.GetService("FreeCrateService");
        local v652 = false;
        v43:HandleButton(l_Free_2, function() --[[ Line: 3069 ]]
            -- upvalues: v652 (ref), v56 (ref), v44 (ref), v8 (ref), v23 (ref), l_FREE_CRATE_TIME_1 (copy), v651 (copy)
            if v652 then
                v56:Notify({
                    message = "System is processing your request, wait a moment.", 
                    duration = 2, 
                    isPositive = false
                });
                return;
            elseif (v44:Get(v8.Player, {
                "FreeCrateData", 
                v23.FREE_CRATE, 
                "Playtime"
            }):expect() or 0) < l_FREE_CRATE_TIME_1 then
                v56:Notify({
                    message = "Can't claim yet, wait a bit longer.", 
                    duration = 2, 
                    isPositive = false
                });
                return;
            else
                v652 = true;
                v651:ClaimFreeCrates():finally(function() --[[ Line: 3092 ]]
                    -- upvalues: v652 (ref)
                    v652 = false;
                end);
                return;
            end;
        end);
        return;
    end;
end;
v229._setupPlaytimeCrate = function(v653, v654, v655) --[[ Line: 3098 ]] --[[ Name: _setupPlaytimeCrate ]]
    -- upvalues: v23 (copy), v30 (copy), v13 (copy), v20 (copy), v27 (copy), v28 (copy), v43 (ref), v21 (copy), v44 (ref), v8 (copy), v22 (copy), v56 (ref)
    if not v654 then
        return;
    else
        v654.Visible = false;
        local v656 = nil;
        for _, v658 in v23.FREE_CRATES do
            if v658.id == v655 then
                v656 = v658;
                break;
            end;
        end;
        if not v656 then
            return;
        else
            local l_v30_RarityPool_4 = v30:GetRarityPool(v656.id);
            local l_v30_LootPool_5 = v30:GetLootPool(v656.id);
            local v661 = {};
            for v662, v663 in l_v30_RarityPool_4 do
                table.insert(v661, {
                    rarity = v662, 
                    weight = v663.weight or v663.Weight or 1
                });
            end;
            table.sort(v661, function(v664, v665) --[[ Line: 3131 ]]
                return v664.weight > v665.weight;
            end);
            local v666 = v13.new();
            local v667 = 0;
            for _, v669 in v661 do
                for _, v671 in l_v30_LootPool_5[v669.rarity] do
                    v667 = v667 + 1;
                    local l_type_2 = v671.type;
                    local l_FirstChild_4 = v654.LargeBin.Main.Bin:FindFirstChild(v667);
                    if l_FirstChild_4 then
                        local v674 = v671 and v671.extraData;
                        local v675 = nil;
                        if l_type_2 == "Inventory" then
                            v675 = v20:GetRewardRarity(v671);
                        elseif l_type_2 == "Unit" then
                            v675 = select(2, v27:GetRarity(v671.name or v671.Name));
                            if v674 then
                                v674.Name = v671.name or v671.Name;
                                v674.Mega = v674.Wumbo or false;
                                v674.Shiny = v674.Shiny or false;
                                if not v674.Level then
                                    v674.Level = 1;
                                end;
                            end;
                        elseif l_type_2 == "Pet" then
                            v675 = select(2, v28:GetRarity(v671.name or v671.Name));
                            if v674 then
                                v674.Name = v671.name or v671.Name;
                                v674.Mega = v674.Wumbo or false;
                                v674.Shiny = v674.Shiny or false;
                                if not v674.Level then
                                    v674.Level = 1;
                                end;
                            end;
                        else
                            warn(("Invalid reward type in %* loot pool:"):format(v656.id), l_type_2);
                            continue;
                        end;
                        local l_Pity_1 = l_FirstChild_4.Inner:FindFirstChild("Pity");
                        local l_pityAmount_1 = v671.pityAmount;
                        if l_Pity_1 and l_pityAmount_1 then
                            l_Pity_1.Visible = true;
                            v666:Connect(function(v678) --[[ Line: 3185 ]]
                                -- upvalues: l_Pity_1 (copy), l_pityAmount_1 (copy)
                                l_Pity_1.Amount.Text = ("%*/%*"):format(v678 % l_pityAmount_1, l_pityAmount_1);
                            end);
                        end;
                        l_FirstChild_4.Backdrop:SetAttribute("Rarity", v675 or "Common");
                        l_FirstChild_4.Glow:SetAttribute("Rarity", v675 or "Common");
                        table.insert(v653.rarityVisuals, l_FirstChild_4.Backdrop);
                        table.insert(v653.rarityVisuals, l_FirstChild_4.Glow);
                        if v43:GetToggleState(script.Name) then
                            l_FirstChild_4.Backdrop:AddTag("VisualizeRarity");
                            l_FirstChild_4.Glow:AddTag("VisualizeRarity");
                        end;
                        local l_new_3 = v21.new;
                        local l_l_FirstChild_4_0 = l_FirstChild_4;
                        local v681 = {
                            Name = v671.name or v671.Name, 
                            UnitData = v674, 
                            IsUnit = l_type_2 == "Unit", 
                            IsPet = l_type_2 == "Pet", 
                            IsSecretUnit = function() --[[ Line: 3204 ]] --[[ Name: IsSecretUnit ]]
                                return false;
                            end
                        };
                        local v682;
                        if v674 then
                            v682 = {};
                            local v683 = false;
                            if v674.Shiny == false then
                                v683 = v674.Wumbo == false;
                            end;
                            v682.Normal = v683;
                            v682.Shiny = v674.Shiny or false;
                            v682.Mega = v674.Wumbo or false;
                            v683 = false;
                            if v674.Shiny == true then
                                v683 = v674.Wumbo == true;
                            end;
                            v682.ShinyMega = v683;
                        else
                            v682 = nil;
                        end;
                        v681.ExtraData = v682;
                        l_new_3(l_l_FirstChild_4_0, v681);
                        l_FirstChild_4.Inner.Chance.Text = ("%*%%"):format(v671.weight or 1);
                    end;
                end;
            end;
            v44:OnChanged(v8.Player, {
                "ChestPity", 
                v656.id
            }, function(v684) --[[ Line: 3219 ]]
                -- upvalues: v666 (copy)
                v666:Fire(v684 or 0);
            end, true);
            v654.Visible = true;
            local l_LargeBin_2 = v654.LargeBin;
            local l_Header_10 = v654.Header;
            local l_workspace_ServerTimeNow_2 = workspace:GetServerTimeNow();
            local l_expire_0 = v656.expire;
            local v689 = v656.start or l_workspace_ServerTimeNow_2;
            local v690 = l_expire_0 - l_workspace_ServerTimeNow_2;
            local v691 = v689 - l_workspace_ServerTimeNow_2;
            if v690 > 1 then
                v654.Visible = false;
                task.delay(v691, function() --[[ Line: 3237 ]]
                    -- upvalues: l_LargeBin_2 (copy), v656 (ref), v44 (ref), v8 (ref), v20 (ref), v654 (copy)
                    local l_Free_3 = l_LargeBin_2.Main.Buttons.Free;
                    local l_TextDisplay_3 = l_Free_3.Content.TextDisplay;
                    local l_secondsPerCrate_0 = v656.secondsPerCrate;
                    v44:OnChanged(v8.Player, {
                        "FreeCrateData", 
                        v656.id, 
                        "Playtime"
                    }, function(v695) --[[ Line: 3242 ]]
                        -- upvalues: l_secondsPerCrate_0 (copy), v20 (ref), l_TextDisplay_3 (copy), l_Free_3 (copy)
                        local v696 = math.floor(v695 / l_secondsPerCrate_0);
                        local v697 = l_secondsPerCrate_0 - v695 % l_secondsPerCrate_0;
                        local v698 = v20:FormatTimeFromSeconds(v697);
                        if v696 >= 1 then
                            l_TextDisplay_3.TextColor3 = Color3.fromRGB(255, 255, 255);
                            l_Free_3.Content.Fill.Size = UDim2.fromScale(1, 1);
                            l_TextDisplay_3.Text = ("Claim (%*)"):format(v696);
                            l_Free_3.Title.Text = ("Next crate in %*"):format(v698);
                            return;
                        else
                            local v699 = math.clamp(v695 / l_secondsPerCrate_0, 0, 1);
                            l_TextDisplay_3.TextColor3 = Color3.fromRGB(200, 200, 200);
                            l_Free_3.Content.Fill.Size = UDim2.fromScale(v699, 1);
                            local v700 = l_secondsPerCrate_0 / 60;
                            l_Free_3.Title.Text = string.upper((("Free crate every %* minutes"):format(v700)));
                            l_TextDisplay_3.Text = ("%*"):format(v698);
                            return;
                        end;
                    end, true);
                    v654.Visible = true;
                end);
            end;
            task.delay(v690, function() --[[ Line: 3267 ]]
                -- upvalues: v654 (copy)
                v654.Visible = false;
            end);
            local l_Timer_2 = l_Header_10.Timer;
            v22.Simple(1, function() --[[ Line: 3272 ]]
                -- upvalues: v690 (ref), l_Timer_2 (copy), v20 (ref)
                v690 = v690 - 1;
                if v690 < 86400 then
                    l_Timer_2.Text = ("Offer ends in %*"):format((v20:FormatTimeFromSeconds(v690)));
                    return;
                else
                    local v702 = math.floor(v690 / 86400);
                    l_Timer_2.Text = ("Offer ends in %* %*"):format(v702, v702 == 1 and "day" or "days");
                    return;
                end;
            end);
            if v653.PaidItemsRestricted then
                for _, v704 in v654.LargeBin.Main.Buttons:GetChildren() do
                    if v704:IsA("GuiButton") then
                        v704.Visible = v704:GetAttribute("PurchaseName") == nil;
                    end;
                end;
            end;
            local l_Free_4 = l_LargeBin_2.Main.Buttons.Free;
            local l_TextDisplay_4 = l_Free_4.Content.TextDisplay;
            local l_secondsPerCrate_1 = v656.secondsPerCrate;
            v44:OnChanged(v8.Player, {
                "FreeCrateData", 
                v656.id, 
                "Playtime"
            }, function(v708) --[[ Line: 3297 ]]
                -- upvalues: l_secondsPerCrate_1 (copy), v20 (ref), l_TextDisplay_4 (copy), l_Free_4 (copy)
                local v709 = math.floor(v708 / l_secondsPerCrate_1);
                local v710 = l_secondsPerCrate_1 - v708 % l_secondsPerCrate_1;
                local v711 = v20:FormatTimeFromSeconds(v710);
                if v709 >= 1 then
                    l_TextDisplay_4.TextColor3 = Color3.fromRGB(255, 255, 255);
                    l_Free_4.Content.Fill.Size = UDim2.fromScale(1, 1);
                    l_TextDisplay_4.Text = ("Claim (%*)"):format(v709);
                    l_Free_4.Title.Text = ("Next crate in %*"):format(v711);
                    return;
                else
                    local v712 = math.clamp(v708 / l_secondsPerCrate_1, 0, 1);
                    l_TextDisplay_4.TextColor3 = Color3.fromRGB(200, 200, 200);
                    l_Free_4.Content.Fill.Size = UDim2.fromScale(v712, 1);
                    local v713 = l_secondsPerCrate_1 / 60;
                    l_Free_4.Title.Text = string.upper((("Free crate every %* minutes"):format(v713)));
                    l_TextDisplay_4.Text = ("%*"):format(v711);
                    return;
                end;
            end, true);
            local v714 = v8.GetService("FreeCrateService");
            local v715 = false;
            v43:HandleButton(l_Free_4, function() --[[ Line: 3320 ]]
                -- upvalues: v715 (ref), v56 (ref), v44 (ref), v8 (ref), v656 (ref), l_secondsPerCrate_1 (copy), v714 (copy)
                if v715 then
                    v56:Notify({
                        message = "System is processing your request, wait a moment.", 
                        duration = 2, 
                        isPositive = false
                    });
                    return;
                elseif (v44:Get(v8.Player, {
                    "FreeCrateData", 
                    v656.id, 
                    "Playtime"
                }):expect() or 0) < l_secondsPerCrate_1 then
                    v56:Notify({
                        message = "Can't claim yet, wait a bit longer.", 
                        duration = 2, 
                        isPositive = false
                    });
                    return;
                else
                    v715 = true;
                    v714:ClaimFreeCrates(v656.id):finally(function() --[[ Line: 3343 ]]
                        -- upvalues: v715 (ref)
                        v715 = false;
                    end);
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v229._setupPrismaticOffer = function(v716, v717, v718, v719) --[[ Line: 3349 ]] --[[ Name: _setupPrismaticOffer ]]
    -- upvalues: v30 (copy), v27 (copy), v21 (copy), v22 (copy), v20 (copy)
    local l_v30_RarityPool_5 = v30:GetRarityPool(v718);
    local l_v30_LootPool_6 = v30:GetLootPool(v718);
    v716.hydraCrateVisuals = {};
    if not l_v30_RarityPool_5 or not v717 then
        return;
    elseif v716.PaidItemsRestricted then
        v717:Destroy();
        return;
    else
        local v722 = {};
        for v723, v724 in l_v30_RarityPool_5 do
            table.insert(v722, {
                rarity = v723, 
                weight = v724.weight or v724.Weight or 1
            });
        end;
        table.sort(v722, function(v725, v726) --[[ Line: 3375 ]]
            return v725.weight > v726.weight;
        end);
        for v727, v728 in v722 do
            local l_FirstChild_5 = v717.LargeBin.Main.Bin:FindFirstChild(v727);
            if l_FirstChild_5 then
                local v730 = l_v30_LootPool_6[v728.rarity] and table.clone(l_v30_LootPool_6[v728.rarity][1]);
                local v731 = v730 and v730.extraData;
                local v732 = select(2, v27:GetRarity(v730.name or v730.Name, true));
                if v732 then
                    l_FirstChild_5.Backdrop:SetAttribute("Rarity", v732);
                    l_FirstChild_5.Glow:SetAttribute("Rarity", v732);
                    table.insert(v716.hydraCrateVisuals, l_FirstChild_5.Backdrop);
                    table.insert(v716.hydraCrateVisuals, l_FirstChild_5.Glow);
                end;
                if v731 then
                    v731.Name = v730.name or v730.Name;
                    v731.Mega = v731.Wumbo or false;
                    v731.Shiny = v731.Shiny or false;
                    if not v731.Level then
                        v731.Level = 1;
                    end;
                end;
                local l_new_4 = v21.new;
                local l_l_FirstChild_5_0 = l_FirstChild_5;
                local v735 = {
                    Name = v730.name or v730.Name, 
                    UnitData = v731, 
                    IsUnit = true
                };
                local v736 = {};
                local v737 = false;
                if v731.Shiny == false then
                    v737 = v731.Wumbo == false;
                end;
                v736.Normal = v737;
                v736.Shiny = v731.Shiny or false;
                v736.Mega = v731.Wumbo or false;
                v737 = false;
                if v731.Shiny == true then
                    v737 = v731.Wumbo == true;
                end;
                v736.ShinyMega = v737;
                v735.ExtraData = v736;
                l_new_4(l_l_FirstChild_5_0, v735);
                l_FirstChild_5.Inner.Chance.Text = ("%*%%"):format(v728.weight or 1);
            end;
        end;
        local l_workspace_ServerTimeNow_3 = workspace:GetServerTimeNow();
        local v739 = v719.startOn or l_workspace_ServerTimeNow_3;
        if v739 and l_workspace_ServerTimeNow_3 < v739 then
            warn(v718, " is not out yet so hiding");
            v717.Visible = false;
            task.delay(v739 - l_workspace_ServerTimeNow_3, function() --[[ Line: 3431 ]]
                -- upvalues: v717 (copy)
                v717.Visible = true;
            end);
        end;
        local l_expireOn_0 = v719.expireOn;
        if not l_expireOn_0 then
            return;
        else
            local v741 = math.clamp(l_expireOn_0 - l_workspace_ServerTimeNow_3, 0, 1e999);
            if v741 < 1 then
                v717.Visible = false;
                return;
            else
                local v742 = nil;
                v742 = v22.Simple(1, function() --[[ Line: 3450 ]]
                    -- upvalues: v741 (ref), v742 (ref), v717 (copy), v20 (ref)
                    if v741 < 1 then
                        v742:Disconnect();
                        v742 = nil;
                        v717.Visible = false;
                        return;
                    else
                        v741 = v741 - 1;
                        v717.Header.Timer.Text = ("Offer Ends In %*"):format((v20:FormatTimeFromSeconds(v741)));
                        return;
                    end;
                end);
                return;
            end;
        end;
    end;
end;
v229._setupLimitedOffersFrame = function(v743) --[[ Line: 3464 ]] --[[ Name: _setupLimitedOffersFrame ]]
    -- upvalues: v23 (copy), v22 (copy), v20 (copy)
    local l_LimitedOffers_0 = v743.bin:FindFirstChild("LimitedOffers");
    if not l_LimitedOffers_0 then
        return;
    else
        l_LimitedOffers_0.Visible = false;
        local l_Header_11 = l_LimitedOffers_0.Header;
        local _ = l_LimitedOffers_0.Bin;
        local v747 = math.round(v23.CHRISTMAS_DEAL_ENDS - workspace:GetServerTimeNow());
        if v747 > 0 then
            v743:_setupLimitedUnitFrame();
        end;
        local v748 = nil;
        v748 = v22.Simple(1, function() --[[ Line: 3487 ]]
            -- upvalues: v747 (ref), l_LimitedOffers_0 (copy), l_Header_11 (copy), v20 (ref), v748 (ref)
            v747 = v747 - 1;
            if v747 > 0 then
                if not l_LimitedOffers_0.Visible then
                    l_LimitedOffers_0.Visible = true;
                end;
                l_Header_11.Timer.Text = ("Offer Ends In %*"):format((v20:FormatTimeFromSeconds(v747)));
                return;
            else
                l_LimitedOffers_0.Visible = false;
                v748:Disconnect();
                v748 = nil;
                return;
            end;
        end);
        return;
    end;
end;
v229._setupLimitedUnitFrame = function(v749) --[[ Line: 3506 ]] --[[ Name: _setupLimitedUnitFrame ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v22 (copy), v20 (copy), v43 (ref), v56 (ref), v58 (ref)
    local l_LimitedOffers_1 = v749.bin:FindFirstChild("LimitedOffers");
    l_LimitedOffers_1 = l_LimitedOffers_1 and l_LimitedOffers_1:FindFirstChild("Bin");
    l_LimitedOffers_1 = l_LimitedOffers_1 and l_LimitedOffers_1:FindFirstChild("SpongeBobSanta");
    if not l_LimitedOffers_1 then
        warn("no frame rip");
        return;
    else
        l_LimitedOffers_1.Visible = false;
        local l_Main_10 = l_LimitedOffers_1.Main;
        local l_SpongebobSanta_0 = require(l_ReplicatedStorage_0.Shared.Data.LimitedUnitShopItems).SpongebobSanta;
        if not l_SpongebobSanta_0 then
            warn("no offer data rip");
            return;
        else
            local l_workspace_ServerTimeNow_4 = workspace:GetServerTimeNow();
            local v754 = true;
            local l_expiresOn_0 = l_SpongebobSanta_0.expiresOn;
            local v756 = l_SpongebobSanta_0.availableOn or l_workspace_ServerTimeNow_4;
            local v757 = l_expiresOn_0 - l_workspace_ServerTimeNow_4;
            if l_workspace_ServerTimeNow_4 < v756 then
                v754 = false;
                task.delay(v756 - l_workspace_ServerTimeNow_4, function() --[[ Line: 3541 ]]
                    -- upvalues: v754 (ref), l_LimitedOffers_1 (ref)
                    v754 = true;
                    l_LimitedOffers_1.Visible = true;
                end);
            end;
            local v758 = nil;
            local v759 = 0;
            local v760 = nil;
            v758 = v22.Simple(1, function() --[[ Line: 3557 ]]
                -- upvalues: v757 (ref), l_workspace_ServerTimeNow_4 (ref), v754 (ref), v756 (copy), l_LimitedOffers_1 (ref), v758 (ref)
                v757 = v757 - 1;
                l_workspace_ServerTimeNow_4 = l_workspace_ServerTimeNow_4 + 1;
                if v757 > 0 then
                    v754 = true;
                    if v756 <= l_workspace_ServerTimeNow_4 and not l_LimitedOffers_1.Visible then
                        l_LimitedOffers_1.Visible = true;
                    end;
                    return;
                else
                    v754 = false;
                    l_LimitedOffers_1.Visible = false;
                    v758:Disconnect();
                    v758 = nil;
                    return;
                end;
            end);
            local function _() --[[ Line: 3577 ]] --[[ Name: updateRemaining ]]
                -- upvalues: l_Main_10 (copy), v20 (ref), v759 (ref)
                l_Main_10.Info.Remaining.Text = ("%* UNITS REMAINING!"):format((v20:CommaNumber(v759)));
            end;
            local v762 = false;
            v43:HandleButton(l_Main_10.AttemptPurchase, function() --[[ Line: 3583 ]]
                -- upvalues: v762 (ref), v754 (ref), v759 (ref), v760 (ref), v56 (ref), v58 (ref)
                if v762 then
                    return;
                elseif not v754 then
                    return;
                elseif v759 < 1 and v760 and v760.tempHold < 1 then
                    v56:Notify({
                        message = "This item is out of stock!", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                elseif v759 < 1 and v760 and v760.tempHold >= 1 then
                    v56:Notify({
                        message = "There are units in hold by other players. Try again shortly!", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                else
                    v762 = true;
                    v58:PurchaseLimitedUnit("SpongebobSanta"):finally(function() --[[ Line: 3612 ]]
                        -- upvalues: v762 (ref)
                        v762 = false;
                    end);
                    return;
                end;
            end);
            v58.ProductStock:Observe(function(v763) --[[ Line: 3617 ]]
                -- upvalues: v760 (ref), v759 (ref), l_Main_10 (copy), v20 (ref)
                if not v763 then
                    return;
                else
                    v760 = v763.SpongebobSanta;
                    v759 = v760 and v760.remaining or 0;
                    l_Main_10.Info.Remaining.Text = ("%* UNITS REMAINING!"):format((v20:CommaNumber(v759)));
                    return;
                end;
            end);
            return;
        end;
    end;
end;
return v229;