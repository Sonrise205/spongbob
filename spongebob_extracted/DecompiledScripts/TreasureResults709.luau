local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out);
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
    Init = function(_, _) --[[ Line: 60 ]] --[[ Name: Init ]]
        -- upvalues: v17 (ref), v4 (copy), v18 (ref), v19 (ref), v20 (ref), v21 (ref)
        v17 = v4.GetController("DataController");
        v18 = v4.GetController("UIController");
        v19 = v4.GetController("AudioController");
        v20 = v4.GetController("DeviceTypeController");
        v21 = v4.GetController("CharacterController");
    end, 
    Start = function(v25, v26) --[[ Line: 69 ]] --[[ Name: Start ]]
        v25.ui = v26;
        v25.main = v26.Main;
        v25.bin = v25.main.Bin;
    end, 
    Opened = function(v27) --[[ Line: 76 ]] --[[ Name: Opened ]]
        -- upvalues: v5 (copy), l_UserInputService_0 (copy), v20 (ref)
        v27._inputDump = v5.new();
        v27._inputDump:Add(l_UserInputService_0.InputBegan:Connect(function(v28, _) --[[ Line: 79 ]]
            -- upvalues: v27 (copy)
            if v28.UserInputType == Enum.UserInputType.MouseButton1 or v28.UserInputType == Enum.UserInputType.Touch then
                v27:_attemptContinue();
            end;
        end));
        v27._inputDump:Add(v20.GamepadButtonPressed:Connect(function() --[[ Line: 85 ]]
            -- upvalues: v27 (copy)
            v27:_attemptContinue();
        end));
        v27._inputDump:Add(function() --[[ Line: 89 ]]
            -- upvalues: v27 (copy)
            v27._inputDump = nil;
        end);
    end, 
    Closed = function(v30) --[[ Line: 94 ]] --[[ Name: Closed ]]
        -- upvalues: v21 (ref), v20 (ref)
        if v30.dump then
            v30.dump:Destroy();
        end;
        if v30._inputDump then
            v30._inputDump:Destroy();
        end;
        if v30._rarityVisualDump then
            v30._rarityVisualDump:Destroy();
            v30._rarityVisualDump = nil;
        end;
        if v30._recapSFX then
            v30._recapSFX:Stop();
            v30._recapSFX = nil;
        end;
        v30._canContinue = false;
        if v30.finishedCallback then
            v30.finishedCallback();
            v30.finishedCallback = nil;
        end;
        v21:ToggleHideAll(false);
        v20:TogglePlayerControls(true);
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
        v30._fromRewards = nil;
    end, 
    ShowResults = function(v31, v32, v33, v34, v35) --[[ Line: 128 ]] --[[ Name: ShowResults ]]
        -- upvalues: v5 (copy), v18 (ref), l_RunService_0 (copy), v22 (copy), v11 (copy), v9 (copy), v13 (copy), v16 (copy), l_TweenService_0 (copy), v10 (copy), v12 (copy), v14 (copy)
        if v34 then
            v31.finishedCallback = v34;
        end;
        if v31.dump then
            v31.dump:Destroy();
        end;
        v31._fromRewards = v35 or false;
        v31.dump = v5.new();
        v31.dump:Add(function() --[[ Line: 141 ]]
            -- upvalues: v18 (ref), v33 (copy), v31 (copy)
            v18:Toggle(script.Name, false);
            if v33 then
                v33[script.Name] = nil;
                v18:RevertFromToggleAll(v33);
            end;
            v31.dump = nil;
        end);
        for _, v37 in v31.bin:GetChildren() do
            if v37:IsA("Frame") then
                v37.Content.Size = UDim2.fromScale(0, 0);
                v37.Visible = false;
            end;
        end;
        v31.bin.Visible = false;
        local v38 = #v32;
        local l_bin_0 = v31.bin;
        l_bin_0.Visible = true;
        v31._canContinue = false;
        v31.main.Hint.Visible = false;
        v18:Toggle(script.Name, true):await();
        l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        v31._rarityVisualDump = v5.new();
        local v40 = 2.2;
        if v38 > 5 then
            v40 = 3.2;
        end;
        local v41 = v22.Time / v40;
        if v38 > 10 then
            v41 = 2.5 / v11.MAX_SUMMON_AMOUNT;
        end;
        local v42 = {};
        for _, v44 in v32 do
            local l_rarity_0 = v44.rarity;
            if v44.type == "Unit" then
                l_rarity_0 = select(2, v9:GetRarity(v44.name));
            elseif v44.type == "Pet" then
                l_rarity_0 = select(2, v13:GetRarity(v44.name));
            elseif not l_rarity_0 then
                l_rarity_0 = v16:GetRewardRarity(v44);
            end;
            v44.Rarity = l_rarity_0;
            table.insert(v42, v44);
        end;
        table.sort(v42, function(v46, v47) --[[ Line: 213 ]]
            -- upvalues: v11 (ref)
            return v11.RARITIES_FROM_NAME[v46.Rarity] > v11.RARITIES_FROM_NAME[v47.Rarity];
        end);
        if v31._recapSFX then
            v31._recapSFX:Stop();
            v31._recapSFX = nil;
        end;
        for v48, v49 in v42 do
            local l_l_bin_0_FirstChild_0 = l_bin_0:FindFirstChild(v48);
            if l_l_bin_0_FirstChild_0 then
                local v51 = v49.Name or v49.name;
                local v52 = v49.Rarity or v49.rarity;
                local v53 = nil;
                if v49.type ~= "Unit" then
                    v53 = v16:GetIconFromRewardData(v49);
                end;
                local v54 = l_TweenService_0:Create(l_l_bin_0_FirstChild_0.Content, v22, {
                    Size = UDim2.fromScale(1, 1)
                });
                if not v31._rarityVisualDump then
                    --[[ close >= 19 ]]
                    break;
                elseif not v18:GetToggleState(script.Name) then
                    --[[ close >= 19 ]]
                    break;
                else
                    v31._rarityVisualDump:Add(v10.new(l_l_bin_0_FirstChild_0.Content.Glow, v52));
                    v31._rarityVisualDump:Add(v10.new(l_l_bin_0_FirstChild_0.Content.Info.Backdrop, v52));
                    l_l_bin_0_FirstChild_0.Content.Info.ItemName.Text = if v49.type ~= "Unit" then v51 else v9:GetUnitValue(v51, "FullName") or "";
                    l_l_bin_0_FirstChild_0.Content.Info.ItemName.Visible = false;
                    l_l_bin_0_FirstChild_0.Content.Info.Amount.Text = "";
                    if v49.type == "Unit" then
                        v12:SetImage(l_l_bin_0_FirstChild_0.Content.Info.Icon, v51);
                    elseif v49.type == "Pet" then
                        v14:SetImage(l_l_bin_0_FirstChild_0.Content.Info.Icon, v51);
                    else
                        l_l_bin_0_FirstChild_0.Content.Info.Icon.ImageRectOffset = Vector2.zero;
                        l_l_bin_0_FirstChild_0.Content.Info.Icon.ImageRectSize = Vector2.zero;
                        l_l_bin_0_FirstChild_0.Content.Info.Icon.ScaleType = Enum.ScaleType.Fit;
                        l_l_bin_0_FirstChild_0.Content.Info.Icon.Image = v53 or "";
                        l_l_bin_0_FirstChild_0.Content.Info.Amount.Text = ("x%*"):format(v49.amount or 1);
                    end;
                    l_l_bin_0_FirstChild_0.Content.Info.Shiny.Visible = v49.extraData and v49.extraData.Shiny or false;
                    l_l_bin_0_FirstChild_0.Content.Info.Wumbo.Visible = v49.extraData and (v49.extraData.Mega or v49.extraData.Wumbo) or false;
                    l_l_bin_0_FirstChild_0.Visible = true;
                    do
                        local l_v54_0 = v54;
                        l_v54_0.Completed:Once(function() --[[ Line: 280 ]]
                            -- upvalues: l_v54_0 (ref)
                            l_v54_0:Destroy();
                            l_v54_0 = nil;
                        end);
                        l_v54_0:Play();
                        task.wait(v41);
                    end;
                end;
            end;
        end;
        v31.main.Hint.Visible = true;
        v31._canContinue = true;
    end, 
    _attemptContinue = function(v56) --[[ Line: 294 ]] --[[ Name: _attemptContinue ]]
        -- upvalues: v18 (ref)
        if not v56._canContinue then
            return;
        else
            v18:Toggle(script.Name, false);
            return;
        end;
    end
};