local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Signal);
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Timer);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_UnavailableGameModes_0 = v3.UnavailableGameModes;
local l_LevelRequirements_0 = v3.LevelRequirements;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    ReachedGameModeLevel = v6.new(), 
    ViewChanged = v6.new()
};
local _ = function() --[[ Line: 49 ]] --[[ Name: hasLoadout ]]
    -- upvalues: v16 (ref)
    local v23 = v16:GetLoadout():expect();
    if not v23 then
        return false;
    else
        for _, v25 in v23 do
            if v25 ~= "" then
                return true;
            end;
        end;
        return false;
    end;
end;
v22.Init = function(v27, v28, v29) --[[ Line: 65 ]] --[[ Name: Init ]]
    -- upvalues: v13 (ref), v7 (copy), v14 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v21 (ref), v5 (copy)
    v13 = v7.GetService("MatchmakingService");
    v14 = v7.GetController("FastTravelController");
    v15 = v7.GetController("CharacterController");
    v16 = v7.GetController("UnitController");
    v17 = v7.GetController("DataController");
    v18 = v7.GetController("UIController");
    v19 = v7.GetController("PlaceTeleportController");
    v21 = v18:GetModuleAsync("HUD"):expect();
    v27.ui = v28;
    v27.mainModesContainer = v28.Main;
    v27.extraModesContainer = v28.Extra;
    v27.dumpster = v5.new();
    v27.currentMode = v29;
    v27._currentView = "Main";
end;
v22.Start = function(v30) --[[ Line: 84 ]] --[[ Name: Start ]]
    -- upvalues: v20 (ref), v18 (ref), v22 (copy), v21 (ref)
    if v30.currentMode ~= "Lobby" then
        return;
    else
        v20 = v18:GetModuleAsync("Notification"):expect();
        v30.dumpster:Add(v22.ViewChanged:Connect(function(v31) --[[ Line: 91 ]]
            -- upvalues: v30 (copy)
            v30.mainModesContainer.Visible = v31 == "Main";
            v30.extraModesContainer.Visible = v31 == "Extra";
        end));
        v30._unlockedModes = {};
        v30.dumpster:Add(v22.ReachedGameModeLevel:Connect(function(v32) --[[ Line: 97 ]]
            -- upvalues: v30 (copy), v21 (ref)
            if not v30._unlockedModes[v32] then
                v30._unlockedModes[v32] = true;
                v21:ToggleNotifier("Play", true);
            end;
        end));
        v30:_setupMainModesContainer();
        v30:_setupExtraModesContainer();
        v30:_setupMenuButtons();
        return;
    end;
end;
v22.Opening = function(v33) --[[ Line: 109 ]] --[[ Name: Opening ]]
    v33:SetView("Main");
end;
v22.Opened = function(_) --[[ Line: 113 ]] --[[ Name: Opened ]]
    -- upvalues: v15 (ref)
    local l_v15_Humanoid_0 = v15:GetHumanoid();
    if l_v15_Humanoid_0 then
        l_v15_Humanoid_0:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
        l_v15_Humanoid_0.WalkSpeed = 0;
    end;
end;
v22.Closed = function(_) --[[ Line: 121 ]] --[[ Name: Closed ]]
    -- upvalues: v15 (ref), l_StarterPlayer_0 (copy)
    local l_v15_Humanoid_1 = v15:GetHumanoid();
    if l_v15_Humanoid_1 then
        l_v15_Humanoid_1:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
        l_v15_Humanoid_1.WalkSpeed = l_StarterPlayer_0.CharacterWalkSpeed;
    end;
end;
v22.SetView = function(v38, v39) --[[ Line: 129 ]] --[[ Name: SetView ]]
    -- upvalues: v22 (copy)
    v38._currentView = v39;
    v22.ViewChanged:Fire(v39);
end;
v22._setupMainModesContainer = function(v40) --[[ Line: 135 ]] --[[ Name: _setupMainModesContainer ]]
    -- upvalues: v18 (ref)
    local l_mainModesContainer_0 = v40.mainModesContainer;
    local l_Close_0 = l_mainModesContainer_0.Folder.Close;
    l_mainModesContainer_0.Visible = false;
    l_mainModesContainer_0.Folder.Party.Visible = false;
    v18:HandleButton(l_Close_0, function() --[[ Line: 142 ]]
        -- upvalues: v18 (ref)
        v18:Toggle(script.Name, false);
    end);
