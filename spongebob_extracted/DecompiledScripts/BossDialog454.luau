local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v6 = require(l_ReplicatedStorage_0.BossDialogs);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.EnemyShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v9 = nil;
local v10 = nil;
local v11 = nil;
return {
    primaryMenu = false, 
    ToggleProperties = {
        ["Main.UIScale"] = {
            Open = {
                Scale = 1, 
                ToggleTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back)
            }, 
            Close = {
                Scale = 0.7, 
                ToggleTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            }
        }
    }, 
    Init = function(v12, v13, v14) --[[ Line: 48 ]] --[[ Name: Init ]]
        -- upvalues: v9 (ref), v2 (copy), v10 (ref), v11 (ref)
        v9 = v2.GetController("UIController");
        v10 = v2.GetService("GameService");
        v11 = v2.GetController("TowerController");
        v12.currentMode = v14;
        v12.ui = v13;
        v12.main = v13.Main;
        v12.bossContainer = v12.main.BossContainer;
        v12.dialogLabel = v12.main.Dialog;
        v12.bossNameLabel = v12.main.BossName;
    end, 
    Start = function(v15) --[[ Line: 63 ]] --[[ Name: Start ]]
        -- upvalues: v10 (ref), v6 (copy)
        v10.BossSpawned:Connect(function(v16, v17) --[[ Line: 64 ]]
            -- upvalues: v6 (ref), v15 (copy)
            if v17 then
                return;
            else
                local v18 = v6[v16];
                if not v18 then
                    return;
                else
                    v15:ShowDialog(v16, v18);
                    return;
                end;
            end;
        end);
    end, 
    Closed = function(v19) --[[ Line: 79 ]] --[[ Name: Closed ]]
        if v19._viewport then
            v19._viewport:Destroy();
            v19._viewport = nil;
        end;
    end, 
    ShowDialog = function(v20, v21, v22) --[[ Line: 86 ]] --[[ Name: ShowDialog ]]
        -- upvalues: v7 (copy), v5 (copy), v9 (ref), v11 (ref), v8 (copy)
        v20:Closed();
        v20.bossNameLabel.Text = v7:GetUnitValue(v21, "FullName") or v21;
        v20.dialogLabel.Text = v22;
        v20.dialogLabel.MaxVisibleGraphemes = 0;
        v20._viewport = v5.new(v20.bossContainer, v21, {
            isEnemy = true
        });
        v20._viewport.viewHandler.viewport.Position = UDim2.fromScale(0.5, 1);
        v20._viewport.viewHandler.viewport.Size = UDim2.fromScale(1.5, 1);
        if v9:GetToggleState("TowerInfo") then
            v9:Toggle("TowerInfo", false):await();
            v11:DeselectTower();
        end;
        v9:Toggle(script.Name, true);
        v8("NumberValue", 0, TweenInfo.new(2), {
            Value = utf8.len(v22)
        }, function(v23) --[[ Line: 106 ]]
            -- upvalues: v20 (copy)
            v20.dialogLabel.MaxVisibleGraphemes = v23;
        end):Add(function() --[[ Line: 110 ]]
            -- upvalues: v20 (copy), v9 (ref)
            v20.dialogLabel.MaxVisibleGraphemes = -1;
            task.delay(4, function() --[[ Line: 113 ]]
                -- upvalues: v9 (ref)
                v9:Toggle(script.Name, false);
            end);
        end);
    end
};