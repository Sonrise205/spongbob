local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Packages.Promise);
local v8 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v11 = require(l_ReplicatedStorage_0.TraitsData);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.Shime);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.PromiseAssetInfo);
local v17 = require(v4.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v20 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v21 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v22 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = UDim2.fromScale(0.742, 0.5);
local v32 = UDim2.fromScale(0.6, 0.5);
local v33 = {
    "TraitRolls", 
    "GoldenTraitRolls"
};
local v34 = {
    primaryMenu = true, 
    blur = true, 
    _currentCurrency = v33[1], 
    _minimumTraitsRequired = v14.TRAIT_REROLL_COSTS.Unlocked, 
    MinimumTraitsChanged = v8.new(), 
    ToggleAll = {}
};
local v35 = false;
v34.Init = function(v36, v37, v38) --[[ Line: 76 ]] --[[ Name: Init ]]
    -- upvalues: v24 (ref), v4 (copy), v25 (ref), v26 (ref), v27 (ref), v28 (ref), l_TweenService_0 (copy), v31 (copy), v32 (copy), v15 (copy), v5 (copy)
    v24 = v4.GetController("UIController");
    v25 = v4.GetController("DataController");
    v26 = v4.GetService("UnitService");
    v27 = v4.GetController("PurchaseController");
    v28 = v4.GetController("DeviceTypeController");
    v36.currentMode = v38;
    v36.ui = v37;
    v36.main = v37.Main;
    v36.exitBtn = v36.main.Exit;
    local l_Content_0 = v36.main.Content;
    local l_Buttons_0 = l_Content_0.Buttons;
    v36.rollButton = l_Buttons_0.RollOptions.Roll;
    v36.autoSkipButton = l_Buttons_0.Filters;
    local l_Top_0 = l_Content_0.Top;
    v36.currencyCycleBtn = l_Top_0.Unsorted.CycleOptions;
    v36.traitCurrencyButton = l_Top_0.TraitRolls;
    v36.traitRollFrame = v36.traitCurrencyButton.Content.TraitReroll;
    v36.traitRollAmountLabel = v36.traitRollFrame.Item.Amount;
    v36.goldenTraitRollFrame = v36.traitCurrencyButton.Content.GoldTraitReroll;
    v36.goldenTraitRollAmountLabel = v36.goldenTraitRollFrame.Item.Amount;
    v36.changeUnitButton = l_Top_0.ChangeUnit;
    v36.towerPreviewFrame = v36.changeUnitButton.Content.TowerPreview;
    v36.towerNameLabel = v36.changeUnitButton.Content.TowerName;
    local l_Trait_0 = l_Top_0.Trait.Trait;
    v36.traitInfoFrame = l_Trait_0.Info;
    v36.traitInfoScale = v36.traitInfoFrame.UIScale;
    v36.traitNameLabel = v36.traitInfoFrame.TraitName;
    v36.traitIcon = v36.traitInfoFrame.Icon;
    v36.noTraitLabel = l_Trait_0.NoTrait;
    v36.traitBoostLabel = l_Trait_0.Boost;
    local l_BonusTrait_0 = l_Top_0.Trait.BonusTrait;
    v36.traitFrame2 = l_BonusTrait_0;
    v36.traitInfoFrame2 = l_BonusTrait_0.Info;
    v36.traitInfoScale2 = v36.traitInfoFrame2.UIScale;
    v36.traitNameLabel2 = v36.traitInfoFrame2.TraitName;
    v36.traitIcon2 = v36.traitInfoFrame2.Icon;
    v36.noTraitLabel2 = l_BonusTrait_0.NoTrait;
    v36.traitBoostLabel2 = l_BonusTrait_0.Boost;
    v36.indexFrame = v36.ui.Index;
    v36.indexFrameScale = v36.indexFrame.UIScale;
    v36.indexContents = v36.indexFrame.Contents;
    v36.pityBars = v36.main.PityBars;
    v36.shopFrame = v36.main.Shop;
    v36.traitLockBtn1 = l_Trait_0.Lock;
    v36.traitLockBtn2 = l_BonusTrait_0.Lock;
    v36.traitKeepBtn = l_Buttons_0.Safety;
    v36.conditionHolder = l_Content_0.Condition;
    v36.autoSkipFrame = v36.ui.Filters;
    v36.confirmation = v36.ui.Confirmation;
    v36.confirmationBottomBtns = v36.confirmation.Main.BottomButtons;
    v36.confirmationBeforeNAfter = v36.confirmation.Main.BeforeAndAfter;
    v36.indexTweens = {
        [true] = {
            l_TweenService_0:Create(v36.indexFrameScale, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Scale = 1
            }), 
            l_TweenService_0:Create(v36.indexFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
                Position = v31
            })
        }, 
        [false] = {
            l_TweenService_0:Create(v36.indexFrameScale, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
                Scale = 0.5
            }), 
            l_TweenService_0:Create(v36.indexFrame, TweenInfo.new(0.25), {
                Position = v32
            })
        }
    };
    v36.traitShime = v15.new(l_Trait_0, 0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0);
    v36.traitShime2 = v15.new(l_BonusTrait_0, 0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0);
    v36.traitShime:GetFrame().ZIndex = 3;
    v36.traitShime2:GetFrame().ZIndex = 3;
    v36.changeUnitBackup = {
        backdropGradient = v36.changeUnitButton.Content.Backdrop.UIGradient:Clone(), 
        backdropColor = v36.changeUnitButton.Content.Backdrop.ImageColor3, 
        glowColor = v36.changeUnitButton.Content.Glow.ImageColor3
    };
    v36.indexState = true;
    v36.processingRoll = false;
    v36.traitRolls = 0;
    v36.dumpster = v5.new();
