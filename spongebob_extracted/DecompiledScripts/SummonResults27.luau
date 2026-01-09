local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out);
return {
    primaryMenu = true, 
    ignoreClosePrimaryMenus = true, 
    _canContinue = false, 
    ToggleProperties = {
        Main = {
            Open = {
                Position = UDim2.fromScale(0, 0)
            }, 
            Close = {
                Position = UDim2.fromScale(0, 0)
            }
        }
    }, 
    Init = function(_, _) --[[ Line: 55 ]] --[[ Name: Init ]]
        -- upvalues: v13 (ref), v4 (copy), v14 (ref), v15 (ref), v16 (ref)
        v13 = v4.GetController("DataController");
        v14 = v4.GetController("UIController");
        v15 = v4.GetController("AudioController");
        v16 = v4.GetController("DeviceTypeController");
    end, 
    Start = function(v20, v21) --[[ Line: 63 ]] --[[ Name: Start ]]
        v20.ui = v21;
        v20.main = v21.Main;
        v20.bin = v20.main.Bin;
        v20.largeBin = v20.main.LargeBin;
    end, 
    Opened = function(v22) --[[ Line: 70 ]] --[[ Name: Opened ]]
        -- upvalues: v5 (copy), l_UserInputService_0 (copy), v16 (ref)
        v22._inputDump = v5.new();
        v22._inputDump:Add(l_UserInputService_0.InputBegan:Connect(function(v23, _) --[[ Line: 73 ]]
            -- upvalues: v22 (copy)
            if v23.UserInputType == Enum.UserInputType.MouseButton1 or v23.UserInputType == Enum.UserInputType.Touch then
                v22:_attemptContinue();
            end;
        end));
        v22._inputDump:Add(v16.GamepadButtonPressed:Connect(function() --[[ Line: 79 ]]
            -- upvalues: v22 (copy)
            v22:_attemptContinue();
        end));
        v22._inputDump:Add(function() --[[ Line: 83 ]]
            -- upvalues: v22 (copy)
            v22._inputDump = nil;
        end);
    end, 
    Closed = function(v25) --[[ Line: 88 ]] --[[ Name: Closed ]]
        -- upvalues: v14 (ref)
        if v25.dump then
            v25.dump:Destroy();
        end;
        if v25._inputDump then
            v25._inputDump:Destroy();
        end;
        if v25._rarityVisualDump then
            v25._rarityVisualDump:Destroy();
            v25._rarityVisualDump = nil;
        end;
        if v25._recapSFX then
            v25._recapSFX:Stop();
            v25._recapSFX = nil;
        end;
        v25._canContinue = false;
        if v25.finishedCallback then
            v25.finishedCallback();
            v25.finishedCallback = nil;
        end;
        if not v25._fromRewards then
            v14:Toggle("Summon", true);
        end;
        v25._fromRewards = nil;
    end, 
    ShowResults = function(v26, v27, v28, v29) --[[ Line: 121 ]] --[[ Name: ShowResults ]]
        -- upvalues: v5 (copy), v6 (copy), v14 (ref), l_RunService_0 (copy), v17 (copy), v11 (copy), v9 (copy), v15 (ref), l_TweenService_0 (copy), v12 (copy), v8 (copy), v10 (copy)
        if v28 then
            v26.finishedCallback = v28;
        end;
        if v26.dump then
            v26.dump:Destroy();
        end;
        v26._fromRewards = v29 or false;
        v26.dump = v5.new();
        v26.dump:Add(function() --[[ Line: 134 ]]
            -- upvalues: v26 (copy)
            v26.dump = nil;
        end);
        local v30 = 1;
        for _, v32 in v6.Extend(v26.bin:GetChildren(), v26.largeBin:GetChildren()) do
            if v32:IsA("Frame") then
                v32.Content.Size = UDim2.fromScale(0, 0);
                v32.Visible = false;
            end;
        end;
        v26.bin.Visible = false;
        v26.largeBin.Visible = false;
        local v33 = #v6.Keys(v27);
        local l_bin_0 = v26.bin;
        if v33 > 10 then
            l_bin_0 = v26.largeBin;
        end;
        l_bin_0.Visible = true;
        v26._canContinue = false;
        v26.main.Hint.Visible = false;
        v14:Toggle(script.Name, true):await();
        l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        v26._rarityVisualDump = v5.new();
        local v35 = 2.2;
        if v33 > 5 then
            v35 = 3.2;
        end;
        local v36 = v17.Time / v35;
        if v33 > 10 then
            v36 = 4 / v11.MAX_SUMMON_AMOUNT;
        end;
        local v37 = {};
        for v38, v39 in v27 do
            table.insert(v37, {
                unitName = v9:ParseLoadout(v38) or v39.Name, 
                unitData = v39
            });
        end;
        table.sort(v37, function(v40, v41) --[[ Line: 196 ]]
            -- upvalues: v9 (ref)
            if v40.unitData.Rarity < v41.unitData.Rarity then
                return true;
            elseif v40.unitData.Rarity > v41.unitData.Rarity then
                return false;
            else
                return (v9:GetTotalDamage(v40.unitData) or 1) < (v9:GetTotalDamage(v41.unitData) or 1);
            end;
        end);
        if v26._recapSFX then
            v26._recapSFX:Stop();
            v26._recapSFX = nil;
        end;
        v26._recapSFX = v15:PlaySound({
            name = "Summoning.SummonRecap", 
            soundGroup = "Master.SFX"
        });
        for _, v43 in v37 do
            local l_unitData_0 = v43.unitData;
            local l_unitName_0 = v43.unitName;
            local l_l_bin_0_FirstChild_0 = l_bin_0:FindFirstChild(v30);
            if l_l_bin_0_FirstChild_0 then
                local _, v48 = v9:GetRarity(l_unitName_0);
                local v49 = l_TweenService_0:Create(l_l_bin_0_FirstChild_0.Content, v17, {
                    Size = UDim2.fromScale(1, 1)
                });
                if not v26._rarityVisualDump then
                    --[[ close >= 20 ]]
                    break;
                elseif not v14:GetToggleState(script.Name) then
                    --[[ close >= 20 ]]
                    break;
                else
                    if v33 > 10 then
                        v12:SetImage(l_l_bin_0_FirstChild_0.Content.Info.UnitIcon, l_unitName_0);
                        l_l_bin_0_FirstChild_0.Content.Info.UnitIcon.Visible = true;
                    else
                        v26._rarityVisualDump:Add(v8.new(l_l_bin_0_FirstChild_0.Content.Info, l_unitName_0));
                    end;
                    v26._rarityVisualDump:Add(v10.new(l_l_bin_0_FirstChild_0.Content.Glow, v48));
                    v26._rarityVisualDump:Add(v10.new(l_l_bin_0_FirstChild_0.Content.Info.Backdrop, v48));
                    l_l_bin_0_FirstChild_0.Content.Info.UnitName.Visible = false;
                    l_l_bin_0_FirstChild_0.Content.Info.Shiny.Visible = l_unitData_0 and l_unitData_0.Shiny or false;
                    l_l_bin_0_FirstChild_0.Content.Info.Wumbo.Visible = l_unitData_0 and l_unitData_0.Mega or false;
                    l_l_bin_0_FirstChild_0.Visible = true;
                    do
                        local l_v49_0 = v49;
                        l_v49_0.Completed:Once(function() --[[ Line: 262 ]]
                            -- upvalues: l_v49_0 (ref)
                            l_v49_0:Destroy();
                            l_v49_0 = nil;
                        end);
                        l_v49_0:Play();
                        v30 = v30 + 1;
                        task.wait(v36);
                    end;
                end;
            end;
        end;
        v26.main.Hint.Visible = true;
        v26._canContinue = true;
    end, 
    _attemptContinue = function(v51) --[[ Line: 277 ]] --[[ Name: _attemptContinue ]]
        -- upvalues: v14 (ref)
        if not v51._canContinue then
            return;
        else
            v14:Toggle(script.Name, false);
            return;
        end;
    end
};