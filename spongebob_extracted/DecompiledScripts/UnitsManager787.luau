local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = require(l_ReplicatedStorage_0.Packages.Signal);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local _ = require(l_ReplicatedStorage_0.TraitsData);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = require(v2.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
return {
    primaryMenu = false, 
    GoldChanged = v5.new(), 
    ToggleProperties = {
        Main = {
            Open = {
                Position = UDim2.fromScale(1, 0), 
                ToggleTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            }, 
            Close = {
                Position = UDim2.fromScale(2, 0), 
                ToggleTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            }
        }
    }, 
    Init = function(v21, v22, v23) --[[ Line: 61 ]] --[[ Name: Init ]]
        -- upvalues: v13 (ref), v2 (copy), v14 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (ref)
        v13 = v2.GetController("UIController");
        v14 = v2.GetService("TowerService");
        v15 = v2.GetController("TowerController");
        v16 = v2.GetController("UIController");
        v17 = v2.GetService("GameService");
        v18 = v2.GetController("DeviceTypeController");
        v21.currentMode = v23;
        v21.ui = v22;
        v21.main = v22.Main;
        v21.bottomButtons = v21.main.BottomButtons;
        v21.unitsScroll = v21.main.Units;
        v21.unitTemplate = v21.unitsScroll.Template:Clone();
        v21.unitsScroll.Template:Destroy();
    end, 
    Start = function(v24) --[[ Line: 81 ]] --[[ Name: Start ]]
        -- upvalues: v19 (ref), v13 (ref), v20 (ref), v17 (ref), v3 (copy)
        v19 = v13:GetModuleAsync("GameUI"):expect();
        v20 = v13:GetModuleAsync("MessagePrompt"):expect();
        HUDModule = v13:GetModuleAsync("HUD"):expect();
        v17.Gold:Observe(function(v25) --[[ Line: 86 ]]
            -- upvalues: v24 (copy)
            v24._currentGold = v25 or 0;
            v24.GoldChanged:Fire();
        end);
        v24.dumpster = v3.new();
        v24:_connectBottomButtons();
    end, 
    Opening = function(v26) --[[ Line: 96 ]] --[[ Name: Opening ]]
        -- upvalues: v13 (ref), v19 (ref)
        v13:Toggle("StageInfo", false);
        v19:ToggleGameInfoBar(false);
        v26:_listenToTowersAdded();
    end, 
    Opened = function(v27) --[[ Line: 102 ]] --[[ Name: Opened ]]
        -- upvalues: v3 (copy), v18 (ref), v13 (ref), l_GuiService_0 (copy)
        v27._inputDump = v3.new();
        local v28 = v18:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 105 ]]
            -- upvalues: v13 (ref)
            v13:Toggle(script.Name, false);
        end);
        local v29 = v18:ObserveGamepadButtonPress(Enum.KeyCode.ButtonR2, function() --[[ Line: 109 ]]
            -- upvalues: v27 (copy)
            v27:AttemptSellAll();
        end);
        v27._inputDump:Add(function() --[[ Line: 113 ]]
            -- upvalues: v28 (ref), v29 (ref), v27 (copy)
            v28();
            v29();
            v28 = nil;
            v29 = nil;
            v27._inputDump = nil;
        end);
        if v18:IsConsole() then
            l_GuiService_0:Select(v27.unitsScroll);
        end;
    end, 
    Closed = function(v30) --[[ Line: 128 ]] --[[ Name: Closed ]]
        -- upvalues: l_GuiService_0 (copy), v12 (copy), v13 (ref), v19 (ref)
        l_GuiService_0.SelectedObject = nil;
        if v30._inputDump then
            v30._inputDump:Destroy();
        end;
        v12.deferClearBrowser(v30.unitsScroll, {
            filterClass = "Frame"
        });
        v13:Toggle("MessagePrompt", false);
        v19:ToggleGameInfoBar(true);
        v30.dumpster:Clean();
    end, 
    AttemptSellAll = function(_) --[[ Line: 144 ]] --[[ Name: AttemptSellAll ]]
        -- upvalues: v13 (ref), v20 (ref), v15 (ref)
        if v13:GetToggleState("MessagePrompt") then
            return;
        else
            v20:Prompt({
                message = "Are you sure you want to sell all of your units?", 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 154 ]] --[[ Name: callback ]]
                            -- upvalues: v15 (ref)
                            v15:SellAllTowers();
                        end
                    }, 
                    {
                        text = "No"
                    }
                }
            });
            v20:BindToClose(function() --[[ Line: 164 ]]
                -- upvalues: v13 (ref)
                v13:Toggle(script.Name, false);
            end);
            return;
        end;
    end, 
    _connectBottomButtons = function(v32) --[[ Line: 169 ]] --[[ Name: _connectBottomButtons ]]
        -- upvalues: v13 (ref)
        v13:HandleButton(v32.bottomButtons.Exit, function() --[[ Line: 170 ]]
            -- upvalues: v13 (ref)
            v13:Toggle(script.Name, false);
        end);
        v13:HandleButton(v32.bottomButtons.SellAll, function() --[[ Line: 174 ]]
            -- upvalues: v32 (copy)
            v32:AttemptSellAll();
        end);
    end, 
    _listenToTowersAdded = function(v33) --[[ Line: 179 ]] --[[ Name: _listenToTowersAdded ]]
        -- upvalues: v12 (copy)
        local l_Friendlies_0 = workspace:WaitForChild("Friendlies");
        local l_l_Friendlies_0_Children_0 = l_Friendlies_0:GetChildren();
        local v37 = v12.loadOnDemand(l_l_Friendlies_0_Children_0, v33.unitsScroll, v33.dumpster, function(v36) --[[ Line: 184 ]]
            -- upvalues: v33 (copy)
            v33:_handleTower(v36);
        end);
        if v37 then
            v33.dumpster:Add(v37);
        end;
        v33.dumpster:Connect(l_Friendlies_0.ChildAdded, function(v38) --[[ Line: 192 ]]
            -- upvalues: v33 (copy)
            v33:_handleTower(v38);
        end);
    end, 
    _handleTower = function(v39, v40) --[[ Line: 197 ]] --[[ Name: _handleTower ]]
        -- upvalues: v2 (copy), v6 (copy), v7 (copy), v15 (ref), v9 (copy), v16 (ref), v18 (ref), v13 (ref), l_GuiService_0 (copy), v17 (ref)
        local l_v40_Attribute_0 = v40:GetAttribute("Id");
        local l_v40_Attribute_1 = v40:GetAttribute("OwnerId");
        if v40:GetAttribute("IsSpawnUnit") then
            return;
        elseif l_v40_Attribute_1 ~= v2.Player.UserId then
            return;
        else
            local v43 = v39.unitTemplate:Clone();
            v43.Name = l_v40_Attribute_0;
            v43.Parent = v39.unitsScroll;
            local v44 = v39.dumpster:Extend();
            v44:Add(v43);
            v44:Construct(v6, v43.UnitBtn.Content.TowerInfo, v40.Name);
            local v45 = select(2, v7:GetRarity(v40.Name));
            if v45 then
                v43.UnitBtn.Content.TowerInfo.Backdrop:SetAttribute("Rarity", v45);
                v43.UnitBtn.Content.TowerInfo.Backdrop:AddTag("VisualizeRarity");
            end;
            local v46 = 1;
            local v47 = v15:_getTraitDataFromModel(v40);
            local v48 = {
                Name = v40.Name, 
                Trait = v47 and v47[1], 
                Trait2 = v47 and v47[2]
            };
            local function v50() --[[ Line: 229 ]] --[[ Name: updateUpgradeLockState ]]
                -- upvalues: v7 (ref), v48 (copy), v46 (ref), v43 (copy), v39 (copy)
                local l_v7_UpgradeCost_0 = v7:GetUpgradeCost(v48, v46 + 1);
                if not l_v7_UpgradeCost_0 then
                    v43.Buttons.Upgrade.Content.Disabled.Visible = true;
                    return;
                else
                    v43.Buttons.Upgrade.Content.Disabled.Visible = v39._currentGold < l_v7_UpgradeCost_0;
                    return;
                end;
            end;
            v44:Add(v9(v40, "Level", function(v51) --[[ Line: 241 ]]
                -- upvalues: v43 (copy)
                v51 = v51 or 1;
                v43.UnitBtn.Content.TowerInfo.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v51);
            end));
            v44:Add(v9(v40, "Upgrade", function(v52) --[[ Line: 246 ]]
                -- upvalues: v46 (ref), v7 (ref), v40 (copy), v43 (copy), v48 (copy), v39 (copy)
                v52 = v52 or 0;
                v46 = v52;
                local l_v52_0 = v52;
                if v7:IsMaxUpgrade(v40.Name, v46) then
                    l_v52_0 = "MAX";
                end;
                v43.Upgrade.Text = ("Upgrade [%*]"):format(l_v52_0);
                local l_v7_UpgradeCost_1 = v7:GetUpgradeCost(v48, v46 + 1);
                if not l_v7_UpgradeCost_1 then
                    v43.Buttons.Upgrade.Content.Disabled.Visible = true;
                    return;
                else
                    v43.Buttons.Upgrade.Content.Disabled.Visible = v39._currentGold < l_v7_UpgradeCost_1;
                    return;
                end;
            end));
            v44:Add(v39.GoldChanged:Connect(v50));
            local v55 = nil;
            v44:Add(v9(v40, "ResourceTower", function(v56) --[[ Line: 264 ]]
                -- upvalues: v43 (copy)
                v43.Priority.Visible = not v56;
            end));
            v44:Add(v9(v40, "AttackMode", function(v57) --[[ Line: 268 ]]
                -- upvalues: v55 (ref), v43 (copy)
                if not v57 then
                    return;
                else
                    v55 = v57;
                    v57 = string.gsub(v57, "InRange", "");
                    v43.Priority.AttackMode.Text = v57;
                    return;
                end;
            end));
            v44:Add(v16:HandleButton(v43.UnitBtn, function() --[[ Line: 279 ]]
                -- upvalues: v15 (ref), v40 (copy)
                v15:SelectTower(v40, true);
            end));
            v44:Add(v16:HandleButton(v43.Priority, function() --[[ Line: 283 ]]
                -- upvalues: v15 (ref), l_v40_Attribute_0 (copy), v55 (ref)
                v15:UpdateTargetMode(l_v40_Attribute_0, v55);
            end));
            v44:Add(v16:HandleButton(v43.Buttons.Sell, function() --[[ Line: 287 ]]
                -- upvalues: v15 (ref), l_v40_Attribute_0 (copy), v40 (copy), v18 (ref), v13 (ref), l_GuiService_0 (ref), v39 (copy)
                v15:SellTower(l_v40_Attribute_0, v40.Name):andThen(function() --[[ Line: 288 ]]
                    -- upvalues: v18 (ref), v13 (ref), l_GuiService_0 (ref), v39 (ref)
                    if v18:IsConsole() and v13:GetToggleState(script.Name) then
                        l_GuiService_0:Select(v39.unitsScroll);
                    end;
                end);
            end));
            v44:Add(v16:HandleButton(v43.Buttons.Upgrade, function() --[[ Line: 295 ]]
                -- upvalues: v17 (ref), l_v40_Attribute_0 (copy)
                v17:UpgradeTower(l_v40_Attribute_0);
            end));
            v44:Add(function() --[[ Line: 299 ]]
                -- upvalues: v44 (ref)
                v44 = nil;
            end);
            v44:AttachTo(v40);
            return;
        end;
    end
};