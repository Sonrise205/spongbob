local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local v5 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.Fusion);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.BeltHandler);
local v9 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
return {
    primaryMenu = false, 
    Init = function(v15, v16) --[[ Line: 36 ]] --[[ Name: Init ]]
        v15.ui = v16;
        v15.top = v15.ui.Top;
        v15.bottom = v15.ui.Bottom;
        v15.levelBar = v15.bottom.Leveling;
        v15.enemiesLabel = v15.top.Main.MobsLeft.Amount.Title;
        v15.floorLabel = v15.top.Main.StageInfo.Inner.Inner.CurrentFloor;
        v15.healthLabel = v15.bottom.GameCurrency.Health.Title;
        v15.bossHealthBin = v15.ui.BossHealths;
        v15.bossHealthTemplate = v15.bossHealthBin.Template;
        v15.bossHealthTemplate.Parent = nil;
    end, 
    Start = function(v17) --[[ Line: 54 ]] --[[ Name: Start ]]
        -- upvalues: v11 (ref), v2 (copy), v12 (ref), v13 (ref), v14 (ref), v4 (copy), v6 (copy), l_UserInputService_0 (copy)
        v11 = v2.GetService("TowerKarateService");
        v12 = v2.GetController("UIController");
        v13 = v2.GetController("DataController");
        v14 = v2.GetController("TowerKarateController");
        v11.LevelInfo:Observe(function(v18) --[[ Line: 60 ]]
            -- upvalues: v17 (copy)
            v17.levelInfo = v18;
        end);
        v4.Custom(function() --[[ Line: 64 ]]
            -- upvalues: v17 (copy)
            return v17.levelInfo;
        end):await();
        if not v17.levelInfo or v17.levelInfo.Mode ~= "TowerOfKarate" then
            return;
        else
            v17.scope = v6.scoped(v6);
            v17:_ObservePlayerHealth();
            v17:_ObserveFloor();
            v17:_ObserveEnemiesAlive();
            v17:_ConnectLevelBar();
            v17:_ConnectAbilityBar();
            if not v12.IsLoaded then
                v12.Loaded:Wait();
            end;
            local function v23() --[[ Line: 84 ]] --[[ Name: updatePreferredVisual ]]
                -- upvalues: l_UserInputService_0 (ref), v17 (copy)
                local l_PreferredInput_0 = l_UserInputService_0.PreferredInput;
                local l_Content_0 = v17.bottom.GameCurrency.Ability.Button.Content.Hint.Content;
                for _, v22 in l_Content_0:GetChildren() do
                    if v22:IsA("Frame") then
                        v22.Visible = false;
                    end;
                end;
                if l_PreferredInput_0 == Enum.PreferredInput.Touch then
                    l_Content_0.Touch.Visible = true;
                    return;
                elseif l_PreferredInput_0 == Enum.PreferredInput.Gamepad then
                    l_Content_0.Gamepad.Visible = true;
                    return;
                else
                    l_Content_0.Keyboard.Visible = true;
                    return;
                end;
            end;
            v23();
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(v23);
            task.defer(function() --[[ Line: 108 ]]
                -- upvalues: v12 (ref)
                v12:Toggle("GameUI", false);
                v12:Toggle(script.Name, true);
            end);
            return;
        end;
    end, 
    CreateBossHealthBar = function(v24, v25) --[[ Line: 116 ]] --[[ Name: CreateBossHealthBar ]]
        local v26 = v24.bossHealthTemplate:Clone();
        v26.Name = v25.Name;
        v26.Visible = true;
        v26.Parent = v24.bossHealthBin;
        return v26;
    end, 
    _ConnectLevelBar = function(v27) --[[ Line: 125 ]] --[[ Name: _ConnectLevelBar ]]
        -- upvalues: v13 (ref), v2 (copy), v9 (copy), v8 (copy)
        v13:OnChanged(v2.Player, "TowerOfKarate.Progression", function(v28) --[[ Line: 126 ]]
            -- upvalues: v27 (copy), v9 (ref), v8 (ref)
            v27._progressionData = v28;
            local v29 = v27._progressionData.Level or 1;
            local v30 = v27._progressionData.Belts or 0;
            local v31 = math.min(v29 + 1, #v9.BeltRanks);
            local v32 = v8.GetRankData(v29);
            local v33 = v8.GetRankData(v31);
            local v34 = math.clamp(v30 / v33.BeltCost, 0, 1);
            if v31 <= v29 then
                v34 = 1;
                v27.levelBar.Progression.Text = ("%*"):format(v32.Name);
            else
                v27.levelBar.Progression.Text = ("%* (%*/%*)"):format(v32.Name, v30, v33.BeltCost);
            end;
            v27.levelBar.Fill.Size = UDim2.fromScale(v34, 1);
            v27.levelBar.Belt.ImageColor3 = v8.GetBeltColor(v29);
        end, true);
    end, 
    _ObservePlayerHealth = function(v35) --[[ Line: 150 ]] --[[ Name: _ObservePlayerHealth ]]
        -- upvalues: v5 (copy), v2 (copy)
        v5.Player.forEachCharacter(function(v36, v37) --[[ Line: 151 ]]
            -- upvalues: v35 (copy)
            local l_Humanoid_0 = v36:WaitForChild("Humanoid");
            v37:Add(l_Humanoid_0.HealthChanged:Connect(function(v39) --[[ Line: 154 ]]
                -- upvalues: v35 (ref)
                v35.healthLabel.Text = math.round(v39);
            end));
            v35.healthLabel.Text = math.round(l_Humanoid_0.Health or 0);
        end, v2.Player);
    end, 
    _ObserveEnemiesAlive = function(v40) --[[ Line: 163 ]] --[[ Name: _ObserveEnemiesAlive ]]
        -- upvalues: v11 (ref)
        v11.EnemiesLeft:Observe(function(v41) --[[ Line: 164 ]]
            -- upvalues: v40 (copy)
            v41 = v41 or 0;
            v40.enemiesLabel.Text = v41;
        end);
    end, 
    _ObserveFloor = function(v42) --[[ Line: 171 ]] --[[ Name: _ObserveFloor ]]
        -- upvalues: v11 (ref)
        v11.KarateFloor:Observe(function(v43) --[[ Line: 172 ]]
            -- upvalues: v42 (copy)
            if v43 < 1 then
                v42.floorLabel.Text = "Start Floor";
                return;
            else
                v42.floorLabel.Text = "Floor " .. tostring(v43);
                return;
            end;
        end);
    end, 
    _ConnectAbilityBar = function(v44) --[[ Line: 182 ]] --[[ Name: _ConnectAbilityBar ]]
        -- upvalues: v9 (copy), v6 (copy), v14 (ref), v10 (copy), v2 (copy)
        local l_Ability_0 = v44.bottom.GameCurrency.Ability;
        local v46 = v44.scope:Value(false);
        local v47 = v44.scope:Value(0);
        local v48 = v44.scope:Value(false);
        v44.scope:Hydrate(l_Ability_0.Fill)({
            Size = v44.scope:Spring(v44.scope:Computed(function(v49) --[[ Line: 191 ]]
                -- upvalues: v47 (copy), v9 (ref)
                local v50 = v49(v47);
                return UDim2.fromScale(math.clamp(v50 / v9.REQUIRED_ABILITY_CHARGE, 0, 1), 1);
            end), 8, 0.8)
        });
        v44.scope:Hydrate(l_Ability_0.ActiveEffects)({
            ImageTransparency = v44.scope:Spring(v44.scope:Computed(function(v51) --[[ Line: 198 ]]
                -- upvalues: v48 (copy)
                if v51(v48) then
                    return 0;
                else
                    return 0.7;
                end;
            end), 5, 0.8), 
            Visible = v44.scope:Computed(function(v52) --[[ Line: 202 ]]
                -- upvalues: v46 (copy)
                return v52(v46);
            end)
        });
        v44.scope:Hydrate(l_Ability_0.Button.Content.Icon)({
            ImageTransparency = v44.scope:Spring(v44.scope:Computed(function(v53) --[[ Line: 208 ]]
                -- upvalues: v46 (copy)
                if v53(v46) == true then
                    return 0;
                else
                    return 0.85;
                end;
            end), 10, 0.8)
        });
        v44.scope:Observer(v46):onBind(function() --[[ Line: 215 ]]
            -- upvalues: v6 (ref), v46 (copy), l_Ability_0 (copy)
            local v54 = v6.peek(v46);
            l_Ability_0.Button.Content.Frame.UIGradient_Active.Enabled = v54;
            l_Ability_0.Button.Content.Frame.UIGradient_Inactive.Enabled = not v54;
        end);
        l_Ability_0.Button.Active = true;
        l_Ability_0.Button.Activated:Connect(function() --[[ Line: 222 ]]
            -- upvalues: v6 (ref), v46 (copy), v14 (ref)
            if not v6.peek(v46) then
                return;
            else
                v14.UseAbility:Fire();
                return;
            end;
        end);
        v10(v2.Player, "AbilityCharge", function(v55) --[[ Line: 230 ]]
            -- upvalues: v47 (copy), v46 (copy), v9 (ref)
            v55 = v55 or 0;
            v47:set(v55);
            v46:set(v9.REQUIRED_ABILITY_CHARGE <= v55);
        end, true);
        task.spawn(function() --[[ Line: 236 ]]
            -- upvalues: l_Ability_0 (copy), v48 (copy), v6 (ref)
            while task.wait(0.8) do
                if not l_Ability_0.ActiveEffects.Visible then
                    v48:set(false);
                else
                    v48:set(not v6.peek(v48));
                end;
            end;
        end);
    end
};