end;
v34.Start = function(v44) --[[ Line: 192 ]] --[[ Name: Start ]]
    -- upvalues: v29 (ref), v24 (ref), v30 (ref), v20 (copy), v4 (copy), v11 (copy), v10 (copy), v26 (ref), v35 (ref), v27 (ref), v18 (copy), v25 (ref), v13 (copy), l_TweenService_0 (copy)
    v29 = v24:GetModuleAsync("Units"):expect();
    v30 = v24:GetModuleAsync("MessagePrompt"):expect();
    v44:_handlePityProgressionBars();
    v44:_handleKeepFlags();
    v44:_handleAutoSkip();
    v44.PolicyInfo = v20(v4.Player):expect();
    if not v44.PolicyInfo then
        v4.Player:Kick("Failed to get policy info. (Please rejoin)");
        return;
    else
        v44.PaidItemsRestricted = v44.PolicyInfo.ArePaidRandomItemsRestricted or false;
        if v44.PaidItemsRestricted then
            v44.shopFrame.Visible = false;
        end;
        v44:_toggleIndex(v44.indexState, true);
        for v45, v46 in v11:GetTraits() do
            local l_FirstChild_0 = v44.indexContents:FindFirstChild(v45);
            if not l_FirstChild_0 then
                v10:Warn("Trait frame not found for:", v45);
            else
                l_FirstChild_0.LayoutOrder = math.round(v46.weight);
                l_FirstChild_0.Main.Icon.Chance.Text = ("%*%%"):format(v46.weight);
            end;
        end;
        v24:HandleButton(v44.exitBtn, function() --[[ Line: 228 ]]
            -- upvalues: v24 (ref)
            v24:Toggle(script.Name, false);
        end);
        v24:HandleButton(v44.autoSkipButton, function() --[[ Line: 232 ]]
            -- upvalues: v44 (copy)
            v44.autoSkipFrame.Visible = not v44.autoSkipFrame.Visible;
        end);
        local v48 = false;
        local function v51(v49) --[[ Line: 238 ]] --[[ Name: tryTraitLock ]]
            -- upvalues: v48 (ref), v44 (copy), v30 (ref), v26 (ref)
            if v48 then
                return;
            elseif not v44._selectedUnit or not v44._selectedUnit.Data or not v44._selectedUnit.Data.Trait2 then
                return;
            else
                v48 = true;
                local v50 = true;
                if v44._selectedUnit.Data[("Trait%*Locked"):format(v49)] ~= nil then
                    v50 = not v44._selectedUnit.Data[("Trait%*Locked"):format(v49)];
                end;
                if v50 then
                    v30:Prompt({
                        message = ("Locking a Trait Slot will require an additional 2 %* to roll the unlocked slot!"):format((v44:_getCurrencyDisplayName())), 
                        options = {
                            {
                                text = "Ok"
                            }
                        }
                    });
                end;
                v26:ToggleLockTrait(v44._selectedUnit.Name, v44._selectedUnit.UID, v49):finally(function() --[[ Line: 266 ]]
                    -- upvalues: v48 (ref)
                    v48 = false;
                end);
                return;
            end;
        end;
        v24:HandleButton(v44.traitLockBtn1, function() --[[ Line: 272 ]]
            -- upvalues: v51 (copy)
            v51(1);
        end);
        v24:HandleButton(v44.traitLockBtn2, function() --[[ Line: 276 ]]
            -- upvalues: v51 (copy)
            v51(2);
        end);
        local function v52() --[[ Line: 280 ]] --[[ Name: rollTrait ]]
            -- upvalues: v44 (copy), v26 (ref), v35 (ref)
            if v44.processingRoll then
                return;
            else
                v44.processingRoll = true;
                v26:RollTrait(v44._selectedUnit.Name, v44._selectedUnit.UID, v44._currencyType, v35):andThen(function() --[[ Line: 286 ]]
                    -- upvalues: v44 (ref)
                    v44.processingRoll = false;
                end);
                return;
            end;
        end;
        v24:HandleButton(v44.rollButton, function() --[[ Line: 291 ]]
            -- upvalues: v44 (copy), v30 (ref), v27 (ref), v52 (copy), v26 (ref), v35 (ref)
            if not v44._selectedUnit then
                return;
            elseif v44.processingRoll then
                return;
            elseif v44._selectedUnit.Data.Trait1Locked and v44._selectedUnit.Data.Trait2Locked then
                v30:Prompt({
                    message = "Both traits on your unit are locked! Unlock one of them to roll a trait.", 
                    options = {
                        {
                            text = "Ok"
                        }
                    }
                });
                return;
            elseif v44.PaidItemsRestricted and not v44:CanAffordRoll() then
                v30:Prompt({
                    message = ("You don't have enough %*!"):format((v44:_getCurrencyDisplayName())), 
                    options = {
                        {
                            text = "Ok"
                        }
                    }
                });
                return;
            elseif not v44:CanAffordRoll() then
                v30:Prompt({
                    message = ("You don't have enough %*! Would you like to buy one?"):format((v44:_getCurrencyDisplayName())), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 331 ]] --[[ Name: callback ]]
                                -- upvalues: v44 (ref), v27 (ref)
                                if v44._currencyType ~= "GoldenTraitRolls" then
                                    v27:PromptProductPurchase("TraitRollsPack1");
                                    return;
                                else
                                    v27:PromptProductPurchase("GoldTraitRollsPack1");
                                    return;
                                end;
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
                return;
            else
                local l_Trait_1 = v44._selectedUnit.Data.Trait;
                local l_Trait2_0 = v44._selectedUnit.Data.Trait2;
                local l_Trait1Locked_0 = v44._selectedUnit.Data.Trait1Locked;
                local l_Trait2Locked_0 = v44._selectedUnit.Data.Trait2Locked;
                local v57 = false;
                if not l_Trait1Locked_0 and l_Trait_1 and not v44._currentAutoSkipData[l_Trait_1.Name] then
                    v57 = true;
                end;
                if not l_Trait2Locked_0 and l_Trait2_0 and not v44._currentAutoSkipData[l_Trait2_0.Name] then
                    v57 = true;
                end;
                if v57 then
                    v30:Prompt({
                        message = "You have a special trait! Are you sure you'd like to reroll?", 
                        options = {
                            {
                                text = "Yes", 
                                callback = v52
                            }, 
                            {
                                text = "No"
                            }
                        }
                    });
                    return;
                elseif v44.processingRoll then
                    return;
                else
                    v44.processingRoll = true;
                    v26:RollTrait(v44._selectedUnit.Name, v44._selectedUnit.UID, v44._currencyType, v35):andThen(function() --[[ Line: 286 ]]
                        -- upvalues: v44 (ref)
                        v44.processingRoll = false;
                    end);
                    return;
                end;
            end;
        end);
        v24:HandleButton(v44.changeUnitButton, function() --[[ Line: 420 ]]
            -- upvalues: v29 (ref)
            v29:OpenWithState("TraitSelection");
        end);
        v24:HandleButton(v44.traitCurrencyButton);
        local function _(v58, v59) --[[ Line: 426 ]] --[[ Name: updateCurrencyAmount ]]
            -- upvalues: v44 (copy), v18 (ref)
            v58 = v58 or v44.traitRolls or 0;
            v59 = v59 or v44._minimumTraitsRequired or 1;
            v44.traitRolls = v58;
            v44.traitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(v58, true, 1), v59);
        end;
        local function _(v61, v62) --[[ Line: 434 ]] --[[ Name: updateCurrencyAmount2 ]]
            -- upvalues: v44 (copy), v18 (ref)
            v61 = v61 or v44.goldenTraitRolls or 0;
            v62 = v62 or v44._minimumTraitsRequired or 1;
            v44.goldenTraitRolls = v61;
            v44.goldenTraitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(v61, true, 1), v62);
        end;
        v25:OnChanged(v4.Player, "Currency.TraitRolls", function(v64) --[[ Line: 442 ]]
            -- upvalues: v44 (copy), v18 (ref)
            local l_v64_0 = v64;
            local v66 = nil;
            l_v64_0 = l_v64_0 or v44.traitRolls or 0;
            v66 = v66 or v44._minimumTraitsRequired or 1;
            v44.traitRolls = l_v64_0;
            v44.traitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(l_v64_0, true, 1), v66);
        end, true);
        v25:OnChanged(v4.Player, "Currency.GoldenTraitRolls", function(v67) --[[ Line: 446 ]]
            -- upvalues: v44 (copy), v18 (ref)
            local l_v67_0 = v67;
            local v69 = nil;
            l_v67_0 = l_v67_0 or v44.goldenTraitRolls or 0;
            v69 = v69 or v44._minimumTraitsRequired or 1;
            v44.goldenTraitRolls = l_v67_0;
            v44.goldenTraitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(l_v67_0, true, 1), v69);
        end, true);
        v44.MinimumTraitsChanged:Connect(function(_) --[[ Line: 450 ]]
            -- upvalues: v44 (copy), v18 (ref)
            local v71 = nil;
            local v72 = nil;
            v71 = v71 or v44.traitRolls or 0;
            v72 = v72 or v44._minimumTraitsRequired or 1;
            v44.traitRolls = v71;
            v44.traitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(v71, true, 1), v72);
            v71 = nil;
            v72 = nil;
            v71 = v71 or v44.goldenTraitRolls or 0;
            v72 = v72 or v44._minimumTraitsRequired or 1;
            v44.goldenTraitRolls = v71;
            v44.goldenTraitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(v71, true, 1), v72);
        end);
        v25:OnChanged(v4.Player, "Currency", function(v73) --[[ Line: 455 ]]
            -- upvalues: v44 (copy), v18 (ref)
            local l_TraitRolls_0 = v73.TraitRolls;
            local v75 = nil;
            l_TraitRolls_0 = l_TraitRolls_0 or v44.traitRolls or 0;
            v75 = v75 or v44._minimumTraitsRequired or 1;
            v44.traitRolls = l_TraitRolls_0;
            v44.traitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(l_TraitRolls_0, true, 1), v75);
            l_TraitRolls_0 = v73.GoldenTraitRolls;
            v75 = nil;
            l_TraitRolls_0 = l_TraitRolls_0 or v44.goldenTraitRolls or 0;
            v75 = v75 or v44._minimumTraitsRequired or 1;
            v44.goldenTraitRolls = l_TraitRolls_0;
            v44.goldenTraitRollAmountLabel.Text = ("%*/%*"):format(v18:SuffixNumber(l_TraitRolls_0, true, 1), v75);
        end, true);
        v26.UnitsRemoved:Connect(function(v76) --[[ Line: 460 ]]
            -- upvalues: v44 (copy), v13 (ref)
            if not v44._selectedUnit then
                return;
            else
                for _, v78 in v76 do
                    local v79, v80 = v13:ParseLoadout(v78);
                    if v44._selectedUnit.Name == v79 and v44._selectedUnit.UID == v80 then
                        v44:ClearSelectedUnit();
                    end;
                end;
                return;
            end;
        end);
        v26.UnitTraitRolled:Connect(function(v81, v82, v83) --[[ Line: 473 ]]
            -- upvalues: v44 (copy), v13 (ref)
            if not v44._selectedUnit then
                return;
            else
                v44.confirmation.Visible = false;
                v44._currerentTraitData1 = v82;
                v44._currerentTraitData2 = v83;
                local v84, v85 = v13:ParseLoadout(v81);
                if v44._selectedUnit.Name == v84 and v44._selectedUnit.UID == v85 then
                    v44._selectedUnit.Data.Trait = v82;
                    v44._selectedUnit.Data.Trait2 = v83;
                    v44:UpdateTraitInfo(v82, true);
                    if v83 then
                        v44:UpdateTraitInfo(v83, true, true);
                        return;
                    else
                        v44:ClearTraitInfo(nil, nil, true);
                    end;
                end;
                return;
            end;
        end);
        v26.UnitTraitLockToggled:Connect(function(v86, v87, v88, v89) --[[ Line: 497 ]]
            -- upvalues: v44 (copy)
            if not v44._selectedUnit then
                return;
            else
                if v44._selectedUnit.Name == v86 and v44._selectedUnit.UID == v87 then
                    v44._selectedUnit.Data[("Trait%*Locked"):format(v88)] = v89;
                    v44:UpdateTraitLockStates();
                end;
                return;
            end;
        end);
        for _, v91 in v44.shopFrame:GetChildren() do
            if v91:IsA("Frame") then
                v44:_connectPurchaseButton(v91.Info.PurchaseOptions.Buy);
                v44:_connectPurchaseButton(v91.Info.PurchaseOptions.Gift);
            end;
        end;
        local function v92() --[[ Line: 518 ]] --[[ Name: updateTraitLockVisibility ]]
            -- upvalues: v44 (copy)
            v44.traitLockBtn1.Visible = v44.traitFrame2.Visible;
            v44.traitLockBtn2.Visible = v44.traitFrame2.Visible;
        end;
        v44.traitLockBtn1.Visible = v44.traitFrame2.Visible;
        v44.traitLockBtn2.Visible = v44.traitFrame2.Visible;
        v44.traitFrame2:GetPropertyChangedSignal("Visible"):Connect(v92);
        v24:HandleButton(v44.currencyCycleBtn, function() --[[ Line: 526 ]]
            -- upvalues: v44 (copy)
            v44:SetTraitRerollType();
        end);
        for _, v94 in v44.indexContents:GetChildren() do
            if v94:IsA("GuiButton") then
                local l_Details_0 = v94:FindFirstChild("Details");
                if l_Details_0 then
                    v94.Active = true;
                    v94.Activated:Connect(function() --[[ Line: 543 ]]
                        -- upvalues: l_Details_0 (copy), v44 (copy), v94 (copy), l_TweenService_0 (ref)
                        l_Details_0.Visible = not l_Details_0.Visible;
                        task.defer(function() --[[ Line: 547 ]]
                            -- upvalues: v44 (ref), v94 (ref), l_TweenService_0 (ref)
                            local v96 = v44.indexContents.CanvasPosition.Y + v94.AbsolutePosition.Y - v44.indexContents.AbsolutePosition.Y - (v44.indexContents.AbsoluteWindowSize.Y / 2 - v94.AbsoluteSize.Y / 2);
                            if v96 < 0 or v44.indexContents.AbsoluteCanvasSize.Y < v96 then
                                v96 = 0;
                            end;
                            local v97 = l_TweenService_0:Create(v44.indexContents, TweenInfo.new(0.2), {
                                CanvasPosition = Vector2.new(0, v96)
                            });
                            v97.Completed:Once(function() --[[ Line: 562 ]]
                                -- upvalues: v97 (copy)
                                v97:Destroy();
                            end);
                            v97:Play();
                        end);
                    end);
                end;
            end;
        end;
        v44:SetTraitRerollType(1);
        return;
    end;
