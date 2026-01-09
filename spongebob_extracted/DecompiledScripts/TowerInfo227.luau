local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ViewportHandler);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v12 = require(l_ReplicatedStorage_0.TraitsData);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v14 = require(v2.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v15 = require(l_ReplicatedStorage_0.ReplicaController);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.AbilityIcons);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = {
    "AttackCooldown", 
    "Damage", 
    "Range"
};
local v27 = {
    "Gold"
};
local v28 = {
    FirstInRange = "First", 
    LastInRange = "Last", 
    Boss = "Boss", 
    Fastest = "Fastest", 
    Strongest = "Strongest"
};
local v29 = {
    normal = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#18b32a")), 
        ColorSequenceKeypoint.new(1, Color3.fromHex("#e0ff45"))
    }), 
    reduced = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#7d0f0f")), 
        ColorSequenceKeypoint.new(1, Color3.fromHex("#ff3434"))
    })
};
return {
    primaryMenu = false, 
    ToggleProperties = {
        Main = {
            Open = {
                Position = UDim2.fromScale(0.01, 0.5), 
                ToggleTweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Back)
            }, 
            Close = {
                Position = UDim2.fromScale(-0.35, 0.5), 
                ToggleTweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            }
        }, 
        ["Main.Unsorted.ChargedAttack"] = {
            Open = {
                Position = UDim2.fromScale(1.025, 0.5), 
                ToggleTweenInfo = TweenInfo.new(0.125, Enum.EasingStyle.Back)
            }, 
            Close = {
                Position = UDim2.fromScale(0.75, 0.5), 
                ToggleTweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            }
        }
    }, 
    GoldUpdated = v4.new(), 
    Init = function(_, _) --[[ Line: 108 ]] --[[ Name: Init ]]
        -- upvalues: v18 (ref), v2 (copy), v22 (ref), v19 (ref), v20 (ref), v21 (ref), v23 (ref), v24 (ref)
        v18 = v2.GetController("DataController");
        v22 = v2.GetController("UIController");
        v19 = v2.GetController("TowerController");
        v20 = v2.GetController("DeviceTypeController");
        v21 = v2.GetService("GameService");
        v23 = v2.GetService("TowerService");
        v24 = v2.GetController("PetController");
    end, 
    Start = function(v32, v33) --[[ Line: 119 ]] --[[ Name: Start ]]
        -- upvalues: v25 (ref), v22 (ref), v19 (ref), v21 (ref), v2 (copy), v15 (copy)
        v25 = v22:GetModuleAsync("Notification"):expect();
        v32.ui = v33;
        v32.main = v33.Main;
        v32.gameTowerInfo = v32.main;
        v32.gameTowerContent = v32.gameTowerInfo.Content;
        v32.gameTowerButtons = v32.gameTowerContent.Buttons;
        v32.chargedAttack = v32.main.Unsorted.ChargedAttack;
        v32.chargedAttack.Visible = false;
        v22:Toggle(script.Name, false);
        v22:HandleButton(v32.gameTowerInfo.Content.Exit.Exit, function() --[[ Line: 133 ]]
            -- upvalues: v19 (ref)
            v19:DeselectTower();
        end);
        v22:HandleButton(v32.gameTowerButtons.Sell, function() --[[ Line: 137 ]]
            -- upvalues: v19 (ref)
            v19:SellTower();
        end);
        v22:HandleButton(v32.gameTowerInfo.Bottom.Sell.Button, function() --[[ Line: 141 ]]
            -- upvalues: v19 (ref)
            v19:SellTower();
        end);
        local function v36() --[[ Line: 145 ]] --[[ Name: attemptChangeTarget ]]
            -- upvalues: v32 (copy), v19 (ref)
            if not v32.towerReplica or not v32.towerReplica.Data or not v32.towerReplica.Data.Model then
                return;
            else
                local l_Attribute_0 = v32.towerReplica.Data.Model:GetAttribute("Id");
                local l_AttackMode_0 = v32.towerReplica.Data.AttackMode;
                if not l_Attribute_0 or not l_AttackMode_0 then
                    return;
                else
                    v19:UpdateTargetMode(l_Attribute_0, l_AttackMode_0);
                    return;
                end;
            end;
        end;
        v22:HandleButton(v32.gameTowerButtons.Targeting, v36);
        v22:HandleButton(v32.gameTowerInfo.Bottom.Target.Button, v36);
        v22:HandleButton(v32.gameTowerButtons.Upgrade, function() --[[ Line: 163 ]]
            -- upvalues: v19 (ref)
            v19:UpgradeTower();
        end, {
            MouseEnter = function() --[[ Line: 166 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v19 (ref)
                v19:ToggleUpgradeRangeViewer(true);
            end, 
            MouseLeave = function() --[[ Line: 169 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v19 (ref)
                v19:ToggleUpgradeRangeViewer(false);
            end
        });
        v22:HandleButton(v32.gameTowerInfo.Bottom.Upgrade.Button, function() --[[ Line: 174 ]]
            -- upvalues: v19 (ref)
            v19:UpgradeTower();
        end, {
            MouseEnter = function() --[[ Line: 177 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v19 (ref)
                v19:ToggleUpgradeRangeViewer(true);
            end, 
            MouseLeave = function() --[[ Line: 180 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v19 (ref)
                v19:ToggleUpgradeRangeViewer(false);
            end
        });
        v21.Gold:Observe(function(v37) --[[ Line: 185 ]]
            -- upvalues: v32 (copy)
            v32._currentGold = v37 or 0;
            v32.GoldUpdated:Fire();
        end);
        v19.TowerReplicaReceived:Connect(function(v38) --[[ Line: 190 ]]
            -- upvalues: v32 (copy)
            v32.towerReplica = v38;
            v32:_displayTowerInfo();
            v38:AddCleanupTask(function() --[[ Line: 194 ]]
                -- upvalues: v32 (ref)
                v32:_hideTowerInfo();
                v32.towerReplica = nil;
            end);
        end);
        local v39 = ("UnitAbilities_%*"):format(v2.Player.UserId);
        v15.ReplicaOfClassCreated(v39, function() --[[ Line: 202 ]]
            -- upvalues: v32 (copy), v15 (ref), v39 (copy)
            v32._abilitysReplica = v15.ReplicaClasses[v39];
            warn("Ability Replica Created", v39, v32._abilitysReplica);
        end);
    end, 
    Opened = function(v40) --[[ Line: 208 ]] --[[ Name: Opened ]]
        -- upvalues: v3 (copy), v20 (ref), v19 (ref)
        v40._inputDump = v3.new();
        local v41 = v20:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 211 ]]
            -- upvalues: v19 (ref)
            v19:DeselectTower();
        end);
        v40._inputDump:Add(function() --[[ Line: 215 ]]
            -- upvalues: v41 (ref), v40 (copy)
            v41();
            v41 = nil;
            v40._inputDump = nil;
        end);
        v40.chargedAttack.Attack.Content.TowerInfo.RotateBg:AddTag("UISpin");
    end, 
    Closing = function(v42) --[[ Line: 224 ]] --[[ Name: Closing ]]
        -- upvalues: v19 (ref)
        if v42._inputDump then
            v42._inputDump:Destroy();
        end;
        v19:ToggleUpgradeRangeViewer(false);
        v42.chargedAttack.Attack.Content.TowerInfo.RotateBg:RemoveTag("UISpin");
    end, 
    OnTowerStatChanged = function(v43, v44, v45, v46) --[[ Line: 235 ]] --[[ Name: OnTowerStatChanged ]]
        if not v44 or not v45 then
            return;
        elseif not v43.towerReplica then
            return;
        else
            if v46 then
                local v47 = nil;
                v47 = if typeof(v44) == "table" then table.concat(v44, ".") else v44;
                v45(v43.towerReplica.Data[v47]);
            end;
            return v43.towerReplica:ListenToChange(v44, v45);
        end;
    end, 
    _displayTowerInfo = function(v48) --[[ Line: 261 ]] --[[ Name: _displayTowerInfo ]]
        -- upvalues: v3 (copy), v8 (copy), v14 (copy), v11 (copy), v7 (copy), v26 (copy), v24 (ref), v29 (copy), v27 (copy), v28 (copy), v2 (copy), v10 (copy), v12 (copy), v13 (copy), v16 (copy), l_RunService_0 (copy), v22 (ref), v25 (ref), v23 (ref)
        if not v48.towerReplica then
            if v48.main.Visible then
                v48:_hideTowerInfo();
            end;
            return;
        else
            if v48._towerViewportClass then
                v48._towerViewportClass:Destroy();
            end;
            local v49 = v3.new();
            local l_Data_0 = v48.towerReplica.Data;
            local l_Model_0 = l_Data_0.Model;
            local l_Trait_0 = l_Data_0.Trait;
            local l_Trait2_0 = l_Data_0.Trait2;
            local l_SellRate_0 = l_Data_0.SellRate;
            local l_Worth_0 = l_Data_0.Worth;
            local l_PlacementCondition_0 = l_Data_0.PlacementCondition;
            v48.gameTowerContent.Top.UnitInfo.Condition.Visible = l_PlacementCondition_0 ~= nil;
            local v57 = nil;
            local v58 = nil;
            local v59 = nil;
            if l_PlacementCondition_0 then
                local _ = nil;
                local l_v8_ConditionData_0, v62 = v8:GetConditionData(l_PlacementCondition_0);
                v57 = l_v8_ConditionData_0;
                v58 = v62.statReductions;
                v48.gameTowerContent.Top.UnitInfo.Condition.Icon.Image = v57.icon;
                v48.gameTowerContent.Top.UnitInfo.Condition.UIGradient.Color = v57.colors;
                v49:Add(v14.new(v48.gameTowerContent.Top.UnitInfo.Condition, {
                    IsCondition = true, 
                    Name = l_PlacementCondition_0
                }));
            end;
            local function _() --[[ Line: 313 ]] --[[ Name: calculateSellPrice ]]
                -- upvalues: v48 (copy), v8 (ref), l_Worth_0 (ref), l_SellRate_0 (ref)
                v48.gameTowerButtons.Sell.Content.Cost.Amount.Text = v8:SuffixNumber((math.round(l_Worth_0 * l_SellRate_0)));
            end;
            local function v83(v64) --[[ Line: 318 ]] --[[ Name: updateUpgradeInfo ]]
                -- upvalues: l_Data_0 (copy), v11 (ref), v7 (ref), v26 (ref), v48 (copy), v24 (ref), v58 (ref), v59 (ref), v8 (ref), v29 (ref), v27 (ref)
                v64 = v64 or l_Data_0.Upgrade;
                if not v64 then
                    return;
                else
                    local l_v11_Upgrade_0 = v11:GetUpgrade(l_Data_0.Name, v64 + 1);
                    if not v11:GetUpgrade(l_Data_0.Name, v64) then
                        v7:Warn((("[%*]: CRITICAL TOWER DISPLAY ERROR - No upgrade info found for %*"):format(script.Name, l_Data_0.Name)));
                        return;
                    else
                        for _, v67 in v26 do
                            local l_FirstChild_0 = v48.gameTowerContent.Top.UnitUpgrades:FindFirstChild(v67);
                            local l_FirstChild_1 = v48.gameTowerInfo.Top:FindFirstChild(v67);
                            if not l_FirstChild_0 or not l_FirstChild_1 then
                                v7:Warn((("[%*]: Failed to find upgrade frame for %*"):format(script.Name, v67)));
                            elseif l_Data_0.IsResourceTower then
                                l_FirstChild_0.Visible = false;
                                l_FirstChild_1.Visible = false;
                            else
                                l_FirstChild_0.Visible = true;
                                l_FirstChild_1.Visible = true;
                                local v70 = v67 == "Damage" and "GetTotalDamage" or v67;
                                if v70 ~= "GetTotalDamage" then
                                    v70 = ("Get%*"):format(v70);
                                end;
                                local v71 = nil;
                                local v72 = nil;
                                if v67 == "Range" or v67 == "AttackCooldown" then
                                    v72 = v24:GetEquippedPets();
                                else
                                    v71 = v24:GetEquippedPets();
                                end;
                                local v73 = v11[v70](v11, l_Data_0.UnitData, v64, {
                                    Reductions = v58, 
                                    Buffs = v59
                                }, v71, v72) or 0;
                                if v67 == "Damage" or v67 == "Range" then
                                    l_FirstChild_0.StatLabel.Text = v8:CommaNumber(v73);
                                    l_FirstChild_1.Info.StatLabel.Text = v8:SuffixNumber(v73, true);
                                else
                                    l_FirstChild_0.StatLabel.Text = v8:FormatDecimal(v73);
                                    l_FirstChild_1.Info.StatLabel.Text = v8:FormatDecimal(v73);
                                end;
                                if l_v11_Upgrade_0 then
                                    local v74 = v11[v70](v11, l_Data_0.UnitData, v64 + 1, {
                                        Reductions = v58, 
                                        Buffs = v59
                                    }, v71, v72) or 0;
                                    if v67 == "Damage" or v67 == "Range" then
                                        l_FirstChild_0.NextAmount.Text = v8:SuffixNumber(v74);
                                    else
                                        l_FirstChild_0.NextAmount.Text = v8:FormatDecimal(v74);
                                    end;
                                end;
                                l_FirstChild_0.NextAmount.Visible = l_v11_Upgrade_0 ~= nil;
                                l_FirstChild_0.Arrow.Visible = l_v11_Upgrade_0 ~= nil;
                                l_FirstChild_1.Info.StatLabel.TextColor3 = if v58 and v58[v67] then Color3.new(1, 0, 0) else Color3.new(1, 1, 1);
                                l_FirstChild_0.NextAmount.UIGradient.Color = v29[v58 and "reduced" or "normal"];
                            end;
                        end;
                        for _, v76 in v27 do
                            local l_FirstChild_2 = v48.gameTowerContent.Top.UnitUpgrades:FindFirstChild(v76);
                            local l_FirstChild_3 = v48.gameTowerInfo.Top:FindFirstChild(v76);
                            if not l_FirstChild_2 or not l_FirstChild_3 then
                                v7:Warn((("[%*]: Failed to find upgrade frame for %*"):format(script.Name, v76)));
                            elseif not l_Data_0.IsResourceTower then
                                l_FirstChild_2.Visible = false;
                                l_FirstChild_3.Visible = false;
                            else
                                l_FirstChild_2.Visible = true;
                                l_FirstChild_3.Visible = true;
                                local v79 = v11[("Get%*"):format(v76)](v11, l_Data_0.UnitData, v64) or 0;
                                l_FirstChild_2.StatLabel.Text = v8:CommaNumber(v79);
                                l_FirstChild_3.Info.StatLabel.Text = v8:CommaNumber(v79);
                                if l_v11_Upgrade_0 then
                                    local v80 = v11[("Get%*"):format(v76)](v11, l_Data_0.UnitData, v64 + 1) or 0;
                                    l_FirstChild_2.NextAmount.Text = v8:SuffixNumber(v80);
                                end;
                                l_FirstChild_2.NextAmount.Visible = l_v11_Upgrade_0 ~= nil;
                                l_FirstChild_2.Arrow.Visible = l_v11_Upgrade_0 ~= nil;
                            end;
                        end;
                        local l_v64_0 = v64;
                        if not l_v11_Upgrade_0 then
                            v48.gameTowerButtons.Upgrade.Content.Cost.Amount.Text = "(MAX)";
                            v48.gameTowerButtons.Upgrade.Content.Cost.Icon.Visible = false;
                            v48.gameTowerButtons.Upgrade.Content.Disabled.Visible = true;
                            v48.gameTowerButtons.Upgrade.Content.Title.Visible = false;
                            v48.gameTowerButtons.Upgrade.Content.Cost.UIPadding:SetAttribute("OriginalPaddingTop", UDim.new());
                            l_v64_0 = "MAX";
                        else
                            local l_v11_UpgradeCost_0 = v11:GetUpgradeCost(l_Data_0, v64 + 1);
                            v48.gameTowerButtons.Upgrade.Content.Cost.Amount.Text = v8:SuffixNumber(l_v11_UpgradeCost_0);
                            v48.gameTowerButtons.Upgrade.Content.Cost.Icon.Visible = true;
                            v48.gameTowerButtons.Upgrade.Content.Disabled.Visible = v48._currentGold < l_v11_UpgradeCost_0;
                            v48.gameTowerButtons.Upgrade.Content.Title.Visible = l_v11_UpgradeCost_0 <= v48._currentGold;
                            v48.gameTowerButtons.Upgrade.Content.Cost.UIPadding:SetAttribute("OriginalPaddingTop", UDim.new(0, v48._currentGold < l_v11_UpgradeCost_0 and 0 or 10));
                        end;
                        v48.gameTowerContent.Top.UnitUpgrades.Upgrade.Visible = v58 == nil;
                        v48.gameTowerContent.Top.UnitUpgrades.NerfedUpgrade.Visible = v58 ~= nil;
                        v48.gameTowerContent.Top.UnitUpgrades.Upgrade.Title.Text = ("Upgrade [%*]"):format(l_v64_0);
                        v48.gameTowerContent.Top.UnitUpgrades.NerfedUpgrade.Title.Text = ("Upgrade [%*]"):format(l_v64_0);
                        return;
                    end;
                end;
            end;
            local function v85(v84) --[[ Line: 465 ]] --[[ Name: updateTargetMode ]]
                -- upvalues: v48 (copy), v28 (ref)
                v48.gameTowerButtons.Targeting.Content.Title.Text = v28[v84];
            end;
            local v86 = l_Data_0.Owner == v2.Player;
            v48.gameTowerInfo.Bottom.Visible = v86 and not v48.gameTowerInfo.Bottom:GetAttribute("PlatformHidden");
            v48.gameTowerButtons.Visible = v86;
            v48._towerViewportClass = v10.new(v48.gameTowerContent.Top.UnitInfo.TowerInfo, l_Data_0.Name, {
                cornerRadius = 26, 
                Position = UDim2.fromScale(0.5, 0.933), 
                Size = UDim2.fromScale(0.863, 1.04)
            });
            v49:Add(v48._towerViewportClass);
            v48.gameTowerContent.Top.UnitInfo.TowerInfo.UnitName.Text = l_Data_0.FullName;
            v48.gameTowerContent.Top.UnitInfo.Traits.Trait.Visible = l_Trait_0 ~= nil;
            v48.gameTowerContent.Top.UnitInfo.Traits.Trait2.Visible = l_Trait2_0 ~= nil;
            local l_Traits_0 = v48.gameTowerContent.Top.UnitInfo.Traits;
            local v88 = true;
            if l_Trait_0 == nil then
                v88 = l_Trait2_0 ~= nil;
            end;
            l_Traits_0.Visible = v88;
            l_Traits_0 = v48.gameTowerContent.Top.UnitInfo.Traits.Trait:FindFirstChildOfClass("ImageLabel");
            if l_Traits_0 then
                l_Traits_0:Destroy();
            end;
            v88 = v48.gameTowerContent.Top.UnitInfo.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
            if v88 then
                v88:Destroy();
            end;
            if l_Trait_0 ~= nil then
                v12:CreateTraitIcon(l_Trait_0.Name, v48.gameTowerContent.Top.UnitInfo.Traits.Trait);
            end;
            if l_Trait2_0 ~= nil then
                v12:CreateTraitIcon(l_Trait2_0.Name, v48.gameTowerContent.Top.UnitInfo.Traits.Trait2);
            end;
            v48.gameTowerContent.Top.UnitInfo.Relic.Visible = l_Data_0.UnitData.Relic ~= nil;
            if l_Data_0.UnitData.Relic then
                v8:CreateRelicIcon(v48.gameTowerContent.Top.UnitInfo.Relic, l_Data_0.UnitData.Relic);
            end;
            v48.gameTowerContent.Top.UnitInfo.Stars.Visible = l_Data_0.UnitData.Stars > 0;
            if l_Data_0.UnitData.Stars > 0 then
                v48.gameTowerContent.Top.UnitInfo.Stars.Main.Amount.Text = l_Data_0.UnitData.Stars;
                for v89 = 2, 5 do
                    v48.gameTowerContent.Top.UnitInfo.Stars[tostring(v89)].Visible = v89 <= l_Data_0.UnitData.Stars;
                end;
            end;
            local l_v11_UnitValue_0 = v11:GetUnitValue(l_Data_0.Name, "Type");
            v48.gameTowerContent.Top.UnitInfo.AttackType.Icon.Image = v8:GetAttackTypeIcon(l_v11_UnitValue_0);
            local l_v11_PrimaryEffect_0 = v11:GetPrimaryEffect(l_Data_0.Name);
            v48.gameTowerContent.Top.UnitInfo.AttackType.EffectType.Visible = l_v11_PrimaryEffect_0 ~= nil;
            if l_v11_PrimaryEffect_0 then
                v48.gameTowerContent.Top.UnitInfo.AttackType.EffectType.Icon.Image = v8:GetEffectIcon(l_v11_PrimaryEffect_0);
                v48.gameTowerContent.Top.UnitInfo.AttackType.EffectType.UIGradient.Color = v8:GetEffectColor(l_v11_PrimaryEffect_0);
            end;
            v14.new(v48.gameTowerContent.Top.UnitInfo.AttackType, {
                IsUnitType = true, 
                Name = l_Data_0.Name
            });
            local v92 = select(2, v11:GetRarity(l_Data_0.Name));
            local v93 = {
                v13.new(v48.gameTowerContent.Top.UnitInfo.TowerInfo.Backdrop, v92), 
                v13.new(v48.gameTowerContent.Top.UnitInfo.Glow, v92)
            };
            v49:Add(function() --[[ Line: 547 ]]
                -- upvalues: l_Model_0 (ref), v93 (copy)
                l_Model_0 = nil;
                for _, v95 in v93 do
                    v95:Destroy();
                end;
                table.clear(v93);
            end);
            v48.gameTowerButtons.Targeting.Visible = not l_Data_0.IsResourceTower;
            v48.gameTowerInfo.Bottom.Target.Visible = not l_Data_0.IsResourceTower;
            v48.gameTowerContent.Stats.TotalDamage.Visible = not l_Data_0.IsResourceTower;
            v48.gameTowerContent.Stats.Takedowns.Visible = not l_Data_0.IsResourceTower;
            v48.gameTowerContent.Stats.TotalGold.Visible = l_Data_0.IsResourceTower;
            local l_Attribute_1 = v48.towerReplica.Data.Model:GetAttribute("Id");
            local v97 = nil;
            local v98 = 0;
            local v99 = false;
            local v100 = nil;
            local v101 = nil;
            local function v103(v102) --[[ Line: 573 ]] --[[ Name: updateAbilityState ]]
                -- upvalues: v97 (ref), v48 (copy)
                v97 = v102;
                if v97 then
                    v48.chargedAttack.Attack.Content.TowerInfo.Cooldown.Text = "";
                    v48.chargedAttack.Attack.Content.TowerInfo.Backdrop.ImageColor3 = Color3.fromRGB(255, 255, 255);
                    v48.chargedAttack.Attack.Content.TowerInfo.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
                    v48.chargedAttack.Attack.Content.TowerInfo.RotateBg.Visible = true;
                    return;
                else
                    v48.chargedAttack.Attack.Content.TowerInfo.Backdrop.ImageColor3 = Color3.fromRGB(99, 99, 99);
                    v48.chargedAttack.Attack.Content.TowerInfo.Icon.ImageColor3 = Color3.fromRGB(99, 99, 99);
                    v48.chargedAttack.Attack.Content.TowerInfo.RotateBg.Visible = false;
                    return;
                end;
            end;
            local function v105(v104) --[[ Line: 588 ]] --[[ Name: updateAbility2State ]]
                -- upvalues: v100 (ref), v48 (copy)
                v100 = v104;
                if v100 then
                    v48.chargedAttack.Attack2.Content.TowerInfo.Cooldown.Text = "";
                    v48.chargedAttack.Attack2.Content.TowerInfo.Backdrop.ImageColor3 = Color3.fromRGB(255, 255, 255);
                    v48.chargedAttack.Attack2.Content.TowerInfo.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
                    v48.chargedAttack.Attack2.Content.TowerInfo.RotateBg.Visible = true;
                    return;
                else
                    v48.chargedAttack.Attack2.Content.TowerInfo.Backdrop.ImageColor3 = Color3.fromRGB(99, 99, 99);
                    v48.chargedAttack.Attack2.Content.TowerInfo.Icon.ImageColor3 = Color3.fromRGB(99, 99, 99);
                    v48.chargedAttack.Attack2.Content.TowerInfo.RotateBg.Visible = false;
                    return;
                end;
            end;
            if v48._abilitysReplica and v48._abilitysReplica.Data[l_Attribute_1] then
                v48.chargedAttack.Visible = true;
                v48.chargedAttack.Attack.Content.TowerInfo.Icon.Image = v16[l_Data_0.Name] or "";
                v98 = v48._abilitysReplica.Data[l_Attribute_1].TimeRemaining;
                v101 = v48._abilitysReplica.Data[l_Attribute_1].TimeRemaining2;
                v48.chargedAttack.Attack2.Visible = v101 ~= nil;
                if v101 then
                    v48.chargedAttack.Attack2.Content.TowerInfo.Icon.Image = v16[("%*_2"):format(l_Data_0.Name)] or "";
                end;
                v49:Add(v48._abilitysReplica:ListenToChange(l_Attribute_1, function() --[[ Line: 616 ]]
                    -- upvalues: v98 (ref), v48 (copy), l_Attribute_1 (copy), v101 (ref)
                    v98 = v48._abilitysReplica.Data[l_Attribute_1].TimeRemaining;
                    v101 = v48._abilitysReplica.Data[l_Attribute_1].TimeRemaining2;
                end));
                v49:Add(l_RunService_0.PreRender:Connect(function() --[[ Line: 621 ]]
                    -- upvalues: l_Model_0 (ref), v98 (ref), v101 (ref), v99 (ref), v48 (copy), v97 (ref), v105 (copy), v100 (ref), v103 (copy)
                    local l_l_Model_0_Attribute_0 = l_Model_0:GetAttribute("TargetEnemy");
                    local v107 = false;
                    if v98 <= 0 then
                        v107 = l_l_Model_0_Attribute_0 ~= nil;
                    end;
                    local v108 = v101 and v101 <= 0 and l_l_Model_0_Attribute_0 ~= nil;
                    if v98 > 0 then
                        v99 = false;
                    end;
                    if v101 ~= nil and v101 > 0 and v98 > 0 then
                        v99 = false;
                    end;
                    local v109 = if v98 > 0 then math.round(v98) else "";
                    v48.chargedAttack.Attack.Content.TowerInfo.Cooldown.Text = v109;
                    if v101 then
                        local v110 = if v101 > 0 then math.round(v101) else "";
                        v48.chargedAttack.Attack2.Content.TowerInfo.Cooldown.Text = v110;
                    end;
                    if v97 == v107 or v99 then
                        v105(v108);
                        return;
                    elseif v100 == v108 or v99 then
                        v103(v107);
                        return;
                    else
                        v105(v108);
                        v103(v107);
                        return;
                    end;
                end));
            else
                v48.chargedAttack.Visible = false;
            end;
            v49:Add(v22:HandleButton(v48.chargedAttack.Attack, function() --[[ Line: 659 ]]
                -- upvalues: v98 (ref), v25 (ref), v99 (ref), l_Model_0 (ref), v23 (ref), l_Attribute_1 (copy), v103 (copy)
                if v98 > 0 then
                    v25:Notify({
                        message = "Ability on cooldown", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                elseif v99 then
                    v25:Notify({
                        message = "Already using ability", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                elseif not l_Model_0:GetAttribute("TargetEnemy") then
                    v25:Notify({
                        message = "No enemies in range", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                else
                    if v23:UseAbility(l_Attribute_1):expect() then
                        v99 = true;
                        v103(false);
                    end;
                    return;
                end;
            end));
            v49:Add(v22:HandleButton(v48.chargedAttack.Attack2, function() --[[ Line: 698 ]]
                -- upvalues: v101 (ref), v25 (ref), v99 (ref), l_Model_0 (ref), v23 (ref), l_Attribute_1 (copy), v105 (copy)
                if not v101 then
                    return;
                elseif v101 > 0 then
                    v25:Notify({
                        message = "Ability on cooldown", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                elseif v99 then
                    v25:Notify({
                        message = "Already using ability", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                elseif not l_Model_0:GetAttribute("TargetEnemy") then
                    v25:Notify({
                        message = "No enemies in range", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                else
                    if v23:UseAbility(l_Attribute_1, true):expect() then
                        v99 = true;
                        v105(false);
                    end;
                    return;
                end;
            end));
            v49:Add(v48:OnTowerStatChanged("Statistics", function(v111) --[[ Line: 742 ]]
                -- upvalues: v48 (copy), v8 (ref)
                v48.gameTowerContent.Stats.TotalDamage.StatLabel.Text = v8:SuffixNumber((math.round(v111.DamageDealt or 0)));
                v48.gameTowerContent.Stats.Takedowns.StatLabel.Text = v8:SuffixNumber(v111.EnemiesDefeated or 0);
                v48.gameTowerContent.Stats.TotalGold.StatLabel.Text = v8:SuffixNumber(v111.GoldGenerated or 0);
            end, true));
            v49:Add(v48:OnTowerStatChanged("Worth", function(v112) --[[ Line: 749 ]]
                -- upvalues: l_Worth_0 (ref), v48 (copy), v8 (ref), l_SellRate_0 (ref)
                l_Worth_0 = v112;
                v48.gameTowerButtons.Sell.Content.Cost.Amount.Text = v8:SuffixNumber((math.round(l_Worth_0 * l_SellRate_0)));
            end, true));
            v49:Add(v48:OnTowerStatChanged("SellRate", function(v113) --[[ Line: 755 ]]
                -- upvalues: l_SellRate_0 (ref), v48 (copy), v8 (ref), l_Worth_0 (ref)
                l_SellRate_0 = v113;
                v48.gameTowerButtons.Sell.Content.Cost.Amount.Text = v8:SuffixNumber((math.round(l_Worth_0 * l_SellRate_0)));
            end, true));
            v49:Add(v48:OnTowerStatChanged("Upgrade", v83));
            v49:Add(v48:OnTowerStatChanged("AttackMode", v85, true));
            v49:Add(v48:OnTowerStatChanged("TotemBoosts", function(v114) --[[ Line: 764 ]]
                -- upvalues: v59 (ref), v83 (copy), l_Data_0 (copy)
                v59 = v114;
                v83(l_Data_0.Upgrade);
            end, true));
            v49:Add(v48.GoldUpdated:Connect(v83));
            for _, v116 in v11:GetUnitValues(l_Data_0.Name):GetChildren() do
                v49:Add(v116:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 772 ]]
                    -- upvalues: v83 (copy), l_Data_0 (copy)
                    v83(l_Data_0.Upgrade);
                end));
            end;
            for _, v118 in v11:GetUpgradesConfigs(l_Data_0.Name):GetChildren() do
                for _, v120 in v118:GetChildren() do
                    v49:Add(v120:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 779 ]]
                        -- upvalues: v83 (copy), l_Data_0 (copy)
                        v83(l_Data_0.Upgrade);
                    end));
                end;
            end;
            v83(l_Data_0.Upgrade);
            if v22:GetToggleState("BossDialog") then
                v22:Toggle("BossDialog", false):andThen(function() --[[ Line: 788 ]]
                    -- upvalues: v22 (ref)
                    v22:Toggle(script.Name, true);
                end);
            else
                v22:Toggle(script.Name, true);
            end;
            v48.towerReplica:AddCleanupTask(function() --[[ Line: 796 ]]
                -- upvalues: v49 (ref), v48 (copy)
                v49:Destroy();
                v49 = nil;
                v48._towerViewportClass = nil;
                v48:_hideTowerInfo();
            end);
            return;
        end;
    end, 
    _hideTowerInfo = function(_) --[[ Line: 805 ]] --[[ Name: _hideTowerInfo ]]
        -- upvalues: v22 (ref)
        v22:Toggle(script.Name, false);
    end
};