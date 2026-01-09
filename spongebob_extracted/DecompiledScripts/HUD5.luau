local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_TeleportService_0 = game:GetService("TeleportService");
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local v9 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v10 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v11 = require(l_ReplicatedStorage_0.Packages.EzVisuals);
local v12 = require(l_ReplicatedStorage_0.Packages.Promise);
local v13 = require(l_ReplicatedStorage_0.Packages.Signal);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.SharedSignals);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ViewportHandler);
local v21 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v22 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v23 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local _ = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v25 = require(l_ReplicatedStorage_0.TraitsData);
local v26 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v27 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v29 = require(l_ReplicatedFirst_0.PlaceIds);
local v30 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v31 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v32 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v33 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v34 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.BeltHandler);
local v35 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v36 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.GlovesUtil);
local v37 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v38 = require(l_ReplicatedStorage_0.Packages.Input).Gamepad.new();
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
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
return {
    primaryMenu = false, 
    _viewportHandlers = {}, 
    _towerInfoViewportClass = nil, 
    targetModel = nil, 
    targetMode = nil, 
    targetType = nil, 
    targetData = nil, 
    targetCache = {}, 
    _hudButtons = {}, 
    _loadoutVisuals = {}, 
    _sideBarState = true, 
    _unitsBarActive = true, 
    _isPresetLoadout = false, 
    ToggledUnitsBar = v13.new(), 
    Init = function(v60, v61, v62) --[[ Line: 105 ]] --[[ Name: Init ]]
        -- upvalues: v39 (ref), v8 (copy), v40 (ref), v41 (ref), v42 (ref), v43 (ref), v44 (ref), v45 (ref), v46 (ref), v47 (ref), v48 (ref), v49 (ref), v50 (ref), v51 (ref), v52 (ref), v53 (ref), v54 (ref), v55 (ref), v10 (copy), v27 (copy), l_TeleportService_0 (copy), v29 (copy)
        v39 = v8.GetController("UIController");
        v40 = v8.GetController("DataController");
        v41 = v8.GetController("TowerController");
        v42 = v8.GetService("GameService");
        v43 = v8.GetController("FastTravelController");
        v44 = v8.GetService("UnitService");
        v45 = v8.GetController("UnitController");
        v46 = v8.GetController("AudioController");
        v47 = v8.GetController("PlaceTeleportController");
        v48 = v8.GetController("EventController");
        v49 = v8.GetController("DeviceTypeController");
        v50 = v8.GetService("CardService");
        v51 = v8.GetController("PetController");
        v52 = v8.GetService("PetService");
        v53 = v8.GetService("OPBundleService");
        v54 = v8.GetService("TowerKarateService");
        v55 = v8.GetService("SessionService");
        v60.currentMode = v62;
        v60.ui = v61;
        v60.lobbyFrame = v60.ui.Lobby;
        v60.leftSide = v60.lobbyFrame.Left;
        v60.rightSide = v60.lobbyFrame.Right;
        v60.bottom = v60.ui.Bottom;
        v60._defaultUnitBarPosition = v60.bottom.Position;
        v60.gameCurrencyBar = v60.bottom.GameCurrency;
        v60.gameCurrencyFrame = v60.gameCurrencyBar.Coins;
        v60.gameHealthFrame = v60.gameCurrencyBar.Health;
        v60.currencyBar = v60.leftSide.Content.Currency;
        v60.xpFrame = v60.bottom.Leveling;
        v60.xpFillbar = v60.xpFrame.Fill;
        v60.progressionLabel = v60.xpFrame.Progression;
        v60.karateIcon = v60.xpFrame.Belt;
        v60.unitsFrame = v60.bottom.Hotbar;
        v60.tooltip = v60.bottom.Tooltip;
        v60.tooltip.Visible = false;
        v60.unitsFrame.Unsorted.Hint.Visible = false;
        v60._unitButtons = v10.Filter(v60.unitsFrame:GetChildren(), function(v63) --[[ Line: 153 ]]
            if v63:IsA("GuiButton") then
                v63.Content.TowerInfo.DMG.Visible = false;
            end;
            return v63:IsA("GuiButton");
        end);
        table.sort(v60._unitButtons, function(v64, v65) --[[ Line: 162 ]]
            return tonumber(v64.Name) < tonumber(v65.Name);
        end);
        v60.petsFrame = v60.bottom.PetHotbar;
        local v66 = v60.petsFrame.Template:Clone();
        v60.petsFrame.Template:Destroy();
        v60._petButtons = {};
        for v67 = 1, v27.PETS.MAX_SLOTS do
            local v68 = v66:Clone();
            v68.Name = v67;
            v68.Parent = v60.petsFrame;
            table.insert(v60._petButtons, v68);
        end;
        local v69 = v60.currentMode == "Game";
        local v70 = false;
        local function _() --[[ Line: 181 ]] --[[ Name: updateGameVisibleState ]]
            -- upvalues: v60 (copy), v69 (copy), v70 (ref)
            v60.lobbyFrame.Visible = not v69 and v60.currentMode ~= "Cave";
            v60.currencyBar.Visible = not v69;
            local l_bottom_0 = v60.bottom;
            local v72 = false;
            if v60.currentMode ~= "Cave" then
                v72 = not v70;
            end;
            l_bottom_0.Visible = v72;
        end;
        if v69 then
            local v74 = v55:PromiseGetMatchSettings():expect();
            if v74 and v74.Mode == "TowerOfKarate" then
                v70 = true;
            end;
            v60.lobbyFrame.Visible = not v69 and v60.currentMode ~= "Cave";
            v60.currencyBar.Visible = not v69;
            local l_bottom_1 = v60.bottom;
            local v76 = false;
            if v60.currentMode ~= "Cave" then
                v76 = not v70;
            end;
            l_bottom_1.Visible = v76;
        end;
        v60.gameCurrencyBar.Visible = false;
        if not l_TeleportService_0:GetLocalPlayerTeleportData() and v29:IsLobby() then
            v60:ToggleNotifier("Shop", false);
        end;
        v60.bottom.Lobby.Visible = false;
        if v29:IsLobby() or v29:IsTrading() then
            v60.bottom.Lobby.Visible = true;
            v60.playButton = v60.bottom.Lobby.Play;
            v60.tradeButton = v60.bottom.Lobby.Trade;
            v60:_setupPlayButton();
            v60:_setupTradeButton();
        end;
    end, 
    Start = function(v77) --[[ Line: 214 ]] --[[ Name: Start ]]
        -- upvalues: v37 (copy), v29 (copy), v27 (copy), v56 (ref), v39 (ref), v59 (ref), v40 (ref), v8 (copy), v36 (copy), v19 (copy), v32 (copy), v55 (ref), v57 (ref), v58 (ref), v22 (copy), v33 (copy), v48 (ref), v30 (copy), v50 (ref), v42 (ref), v46 (ref), l_HttpService_0 (copy), l_GuiService_0 (copy), l_PreferredInput_0 (copy), v38 (copy)
        if v77.rightSide.Content:FindFirstChild("MoviePromo") then
            local l_MoviePromo_0 = v77.rightSide.Content.MoviePromo;
            l_MoviePromo_0.Visible = false;
            v77.policyInfo = select(2, v37():await());
            v77.adsAllowed = v77.policyInfo and v77.policyInfo.AreAdsAllowed or false;
            if v29:IsLobby() and v77.adsAllowed then
                local l_CHRISTMAS_TREE_LIGHTUP_0 = v27.CHRISTMAS_TREE_LIGHTUP;
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                if l_CHRISTMAS_TREE_LIGHTUP_0 <= l_workspace_ServerTimeNow_0 then
                    l_MoviePromo_0.Visible = true;
                else
                    local l_l_MoviePromo_0_0 = l_MoviePromo_0 --[[ copy: 1 -> 16 ]];
                    task.delay(l_CHRISTMAS_TREE_LIGHTUP_0 - l_workspace_ServerTimeNow_0, function() --[[ Line: 229 ]]
                        -- upvalues: l_l_MoviePromo_0_0 (copy)
                        l_l_MoviePromo_0_0.Visible = true;
                    end);
                end;
            end;
        end;
        if v77.currentMode == "Lobby" then
            v56 = v39:GetModuleAsync("Summon"):expect();
        end;
        if v29:IsHUB() then
            v59 = v39:GetModuleAsync("Units"):expect();
        end;
        v77.xpFrame.Prestige.Visible = true;
        v77.xpFrame.Belt.Visible = false;
        v77.currencyBar.KarateCoins.Visible = false;
        v77.gameCurrencyBar.KaratePower.Visible = false;
        local function v88(v82) --[[ Line: 249 ]] --[[ Name: updateKarateMode ]]
            -- upvalues: v77 (copy), v29 (ref), v40 (ref), v8 (ref), v36 (ref), v19 (ref), v32 (ref)
            v77.bottom.Hotbar.Visible = not v82;
            v77.xpFrame.Prestige.Visible = false;
            v77.xpFrame.Belt.Visible = true;
            v77.gameCurrencyBar.KaratePower.Visible = v29:IsHUB();
            v77.gameCurrencyBar.Coins.Visible = false;
            v77.gameCurrencyBar.Health.Visible = v82;
            v77.gameCurrencyBar.Visible = true;
            v77.currencyBar.KarateCoins.Visible = true;
            for _, v84 in v77._unitButtons do
                v84.Content.TowerInfo.Cost.Visible = false;
                v84.Content.TowerInfo.DMG.Visible = true;
            end;
            v77:_ConnectLevelBar();
            v40:OnChanged(v8.Player, "EquippedGlove", function(v85) --[[ Line: 266 ]]
                -- upvalues: v36 (ref), v8 (ref), v77 (ref), v19 (ref), v32 (ref)
                local v86 = v36.GetHitDamage(v8.Player);
                v77.gameCurrencyBar.KaratePower.Title.Text = v19:SuffixNumber(v86, true);
                local l_v32_ByItemName_0 = v32:GetByItemName(v85);
                if l_v32_ByItemName_0 and l_v32_ByItemName_0.icon then
                    v77.gameCurrencyBar.KaratePower.Icon.Image = l_v32_ByItemName_0.icon;
                end;
            end, true);
        end;
        if v29:IsKarateLobby() then
            v77._isKarateMode = true;
            v88(false);
        elseif v29:IsGame() then
            v55:PromiseGetMatchSettings():andThen(function(v89) --[[ Line: 282 ]]
                -- upvalues: v77 (copy), v88 (copy)
                v77._isKarateMode = v89 and v89.Mode == "TowerOfKarate";
                if v77._isKarateMode then
                    v88(true);
                end;
            end);
        end;
        v57 = v39:GetModuleAsync("Notification"):expect();
        v58 = v39:GetModuleAsync("MessagePrompt"):expect();
        v77._myUnits = v40:Get(v8.Player, "Units"):expect();
        v77._myPets = v40:Get(v8.Player, "Pets"):expect();
        v77._playerStats = v40:Get(v8.Player, "PlayerStats"):expect();
        v77.loadoutKey = v22:GetLoadoutKey();
        local v90 = v40:Get(v8.Player, v77.loadoutKey):expect();
        local v91 = v40:Get(v8.Player, "PetsLoadout"):expect();
        v77:_connectPartyDisplay();
        v77:_connectMenuButtons();
        v77:_connectUnits();
        v77:_connectPets();
        local function _(v92, v93) --[[ Line: 308 ]] --[[ Name: updatePlayerStats ]]
            -- upvalues: v77 (copy)
            v77:_updateXPBar(v92);
            if v93 or v77._isPresetLoadout then
                return;
            else
                v77:_updateUnits();
                return;
            end;
        end;
        local function v96(v95) --[[ Line: 319 ]] --[[ Name: updateLoadout ]]
            -- upvalues: v77 (copy)
            if v77._isPresetLoadout then
                return;
            else
                v77._equippedUnits = v95;
                v77:_updateUnits();
                return;
            end;
        end;
        local function v98(v97) --[[ Line: 328 ]] --[[ Name: updatePetLoadout ]]
            -- upvalues: v77 (copy)
            v77._equippedPets = v97;
            v77:_updatePets();
        end;
        v77:_updateXPBar(v77._playerStats);
        if not v77._isPresetLoadout then
            v77._equippedUnits = v90;
            v77:_updateUnits();
        end;
        v77._equippedPets = v91;
        v77:_updatePets();
        v77:SwitchHotbar("Units");
        for _, v100 in v77.currencyBar:GetChildren() do
            local v101 = v100:GetAttribute("CurrencyName") or v100.Name;
            if v101 ~= "FactionPoints" then
                if v101 == "EventCurrency" or v100.Name == "EventCurrency" then
                    v101 = v33.Currency;
                    if v48:IsActive() and v101 ~= nil then
                        v100.Visible = true;
                    else
                        v100.Visible = false;
                        continue;
                    end;
                end;
                if v32:GetByItemName(v101) then
                    v100.Icon.Image = v30.Currency[v101];
                    local l_v32_ByItemName_1 = v32:GetByItemName(v101);
                    if l_v32_ByItemName_1 and l_v32_ByItemName_1.inactive then
                        v100.Visible = false;
                    else
                        v40:OnChanged(v8.Player, ("Currency.%*"):format(v101), function(v103) --[[ Line: 372 ]]
                            -- upvalues: v77 (copy), v100 (copy)
                            v77:_updateCurrency(v100, v103);
                        end, true);
                    end;
                end;
            end;
        end;
        if v29:IsLobby() or v29:IsFactionWorld() then
            local l_FactionPoints_0 = v77.currencyBar:FindFirstChild("FactionPoints");
            if l_FactionPoints_0 then
                l_FactionPoints_0.Visible = true;
                local l_l_FactionPoints_0_0 = l_FactionPoints_0 --[[ copy: 7 -> 15 ]];
                v40:OnChanged(v8.Player, "Faction", function(v106) --[[ Line: 383 ]]
                    -- upvalues: v77 (copy), l_l_FactionPoints_0_0 (copy)
                    local v107 = v106 and v106.Balance or 0;
                    v77:_updateCurrency(l_l_FactionPoints_0_0, v107);
                end, true);
            end;
        end;
        v40:OnChanged(v8.Player, "PlayerStats", function(v108) --[[ Line: 390 ]]
            -- upvalues: v77 (copy)
            v77._playerStats = v108;
            v77:_updateXPBar(v108);
            if v77._isPresetLoadout then
                return;
            else
                v77:_updateUnits();
                return;
            end;
        end);
        v40:OnChanged(v8.Player, v77.loadoutKey, v96);
        v40:OnChanged(v8.Player, "PetsLoadout", v98);
        v40:OnChanged(v8.Player, "Units", function(v109) --[[ Line: 398 ]]
            -- upvalues: v77 (copy)
            v77._myUnits = v109;
            if v77._traitless then
                for _, v111 in v77._myUnits do
                    for _, v113 in v111 do
                        v113.Trait = nil;
                        v113.Trait2 = nil;
                    end;
                end;
            end;
            v77:_updateUnits();
        end);
        v40:OnChanged(v8.Player, "Pets", function(v114) --[[ Line: 413 ]]
            -- upvalues: v77 (copy)
            v77._myPets = v114;
            v77:_updatePets();
        end);
        v40:OnChanged(v8.Player, "MaxPetSlots", function() --[[ Line: 418 ]]
            -- upvalues: v77 (copy)
            v77:_updatePets();
        end);
        v50.LockedLoadoutSlot:Observe(function() --[[ Line: 422 ]]
            -- upvalues: v77 (copy)
            v77:_updateUnits();
        end);
        if v77.currentMode == "Game" then
            v42.Gold:Observe(function(v115) --[[ Line: 455 ]]
                -- upvalues: v77 (copy)
                v77:_updateInGameCurrency(v115);
            end);
            local v116 = 0;
            do
                local l_v116_0 = v116;
                v42.Health:Observe(function(v118) --[[ Line: 461 ]]
                    -- upvalues: l_v116_0 (ref), v46 (ref), v77 (copy)
                    if v118.Current < l_v116_0 then
                        v46:PlaySound({
                            name = "UI.HPDMG", 
                            soundGroup = "Master.SFX.UI"
                        });
                    end;
                    l_v116_0 = v118.Current;
                    v77.gameHealthFrame.Title.Text = ("%*/%*"):format(v118.Current or 0, v118.Max or 0);
                end);
                v42.PresetLoadout:Observe(function(v119) --[[ Line: 476 ]]
                    -- upvalues: v77 (copy), v40 (ref), v8 (ref), v27 (ref), l_HttpService_0 (ref), v22 (ref)
                    if v119 == nil then
                        return;
                    elseif v77._isPresetLoadout == (v119 ~= false) then
                        return;
                    else
                        v77._isPresetLoadout = v119 ~= false;
                        if not v119 then
                            v77._myUnits = v40:Get(v8.Player, "Units"):expect();
                            v77._equippedUnits = v40:Get(v8.Player, v77.loadoutKey):expect();
                            v77:_updateUnits();
                            return;
                        else
                            local v120 = {};
                            local v121 = {};
                            for v122, v123 in v119 do
                                if v122 <= 6 then
                                    local v124 = table.clone(v27.UNITS.UNIT_TEMPLATE);
                                    v124.Name = v123.UnitName;
                                    if v123.ExtraData then
                                        for v125, v126 in v123.ExtraData do
                                            v124[v125] = v126;
                                        end;
                                    end;
                                    local v127 = v120[v123.UnitName];
                                    if not v127 then
                                        v127 = {};
                                        v120[v123.UnitName] = v127;
                                    end;
                                    local v128 = l_HttpService_0:GenerateGUID(false);
                                    v127[v128] = v124;
                                    v121[v122] = v22:CreateLoadoutString(v123.UnitName, v128);
                                else
                                    break;
                                end;
                            end;
                            v77._myUnits = v120;
                            v77._equippedUnits = v121;
                            v77:_updateUnits();
                            return;
                        end;
                    end;
                end);
                v42.LevelInfo:Observe(function(v129) --[[ Line: 530 ]]
                    -- upvalues: v77 (copy)
                    if not v129 then
                        return;
                    else
                        v77.gamemode = v129.Mode;
                        local l_gameCurrencyBar_0 = v77.gameCurrencyBar;
                        local v131 = false;
                        if v129 ~= nil then
                            v131 = v129.Mode ~= "BossBattle";
                        end;
                        l_gameCurrencyBar_0.Visible = v131;
                        if v129.Mode == "BossBattle" then
                            for _, v133 in v77._unitButtons do
                                v133.Content.TowerInfo.Cost.Visible = false;
                            end;
                        end;
                        return;
                    end;
                end);
            end;
        end;
        v42.Traitless:Observe(function(v134) --[[ Line: 546 ]]
            -- upvalues: v77 (copy)
            v77._traitless = v134;
            if v134 then
                for _, v136 in v77._myUnits do
                    for _, v138 in v136 do
                        v138.Trait = nil;
                        v138.Trait2 = nil;
                    end;
                end;
            end;
            v77:_updateUnits();
        end);
        local l_UISizeConstraint_0 = v77.ui.TopBar.UISizeConstraint;
        local l_l_UISizeConstraint_0_0 = l_UISizeConstraint_0 --[[ copy: 7 -> 14 ]];
        local function v143() --[[ Line: 564 ]] --[[ Name: updateTopBarSize ]]
            -- upvalues: l_GuiService_0 (ref), l_l_UISizeConstraint_0_0 (copy), v77 (copy)
            local l_TopbarInset_0 = l_GuiService_0.TopbarInset;
            local v142 = l_TopbarInset_0.Height * 0.7;
            l_l_UISizeConstraint_0_0.MinSize = Vector2.new(v142, v142);
            v77.ui.TopBar.Position = UDim2.new(1, 0, 0, l_TopbarInset_0.Min.Y);
        end;
        local l_TopbarInset_1 = l_GuiService_0.TopbarInset;
        local v145 = l_TopbarInset_1.Height * 0.7;
        l_UISizeConstraint_0.MinSize = Vector2.new(v145, v145);
        v77.ui.TopBar.Position = UDim2.new(1, 0, 0, l_TopbarInset_1.Min.Y);
        l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(v143);
        if v29:IsLobby() then
            v39:HandleButton(v77.ui.TopBar.PatchNotes, function() --[[ Line: 576 ]]
                -- upvalues: v77 (copy), v39 (ref)
                v77:ToggleUnitReplacement(false);
                v77:TogglePetReplacement(false);
                v39:Toggle("PatchNotes");
            end);
            v77:_connectMenuButton(v77.ui.TopBar.PlaytimePrizes, {});
        else
            v77.ui.TopBar.PatchNotes.Visible = false;
            v77.ui.TopBar.PlaytimePrizes.Visible = false;
        end;
        v39:HandleButton(v77.ui.TopBar.Settings, function() --[[ Line: 587 ]]
            -- upvalues: v29 (ref), v77 (copy), v39 (ref)
            if v29:IsHUB() then
                v77:ToggleUnitReplacement(false);
                v77:TogglePetReplacement(false);
            end;
            v39:Toggle("Settings");
        end);
        l_PreferredInput_0.Observe(function(v146) --[[ Line: 597 ]]
            -- upvalues: v77 (copy)
            local v147 = v146 == "Touch";
            local l_UIScale_0 = v77.ui.TopBar:FindFirstChildOfClass("UIScale");
            if not l_UIScale_0 then
                if not v147 then
                    return;
                else
                    l_UIScale_0 = Instance.new("UIScale");
                    l_UIScale_0.Parent = v77.ui.TopBar;
                end;
            end;
            if not v147 then
                l_UIScale_0:Destroy();
                return;
            else
                l_UIScale_0.Scale = 1.45;
                return;
            end;
        end);
        if v48:IsActive() and not v29:IsGame() and v33.ShowEventButton then
            v39:HandleButton(v77.ui.TopBar.Event, function() --[[ Line: 621 ]]
                -- upvalues: v33 (ref), v77 (copy), v39 (ref)
                if v33.EventUIName then
                    v77:ToggleUnitReplacement(false);
                    v77:TogglePetReplacement(false);
                    v39:Toggle(v33.EventUIName);
                    return;
                else
                    return;
                end;
            end);
            l_UISizeConstraint_0 = v48:ObserveTimeLeft(function(v149, _, v151) --[[ Line: 630 ]]
                -- upvalues: v19 (ref), v77 (copy)
                local v152 = string.upper(v19:FormatTimeFromSeconds(v149 or 0, true));
                if v151 then
                    v77.ui.TopBar.Event.Content.Timer.Text = ("STARTS IN: %*"):format(v152);
                    return;
                elseif v149 <= 0 then
                    v77.ui.TopBar.Event.Content.Timer.Text = "EVENT ENDING";
                    return;
                else
                    v77.ui.TopBar.Event.Content.Timer.Text = ("ENDS IN: %*"):format(v152);
                    return;
                end;
            end);
            v48.EventEnded:Connect(function() --[[ Line: 644 ]]
                -- upvalues: v77 (copy), l_UISizeConstraint_0 (copy)
                v77.ui.TopBar.Event.Visible = false;
                l_UISizeConstraint_0();
            end);
        else
            v77.ui.TopBar.Event.Visible = false;
        end;
        v38.ButtonDown:Connect(function(v153, _) --[[ Line: 653 ]]
            -- upvalues: v77 (copy)
            if v153 == Enum.KeyCode.ButtonL1 or v153 == Enum.KeyCode.ButtonR1 then
                v77:_changeHUDSelection(v153);
                return;
            else
                return;
            end;
        end);
        v8.Player:GetAttributeChangedSignal("Stunned"):Connect(function() --[[ Line: 662 ]]
            -- upvalues: v8 (ref), v77 (copy)
            local v155 = v8.Player:GetAttribute("Stunned") or false;
            v77:ToggleUnitsBar(not v155);
        end);
    end, 
    TogglePatchNotesIndicator = function(v156, v157) --[[ Line: 670 ]] --[[ Name: TogglePatchNotesIndicator ]]
        if v157 == nil then
            v157 = false;
        end;
        v156.ui.TopBar.PatchNotes.Content.Indicator.Visible = v157;
    end, 
    ToggleSideBar = function(v158, v159) --[[ Line: 678 ]] --[[ Name: ToggleSideBar ]]
        v158._sideBarState = v159;
        v158.leftSide.Visible = v159;
        v158.rightSide.Visible = v159;
    end, 
    ToggleBottomBar = function(v160, v161) --[[ Line: 685 ]] --[[ Name: ToggleBottomBar ]]
        v160.bottom.Visible = v161;
    end, 
    ToggleBottomLobbyFrame = function(v162, v163) --[[ Line: 689 ]] --[[ Name: ToggleBottomLobbyFrame ]]
        -- upvalues: v29 (copy)
        if not v29:IsLobby() and not v29:IsTrading() then
            v162.bottom.Lobby.Visible = false;
            return;
        else
            v162.bottom.Lobby.Visible = v163;
            return;
        end;
    end, 
    ToggleNotifier = function(v164, v165, v166) --[[ Line: 698 ]] --[[ Name: ToggleNotifier ]]
        -- upvalues: v39 (ref)
        v166 = v166 or false;
        local v167 = v164._hudButtons[v165];
        if not v167 then
            return;
        elseif v166 and v39:GetToggleState(v165) then
            return;
        else
            local v168 = v167.Content:FindFirstChild("Indicator") or v167.Content:FindFirstChild("ClaimNotifier");
            if v168 then
                v168.Visible = v166;
            end;
            return;
        end;
    end, 
    SelectSide = function(v169, v170) --[[ Line: 717 ]] --[[ Name: SelectSide ]]
        -- upvalues: l_GuiService_0 (copy)
        local l_leftSide_0 = v169.leftSide;
        if v170 == "Right" then
            l_leftSide_0 = v169.rightSide;
        end;
        l_GuiService_0:Select(l_leftSide_0);
    end, 
    ToggleUnitsBar = function(v172, v173, v174) --[[ Line: 727 ]] --[[ Name: ToggleUnitsBar ]]
        -- upvalues: l_TweenService_0 (copy), v12 (copy)
        if v173 == nil then
            v173 = not v172._unitsBarActive;
        end;
        v172._unitsBarActive = v173;
        v172.ToggledUnitsBar:Fire(v173);
        local v175 = if v172._unitsBarActive then v172._defaultUnitBarPosition else UDim2.fromScale(0.5, 1.25);
        if v172._bottomBarTween then
            v172._bottomBarTween:Cancel();
        end;
        local v176 = TweenInfo.new(v174 or 0.3);
        local v177 = l_TweenService_0:Create(v172.bottom, v176, {
            Position = v175
        });
        v172._bottomBarTween = v177;
        v177.Completed:Once(function(v178) --[[ Line: 754 ]]
            -- upvalues: v177 (copy), v172 (copy)
            v177:Destroy();
            if v178 == Enum.PlaybackState.Completed then
                v172._bottomBarTween = nil;
            end;
        end);
        v177:Play();
        return v12.fromEvent(v177.Completed);
    end, 
    SwitchHotbar = function(v179, v180) --[[ Line: 767 ]] --[[ Name: SwitchHotbar ]]
        v179.unitsFrame.Visible = v180 == "Units";
        v179.petsFrame.Visible = v180 == "Pets";
    end, 
    ToggleUnitReplacement = function(v181, v182, v183) --[[ Line: 772 ]] --[[ Name: ToggleUnitReplacement ]]
        -- upvalues: v29 (copy), v10 (copy), l_TweenService_0 (copy), v12 (copy)
        assert(typeof(v182) == "boolean", "Toggle most must be a boolean.");
        assert(v29:IsHUB() == true, "Can only toggle swap units mode in HUB areas");
        if not v182 then
            v181:SwitchHotbar("Units");
        end;
        v181._canSwapUnits = false;
        v181._selectedUnitData = v183 and v10.Copy(v183, true) or nil;
        local v184 = v181:_getMaxLoadoutSlot();
        local v185 = {};
        for v186, v187 in v181._unitButtons do
            if v184 < v186 then
                v187.SwapUnit.Position = UDim2.fromScale(0.5, 0.5);
                v187.SwapUnit.Visible = false;
            else
                v187.SwapUnit.Position = UDim2.fromScale(0.5, 0.5);
                v187.SwapUnit.Visible = v182;
                if v182 then
                    local v188 = l_TweenService_0:Create(v187.SwapUnit, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, (v186 - 1) * 0.078), {
                        Position = UDim2.fromScale(0.5, -0.5)
                    });
                    do
                        local l_v188_0 = v188;
                        l_v188_0.Completed:Once(function() --[[ Line: 809 ]]
                            -- upvalues: l_v188_0 (ref)
                            l_v188_0:Destroy();
                            l_v188_0 = nil;
                        end);
                        table.insert(v185, v12.fromEvent(l_v188_0.Completed));
                        l_v188_0:Play();
                    end;
                end;
            end;
        end;
        if #v185 >= 1 then
            v12.allSettled(v185):finally(function() --[[ Line: 820 ]]
                -- upvalues: v181 (copy), v185 (ref)
                v181.unitsFrame.Unsorted.Hint.Visible = true;
                v181._canSwapUnits = true;
                table.clear(v185);
                v185 = nil;
            end);
        else
            v181.unitsFrame.Unsorted.Hint.Visible = v182;
            table.clear(v185);
            v185 = nil;
        end;
        v181:ToggleSideBar(not v182);
        v181.xpFrame.Visible = not v182;
        v181.currencyBar.Visible = not v182;
    end, 
    TogglePetReplacement = function(v190, v191, v192) --[[ Line: 838 ]] --[[ Name: TogglePetReplacement ]]
        -- upvalues: v29 (copy), v10 (copy), v40 (ref), v8 (copy), l_TweenService_0 (copy), v12 (copy)
        assert(typeof(v191) == "boolean", "Toggle most must be a boolean.");
        assert(v29:IsHUB() == true, "Can only toggle swap units mode in HUB areas");
        v190._canSwapPets = false;
        v190._selectedPetData = v192 and v10.Copy(v192, true) or nil;
        local v193 = v40:Get(v8.Player, "MaxPetSlots"):expect();
        local v194 = {};
        for v195, v196 in v190._petButtons do
            if v193 < v195 then
                v196.SwapUnit.Position = UDim2.fromScale(0.5, 0.5);
                v196.SwapUnit.Visible = false;
            else
                v196.SwapUnit.Position = UDim2.fromScale(0.5, 0.5);
                v196.SwapUnit.Visible = v191;
                if v191 then
                    local v197 = l_TweenService_0:Create(v196.SwapUnit, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, (v195 - 1) * 0.078), {
                        Position = UDim2.fromScale(0.5, -0.5)
                    });
                    do
                        local l_v197_0 = v197;
                        l_v197_0.Completed:Once(function() --[[ Line: 879 ]]
                            -- upvalues: l_v197_0 (ref)
                            l_v197_0:Destroy();
                            l_v197_0 = nil;
                        end);
                        table.insert(v194, v12.fromEvent(l_v197_0.Completed));
                        l_v197_0:Play();
                    end;
                end;
            end;
        end;
        if #v194 >= 1 then
            v12.allSettled(v194):finally(function() --[[ Line: 890 ]]
                -- upvalues: v190 (copy), v194 (ref)
                v190.petsFrame.Unsorted.Hint.Visible = true;
                v190._canSwapPets = true;
                table.clear(v194);
                v194 = nil;
            end);
        else
            v190.petsFrame.Unsorted.Hint.Visible = v191;
            table.clear(v194);
            v194 = nil;
        end;
        v190:ToggleSideBar(not v191);
        v190.xpFrame.Visible = not v191;
        v190.currencyBar.Visible = not v191;
    end, 
    _connectMenuButton = function(v199, v200, v201) --[[ Line: 908 ]] --[[ Name: _connectMenuButton ]]
        -- upvalues: v33 (copy), v48 (ref), v11 (copy), l_TweenService_0 (copy), v19 (copy), v9 (copy), v40 (ref), v8 (copy), v31 (copy), v27 (copy), v16 (copy), v53 (ref), v39 (ref), l_GuiService_0 (copy), v58 (ref), v29 (copy), v47 (ref), v43 (ref), v57 (ref)
        if v200.Name == "Event" and (not v33.ShowEventButton or not v48:IsActive()) then
            v200.Visible = false;
            return;
        else
            local v202 = v200:GetAttribute("UIName") or v200:GetAttribute("GUIName") or v200.Name;
            local v203 = v200:GetAttribute("TeleportLocation") or v200:GetAttribute("FastTravelLocation");
            local l_Content_0 = v200:FindFirstChild("Content");
            if l_Content_0 then
                v11.new(v200.Content, "Shine");
            end;
            local v205 = v201 and v201.SetupIconEffects;
            local v206 = nil;
            local v207 = nil;
            local v208 = nil;
            if v205 then
                local v209 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                v206 = v200.Content:FindFirstChild("Icon", true);
                v207 = l_TweenService_0:Create(v206, v209, {
                    Rotation = v206.Rotation + 10
                });
                v208 = l_TweenService_0:Create(v206, v209, {
                    Rotation = v206.Rotation
                });
            end;
            v199._hudButtons[v202] = v200;
            if v200.Name == "Event" then
                local v210 = nil;
                local v211 = l_Content_0 and l_Content_0:FindFirstChild("Timer");
                if v211 then
                    local l_v211_0 = v211 --[[ copy: 11 -> 14 ]];
                    v210 = v48:ObserveTimeLeft(function(v213) --[[ Line: 947 ]]
                        -- upvalues: l_v211_0 (copy), v19 (ref)
                        local v214 = v213 // 86400;
                        if v214 == 0 then
                            l_v211_0.Text = "LAST DAY";
                            return;
                        else
                            l_v211_0.Text = ("%* %*"):format(v214, (string.upper(v19:Pluralize("DAY", v214))));
                            return;
                        end;
                    end);
                end;
                do
                    local l_v210_0 = v210;
                    v48.EventEnded:Connect(function() --[[ Line: 960 ]]
                        -- upvalues: v200 (copy), l_v210_0 (ref)
                        v200.Visible = false;
                        if l_v210_0 then
                            l_v210_0();
                        end;
                    end);
                end;
            end;
            if v200.Name == "OPBundle" then
                local v216 = v9.new();
                local v217 = v216:Extend();
                local l_Timer_0 = v200.Content.Timer;
                local function _() --[[ Line: 973 ]] --[[ Name: listenForTimestamp ]]
                    -- upvalues: v216 (copy), v40 (ref), v8 (ref), v217 (copy), v31 (ref), v27 (ref), v200 (copy), l_Timer_0 (copy), v16 (ref)
                    v216:Add(v40:OnChanged(v8.Player, "OPBundleServicedTimestamp", function(v219) --[[ Line: 974 ]]
                        -- upvalues: v217 (ref), v31 (ref), v27 (ref), v200 (ref), v216 (ref), l_Timer_0 (ref), v16 (ref)
                        if v219 == nil then
                            return;
                        else
                            v217:Destroy();
                            v217:Add(v31.Simple(0.5, function() --[[ Line: 981 ]]
                                -- upvalues: v219 (copy), v27 (ref), v200 (ref), v216 (ref), l_Timer_0 (ref), v16 (ref)
                                local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                                local v221 = v219 + v27.OP_BUNDLE_OFFER.EXPIRATION - l_workspace_ServerTimeNow_1;
                                if v221 <= 0 then
                                    v200.Visible = false;
                                    v216:Destroy();
                                    return;
                                else
                                    l_Timer_0.Text = v16:FormatHHMMSS(v221);
                                    return;
                                end;
                            end, true));
                            return;
                        end;
                    end, true));
                end;
                v53.BundleAvailable:Observe(function(v223) --[[ Line: 996 ]]
                    -- upvalues: v216 (copy), v200 (copy), v40 (ref), v8 (ref), v217 (copy), v31 (ref), v27 (ref), l_Timer_0 (copy), v16 (ref)
                    if not v223 then
                        v216:Destroy();
                        v200.Visible = false;
                        return;
                    else
                        v216:Add(v40:OnChanged(v8.Player, "OPBundleServicedTimestamp", function(v224) --[[ Line: 974 ]]
                            -- upvalues: v217 (ref), v31 (ref), v27 (ref), v200 (ref), v216 (ref), l_Timer_0 (ref), v16 (ref)
                            if v224 == nil then
                                return;
                            else
                                v217:Destroy();
                                v217:Add(v31.Simple(0.5, function() --[[ Line: 981 ]]
                                    -- upvalues: v224 (copy), v27 (ref), v200 (ref), v216 (ref), l_Timer_0 (ref), v16 (ref)
                                    local l_workspace_ServerTimeNow_2 = workspace:GetServerTimeNow();
                                    local v226 = v224 + v27.OP_BUNDLE_OFFER.EXPIRATION - l_workspace_ServerTimeNow_2;
                                    if v226 <= 0 then
                                        v200.Visible = false;
                                        v216:Destroy();
                                        return;
                                    else
                                        l_Timer_0.Text = v16:FormatHHMMSS(v226);
                                        return;
                                    end;
                                end, true));
                                return;
                            end;
                        end, true));
                        v200.Visible = true;
                        return;
                    end;
                end);
            end;
            v39:HandleButton(v200, function() --[[ Line: 1007 ]]
                -- upvalues: l_GuiService_0 (ref), v206 (ref), v208 (ref), v200 (copy), v58 (ref), v29 (ref), v47 (ref), v203 (copy), v43 (ref), v27 (ref), v202 (copy), v19 (ref), v199 (copy), v57 (ref), v33 (ref), v39 (ref)
                l_GuiService_0.SelectedObject = nil;
                if v206 then
                    local l_UIGradient_0 = v206:FindFirstChild("UIGradient");
                    if l_UIGradient_0 then
                        l_UIGradient_0.Enabled = true;
                    end;
                    v208:Play();
                end;
                if v200.Name == "Leave" then
                    v58:Prompt({
                        message = v29:GetDestinationPrompt("Lobby"), 
                        options = {
                            {
                                text = "Yes", 
                                callback = function() --[[ Line: 1024 ]] --[[ Name: callback ]]
                                    -- upvalues: v47 (ref)
                                    v47:Teleport("Lobby");
                                end
                            }, 
                            {
                                text = "No"
                            }
                        }
                    });
                    return;
                elseif v203 then
                    v43:Travel(v203);
                    return;
                else
                    local v228 = v27.LEVEL_LOCK_FEATURES[v202];
                    if v228 and not v19:MeetsLevelRequirement(v199._playerStats, v228) then
                        v57:Notify({
                            message = ("You must be level %* to unlock this feature!"):format(v228), 
                            duration = 3
                        });
                        return;
                    else
                        if v29:IsHUB() then
                            v199:ToggleUnitReplacement(false);
                            v199:TogglePetReplacement(false);
                        end;
                        if v200.Name == "Event" and v33.EventUIName then
                            v39:Toggle(v33.EventUIName);
                            return;
                        else
                            v39:Toggle(v202);
                            return;
                        end;
                    end;
                end;
            end, {
                MouseEnter = function() --[[ Line: 1060 ]] --[[ Name: MouseEnter ]]
                    -- upvalues: v206 (ref), v207 (ref)
                    if v206 then
                        v207:Play();
                        local l_UIGradient_1 = v206:FindFirstChild("UIGradient");
                        if l_UIGradient_1 then
                            l_UIGradient_1.Enabled = false;
                        end;
                    end;
                end, 
                MouseLeave = function() --[[ Line: 1070 ]] --[[ Name: MouseLeave ]]
                    -- upvalues: v206 (ref), v208 (ref)
                    if v206 then
                        v208:Play();
                        local l_UIGradient_2 = v206:FindFirstChild("UIGradient");
                        if l_UIGradient_2 then
                            l_UIGradient_2.Enabled = true;
                        end;
                    end;
                end
            });
            return;
        end;
    end, 
    _connectMenuButtons = function(v231) --[[ Line: 1082 ]] --[[ Name: _connectMenuButtons ]]
        -- upvalues: v10 (copy)
        for _, v233 in v10.Extend(v231.leftSide.Content:GetDescendants(), v231.rightSide.Content:GetChildren()) do
            if v233:IsA("GuiButton") then
                v231:_connectMenuButton(v233, {
                    SetupIconEffects = true
                });
            end;
        end;
    end, 
    UpdatePartyDisplay = function(v234, v235) --[[ Line: 1093 ]] --[[ Name: UpdatePartyDisplay ]]
        -- upvalues: l_Players_0 (copy), v27 (copy)
        local l_PartyContainer_0 = v234.bottom.Lobby.Play.PartyContainer;
        local function v239() --[[ Line: 1097 ]] --[[ Name: GetFirstUnoccupiedFrame ]]
            -- upvalues: l_PartyContainer_0 (copy)
            for _, v238 in l_PartyContainer_0:GetChildren() do
                if v238:IsA("Frame") and not v238:GetAttribute("Occupied") then
                    return v238;
                end;
            end;
            return nil;
        end;
        for _, v241 in l_PartyContainer_0:GetChildren() do
            if v241:IsA("Frame") or v241.Name == "Leader" then
                v241.Icon.Image = "rbxassetid://116414343733416";
                v241.Icon.Size = UDim2.fromScale(0.7, 0.7);
                v241:SetAttribute("Occupied", false);
                v241.Visible = false;
            elseif v241:IsA("TextButton") then
                v241.Visible = true;
            end;
        end;
        if v235 then
            local l_PartyLeader_0 = v235.PartyLeader;
            local v243 = 0;
            for v244, _ in v235.Players do
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(v244)));
                v243 = v243 + 1;
                if l_l_Players_0_PlayerByUserId_0 then
                    local v247 = if v244 == l_PartyLeader_0 then l_PartyContainer_0.Leader else v239();
                    if v247 then
                        v247.Icon.Image = string.format(v27.PLAYER_IMAGE_URL, l_l_Players_0_PlayerByUserId_0.UserId);
                        v247.Icon.Size = UDim2.fromScale(1, 1);
                        v247:SetAttribute("Occupied", true);
                        v247.Visible = true;
                    end;
                end;
            end;
            if v243 == 4 then
                l_PartyContainer_0.Party.Visible = false;
            end;
        end;
    end, 
    _connectPartyDisplay = function(v248) --[[ Line: 1144 ]] --[[ Name: _connectPartyDisplay ]]
        -- upvalues: v29 (copy)
        if not v29:IsLobby() then
            return;
        else
            local l_PartyContainer_1 = v248.bottom.Lobby.Play.PartyContainer;
            v248:UpdatePartyDisplay();
            v248:_connectMenuButton(l_PartyContainer_1.Party, {});
            v248:_connectMenuButton(l_PartyContainer_1.Leader, {});
            return;
        end;
    end, 
    _connectUnits = function(v250) --[[ Line: 1155 ]] --[[ Name: _connectUnits ]]
        -- upvalues: v29 (copy), v39 (ref), v50 (ref), v57 (ref), v22 (copy), v41 (ref), v19 (copy), v44 (ref), v27 (copy)
        local v251 = v29:IsHUB();
        local v252 = nil;
        local v253 = nil;
        local function _(v254) --[[ Line: 1160 ]] --[[ Name: lobbyCallback ]]
            -- upvalues: v250 (copy), v253 (ref), v39 (ref)
            if not v250._equippedUnits[v254] then
                return;
            else
                if not v253 then
                    v253 = v39:GetModuleAsync("Units"):expect();
                end;
                v253:OpenWithSelectedUnit(v254);
                return;
            end;
        end;
        local function v258(v256) --[[ Line: 1175 ]] --[[ Name: gameCallback ]]
            -- upvalues: v250 (copy), v50 (ref), v57 (ref), v22 (ref), v41 (ref)
            if v250:_getMaxLoadoutSlot() < v256 then
                return;
            elseif v50.LockedLoadoutSlot:Get() == v256 then
                v57:Notify({
                    message = "Slot locked from a Card!", 
                    isPositive = false, 
                    duration = 3
                });
                return;
            else
                local v257 = v250._equippedUnits[v256];
                if not v257 or v257 == "" then
                    return;
                else
                    v257 = v22:ParseLoadout(v257);
                    v41:StartTowerPlacement(v257, v256);
                    return;
                end;
            end;
        end;
        for v259, v260 in v250._unitButtons do
            v250._loadoutVisuals[v260] = {};
            v39:HandleButton(v260, function() --[[ Line: 1206 ]]
                -- upvalues: v251 (copy), v259 (copy), v250 (copy), v253 (ref), v39 (ref), v258 (copy)
                if v251 then
                    local l_v259_0 = v259;
                    if not v250._equippedUnits[l_v259_0] then
                        return;
                    else
                        if not v253 then
                            v253 = v39:GetModuleAsync("Units"):expect();
                        end;
                        v253:OpenWithSelectedUnit(l_v259_0);
                        return;
                    end;
                else
                    v258(v259);
                    return;
                end;
            end, {
                MouseEnter = function() --[[ Line: 1213 ]]
                    -- upvalues: v39 (ref), v50 (ref), v259 (copy), v250 (copy), v22 (ref), v19 (ref), v260 (copy), v252 (ref)
                    if v39:GetToggleState("Units") then
                        return;
                    elseif v50.LockedLoadoutSlot:Get() == v259 then
                        return;
                    else
                        local v262 = v250._equippedUnits[v259];
                        if not v262 or v262 == "" then
                            return;
                        else
                            local v263, v264 = v22:ParseLoadout(v262);
                            local v265 = v250._myUnits[v263][v264];
                            local l_v22_UnitValue_0 = v22:GetUnitValue(v263, "Type");
                            v250.tooltip.Inner.Title.Text = v22:GetUnitValue(v263, "FullName");
                            v250.tooltip.Inner.Damage.Visible = l_v22_UnitValue_0 ~= "Resource";
                            v250.tooltip.Inner.RNG.Visible = l_v22_UnitValue_0 ~= "Resource";
                            v250.tooltip.Inner.SPA.Visible = l_v22_UnitValue_0 ~= "Resource";
                            v250.tooltip.Inner.GOLD.Visible = l_v22_UnitValue_0 == "Resource";
                            v250.tooltip.Inner.Type.StatLabel.Text = l_v22_UnitValue_0;
                            v250.tooltip.Inner.Type.StatIcon.Image = v19:GetAttackTypeIcon(l_v22_UnitValue_0);
                            local l_v22_PrimaryEffect_0 = v22:GetPrimaryEffect(v263);
                            v250.tooltip.Inner.Effect.Visible = l_v22_PrimaryEffect_0 ~= nil;
                            if l_v22_PrimaryEffect_0 then
                                v250.tooltip.Inner.Effect.StatLabel.Text = l_v22_PrimaryEffect_0;
                                v250.tooltip.Inner.Effect.StatIcon.Image = v19:GetEffectIcon(l_v22_PrimaryEffect_0);
                                local l_v19_EffectColor_0 = v19:GetEffectColor(l_v22_PrimaryEffect_0);
                                v250.tooltip.Inner.Effect.StatLabel.UIGradient.Color = l_v19_EffectColor_0;
                                v250.tooltip.Inner.Effect.StatIcon.UIGradient.Color = l_v19_EffectColor_0;
                            end;
                            if l_v22_UnitValue_0 == "Resource" then
                                v250.tooltip.Inner.GOLD.Amount.Text = v19:FormatDecimal(v22:GetGold(v265) or 0);
                            else
                                v250.tooltip.Inner.Damage.Amount.Text = v19:FormatDecimal(v22:GetTotalDamage(v265));
                                v250.tooltip.Inner.RNG.Amount.Text = v19:FormatDecimal(v22:GetRange(v265));
                                v250.tooltip.Inner.SPA.Amount.Text = v19:FormatDecimal(v22:GetAttackCooldown(v265));
                            end;
                            v250.tooltip.Visible = true;
                            v250.tooltip.Parent = v260;
                            v252 = v260;
                            return;
                        end;
                    end;
                end, 
                MouseLeave = function() --[[ Line: 1266 ]]
                    -- upvalues: v252 (ref), v260 (copy), v250 (copy)
                    if v252 ~= v260 then
                        return;
                    else
                        v250.tooltip.Visible = false;
                        return;
                    end;
                end
            });
            v260.SwapUnit.Visible = false;
            v39:HandleButton(v260.SwapUnit, function() --[[ Line: 1277 ]]
                -- upvalues: v250 (copy), v44 (ref), v259 (copy), v39 (ref)
                if not v250._selectedUnitData or not v250._canSwapUnits then
                    return;
                else
                    v44:EquipUnit(v250._selectedUnitData.Name, v250._selectedUnitData.UID, v259);
                    v250:ToggleUnitReplacement(false);
                    v39:Toggle("Units", true);
                    return;
                end;
            end);
            local l_UIGradient_3 = v260.Content.TowerInfo.Backdrop:FindFirstChildOfClass("UIGradient");
            if l_UIGradient_3 then
                l_UIGradient_3:Destroy();
                l_UIGradient_3 = nil;
            end;
            v260.Content.TowerInfo.Cost.Visible = v29:GetDestination() ~= "KarateLobby";
            v260.Content.LockedState.LevelRequired.Text = string.format("Lvl %d", v27.LOADOUT_LEVELS[v259] or 1);
        end;
    end, 
    _connectPets = function(v270) --[[ Line: 1301 ]] --[[ Name: _connectPets ]]
        -- upvalues: v29 (copy), v39 (ref), v52 (ref)
        local _ = v29:IsHUB();
        for v272, v273 in v270._petButtons do
            v270._loadoutVisuals[v273] = {};
            v39:HandleButton(v273, nil, {});
            v273.SwapUnit.Visible = false;
            v39:HandleButton(v273.SwapUnit, function() --[[ Line: 1376 ]]
                -- upvalues: v270 (copy), v52 (ref), v272 (copy), v39 (ref)
                if not v270._selectedPetData or not v270._canSwapPets then
                    return;
                else
                    v52:EquipPet(v270._selectedPetData.Name, v270._selectedPetData.UID, v272);
                    v270:TogglePetReplacement(false);
                    v39:Toggle("Units", true);
                    return;
                end;
            end);
            local l_UIGradient_4 = v273.Content.TowerInfo.Backdrop:FindFirstChildOfClass("UIGradient");
            if l_UIGradient_4 then
                l_UIGradient_4:Destroy();
                l_UIGradient_4 = nil;
            end;
        end;
    end, 
    _updateCurrency = function(_, v276, v277) --[[ Line: 1398 ]] --[[ Name: _updateCurrency ]]
        -- upvalues: v19 (copy)
        v276.Title.Text = v19:CommaNumber(v277 or 0) or "[FAILED TO LOAD!]";
    end, 
    _updateXPBar = function(v278, v279) --[[ Line: 1402 ]] --[[ Name: _updateXPBar ]]
        -- upvalues: v19 (copy), v27 (copy)
        if v278._isKarateMode == true then
            v278.xpFrame.Prestige.Visible = false;
            return;
        else
            local v280 = v279.Experience or 0;
            local v281 = v279.Level or 1;
            local v282 = v279.Prestige or 0;
            v278._currentLevel = v281;
            local v283 = v19:GetLevelCost(v281 + 1, v282) or 0;
            local v284 = #v27.PLAYER_XP_REQUIREMENTS <= v281;
            if v27.PRESTIGE.MAX_PRESTIGE <= v282 then
                v284 = false;
            end;
            local v285 = v284 and 1 or math.clamp(v280 / v283, 0, 1);
            v278.xpFrame.Prestige.Image = v19:GetPrestigeIcon(v282, v281) or "";
            v278.xpFrame.Prestige.Visible = v282 >= 1;
            v278.xpFillbar.Size = UDim2.new(v285, 0, 1, 0);
            v278.progressionLabel.Text = if v284 then string.format("Level %d (MAX)", v281) else string.format("Level %d (%d/%d)", v281, v280, v283);
            return;
        end;
    end, 
    _updateUnits = function(v286) --[[ Line: 1433 ]] --[[ Name: _updateUnits ]]
        -- upvalues: v22 (copy), v50 (ref), v17 (copy), v19 (copy), v26 (copy), v21 (copy), v29 (copy), v42 (ref), v36 (copy), v8 (copy)
        local v287 = v286:_getMaxLoadoutSlot();
        for v288, v289 in v286._unitButtons do
            local v290 = v288 <= v287;
            local v291 = v286._equippedUnits[v288] or "";
            local v292, v293 = v22:ParseLoadout(v291);
            v289.Content.TowerInfo.Visible = v290;
            local v294 = v50.LockedLoadoutSlot:Get() == v288;
            v289.Content.LockedState.Visible = v294 or not v290;
            v289.Content.LockedState.LevelRequired.Visible = not v294;
            if v290 then
                local v295 = v294 or v291 == "" or v292 == "";
                local l_v289_Attribute_0 = v289:GetAttribute("LastUnit");
                local v297 = l_v289_Attribute_0 ~= v291;
                if l_v289_Attribute_0 ~= nil and (v295 or v297) then
                    if v286._viewportHandlers[v289] then
                        v286._viewportHandlers[v289]:Destroy();
                        v286._viewportHandlers[v289] = nil;
                    end;
                    if v286._loadoutVisuals[v289] then
                        for _, v299 in v286._loadoutVisuals[v289] do
                            v299:Destroy();
                        end;
                        table.clear(v286._loadoutVisuals[v289]);
                    end;
                end;
                if v295 then
                    v289.Content.TowerInfo.Icon.Image = "";
                    v289.Content.TowerInfo.Cost.Visible = false;
                    if v289.Content.TowerInfo:FindFirstChild("DMG") then
                        v289.Content.TowerInfo.DMG.Visible = false;
                    end;
                    v289.Content.TowerInfo.Level.Text = "";
                    v289:SetAttribute("LastUnit", "");
                    v286:_updateTrait(v289);
                    v286:_updateShinyWumbo(v289);
                    v286:_updateStars(v289);
                    v289.Content.Relic.Visible = false;
                else
                    local v300 = v286._myUnits[v292] and v286._myUnits[v292][v293];
                    if not v300 then
                        v17:Warn("Missing unit data for ", v292, v293);
                    else
                        v289:SetAttribute("LastUnit", v291);
                        v286:_updateTrait(v289, v300.Trait);
                        v286:_updateTrait(v289, v300.Trait2, true);
                        v286:_updateShinyWumbo(v289, v300);
                        v286:_updateStars(v289, v300.Stars);
                        v289.Content.Relic.Visible = v300.Relic ~= nil;
                        if v300.Relic then
                            v19:CreateRelicIcon(v289.Content.Relic, v300.Relic);
                        end;
                        v289.Content.TowerInfo.Level.Text = ("LVL <font color = \"#FFFF00\">%*</font>"):format(v300.Level or 1);
                        if v297 then
                            local _, v302 = v22:GetRarity(v292);
                            table.insert(v286._loadoutVisuals[v289], v26.new(v289.Content.TowerInfo.Backdrop, v302));
                            table.insert(v286._loadoutVisuals[v289], v26.new(v289.Content.Glow, v302));
                            v289.Content.TowerInfo.Cost.Visible = v286.gamemode ~= "BossBattle";
                            v289.Content.TowerInfo.Cost.Amount.Text = v22:GetUnitValue(v292, "Cost");
                            v286._viewportHandlers[v289] = v21.new(v289.Content.TowerInfo, v292);
                            if v29:IsKarateLobby() then
                                v289.Content.TowerInfo.DMG.Amount.Text = v19:SuffixNumber(v22:GetTotalDamage(v300, 0), true);
                                v289.Content.TowerInfo.DMG.Visible = true;
                            end;
                            v42.LevelInfo:Observe(function(v303) --[[ Line: 1535 ]]
                                -- upvalues: v29 (ref), v289 (copy)
                                if v29:IsKarateLobby() then
                                    v289.Content.TowerInfo.Cost.Visible = false;
                                    return;
                                elseif v303 and v303.Mode == "BossBattle" then
                                    v289.Content.TowerInfo.Cost.Visible = false;
                                    return;
                                else
                                    v289.Content.TowerInfo.Cost.Visible = true;
                                    return;
                                end;
                            end);
                        end;
                    end;
                end;
            end;
        end;
        if v29:IsKarateLobby() then
            local v304 = v36.GetHitDamage(v8.Player);
            v286.gameCurrencyBar.KaratePower.Title.Text = v19:SuffixNumber(v304, true);
        end;
    end, 
    _updatePets = function(v305) --[[ Line: 1555 ]] --[[ Name: _updatePets ]]
        -- upvalues: v40 (ref), v8 (copy), v22 (copy), v17 (copy), v23 (copy), v26 (copy), v21 (copy)
        local v306 = v40:Get(v8.Player, "MaxPetSlots"):expect();
        for v307, v308 in v305._petButtons do
            local v309 = v307 <= v306;
            local v310 = v305._equippedPets[v307] or "";
            local v311, v312 = v22:ParseLoadout(v310);
            v308.Content.TowerInfo.Visible = v309;
            v308.Content.LockedState.Visible = not v309;
            if v309 then
                local v313 = true;
                if v310 ~= "" then
                    v313 = v311 == "";
                end;
                local l_v308_Attribute_0 = v308:GetAttribute("LastUnit");
                local v315 = l_v308_Attribute_0 ~= v310;
                if l_v308_Attribute_0 ~= nil and (v313 or v315) then
                    if v305._viewportHandlers[v308] then
                        v305._viewportHandlers[v308]:Destroy();
                        v305._viewportHandlers[v308] = nil;
                    end;
                    if v305._loadoutVisuals[v308] then
                        for _, v317 in v305._loadoutVisuals[v308] do
                            v317:Destroy();
                        end;
                        table.clear(v305._loadoutVisuals[v308]);
                    end;
                end;
                if v313 then
                    v308.Content.TowerInfo.Icon.Image = "";
                    v308.Content.TowerInfo.Level.Text = "";
                    v308:SetAttribute("LastUnit", "");
                    v305:_updateShinyWumbo(v308);
                    v305:_updateStars(v308);
                else
                    local v318 = v305._myPets[v311] and v305._myPets[v311][v312];
                    if not v318 then
                        v17:Warn("Missing pet data for ", v311, v312);
                    else
                        v308:SetAttribute("LastUnit", v310);
                        v305:_updateShinyWumbo(v308, v318);
                        v305:_updateStars(v308, v318.Stars);
                        v308.Content.TowerInfo.Level.Text = ("LVL <font color = \"#FFFF00\">%*</font>"):format(v318.Level or 1);
                        if v315 then
                            local _, v320 = v23:GetRarity(v311);
                            table.insert(v305._loadoutVisuals[v308], v26.new(v308.Content.TowerInfo.Backdrop, v320));
                            table.insert(v305._loadoutVisuals[v308], v26.new(v308.Content.Glow, v320));
                            v305._viewportHandlers[v308] = v21.new(v308.Content.TowerInfo, v311, {
                                isPet = true
                            });
                        end;
                    end;
                end;
            end;
        end;
    end, 
    _updateTrait = function(v321, v322, v323, v324) --[[ Line: 1625 ]] --[[ Name: _updateTrait ]]
        -- upvalues: v25 (copy)
        if not v323 then
            if not v324 then
                v321:_clearTrait(v322, true);
                return;
            else
                v321:_clearTrait(v322, false, true);
                return;
            end;
        else
            if v324 then
                v321:_clearTrait(v322, false, true);
            else
                v321:_clearTrait(v322);
            end;
            local l_Trait_0 = v322.Content.Traits.Trait;
            if v324 then
                l_Trait_0 = v322.Content.Traits.Trait2;
            end;
            v25:CreateTraitIcon(v323.Name, l_Trait_0);
            v322.Content.Traits.Visible = true;
            l_Trait_0.Visible = true;
            return;
        end;
    end, 
    _updateShinyWumbo = function(_, v327, v328) --[[ Line: 1653 ]] --[[ Name: _updateShinyWumbo ]]
        v327.Content.TowerInfo.Shiny.Visible = v328 and v328.Shiny or false;
        v327.Content.TowerInfo.Wumbo.Visible = v328 and v328.Mega or false;
    end, 
    _updateStars = function(_, v330, v331) --[[ Line: 1658 ]] --[[ Name: _updateStars ]]
        local l_Stars_0 = v330.Content.TowerInfo.Stars;
        local l_Amount_0 = l_Stars_0.Main.Amount;
        l_Stars_0.Visible = v331 and v331 > 0;
        if not v331 then
            return;
        else
            l_Amount_0.Text = v331;
            l_Stars_0[tostring(2)].Visible = v331 >= 2;
            l_Stars_0[tostring(3)].Visible = v331 >= 3;
            l_Stars_0[tostring(4)].Visible = v331 >= 4;
            l_Stars_0[tostring(5)].Visible = v331 >= 5;
            return;
        end;
    end, 
    _clearTrait = function(_, v335, v336, v337) --[[ Line: 1677 ]] --[[ Name: _clearTrait ]]
        local l_Traits_0 = v335.Content.Traits;
        local l_ImageLabel_0 = l_Traits_0.Trait:FindFirstChildOfClass("ImageLabel");
        local l_ImageLabel_1 = l_Traits_0.Trait2:FindFirstChildOfClass("ImageLabel");
        if v337 then
            if l_ImageLabel_1 then
                l_ImageLabel_1:Destroy();
                l_ImageLabel_1 = nil;
            end;
            l_Traits_0.Trait2.Visible = false;
            return;
        else
            if l_ImageLabel_0 then
                l_ImageLabel_0:Destroy();
                l_ImageLabel_0 = nil;
            end;
            if v336 then
                if l_ImageLabel_1 then
                    l_ImageLabel_1:Destroy();
                    l_ImageLabel_1 = nil;
                end;
                l_Traits_0.Visible = false;
            end;
            return;
        end;
    end, 
    _getUnitButtonFromId = function(v341, v342) --[[ Line: 1709 ]] --[[ Name: _getUnitButtonFromId ]]
        for v343, v344 in v341._equippedUnits do
            if v344 == v342 then
                return v341._unitButtons[v343];
            end;
        end;
    end, 
    _updateInGameCurrency = function(v345, v346) --[[ Line: 1719 ]] --[[ Name: _updateInGameCurrency ]]
        -- upvalues: v19 (copy)
        v345.gameCurrencyFrame.Title.Text = v19:CommaNumber(v346 or 0);
    end, 
    _changeHUDSelection = function(v347, v348) --[[ Line: 1725 ]] --[[ Name: _changeHUDSelection ]]
        -- upvalues: v41 (ref), v29 (copy), l_GuiService_0 (copy)
        if v41:IsBuildModeActive() then
            return;
        elseif not v347._unitsBarActive then
            return;
        else
            local v349 = #v347._unitButtons;
            if v29:GetDestination() == "Game" then
                v349 = v347:_getMaxLoadoutSlot();
            end;
            local v350 = 1;
            if v348 == Enum.KeyCode.ButtonL1 then
                v350 = -1;
            end;
            if not v347._currentHUDIndex then
                v347._currentHUDIndex = 0;
            end;
            v347._currentHUDIndex = v347._currentHUDIndex + v350;
            if v349 < v347._currentHUDIndex then
                v347._currentHUDIndex = 1;
            elseif v347._currentHUDIndex < 1 then
                v347._currentHUDIndex = v349;
            end;
            l_GuiService_0.SelectedObject = v347._unitButtons[v347._currentHUDIndex];
            return;
        end;
    end, 
    _getMaxLoadoutSlot = function(v351) --[[ Line: 1762 ]] --[[ Name: _getMaxLoadoutSlot ]]
        -- upvalues: v19 (copy)
        if v351._isPresetLoadout then
            return 6;
        else
            return (v19:GetMaxLoadoutSlot(v351._playerStats));
        end;
    end, 
    _setupPlayButton = function(v352) --[[ Line: 1766 ]] --[[ Name: _setupPlayButton ]]
        -- upvalues: v29 (copy), v39 (ref)
        if not v29:IsLobby() then
            v352.playButton:Destroy();
            v352.playButton = nil;
            return;
        else
            v352.playButton.Visible = true;
            v352._hudButtons.Play = v352.playButton;
            v39:HandleButton(v352.playButton, function() --[[ Line: 1775 ]]
                -- upvalues: v39 (ref), v352 (copy)
                v39:Toggle("PlayScreen", true);
                v352:ToggleNotifier("Play", false);
            end);
            return;
        end;
    end, 
    _setupTradeButton = function(v353) --[[ Line: 1781 ]] --[[ Name: _setupTradeButton ]]
        -- upvalues: v29 (copy), v39 (ref)
        if not v29:IsTrading() then
            v353.tradeButton:Destroy();
            v353.tradeButton = nil;
            return;
        else
            v353.tradeButton.Visible = true;
            v353._hudButtons.Trade = v353.tradeButton;
            v39:HandleButton(v353.tradeButton, function() --[[ Line: 1790 ]]
                -- upvalues: v39 (ref), v353 (copy)
                v39:Toggle("TradeRequest", true);
                v353:ToggleNotifier("Trade", false);
            end);
            return;
        end;
    end, 
    _setupKampKoralEvent = function(v354) --[[ Line: 1797 ]] --[[ Name: _setupKampKoralEvent ]]
        -- upvalues: v27 (copy), v30 (copy), v9 (copy), v40 (ref), v8 (copy), v31 (copy), v19 (copy)
        local l_KAMP_KORAL_END_0 = v27.KAMP_KORAL_END;
        local l_workspace_ServerTimeNow_3 = workspace:GetServerTimeNow();
        local l_KampKoral_0 = v354.rightSide.Content.KampKoral;
        l_KampKoral_0.Visible = false;
        local l_KampKoral_1 = v354.currencyBar.KampKoral;
        l_KampKoral_1.Icon.Image = v30.Currency.KampKredit;
        l_KampKoral_1.Visible = false;
        local v359 = v9.new();
        local function _() --[[ Line: 1811 ]] --[[ Name: cleanupEvent ]]
            -- upvalues: v359 (ref), l_KampKoral_0 (copy), l_KampKoral_1 (copy)
            v359:Destroy();
            v359 = nil;
            l_KampKoral_0.Visible = false;
            l_KampKoral_1.Visible = false;
        end;
        if l_KAMP_KORAL_END_0 <= l_workspace_ServerTimeNow_3 then
            v359:Destroy();
            v359 = nil;
            l_KampKoral_0.Visible = false;
            l_KampKoral_1.Visible = false;
            return;
        else
            local l_v40_0 = v40;
            local l_Player_0 = v8.Player;
            v359:Add(l_v40_0:OnChanged(l_Player_0, "Currency.KampKredit", function(v363) --[[ Line: 1824 ]]
                -- upvalues: v354 (copy), l_KampKoral_1 (copy)
                v354:_updateCurrency(l_KampKoral_1, v363);
            end, true));
            local v364 = math.clamp(l_KAMP_KORAL_END_0 - l_workspace_ServerTimeNow_3, 0, 1e999);
            local l_Simple_0 = v31.Simple;
            v359:Add(l_Simple_0(1, function() --[[ Line: 1830 ]]
                -- upvalues: v364 (ref), v359 (ref), l_KampKoral_0 (copy), l_KampKoral_1 (copy), v19 (ref)
                v364 = v364 - 1;
                if v364 < 1 then
                    v359:Destroy();
                    v359 = nil;
                    l_KampKoral_0.Visible = false;
                    l_KampKoral_1.Visible = false;
                    return;
                else
                    l_KampKoral_0.Content.Timer.Text = v19:FormatTimeFromSeconds(v364, true);
                    l_KampKoral_0.Visible = true;
                    l_KampKoral_1.Visible = true;
                    return;
                end;
            end));
            return;
        end;
    end, 
    _ConnectLevelBar = function(v366) --[[ Line: 1845 ]] --[[ Name: _ConnectLevelBar ]]
        -- upvalues: v40 (ref), v8 (copy), v35 (copy), v34 (copy)
        v40:OnChanged(v8.Player, "TowerOfKarate.Progression", function(v367) --[[ Line: 1846 ]]
            -- upvalues: v366 (copy), v35 (ref), v34 (ref)
            v366._progressionData = v367;
            local v368 = v366._progressionData.Level or 1;
            local v369 = v366._progressionData.Belts or 0;
            local v370 = math.min(v368 + 1, #v35.BeltRanks);
            local v371 = v34.GetRankData(v368);
            local v372 = v34.GetRankData(v370);
            local v373 = math.clamp(v369 / v372.BeltCost, 0, 1);
            if v370 <= v368 then
                v373 = 1;
                v366.xpFrame.Progression.Text = ("%*"):format(v371.Name);
            else
                v366.xpFrame.Progression.Text = ("%* (%*/%*)"):format(v371.Name, v369, v372.BeltCost);
            end;
            v366.xpFrame.Fill.Size = UDim2.fromScale(v373, 1);
            v366.xpFrame.Belt.ImageColor3 = v34.GetBeltColor(v368);
        end, true);
    end
};