end;
v34.Opening = function(v98) --[[ Line: 575 ]] --[[ Name: Opening ]]
    -- upvalues: v13 (copy), v12 (copy)
    v98.changeUnitButton.Content.Plus.Visible = v98._selectedUnit == nil;
    v98.towerNameLabel.Text = if v98._selectedUnit then v13:GetUnitValue(v98._selectedUnit.Name, "FullName") else "";
    if v98._selectedUnit then
        v98.dumpster:Add(v12.new(v98.towerPreviewFrame, v98._selectedUnit.Name));
        local v99 = select(2, v13:GetRarity(v98._selectedUnit.Name));
        if v99 then
            v98.changeUnitButton.Content.Backdrop:SetAttribute("Rarity", v99);
            v98.changeUnitButton.Content.Backdrop:AddTag("VisualizeRarity");
            v98.changeUnitButton.Content.Glow:SetAttribute("Rarity", v99);
            v98.changeUnitButton.Content.Glow:AddTag("VisualizeRarity");
        end;
        local v100 = v98._selectedUnit.Data and v98._selectedUnit.Data.Trait;
        local v101 = v98._selectedUnit.Data and v98._selectedUnit.Data.Trait2;
        v98[v100 and "UpdateTraitInfo" or "ClearTraitInfo"](v98, v100);
        v98[v101 and "UpdateTraitInfo" or "ClearTraitInfo"](v98, v101, false, true);
    else
        v98:ClearTraitInfo();
        v98:ClearTraitInfo(nil, nil, true);
        v98:SetTraitRerollType(1);
        v98.indexFrame.Contents.CanvasPosition = Vector2.zero;
    end;
    v98:UpdateTraitLockStates();
