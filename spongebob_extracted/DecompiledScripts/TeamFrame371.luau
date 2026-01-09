local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = {};
v11.__index = v11;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
v11.new = function(v19, v20, v21, v22) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v11 (copy), v3 (copy), v14 (ref), v1 (copy), v13 (ref), v12 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (ref)
    local v23 = setmetatable({
        dumpster = v2.new(), 
        _viewportHandlers = {}, 
        _loadoutVisuals = {}, 
        _toolTipHandlers = {}, 
        teamIndex = v21, 
        teamManager = v22
    }, v11);
    v23.UnitUpdated = v23.dumpster:Construct(v3);
    v23._gui = v19;
    v23._loadout = v23._gui.Loadout;
    v23._top = v23._gui.Top;
    v23._loadoutHotbar = v23._loadout.Hotbar;
    v23._loadoutOptions = v23._loadout.Options;
    v23._gui.LayoutOrder = v21;
    v23._gui.Visible = true;
    v23._gui.Parent = v20;
    v14 = v1.GetController("UIController");
    v13 = v14:GetModuleAsync("HUD"):expect();
    v12 = v14:GetModuleAsync("Units"):expect();
    v15 = v1.GetService("UnitService");
    v16 = v1.GetController("DataController");
    v17 = v1.GetController("PetController");
    v18 = v14:GetModuleAsync("MessagePrompt"):expect();
    v23:_listenToUnits();
    v23:_handleButtons();
    v23:_handleRenaming();
    return v23;