end;
v22._setupExtraModesContainer = function(v43) --[[ Line: 147 ]] --[[ Name: _setupExtraModesContainer ]]
    -- upvalues: v18 (ref)
    local l_extraModesContainer_0 = v43.extraModesContainer;
    local l_Back_0 = l_extraModesContainer_0.Folder.Back;
    l_extraModesContainer_0.Visible = false;
    l_extraModesContainer_0.Folder.Party.Visible = false;
    v18:HandleButton(l_Back_0, function() --[[ Line: 154 ]]
        -- upvalues: v43 (copy)
        v43:SetView("Main");
    end);
end;
v22._setupMenuButtons = function(v46) --[[ Line: 159 ]] --[[ Name: _setupMenuButtons ]]
    -- upvalues: v4 (copy), v9 (copy), v8 (copy), v18 (ref), v20 (ref), l_LevelRequirements_0 (copy), v16 (ref), v13 (ref), v19 (ref), v17 (ref), l_LocalPlayer_0 (copy), v22 (copy)
    local l_mainModesContainer_1 = v46.mainModesContainer;
    local l_extraModesContainer_1 = v46.extraModesContainer;
    local v49 = v4.Extend(l_mainModesContainer_1:GetChildren(), l_extraModesContainer_1:GetChildren());
    for _, v51 in v49 do
        if v51:IsA("TextButton") then
            v51:SetAttribute("InvertClick", true);
            local v52 = false;
            do
                local l_v52_0 = v52;
                if v51.Name == "TowerOfKarate" then
                    local v54, v55 = v9:VerifyTowerOfKarateReleased();
                    do
                        local l_v55_0 = v55;
                        if not v54 then
                            local v57 = nil;
                            do
                                local l_v57_0 = v57;
                                l_v57_0 = v8.Simple(1, function() --[[ Line: 175 ]]
                                    -- upvalues: l_v55_0 (ref), v51 (copy), l_v57_0 (ref), v9 (ref), l_v52_0 (ref)
                                    l_v55_0 = l_v55_0 - 1;
                                    if l_v55_0 <= 0 then
                                        v51.Content.TimeLocked.Visible = false;
                                        l_v57_0:Disconnect();
                                        l_v57_0 = nil;
                                        return;
                                    else
                                        v51.Content.TimeLocked.Timer.Text = v9:FormatTimeFromSeconds(l_v55_0, not l_v52_0);
                                        return;
                                    end;
                                end);
                            end;
                        end;
                        v51.Content.TimeLocked.Visible = not v54;
                    end;
                end;
                v18:HandleButton(v51, function() --[[ Line: 192 ]]
                    -- upvalues: v51 (copy), v46 (copy), v20 (ref), l_LevelRequirements_0 (ref), v16 (ref), v13 (ref), v18 (ref), v9 (ref), v19 (ref)
                    local v59 = false;
                    local l_Name_0 = v51.Name;
                    if l_Name_0 == "Extra" then
                        if not v46:_meetsLevelRequirement("Extra") then
                            v20:Notify({
                                message = ("Reach level %* to play this mode!"):format(l_LevelRequirements_0.Extra), 
                                isPositive = false, 
                                duration = 3
                            });
                            return;
                        else
                            v46:SetView("Extra");
                            return;
                        end;
                    elseif l_Name_0 == "BossBattles" then
                        local v61 = v16:GetLoadout():expect();
                        local v62;
                        if not v61 then
                            v62 = false;
                        else
                            for _, v64 in v61 do
                                if v64 ~= "" then
                                    v62 = true;
                                    v59 = true;
                                end;
                                if v59 then
                                    break;
                                end;
                            end;
                            if not v59 then
                                v62 = false;
                            end;
                        end;
                        v59 = false;
                        if not v62 then
                            v20:Notify({
                                message = "You need a unit in your loadout to join a queue.", 
                                isPositive = false, 
                                duration = 3
                            });
                            return;
                        else
                            v13.AttemptCreateBossBattleQueue:Fire();
                            v18:Toggle("BossBattlesQueue", true);
                            return;
                        end;
                    elseif l_Name_0 == "Rogue" then
                        v18:Toggle("RoguelikeQueue", true);
                        return;
                    elseif l_Name_0 == "TowerOfKarate" then
                        if not v9:VerifyTowerOfKarateReleased() then
                            return;
                        else
                            v19:Teleport("KarateLobby");
                            return;
                        end;
                    elseif l_Name_0 == "Story" then
                        v46:_tryTravelToQueue("Play");
                        return;
                    else
                        v46:_tryTravelToQueue(l_Name_0);
                        return;
                    end;
                end, {
                    MouseEnter = function() --[[ Line: 231 ]] --[[ Name: MouseEnter ]]
                        -- upvalues: l_v52_0 (ref)
                        l_v52_0 = true;
                    end, 
                    MouseLeave = function() --[[ Line: 234 ]] --[[ Name: MouseLeave ]]
                        -- upvalues: l_v52_0 (ref)
                        l_v52_0 = false;
                    end
                });
            end;
        end;
    end;
    local v65 = v17:Get(l_LocalPlayer_0, "PlayerStats"):expect();
    if v65.Prestige == 0 then
        for v66, v67 in l_LevelRequirements_0 do
            if v66 ~= "_DEFAULT" and v67 <= v65.Level and not v46._unlockedModes[v66] then
                v46._unlockedModes[v66] = true;
            end;
        end;
    end;
    v17:OnChanged(l_LocalPlayer_0, {
        "PlayerStats"
    }, function(v68) --[[ Line: 255 ]]
        -- upvalues: v49 (copy), v46 (copy), l_LevelRequirements_0 (ref), v22 (ref)
        for _, v70 in v49 do
            if v70:IsA("TextButton") then
                local l_Name_1 = v70.Name;
                local l_Locked_0 = v70.Content.Locked;
                l_Locked_0.Visible = not v46:_meetsLevelRequirement(l_Name_1);
                l_Locked_0.LevelRequirement.Text = ("LVL %*+"):format(l_LevelRequirements_0[l_Name_1]);
            end;
        end;
        if v68.Prestige == 0 then
            for v73, v74 in l_LevelRequirements_0 do
                if v74 <= v68.Level and not v46._unlockedModes[v73] then
                    v22.ReachedGameModeLevel:Fire(v73);
                end;
            end;
        end;
    end, true);