end;
v34.Opened = function(v102) --[[ Line: 608 ]] --[[ Name: Opened ]]
    -- upvalues: v28 (ref), l_GuiService_0 (copy)
    if not v28:IsConsole() then
        return;
    elseif not v102._selectedUnit then
        l_GuiService_0.SelectedObject = v102.changeUnitButton;
        return;
    else
        l_GuiService_0.SelectedObject = v102.rollButton;
        return;
    end;
end;
v34.Closed = function(v103) --[[ Line: 622 ]] --[[ Name: Closed ]]
    v103.dumpster:Destroy();
    v103:ClearSelectedUnit();
    v103.changeUnitButton.Content.Backdrop:RemoveTag("VisualizeRarity");
    v103.changeUnitButton.Content.Backdrop:SetAttribute("Rarity");
    v103.changeUnitButton.Content.Glow:RemoveTag("VisualizeRarity");
    v103.changeUnitButton.Content.Glow:SetAttribute("Rarity");
    for _, v105 in v103.indexFrame.Contents:GetChildren() do
        if v105:IsA("GuiButton") then
            local l_Details_1 = v105:FindFirstChild("Details");
            if l_Details_1 then
                l_Details_1.Visible = false;
            end;
        end;
    end;
end;
v34.SetTraitRerollType = function(v107, v108) --[[ Line: 649 ]] --[[ Name: SetTraitRerollType ]]
    -- upvalues: v33 (copy), v21 (copy), v17 (copy), v11 (copy), v6 (copy)
    if v108 then
        v107._traitTypeIndex = v108;
    else
        v107._traitTypeIndex = v107._traitTypeIndex + 1;
        if v107._traitTypeIndex > #v33 then
            v107._traitTypeIndex = 1;
        end;
    end;
    local v109 = 1;
    if v107._traitTypeIndex == 1 then
        v109 = 2;
    end;
    v107._currencyType = v33[v107._traitTypeIndex or 1];
    v107.currencyCycleBtn.PotionType.Image = v21.Currency[v33[v109]] or "";
    v107.traitRollFrame.Visible = v107._currencyType == "TraitRolls";
    v107.goldenTraitRollFrame.Visible = v107._currencyType == "GoldenTraitRolls";
    v107.pityBars.TraitRolls.Visible = v107._currencyType == "TraitRolls";
    v107.pityBars.GoldenTraitRolls.Visible = v107._currencyType == "GoldenTraitRolls";
    for _, v111 in v107.shopFrame:GetChildren() do
        if v111:IsA("Frame") then
            if v107._currencyType == "GoldenTraitRolls" then
                v111.Visible = string.find(v111.Name, v107._currencyType) ~= nil;
            else
                v111.Visible = string.find(v111.Name, "GoldenTraitRolls") == nil;
            end;
        end;
    end;
    if v107._traitTooltip then
        v107._traitTooltip:Destroy();
    end;
    v107._traitTooltip = v17.new(v107.traitCurrencyButton, {
        Name = v107._currencyType
    });
    v107._traitTooltip.OnDestroyed = function() --[[ Line: 693 ]]
        -- upvalues: v107 (copy)
        v107._traitTooltip = nil;
    end;
    local l_v11_Traits_0 = v11:GetTraits(v107._currencyType);
    local v113 = {};
    for v114, v115 in l_v11_Traits_0 do
        table.insert(v113, {
            name = v114, 
            weight = v115.weight
        });
    end;
    table.sort(v113, function(v116, v117) --[[ Line: 709 ]]
        return v116.weight > v117.weight;
    end);
    for _, v119 in v107.indexFrame.Contents:GetChildren() do
        if v119:IsA("GuiButton") then
            local l_Name_0 = v119.Name;
            local v121 = l_v11_Traits_0[l_Name_0];
            if not v121 then
                v119.Visible = false;
            else
                local _, v125 = v6.Find(v113, function(v122, _) --[[ Line: 726 ]]
                    -- upvalues: l_Name_0 (copy)
                    return v122.name == l_Name_0;
                end);
                v119.LayoutOrder = v125;
                v119.Main.Icon.Chance.Text = ("%*%%"):format(v121.weight);
                v119.Visible = true;
            end;
        end;
    end;
