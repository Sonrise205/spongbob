local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = require(l_ReplicatedFirst_0.PlaceIds);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = {
    Minimized = 4, 
    Maximized = 6
};
return {
    primaryMenu = false, 
    _boostButtons = {}, 
    Init = function(v19, v20) --[[ Line: 48 ]] --[[ Name: Init ]]
        -- upvalues: v12 (ref), v3 (copy), v13 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (copy)
        v12 = v3.GetController("DataController");
        v13 = v3.GetService("BoostsService");
        v14 = v3.GetController("UIController");
        v15 = v3.GetService("StatsService");
        v16 = v3.GetService("FactionService");
        v17 = v3.GetService("GlobalEventService");
        v19.ui = v20;
        v19.main = v20.Main;
        v19.template = v19.main.Template;
        v19.template.Parent = nil;
        v19.expandButton = v19.main.ToggleExpand;
        v19.mode = "Minimized";
        v19.serverTemplate = v19.main.ServerTemplate;
        v19.serverTemplate.Parent = nil;
        v19.globalFactionButton = v19.main.Server_FactionPoints_Global;
        v19.globalFactionButton:SetAttribute("Active", false);
        v19.globalFactionButton.Visible = false;
        local function _(v21) --[[ Line: 71 ]] --[[ Name: toggleExpand ]]
            -- upvalues: v19 (copy), v18 (ref)
            if v19.mode == "Minimized" then
                v19.mode = "Maximized";
            else
                v19.mode = "Minimized";
            end;
            if v21 then
                v19.mode = v21;
            end;
            v19:_toggleExpandButton();
            v19.main.UIGridLayout.FillDirectionMaxCells = v18[v19.mode];
            v19.expandButton.Content.Title.Text = v19.mode == "Maximized" and "-" or "+";
        end;
        v14:HandleButton(v19.expandButton, function() --[[ Line: 88 ]]
            -- upvalues: v19 (copy), v18 (ref)
            if v19.mode == "Minimized" then
                v19.mode = "Maximized";
            else
                v19.mode = "Minimized";
            end;
            v19:_toggleExpandButton();
            v19.main.UIGridLayout.FillDirectionMaxCells = v18[v19.mode];
            v19.expandButton.Content.Title.Text = v19.mode == "Maximized" and "-" or "+";
        end);
        if v19.mode then
            local l_mode_0 = v19.mode;
            if v19.mode == "Minimized" then
                v19.mode = "Maximized";
            else
                v19.mode = "Minimized";
            end;
            if l_mode_0 then
                v19.mode = l_mode_0;
            end;
            v19:_toggleExpandButton();
            v19.main.UIGridLayout.FillDirectionMaxCells = v18[v19.mode];
            v19.expandButton.Content.Title.Text = v19.mode == "Maximized" and "-" or "+";
        end;
        v19:_toggleExpandButton();
    end, 
    Start = function(v24, _) --[[ Line: 100 ]] --[[ Name: Start ]]
        -- upvalues: v9 (copy), v14 (ref), v12 (ref), v3 (copy), v13 (ref), v17 (ref), l_AvatarEditorService_0 (copy), v7 (copy), v8 (copy), v16 (ref), v10 (copy), v11 (copy)
        if v9:GetDestination() == "AFK" then
            v14:Toggle(script.Name, false);
            return;
        else
            v24.factionData = v12:Get(v3.Player, "Faction"):expect();
            v12:OnChanged(v3.Player, "Faction", function(v26) --[[ Line: 109 ]]
                -- upvalues: v24 (copy)
                v24.factionData = v26;
            end);
            v13.BoostExpired:Connect(function(v27) --[[ Line: 113 ]] --[[ Name: handleBoostExpired ]]
                -- upvalues: v24 (copy)
                if v24._boostButtons[v27] then
                    v24._boostButtons[v27]:Destroy();
                    v24._boostButtons[v27] = nil;
                end;
            end);
            v17.PromptGameFavorite:Connect(function(v28) --[[ Line: 122 ]]
                -- upvalues: l_AvatarEditorService_0 (ref)
                l_AvatarEditorService_0:PromptSetFavorite(v28, Enum.AvatarItemType.Asset, true);
            end);
            local function v34() --[[ Line: 126 ]] --[[ Name: updateBoosts ]]
                -- upvalues: v24 (copy), v7 (ref), v8 (ref)
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                for v30, v31 in v24._activeBoosts do
                    local v32 = math.max(0, v31 - l_workspace_ServerTimeNow_0);
                    if v32 < 1 then
                        if v24._boostButtons[v30] then
                            v24._boostButtons[v30]:Destroy();
                            v24._boostButtons[v30] = nil;
                        end;
                    elseif not v24._boostButtons[v30] then
                        local v33 = v24.template:Clone();
                        v33.Name = v30;
                        v33.Content.Icon.Image = v7:GetByItemName(v30).icon or "";
                        v33.Content.Title.Text = v8:SecondsToClock(v32 or 0);
                        v33.Parent = v24.main;
                        v24._boostButtons[v30] = v33;
                    else
                        v24._boostButtons[v30].Content.Title.Text = v8:SecondsToClock(v32 or 0);
                    end;
                end;
                v24:_toggleExpandButton();
            end;
            v12:OnChanged(v3.Player, "Boosts", function(v35) --[[ Line: 156 ]]
                -- upvalues: v24 (copy)
                v24._activeBoosts = v35;
            end, true);
            local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
            local v37 = v13.ServerBoosts:OnReady():expect();
            local v38 = v13.BoostOverrides:OnReady():expect();
            local v39 = {};
            v13.ServerBoosts.Changed:Connect(function(v40) --[[ Line: 176 ]]
                -- upvalues: v37 (ref)
                v37 = v40;
                warn("Server boost timestamps updated", v40);
            end);
            v13.BoostOverrides.Changed:Connect(function(v41) --[[ Line: 181 ]]
                -- upvalues: v38 (ref), v39 (copy)
                v38 = v41;
                for v42, v43 in v39 do
                    v43.Content.Icon.Title.Text = ("%*x"):format(v38[v42] or 2);
                end;
                warn("Server boost overrides updated", v41);
            end);
            local v44 = v16.FactionsProgress:OnReady():expect();
            local v45 = v12:Get(v3.Player, "Faction"):expect();
            local function v47() --[[ Line: 194 ]] --[[ Name: updateGlobalFactionBoost ]]
                -- upvalues: v45 (ref), v44 (ref), v37 (ref), v24 (copy)
                if v45.Id == 0 then
                    return;
                elseif not v44 then
                    return;
                else
                    local v46 = v44[v45.Id];
                    if not v46 then
                        return;
                    elseif v46.boostTime then
                        v37.FactionPoints_Global = {
                            START = v46.boostTime, 
                            END = v46.boostTime
                        };
                        v24.globalFactionButton:SetAttribute("Active", true);
                        v24.globalFactionButton.Visible = true;
                        return;
                    else
                        v24.globalFactionButton:SetAttribute("Active", false);
                        v24.globalFactionButton.Visible = false;
                        v37.FactionPoints_Global = nil;
                        return;
                    end;
                end;
            end;
            v12:OnChanged(v3.Player, "Faction", function(v48) --[[ Line: 219 ]]
                -- upvalues: v45 (ref), v47 (copy)
                local v49 = v45.Id ~= v48.Id;
                v45 = v48;
                if v49 then
                    v47();
                end;
            end);
            v16.FactionsProgress:Observe(function(v50) --[[ Line: 229 ]]
                -- upvalues: v44 (ref), v47 (copy)
                v44 = v50;
                v47();
            end);
            v10.Simple(0.5, function() --[[ Line: 234 ]]
                -- upvalues: v34 (copy), l_workspace_ServerTimeNow_1 (ref), v39 (copy), v37 (ref), v11 (ref), v24 (copy), v38 (ref), v8 (ref)
                v34();
                l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                for v51, v52 in v39 do
                    if not v37[v51] then
                        v52:Destroy();
                        v39[v51] = nil;
                    end;
                end;
                for v53, v54 in v37 do
                    local v55 = false;
                    if l_workspace_ServerTimeNow_1 >= v54.START then
                        v55 = l_workspace_ServerTimeNow_1 < v54.END;
                    end;
                    local v56 = v39[v53];
                    if not v55 then
                        if v56 then
                            v56:Destroy();
                            v39[v53] = nil;
                        end;
                    else
                        if not v56 then
                            local v57 = ("%*_60"):format((string.upper(v53)));
                            if v53 == "XP" then
                                v57 = "XP4_60";
                            end;
                            if v53 == "Luck" then
                                v57 = "LUCKx4_60";
                            end;
                            if v53 == "Gems" then
                                v57 = "GEMSx4_60";
                            end;
                            if v53 == "Coins" then
                                v57 = "COINSx4_60";
                            end;
                            local v58 = v11.Currency[v53] or v11.Inventory[v53];
                            if not v58 then
                                warn("No server icon found for boost: ", v53);
                                continue;
                            else
                                v56 = v24.serverTemplate:Clone();
                                v56.Name = "Server_" .. v53;
                                v56.Content.Icon.Image = v58;
                                v56:SetAttribute("Active", true);
                                v56.Parent = v24.main;
                                v39[v53] = v56;
                            end;
                        end;
                        local v59 = math.max(0, v54.END - l_workspace_ServerTimeNow_1);
                        v56.Content.Icon.Title.Text = ("%*x"):format(v38[v53] or 2);
                        v56.Content.Countdown.Text = v8:SecondsToClock(v59 or 0);
                    end;
                end;
                v24:_toggleExpandButton();
            end, true);
            return;
        end;
    end, 
    Closed = function(v60) --[[ Line: 304 ]] --[[ Name: Closed ]]
        if v60._tooltip then
            v60._tooltip:Destroy();
        end;
    end, 
    _toggleExpandButton = function(v61) --[[ Line: 310 ]] --[[ Name: _toggleExpandButton ]]
        local v62 = 0;
        for _, v64 in v61.main:GetChildren() do
            if v64:IsA("GuiButton") and v64.Visible then
                v62 = v62 + 1;
            end;
        end;
        v61.expandButton.Visible = v62 >= 4;
        v61:_updateShownButtons();
    end, 
    _updateShownButtons = function(v65) --[[ Line: 327 ]] --[[ Name: _updateShownButtons ]]
        -- upvalues: v5 (copy)
        local v67 = v5.Filter(v65.main:GetChildren(), function(v66) --[[ Line: 328 ]]
            -- upvalues: v65 (copy)
            return v66:IsA("GuiButton") and v66.Name ~= v65.expandButton.Name and not (string.find(v66.Name, "Server_") and not v66:GetAttribute("Active"));
        end);
        table.sort(v67, function(v68, v69) --[[ Line: 333 ]]
            return v68.LayoutOrder < v69.LayoutOrder;
        end);
        local v70 = 3;
        if v65.mode == "Maximized" then
            v70 = #v67;
        end;
        for v71 = 1, #v67 do
            v67[v71].Visible = v71 <= v70;
        end;
    end
};