end;
v22._tryTravelToQueue = function(v75, v76) --[[ Line: 280 ]] --[[ Name: _tryTravelToQueue ]]
    -- upvalues: v20 (ref), l_LevelRequirements_0 (copy), v14 (ref), v18 (ref)
    if not v75:_isAvailableMode(v76) then
        v20:Notify({
            message = "This mode is coming soon!", 
            duration = 2
        });
        return;
    elseif not v75:_meetsLevelRequirement(v76) then
        v20:Notify({
            message = ("Reach level %* to play this mode!"):format(l_LevelRequirements_0[v76]), 
            isPositive = false, 
            duration = 3
        });
        return;
    else
        v14:Travel(v76);
        v18:Toggle(script.Name, false);
        return;
    end;
end;
v22._isAvailableMode = function(_, v78) --[[ Line: 302 ]] --[[ Name: _isAvailableMode ]]
    -- upvalues: l_UnavailableGameModes_0 (copy)
    return l_UnavailableGameModes_0[v78] == nil;
end;
v22._meetsLevelRequirement = function(_, v80) --[[ Line: 306 ]] --[[ Name: _meetsLevelRequirement ]]
    -- upvalues: l_LevelRequirements_0 (copy), v17 (ref), l_LocalPlayer_0 (copy)
    local v81 = l_LevelRequirements_0[v80];
    if v81 then
        local v82 = v17:Get(l_LocalPlayer_0, "PlayerStats"):expect();
        if v82.Prestige == 0 and v82.Level < v81 then
            return false;
        end;
    end;
    return true;
end;
return v22;