end;
v34.SelectUnit = function(v126, v127) --[[ Line: 736 ]] --[[ Name: SelectUnit ]]
    -- upvalues: v14 (copy), v24 (ref)
    v126._selectedUnit = v127;
    if v127.Data.Trait1Locked or v127.Data.Trait2Locked then
        v126._minimumTraitsRequired = v14.TRAIT_REROLL_COSTS.Locked;
    else
        v126._minimumTraitsRequired = v14.TRAIT_REROLL_COSTS.Unlocked;
    end;
    v24:Toggle(script.Name, true);
end;
v34.UpdateTraitInfo = function(v128, v129, v130, v131) --[[ Line: 748 ]] --[[ Name: UpdateTraitInfo ]]
    -- upvalues: v11 (copy), v18 (copy)
    local l_v11_TraitIconTemplate_0 = v11:GetTraitIconTemplate(v129.Name);
    local l_v11_TraitTitle_0 = v11:GetTraitTitle(v129.Name);
    local l_v11_TraitDisplayName_0 = v11:GetTraitDisplayName(v129.Name);
    if v129.Tier then
        l_v11_TraitDisplayName_0 = l_v11_TraitDisplayName_0 .. (" %*"):format((v18:IntToRoman(v129.Tier)));
    end;
    if v131 then
        v128._currerentTraitData2 = v129;
    else
        v128._currerentTraitData1 = v129;
    end;
    if v131 then
        v128.traitNameLabel2.Text = l_v11_TraitDisplayName_0;
        v128:_swapGradient(v128.traitNameLabel2, l_v11_TraitTitle_0:FindFirstChildOfClass("UIGradient"));
        v128.traitIcon2.Image = l_v11_TraitIconTemplate_0.Image;
        v128:_swapGradient(v128.traitIcon2, l_v11_TraitIconTemplate_0:FindFirstChildOfClass("UIGradient"));
        v128.noTraitLabel2.Visible = false;
        v128.traitInfoFrame2.Visible = true;
        v128.traitFrame2.Visible = true;
        if v130 then
            v128.traitShime2:Play();
            return;
        end;
    else
        v128.traitNameLabel.Text = l_v11_TraitDisplayName_0;
        v128:_swapGradient(v128.traitNameLabel, l_v11_TraitTitle_0:FindFirstChildOfClass("UIGradient"));
        v128.traitIcon.Image = l_v11_TraitIconTemplate_0.Image;
        v128:_swapGradient(v128.traitIcon, l_v11_TraitIconTemplate_0:FindFirstChildOfClass("UIGradient"));
        v128.traitInfoFrame.Visible = true;
        v128.noTraitLabel.Visible = false;
        if v130 then
            v128.traitShime:Play();
        end;
    end;
