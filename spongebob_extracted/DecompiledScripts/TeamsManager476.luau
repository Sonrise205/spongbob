local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(script.Parent.TeamFrame);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = {};
return {
    Showing = false, 
    ToggledSignal = v2.new(), 
    Init = function(v11, v12) --[[ Line: 39 ]] --[[ Name: Init ]]
        -- upvalues: v6 (ref), v1 (copy), v7 (ref), v8 (ref)
        v6 = v1.GetController("DataController");
        v7 = v1.GetController("UIController");
        v8 = v1.GetService("UnitService");
        v11._teamManager = v12.TeamManager;
        v11._teamManager.Visible = false;
        v11._main = v11._teamManager.Main;
        v11._content = v11._main.Content;
        v11._bin = v11._content.Bin;
        v11._template = v11._bin.TeamIndex;
        v11._exit = v11._main.Exit;
        v11._template.Visible = false;
    end, 
    Start = function(v13) --[[ Line: 56 ]] --[[ Name: Start ]]
        -- upvalues: v9 (ref), v7 (ref)
        v9 = v7:GetModuleAsync("Units"):expect();
        v7:HandleButton(v13._exit, function() --[[ Line: 59 ]]
            -- upvalues: v13 (copy)
            v13:ToggleFrame(false);
        end);
        v13:_listenToTeamsChanged();
    end, 
    ToggleFrame = function(v14, v15) --[[ Line: 66 ]] --[[ Name: ToggleFrame ]]
        -- upvalues: v9 (ref), v10 (copy)
        if v15 == nil then
            v15 = not v14.Showing;
        end;
        v14._teamManager.Visible = v15;
        if v15 == false then
            v9:SetState("Normal");
        end;
        v14.ToggledSignal:Fire(v15);
        if v15 == true then
            v14:_updateTeams(v14._myTeams, v14._myUnits, v14._playerStats);
            return;
        else
            for v16, _ in v14._myTeams do
                if v10[v16] then
                    v10[v16]:Hide();
                end;
            end;
            return;
        end;
    end, 
    SetCurrentTeamSelectionIndex = function(v18, v19) --[[ Line: 90 ]] --[[ Name: SetCurrentTeamSelectionIndex ]]
        v18._currentTeamIndex = v19;
    end, 
    CallToAddUnit = function(v20, v21) --[[ Line: 94 ]] --[[ Name: CallToAddUnit ]]
        -- upvalues: v5 (copy), v8 (ref)
        if not v20._currentTeamIndex then
            return;
        else
            local l_v5_LoadoutString_0 = v5:CreateLoadoutString(v21.Name, v21.UID);
            local v23 = false;
            for _, v25 in v20._myTeams[v20._currentTeamIndex].Loadout do
                if v25 == l_v5_LoadoutString_0 then
                    v23 = true;
                    break;
                end;
            end;
            v20:ToggleFrame(true);
            if not v23 then
                v8:AddUnitToTeam(l_v5_LoadoutString_0, v20._currentTeamIndex);
                return;
            else
                v8:RemoveUnitFromTeam(l_v5_LoadoutString_0, v20._currentTeamIndex);
                return;
            end;
        end;
    end, 
    _updateTeams = function(v26, v27, v28, v29) --[[ Line: 124 ]] --[[ Name: _updateTeams ]]
        -- upvalues: v10 (copy), v4 (copy)
        if v26._teamManager.Visible == false then
            return;
        else
            if not v26._madeInitialTeams then
                v26._madeInitialTeams = true;
                for v30, v31 in v27 do
                    v10[v30] = v4.new(v26._template:Clone(), v26._bin, v30, v26);
                    v10[v30]:UpdateUnits(v31, v28, v29);
                end;
            end;
            for v32, v33 in v27 do
                v10[v32]:UpdateUnits(v33, v28, v29);
            end;
            return;
        end;
    end, 
    _listenToTeamsChanged = function(v34) --[[ Line: 143 ]] --[[ Name: _listenToTeamsChanged ]]
        -- upvalues: v6 (ref), v1 (copy), v8 (ref), v5 (copy)
        v34._myTeams = v6:Get(v1.Player, "Teams"):expect();
        v34._myUnits = v6:Get(v1.Player, "Units"):expect();
        v34._playerStats = v6:Get(v1.Player, "PlayerStats"):expect();
        v6:OnChanged(v1.Player, "Teams", function(v35) --[[ Line: 148 ]]
            -- upvalues: v34 (copy)
            v34._myTeams = v35;
            v34:_updateTeams(v34._myTeams, v34._myUnits, v34._playerStats);
        end, true);
        v6:OnChanged(v1.Player, "Units", function(v36) --[[ Line: 153 ]]
            -- upvalues: v34 (copy)
            v34._myUnits = v36;
            v34:_updateTeams(v34._myTeams, v34._myUnits, v34._playerStats);
        end);
        v6:OnChanged(v1.Player, "PlayerStats", function(v37) --[[ Line: 158 ]]
            -- upvalues: v34 (copy)
            v34._playerStats = v37;
            v34:_updateTeams(v34._myTeams, v34._myUnits, v34._playerStats);
        end, true);
        v8.UnitsAdded:Connect(function(v38) --[[ Line: 164 ]]
            -- upvalues: v5 (ref), v34 (copy)
            for v39, v40 in v38 do
                local v41, v42 = v5:ParseLoadout(v39);
                if v41 and v42 then
                    if not v34._myUnits[v41] then
                        v34._myUnits[v41] = {};
                    end;
                    v34._myUnits[v41][v42] = v40;
                end;
            end;
            v34:_updateTeams(v34._myTeams, v34._myUnits, v34._playerStats);
        end);
        v8.UnitDataUpdated:Connect(function(v43, v44) --[[ Line: 183 ]]
            -- upvalues: v5 (ref), v34 (copy)
            local v45, v46 = v5:ParseLoadout(v43);
            if not v45 or not v46 then
                return;
            else
                if not v34._myUnits[v45] then
                    v34._myUnits[v45] = {};
                end;
                v34._myUnits[v45][v46] = v44;
                v34:_updateTeams(v34._myTeams, v34._myUnits, v34._playerStats);
                return;
            end;
        end);
        v8.UnitsRemoved:Connect(function(v47) --[[ Line: 198 ]]
            -- upvalues: v5 (ref), v34 (copy)
            for _, v49 in v47 do
                local v50, v51 = v5:ParseLoadout(v49);
                if v50 and v51 then
                    if not v34._myUnits[v50] then
                        v34._myUnits[v50] = {};
                    end;
                    if v34._myUnits[v50][v51] then
                        v34._myUnits[v50][v51] = nil;
                    end;
                end;
            end;
            v34:_updateTeams(v34._myTeams, v34._myUnits, v34._playerStats);
        end);
    end
};