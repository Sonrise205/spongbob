local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.Shime);
local v13 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v14 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v15 = require(v3.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v19 = require(l_ReplicatedStorage_0.TraitsData);
local v20 = require(v3.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v21 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v22 = require(l_ReplicatedStorage_0.Shared.Util.FusionsUtil);
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
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = {
    [true] = Color3.fromRGB(50, 58, 125), 
    [false] = Color3.fromRGB(115, 199, 120)
};
local v42 = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In);
local v43 = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
local v44 = {
    Level = "Fusion Levels", 
    Shiny = "Shiny", 
    Wumbo = "Wumbo", 
    Trait = "Traits", 
    NeptunesCrown = "Neptune's Crown", 
    ShinyWumbo = "Shiny Wumbo"
};
local v45 = {
    "Level", 
    "Trait", 
    "Shiny", 
    "Wumbo", 
    "NeptunesCrown", 
    "ShinyWumbo"
};
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
local l_Pets_0 = l_ReplicatedStorage_0.Models.Pets;
local l_Shiny_0 = l_ReplicatedStorage_0.VFX.Towers.Shiny;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    isPetMode = false, 
    Init = function(v49, v50, v51) --[[ Line: 106 ]] --[[ Name: Init ]]
        -- upvalues: v23 (ref), v3 (copy), v24 (ref), v25 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v35 (ref), v36 (ref), v37 (ref), v4 (copy)
        v23 = v3.GetController("UIController");
        v24 = v3.GetController("DataController");
        v25 = v3.GetController("UnitController");
        v26 = v3.GetService("UnitService");
        v27 = v3.GetController("PurchaseController");
        v28 = v3.GetController("CharacterController");
        v29 = v3.GetController("BlurController");
        v30 = v3.GetController("FOVController");
        v31 = v3.GetController("DeviceTypeController");
        v32 = v3.GetController("CamShakeController");
        v33 = v3.GetController("AudioController");
        v34 = v3.GetController("GlobalMintController");
        v35 = v3.GetController("GlobalUnitTrackerController");
        v36 = v3.GetService("PetService");
        v37 = v3.GetController("PetController");
        v49.currentMode = v51;
        v49.ui = v50;
        v49.main = v50.Main;
        v49.main.BackgroundTransparency = 0.5;
        v49.mainInner = v49.main.Inner;
        v49.exitButton = v49.mainInner.Exit;
        local l_Content_0 = v49.mainInner.Content;
        v49.coinDisplay = l_Content_0.Coins;
        v49.coinAmountLabel = v49.coinDisplay.Content.Amount;
        v49.fusionFrame = l_Content_0.Fusion;
        v49.fuseButton = l_Content_0.Fuse;
        v49.keeperUnit = v49.fusionFrame.Keeper;
        v49.skipHint = v49.main.SkipHint;
        v49.starVFX = v49.main.StarVFX;
        v49.currentStar = v49.starVFX.Current;
        v49.newStar = v49.starVFX.Star;
        v49.maxFuseButton = l_Content_0.FuseMax;
        v49.hoverTooltip = v49.main.HoverTooltip;
        v49.keeperUnitBackup = {
            backdropGradient = v49.keeperUnit.Content.Backdrop.UIGradient:Clone(), 
            backdropColor = v49.keeperUnit.Content.Backdrop.ImageColor3, 
            glowColor = v49.keeperUnit.Content.Glow.ImageColor3
        };
        v49.selectionFrame = v49.main.Selection;
        local l_Inner_0 = v49.selectionFrame.Inner;
        local l_Buttons_0 = l_Inner_0.Buttons;
        v49.confirmSelection = l_Buttons_0.Confirm;
        v49.cancelSelection = l_Buttons_0.Cancel;
        v49.selectMaxButton = l_Buttons_0.SelectMax;
        v49.selectionBin = l_Inner_0.Bin.Bin;
        v49.selectionTemplate = v49.selectionBin.Template:Clone();
        v49.selectionBin.Template:Destroy();
        v49.burnerSlots = {};
        v49.burnerBackup = nil;
        for _, v56 in v49.fusionFrame.BurnerSlots:GetDescendants() do
            if v56:IsA("TextButton") then
                local v57 = tonumber(v56.Name);
                if v57 then
                    v49.burnerSlots[v57] = v56;
                    if not v49.burnerBackup then
                        v49.burnerBackup = {
                            backdropGradient = v56.Content.Backdrop.UIGradient:Clone(), 
                            backdropColor = v56.Content.Backdrop.ImageColor3, 
                            glowColor = v56.Content.Glow.ImageColor3
                        };
                    end;
                end;
            end;
        end;
        v49.coins = 0;
        v49.burnerViewports = {};
        v49.keeperViewport = nil;
        v49._selectedUnit = nil;
        v49._selectedBurners = {};
        v49._burnerData = {};
        v49._replacingBurner = nil;
        v49._originalBurner = nil;
        v49._expectedDuplicates = 0;
        v49.canSkipVFX = false;
        v49.dumpster = v4.new();
        v49.selectionDumpster = v4.new();
        v49.vfxDumpster = v4.new();
        v49.keeperUnit.Content.TowerName.Text = "";
        v49.selectionFrame.Visible = false;
        v49.coinDisplay.Visible = false;
    end, 
    Start = function(v58) --[[ Line: 213 ]] --[[ Name: Start ]]
        -- upvalues: v38 (ref), v23 (ref), v39 (ref), v40 (ref), v14 (copy), v3 (copy), v24 (ref), v9 (copy), v13 (copy), v11 (copy), v5 (copy), v36 (ref), v26 (ref), v22 (copy), v45 (copy), v44 (copy), v27 (ref)
        v38 = v23:GetModuleAsync("Units"):expect();
        v39 = v23:GetModuleAsync("Notification"):expect();
        v40 = v23:GetModuleAsync("MessagePrompt"):expect();
        v58.PolicyInfo = v14(v3.Player):expect();
        if not v58.PolicyInfo then
            v3.Player:Kick("Failed to get policy info. (Please rejoin)");
            return;
        else
            v58.PaidItemsRestricted = v58.PolicyInfo.ArePaidRandomItemsRestricted or false;
            v58:Reset();
            v24:OnChanged(v3.Player, "Currency.Coins", function(v59) --[[ Line: 230 ]] --[[ Name: updateCurrencyAmount ]]
                -- upvalues: v58 (copy)
                v58.coins = v59;
                v58.coinAmountLabel.Text = v59;
            end, true);
            v24:OnChanged(v3.Player, "Currency", function(v60) --[[ Line: 236 ]]
                -- upvalues: v58 (copy)
                local l_Coins_0 = v60.Coins;
                v58.coins = l_Coins_0;
                v58.coinAmountLabel.Text = l_Coins_0;
            end, true);
            v23:HandleButton(v58.exitButton, function() --[[ Line: 240 ]]
                -- upvalues: v23 (ref)
                v23:Toggle(script.Name, false);
            end);
            v23:HandleButton(v58.keeperUnit, function() --[[ Line: 244 ]]
                -- upvalues: v58 (copy), v38 (ref)
                if v58.selectionFrame.Visible then
                    return;
                else
                    v38:OpenWithState("FusionSelection");
                    return;
                end;
            end, {
                MouseEnter = function() --[[ Line: 251 ]] --[[ Name: MouseEnter ]]
                    -- upvalues: v58 (copy)
                    if v58.selectionFrame.Visible then
                        return;
                    else
                        v58:_showHoverTooltip(v58.keeperUnit, v58._selectedUnit);
                        return;
                    end;
                end, 
                MouseLeave = function() --[[ Line: 259 ]] --[[ Name: MouseLeave ]]
                    -- upvalues: v58 (copy)
                    if v58.selectionFrame.Visible then
                        return;
                    else
                        v58:_hideHoverTooltip(v58.keeperUnit, v58._selectedUnit);
                        return;
                    end;
                end
            });
            for v62, v63 in v58.burnerSlots do
                local function v65() --[[ Line: 269 ]] --[[ Name: getBurnerInfo ]]
                    -- upvalues: v58 (copy), v62 (copy), v9 (ref)
                    if not v58._selectedUnit then
                        return;
                    else
                        local v64 = v58._burnerData[v62];
                        if not v64 then
                            return;
                        else
                            return {
                                Name = v58._selectedUnit.Name, 
                                UID = v58._selectedBurners[v62], 
                                Type = not v58.isPetMode and v9:GetUnitValue(v58._selectedUnit.Name, "Type"), 
                                Data = v64
                            };
                        end;
                    end;
                end;
                v23:HandleButton(v63, function() --[[ Line: 287 ]]
                    -- upvalues: v58 (copy), v39 (ref), v62 (copy)
                    local v66 = v58.isPetMode and "pet" or "unit";
                    if not v58._selectedUnit then
                        v39:Notify({
                            message = ("You must select a %* to fuse first"):format(v66), 
                            isPositive = false
                        });
                        return;
                    else
                        v58:OpenSelection(v62);
                        return;
                    end;
                end, {
                    MouseEnter = function() --[[ Line: 301 ]] --[[ Name: MouseEnter ]]
                        -- upvalues: v58 (copy), v63 (copy), v65 (copy)
                        if v58.selectionFrame.Visible then
                            return;
                        else
                            v58:_showHoverTooltip(v63, v65());
                            return;
                        end;
                    end, 
                    MouseLeave = function() --[[ Line: 309 ]] --[[ Name: MouseLeave ]]
                        -- upvalues: v58 (copy), v63 (copy), v65 (copy)
                        if v58.selectionFrame.Visible then
                            return;
                        else
                            v58:_hideHoverTooltip(v63, v65());
                            return;
                        end;
                    end
                });
            end;
            v23:HandleButton(v58.confirmSelection, function() --[[ Line: 319 ]]
                -- upvalues: v58 (copy), v39 (ref)
                if not v58.selectionFrame.Visible then
                    return;
                elseif v58.confirmSelection.Disabled.Visible then
                    local v67 = v58._expectedDuplicates == 1 and "You need to select a duplicate to replace with" or ("You need to select %* duplicates"):format(v58._expectedDuplicates);
                    v39:Notify({
                        message = v67, 
                        isPositive = false
                    });
                    return;
                else
                    v58:CloseSelection();
                    if v58._expectedDuplicates == 1 then
                        v58:_loadBurnerSlot(v58._replacingBurner, v58._selectedBurners[v58._replacingBurner]);
                        return;
                    else
                        v58:_populateBurnerSlots();
                        v58:_enableFusion();
                        return;
                    end;
                end;
            end);
            v23:HandleButton(v58.cancelSelection, function() --[[ Line: 348 ]]
                -- upvalues: v58 (copy)
                if not v58.selectionFrame.Visible then
                    return;
                else
                    v58:CloseSelection();
                    if v58._expectedDuplicates == 1 then
                        if v58._originalBurner and v58._replacingBurner then
                            v58._selectedBurners[v58._replacingBurner] = v58._originalBurner;
                        end;
                        return;
                    else
                        v58:Reset();
                        return;
                    end;
                end;
            end);
            v23:HandleButton(v58.selectMaxButton, function() --[[ Line: 366 ]]
                -- upvalues: v58 (copy), v13 (ref), v11 (ref), v39 (ref)
                table.clear(v58._selectedBurners);
                v58._replacingBurner = false;
                local v68 = 0;
                local v69 = {};
                v13:IterateClass(v58.selectionBin, "TextButton", function(v70) --[[ Line: 374 ]]
                    -- upvalues: v69 (copy)
                    v69[v70.LayoutOrder] = v70;
                end);
                for _, v72 in v69 do
                    v72.Content.Selected.Visible = false;
                    if v11.FUSION.NEEDED <= v68 then
                        return;
                    else
                        local l_v72_Attribute_0 = v72:GetAttribute("UnitUID");
                        local l_v72_Attribute_1 = v72:GetAttribute("UnitName");
                        if not l_v72_Attribute_0 or not l_v72_Attribute_1 then
                            return;
                        else
                            v68 = v68 + 1;
                            local v75 = table.find(v58._selectedBurners, l_v72_Attribute_0);
                            if v75 and not v58._replacingBurner then
                                table.remove(v58._selectedBurners, v75);
                                v72.Content.Selected.Visible = false;
                                v58:_updateSelectionConfirmButton();
                                return;
                            elseif v75 and v58._replacingBurner then
                                v39:Notify({
                                    message = "You must pick a different duplicate to replace the current one", 
                                    isPositive = false
                                });
                                return;
                            elseif v58._replacingBurner then
                                local v76 = v58._selectedBurners[v58._replacingBurner];
                                local l_FirstChild_0 = v58.selectionBin:FindFirstChild(v76);
                                if l_FirstChild_0 then
                                    l_FirstChild_0.Content.Selected.Visible = false;
                                end;
                                v58._selectedBurners[v58._replacingBurner] = l_v72_Attribute_0;
                                v72.Content.Selected.Visible = true;
                                v58:_updateSelectionConfirmButton(true);
                                return;
                            elseif #v58._selectedBurners + 1 > v58._expectedDuplicates then
                                local v78 = v58._expectedDuplicates == 1 and "You can only select 1 duplicate" or ("You can only select %* duplicates"):format(v58._expectedDuplicates);
                                v39:Notify({
                                    message = v78, 
                                    isPositive = false
                                });
                                return;
                            else
                                table.insert(v58._selectedBurners, l_v72_Attribute_0);
                                v72.Content.Selected.Visible = true;
                                v58:_updateSelectionConfirmButton();
                            end;
                        end;
                    end;
                end;
            end);
            local function v83() --[[ Line: 445 ]] --[[ Name: fuse ]]
                -- upvalues: v58 (copy), v5 (ref), v36 (ref), v26 (ref), v39 (ref)
                if not v58._selectedUnit or not v58._selectedUnit.Data then
                    return;
                else
                    local v79 = v5.Copy(v58._selectedUnit.Data, true);
                    local v80 = v58.isPetMode and v36 or v26;
                    local l_isPetMode_0 = v58.isPetMode;
                    v80:Fuse(v58._selectedUnit.Name, v58._selectedUnit.UID, v58._selectedBurners):andThen(function(v82) --[[ Line: 456 ]]
                        -- upvalues: v58 (ref), v39 (ref), v79 (copy), l_isPetMode_0 (copy)
                        if not v82 then
                            v58:Reset();
                            v39:Notify({
                                message = "Something went wrong, please try again", 
                                isPositive = false
                            });
                            return;
                        else
                            v39:Notify({
                                message = "Fusion successful!", 
                                isPositive = true
                            });
                            v58.mainInner.Visible = false;
                            v58:_fadeBackground(false);
                            v58:Reset();
                            v58:_playVFX(v79, nil, l_isPetMode_0);
                            return;
                        end;
                    end);
                    return;
                end;
            end;
            local function v101() --[[ Line: 482 ]] --[[ Name: fuseMax ]]
                -- upvalues: v58 (copy), v5 (ref), v24 (ref), v3 (ref), v22 (ref), v45 (ref), v44 (ref), v36 (ref), v26 (ref), v39 (ref), v40 (ref)
                if not v58._selectedUnit or not v58._selectedUnit.Data then
                    return;
                else
                    local v84 = v5.Copy(v58._selectedUnit.Data, true);
                    local l_isPetMode_1 = v58.isPetMode;
                    local v86 = v24:Get(v3.Player, l_isPetMode_1 and "Pets" or "Units"):expect();
                    v86 = v86 and v86[v58._selectedUnit.Name];
                    local v87 = v86 and v5.Copy(v86, true);
                    local v88;
                    v87, v88 = v22:SmartGetBurners(v58.coins or 0, v58._selectedUnit.UID, v58._selectedUnit.Data, v87, l_isPetMode_1);
                    local v89 = {
                        Level = false, 
                        Shiny = false, 
                        Wumbo = false, 
                        Trait = false, 
                        NeptunesCrown = false, 
                        ShinyWumbo = false
                    };
                    for _, v91 in v88 do
                        if v91.Stars > 0 then
                            v89.Level = true;
                        end;
                        if v91.Trait2 then
                            v89.NeptunesCrown = true;
                        elseif v91.Trait then
                            v89.Trait = true;
                        end;
                        if v91.Shiny and v91.Mega then
                            v89.ShinyWumbo = true;
                        else
                            if v91.Shiny then
                                v89.Shiny = true;
                            end;
                            if v91.Mega then
                                v89.Wumbo = true;
                            end;
                        end;
                    end;
                    local v92 = ("Are you sure you want to fuse this %* to the max?"):format(l_isPetMode_1 and "pet" or "unit");
                    local v93 = false;
                    for _, v95 in v45 do
                        if v89[v95] then
                            if not v93 then
                                v93 = true;
                                v92 = v92 .. (" This will fuse %* that have: "):format(l_isPetMode_1 and "pets" or "units");
                            end;
                            v92 = v92 .. v44[v95] .. ", ";
                        end;
                    end;
                    if v93 then
                        v92 = v92:sub(1, -3) .. ".";
                    end;
                    local function _() --[[ Line: 558 ]] --[[ Name: callFuse ]]
                        -- upvalues: v58 (ref), v36 (ref), v26 (ref), v39 (ref), v84 (copy), l_isPetMode_1 (copy)
                        (v58.isPetMode and v36 or v26):MaxFuse(v58._selectedUnit.Name, v58._selectedUnit.UID):andThen(function(v96, v97) --[[ Line: 561 ]]
                            -- upvalues: v58 (ref), v39 (ref), v84 (ref), l_isPetMode_1 (ref)
                            if not v96 then
                                v58:Reset();
                                v39:Notify({
                                    message = "Something went wrong, please try again", 
                                    isPositive = false
                                });
                                return;
                            else
                                v39:Notify({
                                    message = "Fusion successful!", 
                                    isPositive = true
                                });
                                v58.mainInner.Visible = false;
                                v58:_fadeBackground(false);
                                v58:Reset();
                                v58:_playVFX(v84, v97, l_isPetMode_1);
                                return;
                            end;
                        end);
                    end;
                    v40:Prompt({
                        message = v92, 
                        options = {
                            {
                                text = "Yes", 
                                callback = function() --[[ Line: 592 ]] --[[ Name: callback ]]
                                    -- upvalues: v58 (ref), v36 (ref), v26 (ref), v39 (ref), v84 (copy), l_isPetMode_1 (copy)
                                    (v58.isPetMode and v36 or v26):MaxFuse(v58._selectedUnit.Name, v58._selectedUnit.UID):andThen(function(v99, v100) --[[ Line: 561 ]]
                                        -- upvalues: v58 (ref), v39 (ref), v84 (ref), l_isPetMode_1 (ref)
                                        if not v99 then
                                            v58:Reset();
                                            v39:Notify({
                                                message = "Something went wrong, please try again", 
                                                isPositive = false
                                            });
                                            return;
                                        else
                                            v39:Notify({
                                                message = "Fusion successful!", 
                                                isPositive = true
                                            });
                                            v58.mainInner.Visible = false;
                                            v58:_fadeBackground(false);
                                            v58:Reset();
                                            v58:_playVFX(v84, v100, l_isPetMode_1);
                                            return;
                                        end;
                                    end);
                                end
                            }, 
                            {
                                text = "No"
                            }
                        }
                    });
                    return;
                end;
            end;
            v23:HandleButton(v58.fuseButton, function() --[[ Line: 601 ]]
                -- upvalues: v58 (copy), v11 (ref), v39 (ref), v40 (ref), v27 (ref), v83 (copy)
                if #v58._burnerData < 1 then
                    return;
                elseif v58.selectionFrame.Visible then
                    return;
                else
                    local v102 = select(2, v58:_getRarity(v58._selectedUnit.Name, true));
                    local v103 = v58.isPetMode and v11.FUSION.PET_COSTS or v11.FUSION.COSTS;
                    if v58.coins < v103[v102] then
                        if v58.PaidItemsRestricted then
                            v39:Notify({
                                message = "You do not have enough coins to fuse", 
                                isPositive = false
                            });
                            return;
                        else
                            v40:Prompt({
                                message = "You don't have enough coins to fuse.\n\nWould you like to buy some?", 
                                options = {
                                    {
                                        text = "Yes", 
                                        callback = function() --[[ Line: 628 ]] --[[ Name: callback ]]
                                            -- upvalues: v27 (ref)
                                            v27:PromptProductPurchase("CoinsPack2");
                                        end
                                    }, 
                                    {
                                        text = "No"
                                    }
                                }
                            });
                            return;
                        end;
                    else
                        local v104 = false;
                        local v105 = false;
                        local v106 = false;
                        local v107 = false;
                        for _, v109 in v58._burnerData do
                            if v109.Shiny then
                                v106 = true;
                            end;
                            if v109.Mega then
                                v107 = true;
                            end;
                            if v109.Stars > 0 then
                                v105 = true;
                            end;
                            if v109.Trait then
                                v104 = true;
                            end;
                        end;
                        if v104 or v105 or v106 or v107 then
                            v40:Prompt({
                                message = "Some of the duplicates you are fusing have traits, stars, shiny, and/or wumbo.\n\nAre you sure you want to continue?", 
                                options = {
                                    {
                                        text = "Yes", 
                                        callback = v83
                                    }, 
                                    {
                                        text = "No"
                                    }
                                }
                            });
                            return;
                        else
                            v40:Prompt({
                                message = "Selected duplicates will be removed from your inventory and fused into the unit chosen for Fusion.\n\nAre you sure you want to continue?", 
                                options = {
                                    {
                                        text = "Yes", 
                                        callback = v83
                                    }, 
                                    {
                                        text = "No"
                                    }
                                }
                            });
                            return;
                        end;
                    end;
                end;
            end);
            v23:HandleButton(v58.maxFuseButton, function() --[[ Line: 689 ]]
                -- upvalues: v58 (copy), v101 (copy)
                if #v58._burnerData < 1 then
                    return;
                elseif v58.selectionFrame.Visible then
                    return;
                else
                    v101();
                    return;
                end;
            end);
            return;
        end;
    end, 
    Opening = function(v110) --[[ Line: 713 ]] --[[ Name: Opening ]]
        -- upvalues: v8 (copy), v12 (copy), l_UserInputService_0 (copy), v31 (ref)
        v110.keeperUnit.Content.Plus.Visible = v110._selectedUnit == nil;
        local v111 = v110._selectedUnit and v110:_getValue(v110._selectedUnit.Name, "FullName");
        v110.keeperUnit.Content.TowerName.Text = v111 or "";
        if v110._selectedUnit then
            v110.keeperViewport = v8.new(v110.keeperUnit.Content.TowerPreview, v110._selectedUnit.Name, {
                Size = UDim2.fromScale(1.07, 1.3), 
                cornerRadius = 24, 
                isPet = v110.isPetMode
            });
            local v112 = select(2, v110:_getRarity(v110._selectedUnit.Name));
            if v112 then
                v110.keeperUnit.Content.Backdrop:SetAttribute("Rarity", v112);
                v110.keeperUnit.Content.Backdrop:AddTag("VisualizeRarity");
                v110.keeperUnit.Content.Glow:SetAttribute("Rarity", v112);
                v110.keeperUnit.Content.Glow:AddTag("VisualizeRarity");
            end;
            v110:_updateTowerInfo(v110.keeperUnit.Content.TowerInfo, v110._selectedUnit.Data);
            v110:OpenSelection();
        end;
        local v113 = v12.new(v110.fuseButton, 1.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, nil, nil, 1.5);
        v110.dumpster:Add(v113);
        v113:Play();
        v110.dumpster:Add(l_UserInputService_0.InputBegan:Connect(function(v114) --[[ Line: 760 ]]
            -- upvalues: v110 (copy)
            if (v114.UserInputType == Enum.UserInputType.MouseButton1 or v114.UserInputType == Enum.UserInputType.Touch) and v110.canSkipVFX then
                v110:_stopVFX();
            end;
        end));
        v110.dumpster:Add(v31.GamepadButtonPressed:Connect(function() --[[ Line: 768 ]]
            -- upvalues: v110 (copy)
            if v110.canSkipVFX then
                v110:_stopVFX();
            end;
        end));
    end, 
    Closing = function(_) --[[ Line: 775 ]] --[[ Name: Closing ]]
        -- upvalues: v23 (ref)
        v23:Toggle("MessagePrompt", false);
    end, 
    Closed = function(v116) --[[ Line: 779 ]] --[[ Name: Closed ]]
        v116.dumpster:Destroy();
        v116:CloseSelection();
        v116:Reset();
    end, 
    SelectUnit = function(v117, v118) --[[ Line: 787 ]] --[[ Name: SelectUnit ]]
        -- upvalues: v11 (copy), v39 (ref), v24 (ref), v3 (copy), v9 (copy), v23 (ref)
        local v119 = v118.IsPet or false;
        local v120 = v119 and "pet" or "unit";
        v117.isPetMode = v119 or false;
        if v118.Data.Stars == v11.FUSION.MAX_STARS then
            v39:Notify({
                message = ("You cannot fuse a %* that has the maximum amount of stars (5)"):format(v120), 
                isPositive = false
            });
            return;
        else
            local v121 = v119 and "Pets" or "Units";
            v24:Get(v3.Player, v121):andThen(function(v122) --[[ Line: 804 ]]
                -- upvalues: v118 (copy), v11 (ref), v39 (ref), v120 (copy), v119 (copy), v9 (ref), v117 (copy), v23 (ref)
                local v123 = v122[v118.Name];
                if not v123 then
                    return;
                else
                    local v124 = 0;
                    for v125 in v123 do
                        if v125 ~= v118.UID then
                            v124 = v124 + 1;
                        end;
                    end;
                    if v124 < v11.FUSION.NEEDED then
                        v39:Notify({
                            message = ("You need at least %* of this %* for Fusion"):format(v11.FUSION.NEEDED + 1, v120), 
                            isPositive = false
                        });
                        return;
                    else
                        v118.Type = not v119 and v9:GetUnitValue(v118.Name, "Type") or nil;
                        v117._selectedUnit = v118;
                        v23:Toggle(script.name, true);
                        return;
                    end;
                end;
            end);
            return;
        end;
    end, 
    Reset = function(v126) --[[ Line: 834 ]] --[[ Name: Reset ]]
        -- upvalues: v41 (copy)
        v126.isPetMode = false;
        v126._expectedDuplicates = 0;
        v126._selectedUnit = nil;
        v126._replacingBurner = nil;
        v126._originalBurner = nil;
        v126.canSkipVFX = false;
        for _, v128 in v126.burnerViewports do
            v128:Destroy();
        end;
        table.clear(v126.burnerViewports);
        table.clear(v126._selectedBurners);
        table.clear(v126._burnerData);
        for _, v130 in v126.burnerSlots do
            v130.Content.TowerInfo.Visible = false;
            v130.Content.LockedState.Visible = true;
            v130.Content.Backdrop:RemoveTag("VisualizeRarity");
            v130.Content.Backdrop:SetAttribute("Rarity");
            v130.Content.Glow:RemoveTag("VisualizeRarity");
            v130.Content.Glow:SetAttribute("Rarity");
            local l_UIGradient_0 = v130.Content.Backdrop:FindFirstChildOfClass("UIGradient");
            if l_UIGradient_0 then
                l_UIGradient_0:Destroy();
            end;
            v126.burnerBackup.backdropGradient:Clone().Parent = v130.Content.Backdrop;
            v130.Content.Glow.ImageColor3 = v41[true];
        end;
        if v126.keeperViewport then
            v126.keeperViewport:Destroy();
            v126.keeperViewport = nil;
        end;
        v126.keeperUnit.Content.TowerInfo.Visible = false;
        v126.keeperUnit.Content.Plus.Visible = true;
        v126.keeperUnit.Content.TowerName.Text = "";
        v126.keeperUnit.Content.Backdrop:RemoveTag("VisualizeRarity");
        v126.keeperUnit.Content.Backdrop:SetAttribute("Rarity");
        v126.keeperUnit.Content.Glow:RemoveTag("VisualizeRarity");
        v126.keeperUnit.Content.Glow:SetAttribute("Rarity");
        local l_UIGradient_1 = v126.keeperUnit.Content.Backdrop:FindFirstChildOfClass("UIGradient");
        if l_UIGradient_1 then
            l_UIGradient_1:Destroy();
        end;
        v126.keeperUnitBackup.backdropGradient:Clone().Parent = v126.keeperUnit.Content.Backdrop;
        v126.keeperUnit.Content.Backdrop.ImageColor3 = v126.keeperUnitBackup.backdropColor;
        v126.keeperUnit.Content.Glow.ImageColor3 = v126.keeperUnitBackup.glowColor;
        v126.fuseButton.Visible = false;
        v126.coinDisplay.Visible = false;
        v126.maxFuseButton.Visible = false;
        v126.selectMaxButton.Visible = true;
        v126:_resetStarVFX();
    end, 
    GetDuplicates = function(v133, v134) --[[ Line: 908 ]] --[[ Name: GetDuplicates ]]
        -- upvalues: v24 (ref), v3 (copy), v9 (copy), v38 (ref), v5 (copy)
        local v135 = {};
        local v136 = v133.isPetMode and "Pets" or "Units";
        for v137, v138 in v24:Get(v3.Player, v136):expect()[v133._selectedUnit.Name] do
            if v137 ~= v133._selectedUnit.UID then
                table.insert(v135, {
                    Name = v138.Name, 
                    UID = v137, 
                    Data = v138, 
                    Type = not v133.isPetMode and v9:GetUnitValue(v138.Name, "Type")
                });
            end;
        end;
        if v134 then
            v38:SortUnits(v135, v133.isPetMode, true);
        end;
        return (v5.Reverse(v135));
    end, 
    GetPossibleFuses = function(v139, v140, v141) --[[ Line: 934 ]] --[[ Name: GetPossibleFuses ]]
        -- upvalues: v11 (copy)
        v140 = v140 or v139:GetDuplicates(v141 or false);
        if not v140 or #v140 < v11.FUSION.NEEDED then
            return 0, 0;
        else
            local l__selectedUnit_0 = v139._selectedUnit;
            local v143 = l__selectedUnit_0 and l__selectedUnit_0.Data and l__selectedUnit_0.Data.Stars or 0;
            if not l__selectedUnit_0 then
                return 0, 0;
            else
                local v144 = select(2, v139:_getRarity(l__selectedUnit_0.Name, true));
                local v145 = v139.isPetMode and v11.FUSION.PET_COSTS or v11.FUSION.COSTS;
                local v146 = v144 and v145[v144];
                if not v146 then
                    return 0, 0;
                else
                    local v147 = v11.FUSION.MAX_STARS - v143;
                    local v148 = math.min(math.min(math.floor(#v140 / v11.FUSION.NEEDED), v147), (math.floor(v139.coins / v146)));
                    if v148 < 1 then
                        return 0, 0;
                    else
                        return v148, v148 * v146;
                    end;
                end;
            end;
        end;
    end, 
    OpenSelection = function(v149, v150) --[[ Line: 973 ]] --[[ Name: OpenSelection ]]
        -- upvalues: v11 (copy), v15 (copy)
        if v149.selectionFrame.Visible then
            return;
        else
            v149:_hideHoverTooltip();
            v149._expectedDuplicates = v150 and 1 or v11.FUSION.NEEDED;
            v149._replacingBurner = v150;
            v149._originalBurner = v149._selectedBurners[v150];
            v149.selectMaxButton.Visible = not v150;
            v149.selectionFrame.Visible = true;
            v149.confirmSelection.Disabled.Visible = true;
            local l_v149_Duplicates_0 = v149:GetDuplicates(true);
            v149.selectionDumpster:Add(function() --[[ Line: 991 ]]
                -- upvalues: v15 (ref), v149 (copy)
                v15.deferClearBrowser(v149.selectionBin);
            end);
            v15.loadOnDemand(l_v149_Duplicates_0, v149.selectionBin, v149.selectionDumpster, function(v152, v153) --[[ Line: 995 ]]
                -- upvalues: v149 (copy)
                if v152 and v152.Data and v152.Data.Favorite then
                    return;
                else
                    v149:_generateDuplicateButton(v152, v153);
                    return;
                end;
            end, nil, {
                populateBy = 25
            });
            return;
        end;
    end, 
    CloseSelection = function(v154) --[[ Line: 1006 ]] --[[ Name: CloseSelection ]]
        v154.selectionDumpster:Destroy();
        v154.selectionFrame.Visible = false;
        v154:_updateSelectionConfirmButton(false);
    end, 
    _updateTowerInfo = function(v155, v156, v157) --[[ Line: 1014 ]] --[[ Name: _updateTowerInfo ]]
        -- upvalues: v19 (copy), v13 (copy)
        v156.Visible = true;
        v156.Shiny.Visible = v157.Shiny or false;
        v156.Wumbo.Visible = v157.Mega or false;
        v156.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v157.Level or 1);
        local l_Traits_0 = v156.Traits;
        local l_ImageLabel_0 = l_Traits_0.Trait:FindFirstChildOfClass("ImageLabel");
        if l_ImageLabel_0 then
            l_ImageLabel_0:Destroy();
        end;
        local l_ImageLabel_1 = l_Traits_0.Trait2:FindFirstChildOfClass("ImageLabel");
        if l_ImageLabel_1 then
            l_ImageLabel_1:Destroy();
        end;
        l_Traits_0.Trait.Visible = v157.Trait ~= nil;
        l_Traits_0.Trait2.Visible = v157.Trait2 ~= nil;
        local v161 = true;
        if v157.Trait == nil then
            v161 = v157.Trait2 ~= nil;
        end;
        l_Traits_0.Visible = v161;
        if v157.Trait ~= nil then
            v19:CreateTraitIcon(v157.Trait.Name, l_Traits_0.Trait);
        end;
        if v157.Trait2 ~= nil then
            v19:CreateTraitIcon(v157.Trait2.Name, l_Traits_0.Trait2);
        end;
        v156.Relic.Visible = v157.Relic ~= nil;
        if v157.Relic then
            v13:CreateRelicIcon(v156.Relic, v157.Relic);
        end;
        v156.Stars.Visible = v157.Stars > 0;
        if v157.Stars > 0 then
            v155:_updateStars(v156.Stars, v157.Stars);
        end;
    end, 
    _updateStars = function(_, v163, v164) --[[ Line: 1057 ]] --[[ Name: _updateStars ]]
        v163.Main.Amount.Text = v164;
        v163[tostring(2)].Visible = v164 >= 2;
        v163[tostring(3)].Visible = v164 >= 3;
        v163[tostring(4)].Visible = v164 >= 4;
        v163[tostring(5)].Visible = v164 >= 5;
    end, 
    _generateDuplicateButton = function(v165, v166, v167) --[[ Line: 1065 ]] --[[ Name: _generateDuplicateButton ]]
        -- upvalues: v23 (ref), v39 (ref), v17 (copy), v16 (copy)
        local v168 = v165.selectionTemplate:Clone();
        v168.Name = v166.UID;
        v168.LayoutOrder = v167;
        v168.Parent = v165.selectionBin;
        local v169 = table.find(v165._selectedBurners, v166.UID) ~= nil;
        v168.Content.Selected.Visible = v169;
        local l_TowerInfo_0 = v168.Content.TowerInfo;
        v165:_updateTowerInfo(l_TowerInfo_0, v166.Data);
        v168:SetAttribute("UnitUID", v166.UID);
        v168:SetAttribute("UnitName", v166.Name);
        local v175 = v23:HandleButton(v168, function() --[[ Line: 1080 ]]
            -- upvalues: v165 (copy), v166 (copy), v168 (copy), v39 (ref)
            local v171 = table.find(v165._selectedBurners, v166.UID);
            if v171 and not v165._replacingBurner then
                table.remove(v165._selectedBurners, v171);
                v168.Content.Selected.Visible = false;
                v165:_updateSelectionConfirmButton();
                return;
            elseif v171 and v165._replacingBurner then
                v39:Notify({
                    message = "You must pick a different duplicate to replace the current one", 
                    isPositive = false
                });
                return;
            elseif v165._replacingBurner then
                local v172 = v165._selectedBurners[v165._replacingBurner];
                local l_FirstChild_1 = v165.selectionBin:FindFirstChild(v172);
                if l_FirstChild_1 then
                    l_FirstChild_1.Content.Selected.Visible = false;
                end;
                v165._selectedBurners[v165._replacingBurner] = v166.UID;
                v168.Content.Selected.Visible = true;
                v165:_updateSelectionConfirmButton(true);
                return;
            elseif #v165._selectedBurners + 1 > v165._expectedDuplicates then
                local v174 = v165._expectedDuplicates == 1 and "You can only select 1 duplicate" or ("You can only select %* duplicates"):format(v165._expectedDuplicates);
                v39:Notify({
                    message = v174, 
                    isPositive = false
                });
                return;
            else
                table.insert(v165._selectedBurners, v166.UID);
                v168.Content.Selected.Visible = true;
                v165:_updateSelectionConfirmButton();
                return;
            end;
        end, {
            MouseEnter = function() --[[ Line: 1129 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v165 (copy), v168 (copy), v166 (copy)
                v165:_showHoverTooltip(v168, v166);
            end, 
            MouseLeave = function() --[[ Line: 1133 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v165 (copy), v168 (copy), v166 (copy)
                v165:_hideHoverTooltip(v168, v166);
            end
        });
        local v176 = select(2, v165:_getRarity(v166.Name));
        if v176 then
            l_TowerInfo_0.Backdrop:SetAttribute("Rarity", v176);
            l_TowerInfo_0.Backdrop:AddTag("VisualizeRarity");
            v168.Content.Glow:SetAttribute("Rarity", v176);
            v168.Content.Glow:AddTag("VisualizeRarity");
        end;
        v175:Add((v165.isPetMode and v17 or v16):CreateImage(v166.Name, {
            Size = UDim2.fromScale(1, 1), 
            Parent = l_TowerInfo_0, 
            ZIndex = 2
        }));
    end, 
    _updateSelectionConfirmButton = function(v177, v178) --[[ Line: 1157 ]] --[[ Name: _updateSelectionConfirmButton ]]
        local v179 = if v178 ~= nil then v178 else #v177._selectedBurners == v177._expectedDuplicates;
        v177.confirmSelection:SetAttribute("Disabled", not v179);
        v177.confirmSelection.Disabled.Visible = not v179;
    end, 
    _loadBurnerSlot = function(v180, v181, v182) --[[ Line: 1163 ]] --[[ Name: _loadBurnerSlot ]]
        -- upvalues: v18 (copy), v37 (ref), v25 (ref), v8 (copy)
        local v183 = v180.burnerSlots[v181];
        if not v183 then
            v18:Warn("Failed to get burner slot", v181);
            return;
        else
            local v184 = nil;
            v184 = if v180.isPetMode then v37:GetPet(v180._selectedUnit.Name, v182):expect() else v25:GetUnit(v180._selectedUnit.Name, v182):expect();
            if not v184 then
                v18:Warn("Failed to get unit data for burner slot", v181, "with UID:", v182);
                return;
            else
                local v185 = v180.burnerViewports[v181];
                if v185 then
                    v185:Destroy();
                end;
                v180.burnerViewports[v181] = v8.new(v183.Content.TowerPreview, v180._selectedUnit.Name, {
                    Size = UDim2.fromScale(1.07, 1.3), 
                    cornerRadius = 18, 
                    isPet = v180.isPetMode
                });
                local v186 = select(2, v180:_getRarity(v180._selectedUnit.Name));
                if v186 then
                    v183.Content.Backdrop:SetAttribute("Rarity", v186);
                    v183.Content.Backdrop:AddTag("VisualizeRarity");
                    v183.Content.Glow:SetAttribute("Rarity", v186);
                    v183.Content.Glow:AddTag("VisualizeRarity");
                end;
                v180:_updateTowerInfo(v183.Content.TowerInfo, v184);
                return v184;
            end;
        end;
    end, 
    _populateBurnerSlots = function(v187) --[[ Line: 1219 ]] --[[ Name: _populateBurnerSlots ]]
        for v188, v189 in v187.burnerSlots do
            v189.Content.LockedState.Visible = false;
            local v190 = v187:_loadBurnerSlot(v188, v187._selectedBurners[v188]);
            v187._burnerData[v188] = v190;
        end;
    end, 
    _enableFusion = function(v191) --[[ Line: 1228 ]] --[[ Name: _enableFusion ]]
        -- upvalues: v11 (copy)
        warn("enabling fusion");
        local v192 = select(2, v191:_getRarity(v191._selectedUnit.Name, true));
        local v193 = v191.isPetMode and v11.FUSION.PET_COSTS or v11.FUSION.COSTS;
        v191.fuseButton.Content.Price.Amount.Text = v193[v192];
        v191:_updateStars(v191.fuseButton.Content.Stars.Before, v191._selectedUnit.Data.Stars);
        v191:_updateStars(v191.fuseButton.Content.Stars.After, v191._selectedUnit.Data.Stars + 1);
        local l_v191_PossibleFuses_0, v195 = v191:GetPossibleFuses(false);
        if v191.isPetMode then
            v191.maxFuseButton.Visible = false;
        else
            v191.maxFuseButton.Visible = l_v191_PossibleFuses_0 > 1;
        end;
        v191:_updateStars(v191.maxFuseButton.Content.Stars.Before, v191._selectedUnit.Data.Stars);
        v191:_updateStars(v191.maxFuseButton.Content.Stars.After, v191._selectedUnit.Data.Stars + l_v191_PossibleFuses_0);
        v191.maxFuseButton.Content.Price.Amount.Text = v195 or 0;
        v191.fuseButton.Visible = true;
        v191.coinDisplay.Visible = true;
    end, 
    _createUnitModel = function(v196, v197, v198, v199) --[[ Line: 1254 ]] --[[ Name: _createUnitModel ]]
        -- upvalues: l_Pets_0 (copy), l_Friendlies_0 (copy), l_Shiny_0 (copy), v20 (copy)
        local l_FirstChild_2 = (v199 and l_Pets_0 or l_Friendlies_0):FindFirstChild(v197.Name);
        l_FirstChild_2 = l_FirstChild_2 and l_FirstChild_2:Clone();
        if not l_FirstChild_2 then
            return;
        else
            local l_l_FirstChild_2_Attribute_0 = l_FirstChild_2:GetAttribute("SummonScale");
            if l_l_FirstChild_2_Attribute_0 then
                l_FirstChild_2:ScaleTo(l_FirstChild_2:GetScale() * l_l_FirstChild_2_Attribute_0);
            end;
            l_FirstChild_2.PrimaryPart.Anchored = true;
            v196.vfxDumpster:Add(l_FirstChild_2);
            for _, v203 in l_FirstChild_2:GetDescendants() do
                if v203:IsA("BasePart") then
                    v203.CanQuery = false;
                    v203.CanCollide = false;
                    v203.CastShadow = false;
                end;
            end;
            l_l_FirstChild_2_Attribute_0 = l_FirstChild_2:GetExtentsSize();
            local v204 = math.max(l_l_FirstChild_2_Attribute_0.X, l_l_FirstChild_2_Attribute_0.Y, l_l_FirstChild_2_Attribute_0.Z) * 1.5;
            local v205 = Vector3.new(0, 1, 0, 0) * (l_l_FirstChild_2_Attribute_0.Y / 2);
            local l_l_FirstChild_2_Attribute_1 = l_FirstChild_2:GetAttribute("SummonOffset");
            if l_l_FirstChild_2_Attribute_1 then
                v198 = v198 * CFrame.new(l_l_FirstChild_2_Attribute_1);
            end;
            local v207 = v198.LookVector * v204;
            local v208 = v198.Position + v207 - v205;
            local v209 = (v198.Position - v208) * Vector3.new(1, 0, 1, 0);
            local v210 = CFrame.new(v208) * CFrame.lookAt(Vector3.new(), v209.Unit);
            local l_SurfaceLight_0 = Instance.new("SurfaceLight");
            l_SurfaceLight_0.Brightness = 1.25;
            l_SurfaceLight_0.Range = 30;
            l_SurfaceLight_0.Shadows = true;
            l_SurfaceLight_0.Parent = l_FirstChild_2.PrimaryPart;
            l_FirstChild_2:PivotTo(v210);
            if v197.Shiny then
                local l_l_FirstChild_2_ExtentsSize_0 = l_FirstChild_2:GetExtentsSize();
                local v213 = l_l_FirstChild_2_ExtentsSize_0 / 2;
                local v214 = l_Shiny_0:Clone();
                v214.Size = l_l_FirstChild_2_ExtentsSize_0;
                if not v199 then
                    local l_WorldCFrame_0 = l_FirstChild_2.PrimaryPart.FloorPoint.WorldCFrame;
                    v214.CFrame = l_WorldCFrame_0.Rotation + (l_WorldCFrame_0.Position + Vector3.new(0, v213.Y, 0));
                else
                    v214.CFrame = l_FirstChild_2:GetPivot() + Vector3.new(0, v213.Y, 0);
                end;
                v214.Parent = l_FirstChild_2;
                for _, v217 in v214:GetDescendants() do
                    if v217:IsA("ParticleEmitter") then
                        v217.Enabled = true;
                    end;
                end;
            end;
            l_FirstChild_2.Parent = workspace.CurrentCamera;
            if not l_FirstChild_2:IsDescendantOf(workspace) then
                l_FirstChild_2.AncestryChanged:Wait();
            end;
            v196.vfxDumpster:Construct(v20, v197.Name, l_FirstChild_2, v199 and "Pets" or "Friendlies"):Play("Idle", {
                fadeTime = 0, 
                looped = true
            });
            return;
        end;
    end, 
    _playVFX = function(v218, v219, v220, v221) --[[ Line: 1354 ]] --[[ Name: _playVFX ]]
        -- upvalues: v28 (ref), v29 (ref), v30 (ref), v33 (ref), l_TweenService_0 (copy), v6 (copy), v42 (copy), v11 (copy), v32 (ref), v43 (copy), v18 (copy)
        v220 = v220 or 1;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_Fusions_0 = workspace.Fusions;
        local l_FusionFireworks_0 = l_Fusions_0.FusionFireworks;
        local l_CFrame_0 = l_Fusions_0.FusionVFXPov.CFrame;
        local l_BillboardGui_0 = l_Fusions_0.FusionsBillboard:FindFirstChildOfClass("BillboardGui");
        if l_BillboardGui_0 then
            l_BillboardGui_0.Enabled = false;
        end;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        v28:ToggleHideAll(true);
        v29:SetBlur(0);
        v29:SetFusionDepthMode(true);
        v30:Revert();
        v33:PlaySound({
            name = "Fusion.VFX", 
            soundGroup = "Master.SFX.VFX"
        });
        v218:_createUnitModel(v219, l_CFrame_0, v221);
        local v227 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3), {
            CFrame = l_CFrame_0
        });
        if not v6.new(function(v228, v229) --[[ Line: 1388 ]]
            -- upvalues: v227 (copy), v218 (copy)
            v227.Completed:Once(function(v230) --[[ Line: 1389 ]]
                -- upvalues: v218 (ref), v228 (copy), v229 (copy), v227 (ref)
                if v230 == Enum.PlaybackState.Completed then
                    v218.canSkipVFX = true;
                    v218.skipHint.Visible = true;
                    v228();
                else
                    v229();
                end;
                v227:Destroy();
            end);
            v227:Play();
        end):await() then
            v218:_stopVFX();
            return;
        else
            local v231 = {};
            local v232 = {};
            v218:_updateStars(v218.currentStar, v219.Stars);
            v218.starVFX.Visible = true;
            table.insert(v231, l_TweenService_0:Create(v218.currentStar, v42, {
                Position = UDim2.fromScale(0.5, 0.5)
            }));
            table.insert(v231, l_TweenService_0:Create(v218.newStar, v42, {
                Position = UDim2.fromScale(0.5, 0.5)
            }));
            for _, v234 in v231 do
                v218.vfxDumpster:Add(v234);
                table.insert(v232, v6.new(function(v235, v236) --[[ Line: 1437 ]]
                    -- upvalues: v234 (copy)
                    v234.Completed:Connect(function(v237) --[[ Line: 1438 ]]
                        -- upvalues: v234 (ref), v235 (copy), v236 (copy)
                        if v234 then
                            v234:Destroy();
                        end;
                        if v237 == Enum.PlaybackState.Completed then
                            v235();
                            return;
                        else
                            v236();
                            return;
                        end;
                    end);
                    v234:Play();
                end));
            end;
            v6.all(v232):andThen(function() --[[ Line: 1456 ]]
                -- upvalues: v218 (copy), v219 (copy), v220 (ref), v11 (ref), v32 (ref), l_CFrame_0 (copy), l_FusionFireworks_0 (copy), l_TweenService_0 (ref), v43 (ref)
                v218.newStar.Visible = false;
                v218:_updateStars(v218.currentStar, (math.clamp(v219.Stars + v220, 1, v11.FUSION.MAX_STARS)));
                local v238 = v219.Stars == 0 and 1 or 1.4 * v219.Stars;
                v32:Shake("Fusion", {
                    originalPivot = l_CFrame_0, 
                    overrides = {
                        Amplitude = 1.2 * v238
                    }
                });
                for _, v240 in l_FusionFireworks_0:GetDescendants() do
                    if v240:IsA("ParticleEmitter") then
                        if v240.Name == "Particles01" then
                            task.delay(0.2, v240.Emit, v240, 100 * v238);
                        elseif v240.Name == "Particles02" or v240.Name == "Shards03" then
                            v240:Emit(10 * v238);
                        elseif v240.Name == "Shards01" or v240.Name == "Shards02" then
                            v240:Emit(25 * v238);
                        end;
                    end;
                end;
                local v241 = l_TweenService_0:Create(v218.starVFX, v43, {
                    Size = UDim2.fromScale(1, 0.125)
                });
                v218.vfxDumpster:Add(v241);
                v241.Completed:Connect(function() --[[ Line: 1497 ]]
                    -- upvalues: v241 (copy)
                    if v241 then
                        v241:Destroy();
                    end;
                end);
                v241:Play();
            end):catch(v18.EmptyPromiseCatch);
            v218.vfxDumpster:AddPromise(v6.delay(2.5):andThen(function() --[[ Line: 1506 ]]
                -- upvalues: v218 (copy)
                v218:_stopVFX();
            end));
            return;
        end;
    end, 
    _showHoverTooltip = function(v242, v243, v244) --[[ Line: 1511 ]] --[[ Name: _showHoverTooltip ]]
        -- upvalues: v4 (copy), v21 (copy), v35 (ref), v34 (ref), v10 (copy), v9 (copy), v13 (copy)
        if not v244 then
            return;
        elseif v242._hoveringInfo and v242._hoveringInfo.UID == v244.UID then
            return;
        else
            v242._hoveringInfo = v244;
            local v245 = v244.Data.Level or 1;
            local v246 = select(2, v242:_getRarity(v244.Name));
            if v242._hoverDump then
                v242._hoverDump:Destroy();
                v242._hoverDump = nil;
            end;
            v242._hoverDump = v4.new();
            v242._hoverDump:Add(v21.new(v242.hoverTooltip, v246));
            v242._hoverDump:Add(v21.new(v242.hoverTooltip.Content.UIStroke, v246));
            v242._hoverDump:Add(v21.new(v242.hoverTooltip.Content.Characteristics.UnitTags.Rarity, v246));
            v242.hoverTooltip.Content.ExistingCount.Visible = false;
            v242._hoverDump:Add(v35:ApplyCountToLabel(v244.Name, v244.Data, v242.hoverTooltip.Content.ExistingCount, v242.isPetMode, "%s Exist", false):andThen(function(v247, v248) --[[ Line: 1545 ]]
                -- upvalues: v242 (copy)
                if not v247 then
                    return;
                else
                    v242.hoverTooltip.Content.ExistingCount.Visible = true;
                    v242._hoverDump:Add(v248);
                    return;
                end;
            end));
            v242.hoverTooltip.Content.Serial.Visible = false;
            v242.hoverTooltip.Content.MintedBy.Visible = false;
            v242._hoverDump:Add(v34:ApplyMintToLabel(v244.Name, v244.UID, v244.Data, v242.hoverTooltip.Content.Serial, v242.isPetMode and "Pets" or "Units", "#%s"):andThen(function(v249, v250) --[[ Line: 1566 ]]
                -- upvalues: v244 (copy), v34 (ref), v242 (copy)
                if not v249 then
                    return;
                else
                    if v244.Data.MintedBy ~= nil then
                        v34:ApplyMintedByToLabel(v244.Data, v242.hoverTooltip.Content.MintedBy):andThen(function() --[[ Line: 1575 ]]
                            -- upvalues: v242 (ref)
                            v242.hoverTooltip.Content.MintedBy.Visible = true;
                        end);
                    end;
                    v242.hoverTooltip.Content.Serial.Visible = true;
                    v242._hoverDump:Add(v250);
                    return;
                end;
            end));
            v242.hoverTooltip.Content.UnitName.UnitName.Text = v242:_getValue(v244.Name, "FullName");
            v242.hoverTooltip.Content.Characteristics.UnitTags.Rarity.Text = v246;
            v242.hoverTooltip.Content.Characteristics.UnitTags.ShinyStatus.Visible = v244.Data.Shiny or false;
            v242.hoverTooltip.Content.Characteristics.UnitTags.WumboStatus.Visible = v244.Data.Mega or false;
            v242.hoverTooltip.Content.Level.Level.RichText = true;
            v242.hoverTooltip.Content.Level.Level.Text = ("Level <font color=\"#FFFF00\">%*</font>"):format(v245);
            local v251 = 0;
            v251 = if v242.isPetMode then v10:GetNextLevelCost(v244.Data) else v9:GetNextLevelCost(v244.Data);
            v242.hoverTooltip.Content.Level.XPBar.Fill.Size = UDim2.fromScale(math.clamp(v244.Data.Experience / v251, 0, 1), 1);
            v242.hoverTooltip.Content.Level.XPBar.Progression.Text = ("%*/%*"):format(math.round(v244.Data.Experience), v251);
            v242.hoverTooltip.Content.Characteristics.Stats.Values.DMG.Visible = v244.Type ~= "Resource";
            v242.hoverTooltip.Content.Characteristics.Stats.Values.RNG.Visible = v244.Type ~= "Resource";
            v242.hoverTooltip.Content.Characteristics.Stats.Values.SPA.Visible = v244.Type ~= "Resource";
            v242.hoverTooltip.Content.Characteristics.Stats.Values.GOLD.Visible = v244.Type == "Resource";
            v242.hoverTooltip.Content.Characteristics.Stats.Values.PLC.Visible = false;
            if not v242.isPetMode and v244.Type == "Resource" then
                v242.hoverTooltip.Content.Characteristics.Stats.Values.GOLD.StatAmount.Text = v9:GetGold(v244.Data);
            elseif not v242.isPetMode then
                v242.hoverTooltip.Content.Characteristics.Stats.Values.DMG.StatAmount.Text = v9:GetTotalDamage(v244.Data);
                v242.hoverTooltip.Content.Characteristics.Stats.Values.RNG.StatAmount.Text = v9:GetRange(v244.Data);
                v242.hoverTooltip.Content.Characteristics.Stats.Values.SPA.StatAmount.Text = v9:GetAttackCooldown(v244.Data);
            else
                local v252 = v10:GetDamageBuff(v244.Data) or 0;
                local v253 = v10:GetRangeBuff(v244.Data) or 0;
                local v254 = v10:GetCooldownBuff(v244.Data) or 0;
                local v255 = v10:GetGoldBuff(v244.Data) or 0;
                local v256 = v10:GetPlacementBuff(v244.Data) or 0;
                local l_Values_0 = v242.hoverTooltip.Content.Characteristics.Stats.Values;
                local function _(v258, v259, v260) --[[ Line: 1627 ]] --[[ Name: fillStatLabel ]]
                    local v261 = v259 > 0 and "+" or "";
                    local v262 = v260 and "" or "%";
                    v258.StatAmount.Text = ("%*%*%*"):format(v261, v259, v262);
                    v258.Visible = v259 ~= 0;
                end;
                local l_DMG_0 = l_Values_0.DMG;
                local v265 = v252 > 0 and "+" or "";
                l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v265, v252);
                l_DMG_0.Visible = v252 ~= 0;
                l_DMG_0 = l_Values_0.RNG;
                v265 = v253 > 0 and "+" or "";
                l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v265, v253);
                l_DMG_0.Visible = v253 ~= 0;
                l_DMG_0 = l_Values_0.SPA;
                v265 = v254 > 0 and "+" or "";
                l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v265, v254);
                l_DMG_0.Visible = v254 ~= 0;
                l_DMG_0 = l_Values_0.GOLD;
                v265 = v255 > 0 and "+" or "";
                l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v265, v255);
                l_DMG_0.Visible = v255 ~= 0;
                l_DMG_0 = l_Values_0.PLC;
                v265 = v256 > 0 and "+" or "";
                l_DMG_0.StatAmount.Text = ("%*%*"):format(v265, v256);
                l_DMG_0.Visible = v256 ~= 0;
            end;
            v242.hoverTooltip.Content.Level.Unsorted.Stars.Visible = v244.Data.Stars > 0;
            if v244.Data.Stars > 0 then
                v242.hoverTooltip.Content.Level.Unsorted.Stars.Main.Amount.Text = v244.Data.Stars;
                for v266 = 2, 5 do
                    v242.hoverTooltip.Content.Level.Unsorted.Stars[tostring(v266)].Visible = v266 <= v244.Data.Stars;
                end;
            end;
            v242.hoverTooltip.Content.UnitName.AttackType.Visible = false;
            if not v242.isPetMode then
                v242.hoverTooltip.Content.UnitName.AttackType.Visible = true;
                v242.hoverTooltip.Content.UnitName.AttackType.Icon.Image = v13:GetAttackTypeIcon(v244.Type);
                local l_v9_PrimaryEffect_0 = v9:GetPrimaryEffect(v244.Name);
                v242.hoverTooltip.Content.UnitName.AttackType.EffectType.Visible = l_v9_PrimaryEffect_0 ~= nil;
                if l_v9_PrimaryEffect_0 then
                    v242.hoverTooltip.Content.UnitName.AttackType.EffectType.Icon.Image = v13:GetEffectIcon(l_v9_PrimaryEffect_0);
                    v242.hoverTooltip.Content.UnitName.AttackType.EffectType.UIGradient.Color = v13:GetEffectColor(l_v9_PrimaryEffect_0);
                end;
            end;
            v242.hoverTooltip.Visible = true;
            v242:_alignTooltip(v243, v242.hoverTooltip);
            return;
        end;
    end, 
    _hideHoverTooltip = function(v268, v269, v270) --[[ Line: 1669 ]] --[[ Name: _hideHoverTooltip ]]
        if not v269 or not v270 then
            v268._hoveringInfo = nil;
            v268.hoverTooltip.Visible = false;
            return;
        elseif v268._hoveringInfo and v268._hoveringInfo.UID ~= v270.UID then
            return;
        else
            if v268._hoverDump then
                v268._hoverDump:Destroy();
                v268._hoverDump = nil;
            end;
            v268._hoveringInfo = nil;
            v268.hoverTooltip.Visible = false;
            return;
        end;
    end, 
    _alignTooltip = function(_, v272, v273) --[[ Line: 1691 ]] --[[ Name: _alignTooltip ]]
        local l_AbsolutePosition_0 = v273.Parent.AbsolutePosition;
        local l_AbsolutePosition_1 = v272.AbsolutePosition;
        local l_AbsoluteSize_0 = v272.AbsoluteSize;
        local v277 = l_AbsolutePosition_1.X - l_AbsolutePosition_0.X + l_AbsoluteSize_0.X;
        local v278 = l_AbsolutePosition_1.Y - l_AbsolutePosition_0.Y - l_AbsoluteSize_0.Y * 0.25;
        v273.Position = UDim2.new(0, v277, 0, v278);
    end, 
    _stopVFX = function(v279) --[[ Line: 1702 ]] --[[ Name: _stopVFX ]]
        -- upvalues: v28 (ref), v29 (ref), v30 (ref)
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        local l_BillboardGui_1 = workspace.Fusions.FusionsBillboard:FindFirstChildOfClass("BillboardGui");
        v279.vfxDumpster:Destroy();
        l_CurrentCamera_1.CameraType = Enum.CameraType.Custom;
        v28:ToggleHideAll(false);
        v29:SetBlur(v29.DEFAULT_SIZE);
        v29:SetFusionDepthMode(false);
        v30:SetFOV();
        if l_BillboardGui_1 then
            l_BillboardGui_1.Enabled = true;
        end;
        v279:_resetStarVFX();
        v279.mainInner.Visible = true;
        v279.skipHint.Visible = false;
        v279:_fadeBackground(true);
    end, 
    _resetStarVFX = function(v282) --[[ Line: 1727 ]] --[[ Name: _resetStarVFX ]]
        v282.starVFX.Visible = false;
        v282.newStar.Visible = true;
        v282.starVFX.Size = UDim2.fromScale(1, 0.08);
        v282.currentStar.Position = UDim2.fromScale(0.4, 0.5);
        v282.newStar.Position = UDim2.fromScale(0.6, 0.5);
    end, 
    _fadeBackground = function(v283, v284) --[[ Line: 1735 ]] --[[ Name: _fadeBackground ]]
        -- upvalues: l_TweenService_0 (copy)
        local v285 = v284 and 0.5 or 1;
        local v286 = l_TweenService_0:Create(v283.main, TweenInfo.new(0.25), {
            BackgroundTransparency = v285
        });
        v286.Completed:Once(function() --[[ Line: 1740 ]]
            -- upvalues: v286 (copy)
            v286:Destroy();
        end);
        v286:Play();
    end, 
    _getRarity = function(v287, v288, v289) --[[ Line: 1747 ]] --[[ Name: _getRarity ]]
        -- upvalues: v10 (copy), v9 (copy)
        if v287.isPetMode then
            return v10:GetRarity(v288, v289);
        else
            return v9:GetRarity(v288, v289);
        end;
    end, 
    _getValue = function(v290, v291, v292) --[[ Line: 1755 ]] --[[ Name: _getValue ]]
        -- upvalues: v10 (copy), v9 (copy)
        if v290.isPetMode then
            return v10:GetPetValue(v291, v292);
        else
            return v9:GetUnitValue(v291, v292);
        end;
    end
};