end;
v34.UpdateTraitLockStates = function(v135) --[[ Line: 790 ]] --[[ Name: UpdateTraitLockStates ]]
    -- upvalues: v14 (copy)
    if not v135._selectedUnit or not v135._selectedUnit.Data or not v135._selectedUnit.Data.Trait2 then
        v135.traitLockBtn1.Visible = false;
        v135.traitLockBtn2.Visible = false;
        v135:_setMinimumTraitsRequired(v14.TRAIT_REROLL_COSTS.Unlocked);
        return;
    else
        local l_Data_0 = v135._selectedUnit.Data;
        local v137 = l_Data_0.Trait1Locked or false;
        local v138 = l_Data_0.Trait2Locked or false;
        v135.traitLockBtn1.Content.Locked.Visible = v137;
        v135.traitLockBtn1.Content.Unlocked.Visible = not v137;
        v135.traitLockBtn2.Content.Locked.Visible = v138;
        v135.traitLockBtn2.Content.Unlocked.Visible = not v138;
        if v137 or v138 then
            v135:_setMinimumTraitsRequired(v14.TRAIT_REROLL_COSTS.Locked);
        else
            v135:_setMinimumTraitsRequired(v14.TRAIT_REROLL_COSTS.Unlocked);
        end;
        v135.traitLockBtn1.Visible = true;
        v135.traitLockBtn2.Visible = true;
        return;
    end;
end;
v34.ClearTraitInfo = function(v139, _, _, v142) --[[ Line: 818 ]] --[[ Name: ClearTraitInfo ]]
    if v142 then
        v139.traitFrame2.Visible = false;
        return;
    else
        v139._currerentTraitData1 = nil;
        v139._currerentTraitData2 = nil;
        v139.traitInfoFrame.Visible = false;
        v139.noTraitLabel.Visible = true;
        return;
    end;
end;
v34.ClearSelectedUnit = function(v143) --[[ Line: 832 ]] --[[ Name: ClearSelectedUnit ]]
    v143.dumpster:Destroy();
    v143._selectedUnit = nil;
    v143.towerNameLabel.Text = "";
    v143.changeUnitButton.Content.Plus.Visible = true;
    v143:ClearTraitInfo();
    local l_UIGradient_0 = v143.changeUnitButton.Content.Backdrop:FindFirstChildOfClass("UIGradient");
    if l_UIGradient_0 then
        l_UIGradient_0:Destroy();
    end;
    v143.changeUnitBackup.backdropGradient:Clone().Parent = v143.changeUnitButton.Content.Backdrop;
    v143.changeUnitButton.Content.Backdrop.ImageColor3 = v143.changeUnitBackup.backdropColor;
    v143.changeUnitButton.Content.Glow.ImageColor3 = v143.changeUnitBackup.glowColor;
end;
v34.CanAffordRoll = function(v145) --[[ Line: 850 ]] --[[ Name: CanAffordRoll ]]
    local v146 = v145.traitRolls or 0;
    if v145._currencyType == "GoldenTraitRolls" then
        v146 = v145.goldenTraitRolls or 0;
    end;
    return v145._minimumTraitsRequired <= v146;
end;
v34._handleAutoSkip = function(v147) --[[ Line: 861 ]] --[[ Name: _handleAutoSkip ]]
    -- upvalues: v24 (ref), v26 (ref), v25 (ref), v4 (copy)
    v24:HandleButton(v147.autoSkipFrame.Main.Exit, function() --[[ Line: 862 ]]
        -- upvalues: v147 (copy)
        v147.autoSkipFrame.Visible = false;
    end);
    for _, v149 in v147.autoSkipFrame.Main.Buttons:GetChildren() do
        if v149:IsA("TextButton") then
            v24:HandleButton(v149, function() --[[ Line: 871 ]]
                -- upvalues: v26 (ref), v149 (copy), v147 (copy)
                v26:ToggleAutoSkip(v149.Name, not v147._currentAutoSkipData[v149.Name]);
            end);
        end;
    end;
    v25:OnChanged(v4.Player, "AutoSkipTraits", function(v150) --[[ Line: 876 ]]
        -- upvalues: v147 (copy)
        if not v150 then
            v150 = {};
        end;
        v147._currentAutoSkipData = v150;
        for _, v152 in v147.autoSkipFrame.Main.Buttons:GetChildren() do
            if v152:IsA("TextButton") then
                v152.Content.AutoSkip.Visible = v150[v152.Name];
            end;
        end;
    end, true);