end;
v11.UpdateUnits = function(v24, v25, v26, v27) --[[ Line: 84 ]] --[[ Name: UpdateUnits ]]
    -- upvalues: v4 (copy), v8 (copy), v14 (ref), v12 (ref), v13 (ref), v5 (copy), v6 (copy), v7 (copy), v9 (copy), v17 (ref)
    local l_v4_MaxLoadoutSlot_0 = v4:GetMaxLoadoutSlot(v27);
    v24._top.TeamName.TextBox.Text = v25.TeamName;
    v24._top.TeamName.TextBox.PlaceholderText = v25.TeamName;
    local v29 = 0;
    local v30 = 0;
    local v31 = 0;
    for v32, v33 in v25.Loadout do
        if not v24._loadoutHotbar[v32] then
            warn("No unit frame found for index: " .. tostring(v32));
        else
            local v34 = v24._loadoutHotbar[v32];
            local v35 = v32 <= l_v4_MaxLoadoutSlot_0;
            v34.Content.Plus.Visible = false;
            v34.Content.TowerInfo.Visible = v35;
            v34.Content.LockedState.Visible = not v35;
            v34.Content.LockedState.LevelRequired.Text = ("Lvl %*"):format(v8.LOADOUT_LEVELS[v32]);
            if v35 then
                if not v34:GetAttribute("BeingHandled") then
                    v34:SetAttribute("BeingHandled", true);
                    v14:HandleButton(v34, function() --[[ Line: 117 ]]
                        -- upvalues: v24 (copy), v12 (ref), v25 (copy)
                        v24.teamManager:SetCurrentTeamSelectionIndex(v24.teamIndex);
                        v12:OpenWithState("TeamSelection", {
                            teamIndex = v24.teamIndex, 
                            teamData = v25
                        });
                    end);
                end;
                if v34:GetAttribute("LastUnit") ~= v33 then
                    v24:_clearButton(v34);
                    v13:_updateTrait(v34, nil);
                    v13:_updateTrait(v34, nil, true);
                    v13:_updateShinyWumbo(v34, nil);
                    v13:_updateStars(v34, nil);
                    v34.Content.TowerInfo.Cost.Visible = false;
                    v34.Content.TowerInfo.Cost.Amount.Text = "";
                    v34.Content.TowerInfo.Level.Visible = false;
                    v34.Content.Relic.Visible = false;
                end;
                local v36, v37 = v5:ParseLoadout(v33);
                local v38 = nil;
                v34:SetAttribute("LastUnit");
                if v26[v36] then
                    for v39, v40 in v26[v36] do
                        if v39 == v37 then
                            v38 = v40;
                            break;
                        end;
                    end;
                end;
                if not v38 then
                    v34.Content.Plus.Visible = true;
                else
                    v34:SetAttribute("LastUnit", v33);
                    v13:_updateTrait(v34, v38.Trait);
                    v13:_updateTrait(v34, v38.Trait2, true);
                    v13:_updateShinyWumbo(v34, v38);
                    v13:_updateStars(v34, v38.Stars);
                    v34.Content.Relic.Visible = v38.Relic ~= nil;
                    if v38.Relic then
                        v4:CreateRelicIcon(v34.Content.Relic, v38.Relic);
                    end;
                    if not v24._loadoutVisuals[v34] then
                        v24._loadoutVisuals[v34] = {};
                    end;
                    if not v24._toolTipHandlers[v34] then
                        local _, v42 = v5:GetRarity(v36);
                        table.insert(v24._loadoutVisuals[v34], v6.new(v34.Content.TowerInfo.Backdrop, v42));
                        table.insert(v24._loadoutVisuals[v34], v6.new(v34.Content.Glow, v42));
                        v24._viewportHandlers[v34] = v7.new(v34.Content.TowerInfo, v36);
                        v24._toolTipHandlers[v34] = v9.new(v34, {
                            Name = v36, 
                            IsUnit = true, 
                            IsSecretUnit = function() --[[ Line: 189 ]] --[[ Name: IsSecretUnit ]]
                                return false;
                            end, 
                            HideName = false, 
                            UnitData = v24.units[v36] and v24.units[v36][v37]
                        });
                        if v24._toolTipHandlers[v34] then
                            v24._toolTipHandlers[v34].dumpster:Add(v24.UnitUpdated:Connect(function(v43, v44, v45) --[[ Line: 198 ]]
                                -- upvalues: v36 (copy), v37 (copy), v24 (copy), v34 (copy)
                                if v43 == v36 and v44 == v37 then
                                    v24._toolTipHandlers[v34].props.UnitData = v45;
                                end;
                            end));
                        end;
                    end;
                    v34.Content.TowerInfo.Cost.Visible = true;
                    v34.Content.TowerInfo.Cost.Amount.Text = v5:GetUnitValue(v36, "Cost");
                    v34.Content.TowerInfo.Level.Text = ("LVL <font color = \"#FFFF00\">%*</font>"):format(v38.Level or 1);
                    v34.Content.TowerInfo.Level.Visible = true;
                    local v46 = v5:GetMaxUnits(v36, v38, v17:GetEquippedPets()) or 1;
                    v30 = v30 + (v5:GetUnitValue(v36, "Cost") * v46 or 0);
                    if v5:GetUpgrades(v36) then
                        for _, v48 in v5:GetUpgrades(v36) do
                            if v48.Cost then
                                v31 = v31 + (v48.Cost * v46 or 0);
                            end;
                        end;
                        v29 = v29 + v5:CalculateDPSoffMax(v38, #v5:GetUpgrades(v36));
                    else
                        v29 = v29 + v5:CalculateDPSoffMax(v38);
                    end;
                end;
            end;
        end;
    end;
    v24._top.DPS.Stat.Amount.Text = ("%*/s"):format((v4:SuffixNumber(v29, false, 1)));
    v24._top.Cost.Stat.Amount.Text = ("%* / %*"):format(v4:CommaNumber((math.round(v30))), (v4:CommaNumber((math.round(v31)))));
end;
v11.Show = function(_) --[[ Line: 235 ]] --[[ Name: Show ]]

end;
v11.Hide = function(v50) --[[ Line: 239 ]] --[[ Name: Hide ]]
    for _, v52 in v50._loadoutHotbar:GetChildren() do
        if v52:IsA("ImageButton") or v52:IsA("TextButton") then
            v50:_clearButton(v52);
        end;
    end;
end;
v11.Destroy = function(v53) --[[ Line: 247 ]] --[[ Name: Destroy ]]
    if v53.dumpster then
        v53.dumpster:Destroy();
        v53.dumpster = nil;
    end;
end;
v11._clearButton = function(v54, v55) --[[ Line: 256 ]] --[[ Name: _clearButton ]]
    if v54._viewportHandlers[v55] then
        v54._viewportHandlers[v55]:Destroy();
        v54._viewportHandlers[v55] = nil;
    end;
    if v54._toolTipHandlers[v55] then
        v54._toolTipHandlers[v55]:Destroy();
        v54._toolTipHandlers[v55] = nil;
    end;
    if v54._loadoutVisuals[v55] then
        for _, v57 in v54._loadoutVisuals[v55] do
            v57:Destroy();
        end;
        table.clear(v54._loadoutVisuals[v55]);
    end;
end;
v11._handleButtons = function(v58) --[[ Line: 276 ]] --[[ Name: _handleButtons ]]
    -- upvalues: v14 (ref), v15 (ref), v18 (ref)
    v14:HandleButton(v58._loadoutOptions.Equip, function() --[[ Line: 277 ]]
        -- upvalues: v15 (ref), v58 (copy)
        v15:EquipTeam(v58.teamIndex);
    end);
    v14:HandleButton(v58._loadoutOptions.Clear, function() --[[ Line: 281 ]]
        -- upvalues: v18 (ref), v15 (ref), v58 (copy)
        v18:Prompt({
            message = "Are you sure you want to clear the units from this team?\n\n(This can not be reversed.)", 
            options = {
                {
                    text = "Yes", 
                    callback = function() --[[ Line: 287 ]] --[[ Name: callback ]]
                        -- upvalues: v15 (ref), v58 (ref)
                        v15:RemoveAllFromTeam(v58.teamIndex);
                    end
                }, 
                {
                    text = "No"
                }
            }
        });
    end);
    v14:HandleButton(v58._loadoutOptions.Overwrite, function() --[[ Line: 296 ]]
        -- upvalues: v18 (ref), v15 (ref), v58 (copy)
        v18:Prompt({
            message = "Are you sure you want to overwrite this team with the units in your current loadout?\n\n(This can not be reversed.)", 
            options = {
                {
                    text = "Yes", 
                    callback = function() --[[ Line: 302 ]] --[[ Name: callback ]]
                        -- upvalues: v15 (ref), v58 (ref)
                        v15:OverwriteTeamLoadout(v58.teamIndex);
                    end
                }, 
                {
                    text = "No"
                }
            }
        });
    end);
end;
v11._handleRenaming = function(v59) --[[ Line: 312 ]] --[[ Name: _handleRenaming ]]
    -- upvalues: v15 (ref)
    v59.dumpster:Add(v59._top.TeamName.TextBox.FocusLost:Connect(function(_) --[[ Line: 313 ]]
        -- upvalues: v59 (copy), v15 (ref)
        local l_Text_0 = v59._top.TeamName.TextBox.Text;
        if l_Text_0 == "" then
            return;
        else
            v15:RenameTeam(v59.teamIndex, l_Text_0);
            return;
        end;
    end));
end;
v11._listenToUnits = function(v62) --[[ Line: 324 ]] --[[ Name: _listenToUnits ]]
    -- upvalues: v16 (ref), v1 (copy), v15 (ref), v5 (copy)
    v62.units = v16:Get(v1.Player, "Units"):expect();
    v62.dumpster:Add(v15.UnitDataUpdated:Connect(function(v63, v64) --[[ Line: 327 ]]
        -- upvalues: v5 (ref), v62 (copy)
        local v65, v66 = v5:ParseLoadout(v63);
        if not v65 or not v66 then
            return;
        else
            if not v62.units[v65] then
                v62.units[v65] = {};
            end;
            v62.units[v65][v66] = v64;
            v62.UnitUpdated:Fire(v65, v66);
            return;
        end;
    end));
    v62.dumpster:Add(v15.UnitsAdded:Connect(function(v67) --[[ Line: 342 ]]
        -- upvalues: v5 (ref), v62 (copy)
        for v68, v69 in v67 do
            local v70, v71 = v5:ParseLoadout(v68);
            if v70 and v71 then
                if not v62.units[v70] then
                    v62.units[v70] = {};
                end;
                v62.units[v70][v71] = v69;
            end;
        end;
    end));
end;
return v11;