end;
v34._handleKeepFlags = function(v153) --[[ Line: 893 ]] --[[ Name: _handleKeepFlags ]]
    -- upvalues: v35 (ref), v24 (ref), v11 (copy), v18 (copy), v5 (copy), v26 (ref)
    local function _(v154, v155) --[[ Line: 894 ]] --[[ Name: setButtonColor ]]
        -- upvalues: v153 (copy)
        if v155 then
            v154.Enabled.Visible = true;
            v154.Disabled.Visible = false;
            v153.conditionHolder.Safety.Visible = true;
            v153.conditionHolder.NoSafety.Visible = false;
            return;
        else
            v154.Enabled.Visible = false;
            v154.Disabled.Visible = true;
            v153.conditionHolder.Safety.Visible = false;
            v153.conditionHolder.NoSafety.Visible = true;
            return;
        end;
    end;
    local l_traitKeepBtn_0 = v153.traitKeepBtn;
    if v35 then
        l_traitKeepBtn_0.Enabled.Visible = true;
        l_traitKeepBtn_0.Disabled.Visible = false;
        v153.conditionHolder.Safety.Visible = true;
        v153.conditionHolder.NoSafety.Visible = false;
    else
        l_traitKeepBtn_0.Enabled.Visible = false;
        l_traitKeepBtn_0.Disabled.Visible = true;
        v153.conditionHolder.Safety.Visible = false;
        v153.conditionHolder.NoSafety.Visible = true;
    end;
    v24:HandleButton(v153.traitKeepBtn, function() --[[ Line: 912 ]]
        -- upvalues: v35 (ref), v153 (copy)
        v35 = not v35;
        local l_traitKeepBtn_1 = v153.traitKeepBtn;
        if v35 then
            l_traitKeepBtn_1.Enabled.Visible = true;
            l_traitKeepBtn_1.Disabled.Visible = false;
            v153.conditionHolder.Safety.Visible = true;
            v153.conditionHolder.NoSafety.Visible = false;
            return;
        else
            l_traitKeepBtn_1.Enabled.Visible = false;
            l_traitKeepBtn_1.Disabled.Visible = true;
            v153.conditionHolder.Safety.Visible = false;
            v153.conditionHolder.NoSafety.Visible = true;
            return;
        end;
    end);
    l_traitKeepBtn_0 = function(v159, v160) --[[ Line: 917 ]] --[[ Name: loadFrameBasedOnIcon ]]
        -- upvalues: v11 (ref), v18 (ref), v153 (copy)
        if not v160 then
            v159.Info.TraitName.Text = "NONE";
            v159.Info.TraitName.TextColor3 = Color3.fromRGB(80, 45, 113);
            v159.Info.Icon.Image = "";
            local l_UIGradient_1 = v159.Info.TraitName:FindFirstChildOfClass("UIGradient");
            if l_UIGradient_1 then
                l_UIGradient_1:Destroy();
            end;
            local l_UIStroke_0 = v159.Info.TraitName:FindFirstChildOfClass("UIStroke");
            if l_UIStroke_0 then
                l_UIStroke_0:Destroy();
            end;
            return;
        else
            v159.Info.TraitName.TextColor3 = Color3.fromRGB(255, 255, 255);
            local l_v11_TraitIconTemplate_1 = v11:GetTraitIconTemplate(v160.Name);
            local l_v11_TraitTitle_1 = v11:GetTraitTitle(v160.Name);
            local l_v11_TraitDisplayName_1 = v11:GetTraitDisplayName(v160.Name);
            if v160.Tier then
                l_v11_TraitDisplayName_1 = l_v11_TraitDisplayName_1 .. (" %*"):format((v18:IntToRoman(v160.Tier)));
            end;
            v159.Info.TraitName.Text = l_v11_TraitDisplayName_1;
            v159.Info.Icon.Image = l_v11_TraitIconTemplate_1.Image;
            v153:_swapGradient(v159.Info.TraitName, l_v11_TraitTitle_1:FindFirstChildOfClass("UIGradient"));
            v153:_swapGradient(v159.Info.Icon, l_v11_TraitIconTemplate_1:FindFirstChildOfClass("UIGradient"));
            return;
        end;
    end;
    v153._confirmationResponseDumpster = v5.new();
    v26.UnitsTraitOption:Connect(function(v166, v167) --[[ Line: 957 ]]
        -- upvalues: v153 (copy), l_traitKeepBtn_0 (copy), v26 (ref)
        v153.confirmation.Visible = true;
        if v166 then
            v153.confirmationBeforeNAfter.After.Trait.Visible = true;
            v153.confirmationBeforeNAfter.Before.Trait.Visible = true;
            l_traitKeepBtn_0(v153.confirmationBeforeNAfter.After.Trait, v166);
            l_traitKeepBtn_0(v153.confirmationBeforeNAfter.Before.Trait, v153._currerentTraitData1);
        end;
        if v167 then
            v153.confirmationBeforeNAfter.Size = UDim2.new(1, 0, 0, 250);
            l_traitKeepBtn_0(v153.confirmationBeforeNAfter.After.BonusTrait, v167);
            v153.confirmationBeforeNAfter.After.BonusTrait.Visible = true;
            l_traitKeepBtn_0(v153.confirmationBeforeNAfter.Before.BonusTrait, v153._currerentTraitData2);
            v153.confirmationBeforeNAfter.Before.BonusTrait.Visible = true;
            if not v166 then
                v153.confirmationBeforeNAfter.Size = UDim2.new(1, 0, 0, 120);
                v153.confirmationBeforeNAfter.After.Trait.Visible = false;
                v153.confirmationBeforeNAfter.Before.Trait.Visible = false;
            end;
        else
            v153.confirmationBeforeNAfter.Size = UDim2.new(1, 0, 0, 120);
            v153.confirmationBeforeNAfter.After.BonusTrait.Visible = false;
            v153.confirmationBeforeNAfter.Before.BonusTrait.Visible = false;
        end;
        v153._confirmationResponseDumpster:Add(v153.confirmationBottomBtns.Button1.MouseButton1Down:Connect(function() --[[ Line: 989 ]]
            -- upvalues: v153 (ref), v26 (ref)
            v153.confirmation.Visible = false;
            v26:AcceptTempTrade();
            v153._confirmationResponseDumpster:Clean();
        end));
        v153._confirmationResponseDumpster:Add(v153.confirmationBottomBtns.Button2.MouseButton1Down:Connect(function() --[[ Line: 995 ]]
            -- upvalues: v153 (ref)
            v153.confirmation.Visible = false;
            v153._confirmationResponseDumpster:Clean();
        end));
    end);
end;
v34._handlePityProgressionBars = function(v168) --[[ Line: 1002 ]] --[[ Name: _handlePityProgressionBars ]]
    -- upvalues: v25 (ref), v4 (copy), v14 (copy), v18 (copy)
    v25:OnChanged(v4.Player, "TraitPity", function(v169) --[[ Line: 1003 ]]
        -- upvalues: v14 (ref), v168 (copy), v18 (ref)
        for v170, v171 in v14.SUMMONING.TRAIT_PITY do
            local l_FirstChild_1 = v168.pityBars:FindFirstChild(v170);
            if l_FirstChild_1 then
                local v173 = v169[v170] or 0;
                l_FirstChild_1.Fill.Size = UDim2.fromScale(math.clamp(v173 / v171, 0, 1), 1);
                l_FirstChild_1.Progression.Text = ("%*/%*"):format(v18:CommaNumber(v173), (v18:CommaNumber(v171)));
            end;
        end;
    end, true);
end;
v34._setMinimumTraitsRequired = function(v174, v175) --[[ Line: 1019 ]] --[[ Name: _setMinimumTraitsRequired ]]
    if not v175 then
        return;
    else
        v174._minimumTraitsRequired = v175;
        v174.MinimumTraitsChanged:Fire(v175);
        return;
    end;
end;
v34._swapGradient = function(_, v177, v178) --[[ Line: 1028 ]] --[[ Name: _swapGradient ]]
    if not v178 then
        return;
    else
        local l_UIGradient_2 = v177:FindFirstChildOfClass("UIGradient");
        if l_UIGradient_2 then
            l_UIGradient_2:Destroy();
        end;
        v178:Clone().Parent = v177;
        return;
    end;
end;
v34._toggleIndex = function(v180, v181, v182) --[[ Line: 1042 ]] --[[ Name: _toggleIndex ]]
    -- upvalues: v31 (copy), v32 (copy), v7 (copy), v10 (copy)
    local v183 = v181 and 1 or 0.5;
    local v184 = if v181 then v31 else v32;
    v180.indexState = v181;
    if v182 then
        for _, v186 in v180.indexTweens[v181] do
            if v186.PlaybackState == Enum.PlaybackState.Playing then
                v186:Cancel();
            end;
        end;
        v180.indexFrameScale.Scale = v183;
        v180.indexFrame.Position = v184;
        v180.indexFrame.Visible = v181;
        return;
    else
        if v181 then
            v180.indexFrame.Visible = true;
        end;
        local v187 = {};
        for _, v189 in v180.indexTweens[v181] do
            table.insert(v187, v7.new(function(v190, v191) --[[ Line: 1068 ]]
                -- upvalues: v189 (copy)
                v189.Completed:Once(function(v192) --[[ Line: 1069 ]]
                    -- upvalues: v191 (copy), v190 (copy)
                    if v192 ~= Enum.PlaybackState.Completed then
                        v191();
                        return;
                    else
                        v190();
                        return;
                    end;
                end);
            end));
            v189:Play();
        end;
        v7.all(v187):andThen(function() --[[ Line: 1083 ]]
            -- upvalues: v181 (copy), v180 (copy), v32 (ref)
            if not v181 then
                v180.indexFrame.Position = v32;
                v180.indexFrameScale.Scale = 0.5;
                v180.indexFrame.Visible = false;
            end;
        end, v10.EmptyPromiseCatch);
        return;
    end;
end;
v34._connectPurchaseButton = function(_, v194) --[[ Line: 1092 ]] --[[ Name: _connectPurchaseButton ]]
    -- upvalues: v10 (copy), v27 (ref), v16 (copy), v24 (ref)
    local l_v194_Attribute_0 = v194:GetAttribute("PurchaseName");
    if not l_v194_Attribute_0 then
        v10:Warn("PurchaseName attribute not found on button:", v194:GetFullName());
        return;
    else
        local l_v194_Attribute_1 = v194:GetAttribute("PurchaseType");
        if not l_v194_Attribute_1 then
            v10:Warn("PurchaseType attribute not found on button:", v194:GetFullName());
            return;
        else
            local v197 = v27[l_v194_Attribute_1 == "DevProducts" and "GetProduct" or "GetGamepass"](v27, l_v194_Attribute_0);
            if not v197 then
                return;
            else
                if v194.Parent:FindFirstChild("Title") then
                    v194.Parent.Title.Text = ("%* Trait Rerolls"):format(v197.purchaseData.currency.amount);
                end;
                local v198 = if l_v194_Attribute_1 == "DevProducts" then Enum.InfoType.Product else Enum.InfoType.GamePass;
                v16(v197.purchaseId, v198):andThen(function(v199) --[[ Line: 1118 ]]
                    -- upvalues: v194 (copy), l_v194_Attribute_1 (copy), v24 (ref), v27 (ref), l_v194_Attribute_0 (copy)
                    if v194.Content:FindFirstChild("Amount") then
                        v194.Content.Amount.Text = v199.PriceInRobux or "?";
                        if v199.PriceInRobux and v194.Parent.Parent then
                            v194.Parent.Parent.LayoutOrder = v199.PriceInRobux;
                        end;
                    end;
                    local v200 = l_v194_Attribute_1 == "DevProducts" and "PromptProductPurchase" or "PromptGamepassPurchase";
                    v24:HandleButton(v194, function() --[[ Line: 1128 ]]
                        -- upvalues: v27 (ref), v200 (copy), l_v194_Attribute_0 (ref)
                        v27[v200](v27, l_v194_Attribute_0);
                    end);
                end);
                return;
            end;
        end;
    end;
end;
v34._getCurrencyDisplayName = function(v201) --[[ Line: 1134 ]] --[[ Name: _getCurrencyDisplayName ]]
    -- upvalues: v22 (copy)
    local v202 = v22.Currency[v201._currencyType];
    if not v202 then
        return "Trait Rerolls";
    else
        return v202.DisplayName or v202.displayName;
    end;
end;
return v34;