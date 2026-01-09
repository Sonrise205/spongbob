local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.Fusion);
local l_peek_0 = v6.peek;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v11 = require(v3.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v16 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v17 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    _selectedUnit = nil, 
    _unitButtons = {}, 
    rgbHandler = v13.new(), 
    Init = function(v26, v27) --[[ Line: 59 ]] --[[ Name: Init ]]
        -- upvalues: v18 (ref), v3 (copy), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v6 (copy)
        v18 = v3.GetController("DataController");
        v19 = v3.GetController("UIController");
        v20 = v3.GetController("GlobalUnitTrackerController");
        v21 = v3.GetService("VersionService");
        v22 = v3.GetService("IndexService");
        v26.ui = v27;
        v26.main = v27.Main;
        v26.contentFrame = v26.main.Content;
        v26.exitBtn = v26.main.Exit;
        v26.previewFrame = v26.contentFrame.Preview;
        v26.previewHint = v26.contentFrame.Preview.FirstOpenBackground;
        v26.unitInfo = v26.previewFrame.UnitInfo;
        v26.bin = v26.contentFrame.Units.Bin;
        v26.effectTypeChart = v26.ui.EffectTypeChart;
        v26.normalProgressBar = v26.main.NormalProgress.Bar;
        v26.normalProgressFill = v26.normalProgressBar.Fill.UIGradient;
        v26.normalProgressRewards = v26.normalProgressBar.Rewards;
        v26.normalProgressTemplate = v26.normalProgressRewards.Template:Clone();
        v26.normalProgressRewards.Template:Destroy();
        v26.variantProgressBar = v26.main.VariantProgress.Bar;
        v26.variantProgressFill = v26.variantProgressBar.Fill.UIGradient;
        v26.variantProgressRewards = v26.variantProgressBar.Rewards;
        v26.variantProgressTemplate = v26.variantProgressRewards.Template:Clone();
        v26.variantProgressRewards.Template:Destroy();
        v26.template = v26.bin.Template;
        v26.template.Parent = nil;
        v26.fusionScope = v6.scoped(v6);
    end, 
    Start = function(v28, _) --[[ Line: 95 ]] --[[ Name: Start ]]
        -- upvalues: v23 (ref), v19 (ref), v24 (ref), v21 (ref), l_Friendlies_0 (copy), v10 (copy), v14 (copy), v16 (copy), v18 (ref), v3 (copy), v5 (copy), l_TweenService_0 (copy), v9 (copy), v11 (copy), l_peek_0 (copy), v22 (ref)
        v23 = v19:GetModuleAsync("HUD"):expect();
        v24 = v19:GetModuleAsync("Notification"):expect();
        v28:_addEffectTypes();
        local v30 = {
            "Normal", 
            "Shiny", 
            "Wumbo", 
            "ShinyWumbo"
        };
        local v31 = {};
        local v32 = 0;
        local v33 = tonumber(v21:GetVersion():expect());
        for _, v35 in l_Friendlies_0:GetChildren() do
            if v35.Name ~= "*RootFriendly" and v35.Name ~= "PioneerRock" and not v35:HasTag("SpawnUnit") then
                local l_v35_Attribute_0 = v35:GetAttribute("ReleaseVersion");
                if not l_v35_Attribute_0 or v33 >= l_v35_Attribute_0 then
                    local l_v10_Rarity_0, v38 = v10:GetRarity(v35.Name);
                    if l_v10_Rarity_0 then
                        table.insert(v31, {
                            UnitName = v35.Name, 
                            Rarity = v38, 
                            RarityIndex = l_v10_Rarity_0
                        });
                        v32 = v32 + 1;
                    end;
                end;
            end;
        end;
        local v39 = v32 * #v30;
        table.sort(v31, function(v40, v41) --[[ Line: 144 ]]
            if v40.RarityIndex < v41.RarityIndex then
                return true;
            elseif v40.RarityIndex > v41.RarityIndex then
                return false;
            elseif v40.UnitName < v41.UnitName then
                return true;
            else
                return false;
            end;
        end);
        for v42, v43 in v31 do
            local v44 = v28.template:Clone();
            v44.Name = v43.UnitName;
            v44.LayoutOrder = v42;
            v14:SetImage(v44.Content.Info.Icon, v43.UnitName);
            v44.Content.Info.Icon.Visible = true;
            v28.rgbHandler:AddObject(v44.Content.Info.Backdrop, v43.Rarity);
            v44.Parent = v28.bin;
            v28._unitButtons[v43.UnitName] = v44;
            local function _() --[[ Line: 168 ]] --[[ Name: isIndexed ]]
                -- upvalues: v28 (copy), v43 (copy)
                return v28._myIndex.Index[v43.UnitName] ~= nil;
            end;
            v16.new(v44, {
                Name = v43.UnitName, 
                IsUnit = true, 
                HideName = function() --[[ Line: 175 ]] --[[ Name: HideName ]]
                    -- upvalues: v28 (copy), v43 (copy)
                    return not (v28._myIndex.Index[v43.UnitName] ~= nil);
                end, 
                IsSecretUnit = function() --[[ Line: 178 ]] --[[ Name: IsSecretUnit ]]
                    -- upvalues: v28 (copy), v43 (copy)
                    return not (v28._myIndex.Index[v43.UnitName] ~= nil);
                end
            });
            v19:HandleButton(v44, function() --[[ Line: 183 ]]
                -- upvalues: v28 (copy), v43 (copy)
                v28:SelectUnit(v43.UnitName, v43.Rarity);
            end);
        end;
        local v46 = v28.fusionScope:Value(0);
        local v47 = v28.fusionScope:Value(0);
        v18:OnChanged(v3.Player, "UnitsIndex", function(v48) --[[ Line: 191 ]]
            -- upvalues: v28 (copy), v5 (ref), v46 (copy), v47 (copy), v32 (ref), v39 (copy)
            v28._myIndex = v48;
            local v49 = #v5.Keys(v48.Index);
            local v50 = 0;
            for v51, v52 in v28._unitButtons do
                local v53 = v28._myIndex.Index[v51];
                if not v53 then
                    v52.Content.Info.Undiscovered.Visible = true;
                    v52.Content.Info.Icon.ImageColor3 = Color3.new(0, 0, 0);
                else
                    v52.Content.Info.Undiscovered.Visible = false;
                    v52.Content.Info.Icon.ImageColor3 = Color3.new(1, 1, 1);
                    for v54, v55 in v53 do
                        if v55 then
                            v50 = v50 + 1;
                        end;
                        v52.Content.Types[v54].Visible = v55;
                    end;
                end;
            end;
            v46:set(v49);
            v47:set(v50);
            v28.contentFrame.Top.UnitsCount.UnitsDiscovered.Count.Text = ("%*/%*"):format(v49, v32);
            v28.contentFrame.Top.UnitsCount.VariantsDiscovered.Count.Text = ("%*/%*"):format(v50, v39);
        end, true);
        v19:HandleButton(v28.exitBtn, function() --[[ Line: 226 ]]
            -- upvalues: v19 (ref)
            v19:Toggle(script.Name, false);
        end);
        v19:HandleButton(v28.effectTypeChart.Main.Exit, function() --[[ Line: 230 ]]
            -- upvalues: v28 (copy)
            v28.main.Visible = true;
        end);
        v19:HandleButton(v28.main.Effects, function() --[[ Line: 234 ]]
            -- upvalues: v28 (copy)
            v28.main.Visible = false;
        end);
        v28.main:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 238 ]]
            -- upvalues: v28 (copy)
            v28.effectTypeChart.Visible = not v28.main.Visible;
        end);
        v28.contentFrame.Top.SearchBar.TextBox.FocusLost:Connect(function(v56) --[[ Line: 242 ]]
            -- upvalues: v28 (copy)
            if not v56 then
                return;
            else
                v28:SearchUnits(v28.contentFrame.Top.SearchBar.TextBox.Text);
                return;
            end;
        end);
        local v57 = TweenInfo.new(10, Enum.EasingStyle.Linear);
        local v58 = l_TweenService_0:Create(v28.unitInfo.CanvasGroup.BG, v57, {
            Position = UDim2.fromScale(1, 1)
        });
        local v59 = l_TweenService_0:Create(v28.unitInfo.CanvasGroup.BG, v57, {
            Position = UDim2.fromScale(0.5, 0.5)
        });
        v58.Completed:Connect(function() --[[ Line: 260 ]]
            -- upvalues: v59 (copy)
            v59:Play();
        end);
        v59.Completed:Connect(function() --[[ Line: 264 ]]
            -- upvalues: v58 (copy)
            v58:Play();
        end);
        v58:Play();
        v28:Deselect();
        local v60 = {
            Normal = {}, 
            Variant = {}
        };
        local v61 = {
            Normal = v28.normalProgressRewards, 
            Variant = v28.variantProgressRewards
        };
        local v62 = {
            Normal = v28.normalProgressFill, 
            Variant = v28.variantProgressFill
        };
        local v63 = {
            Normal = v46, 
            Variant = v47
        };
        for v64, v65 in v61 do
            local v66 = v60[v64];
            local v67 = v63[v64];
            local v68 = v62[v64];
            local v69 = v9.UNIT_INDEX_MILESTONES[v64];
            local v70 = #v69;
            for v71, v72 in v69 do
                local v73 = v28.normalProgressTemplate:Clone();
                v73.Name = v71;
                v73.LayoutOrder = v71;
                v73.Required.Text = ("%* Units"):format(v72.required);
                v73.Parent = v65;
                local l_Button_0 = v11.new({
                    v72.reward
                }, {
                    template = v73.Reward, 
                    parent = v73, 
                    hideExistCount = true, 
                    retainLayoutOrder = true
                }):GetButton(1);
                table.insert(v66, l_Button_0.Content);
                v19:HandleButton(l_Button_0, function() --[[ Line: 322 ]]
                    -- upvalues: l_Button_0 (copy), v24 (ref), l_peek_0 (ref), v67 (copy), v72 (copy), v64 (copy), v22 (ref), v71 (copy)
                    if l_Button_0.Content.Claimed.Visible then
                        v24:Notify({
                            message = "You have already claimed this reward!", 
                            duration = 4, 
                            isPositive = false
                        });
                        return;
                    elseif l_peek_0(v67) < v72.required then
                        v24:Notify({
                            message = ("You need %* %* units indexed to claim this reward"):format(v72.required, v64), 
                            duration = 4, 
                            isPositive = false
                        });
                        return;
                    else
                        v22:ClaimUnitIndexReward(v64, v71):andThen(function(v75) --[[ Line: 344 ]]
                            -- upvalues: v24 (ref)
                            local v76 = v75 and "Successfully claimed reward!" or "Something went wrong, please try again later";
                            v24:Notify({
                                message = v76, 
                                duration = 4, 
                                isPositive = v75
                            });
                        end);
                        return;
                    end;
                end);
            end;
            v28.fusionScope:Observer(v67):onBind(function() --[[ Line: 358 ]]
                -- upvalues: l_peek_0 (ref), v67 (copy), v69 (copy), v70 (copy), v68 (copy), v66 (copy)
                local v77 = l_peek_0(v67);
                local v78 = 0;
                for _, v80 in v69 do
                    v78 = v78 + 1;
                    if v77 < v80.required then
                        break;
                    end;
                end;
                local l_required_0 = v69[v78].required;
                local v82 = (v78 - 1) / v70 + v77 / l_required_0 * (1 / v70);
                v68.Offset = Vector2.new(-(1 - v82), 0);
                for v83, v84 in v66 do
                    local v85 = v69[v83];
                    local l_Claim_0 = v84.Claim;
                    local v87 = false;
                    if v85.required <= v77 then
                        v87 = not v84.Claimed.Visible;
                    end;
                    l_Claim_0.Visible = v87;
                end;
            end);
        end;
        v18:OnChanged(v3.Player, "UnitIndexRewardsClaimed", function(v88) --[[ Line: 385 ]]
            -- upvalues: v60 (copy)
            for v89, v90 in v60 do
                local v91 = v88[v89];
                for v92, v93 in v90 do
                    local v94 = v91[tostring(v92)] == true;
                    v93.Claimed.Visible = v94;
                    if v94 then
                        v93.Claim.Visible = false;
                    end;
                end;
            end;
        end, true);
    end, 
    Opening = function(v95) --[[ Line: 403 ]] --[[ Name: Opening ]]
        -- upvalues: v23 (ref)
        v95.rgbHandler:Enable();
        v23:ToggleBottomLobbyFrame(false);
    end, 
    Opened = function(v96) --[[ Line: 408 ]] --[[ Name: Opened ]]
        -- upvalues: v4 (copy)
        if v96.dump then
            v96.dump:Destroy();
        end;
        v96.dump = v4.new();
    end, 
    Closing = function(_) --[[ Line: 416 ]] --[[ Name: Closing ]]
        -- upvalues: v23 (ref)
        v23:ToggleBottomLobbyFrame(true);
    end, 
    Closed = function(v98) --[[ Line: 420 ]] --[[ Name: Closed ]]
        if v98.dump then
            v98.dump:Destroy();
        end;
        v98:SearchUnits();
        v98:Deselect();
        if v98._tooltip then
            v98._tooltip:Destroy();
        end;
        v98.main.Visible = true;
        v98.rgbHandler:Disable();
    end, 
    SelectUnit = function(v99, v100, v101) --[[ Line: 436 ]] --[[ Name: SelectUnit ]]
        -- upvalues: v4 (copy), v15 (copy), v12 (copy), v10 (copy), v20 (ref), v17 (copy), v16 (copy)
        if v99._selectedUnit == v100 then
            v99:Deselect();
            return;
        else
            v99:Deselect();
            v99._selectedUnit = v100;
            v99._selectionDump = v4.new();
            v99._selectionDump:Add(function() --[[ Line: 448 ]]
                -- upvalues: v99 (copy)
                v99._selectionDump = nil;
            end);
            local v102 = v99._myIndex.Index[v100];
            v99._selectionDump:Construct(v15, v99.unitInfo, v100, {
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageColor3 = if v102 then Color3.new(1, 1, 1) else Color3.new(0, 0, 0), 
                positionAttribute = "PreviewOffset"
            });
            if not v102 then
                v99.unitInfo.Types.Visible = false;
            else
                for v103, v104 in v102 do
                    v99.unitInfo.Types[v103].Visible = v104;
                end;
                v99.unitInfo.Types.Visible = true;
            end;
            v99._selectionDump:Add(v12.new(v99.unitInfo.CanvasGroup.BG, v101));
            local v105 = false;
            if v102 then
                v99.unitInfo.Content.UnitName.UnitName.Text = v10:GetUnitValue(v100, "FullName") or v100;
            else
                v99.unitInfo.Content.UnitName.UnitName.Text = "???";
                v105 = true;
            end;
            local l_v10_UnitValue_0 = v10:GetUnitValue(v100, "Type");
            local v107 = nil;
            local v108 = nil;
            local v109 = nil;
            local v110 = nil;
            if l_v10_UnitValue_0 == "Resource" then
                v110 = v10:GetGold({
                    Name = v100
                });
            else
                v107 = v10:GetTotalDamage({
                    Name = v100
                });
                v108 = v10:GetRange({
                    Name = v100
                });
                v109 = v10:GetAttackCooldown({
                    Name = v100
                });
            end;
            if v105 then
                v107 = "???";
                v108 = "???";
                v109 = "???";
            end;
            v99.previewFrame.ExistingCount.Visible = false;
            v99._selectionDump:Add(v20:ApplyCountToLabel(v100, nil, v99.previewFrame.ExistingCount.Amount, false, "%s Exist", false):andThen(function(v111, v112) --[[ Line: 516 ]]
                -- upvalues: v99 (copy)
                if not v111 then
                    return;
                else
                    v99.previewFrame.ExistingCount.Visible = true;
                    v99._selectionDump:Add(v112);
                    return;
                end;
            end));
            v99.unitInfo.Content.Rarity.Text = v101;
            v99._selectionDump:Add(v12.new(v99.unitInfo.Content.Rarity, v101));
            v99.unitInfo.Content.Stats.Values.DMG.StatAmount.Text = v107 or "";
            v99.unitInfo.Content.Stats.Values.RNG.StatAmount.Text = v108 or "";
            v99.unitInfo.Content.Stats.Values.SPA.StatAmount.Text = v109 or "";
            v99.unitInfo.Content.Stats.Values.GOLD.StatAmount.Text = v110 or "";
            v99.unitInfo.Content.Stats.Values.DMG.Visible = l_v10_UnitValue_0 ~= "Resource";
            v99.unitInfo.Content.Stats.Values.RNG.Visible = l_v10_UnitValue_0 ~= "Resource";
            v99.unitInfo.Content.Stats.Values.SPA.Visible = l_v10_UnitValue_0 ~= "Resource";
            v99.unitInfo.Content.Stats.Values.GOLD.Visible = l_v10_UnitValue_0 == "Resource";
            v99.previewHint.Visible = false;
            v99.unitInfo.Visible = true;
            if v105 then
                v99.unitInfo.Content.UnitName.AttackType.Visible = false;
                return;
            else
                v99.unitInfo.Content.UnitName.AttackType.Visible = true;
                v99.unitInfo.Content.UnitName.UnitName.Text = v10:GetUnitValue(v100, "FullName") or v100;
                v99.unitInfo.Content.UnitName.AttackType.Icon.Image = v17:GetAttackTypeIcon(l_v10_UnitValue_0);
                local l_v10_PrimaryEffect_0 = v10:GetPrimaryEffect(v100);
                v99.unitInfo.Content.UnitName.AttackType.EffectType.Visible = l_v10_PrimaryEffect_0 ~= nil;
                if l_v10_PrimaryEffect_0 then
                    v99.unitInfo.Content.UnitName.AttackType.EffectType.Icon.Image = v17:GetEffectIcon(l_v10_PrimaryEffect_0);
                end;
                v16.new(v99.unitInfo.Content.UnitName.AttackType, {
                    IsUnitType = true, 
                    Name = v100
                });
                return;
            end;
        end;
    end, 
    Deselect = function(v114) --[[ Line: 565 ]] --[[ Name: Deselect ]]
        if v114._selectionDump then
            v114._selectionDump:Destroy();
        end;
        v114._selectedUnit = nil;
        v114.previewFrame.ExistingCount.Visible = false;
        v114.previewHint.Visible = true;
        v114.unitInfo.Visible = false;
    end, 
    SearchUnits = function(v115, v116) --[[ Line: 577 ]] --[[ Name: SearchUnits ]]
        -- upvalues: v10 (copy)
        v116 = v116 or "";
        v116 = string.lower(v116);
        if string.len(v116) and v116 == "" then
            for _, v118 in v115._unitButtons do
                v118.Visible = true;
            end;
            return;
        else
            for v119, v120 in v115._unitButtons do
                local v121 = v10:GetUnitValue(v119, "FullName") or v119;
                v120.Visible = (string.find(string.lower(v121), v116) or string.find(string.lower(v119), v116)) ~= nil;
            end;
            return;
        end;
    end, 
    _addEffectTypes = function(v122) --[[ Line: 597 ]] --[[ Name: _addEffectTypes ]]
        -- upvalues: v16 (copy)
        local function v128(v123, v124) --[[ Line: 598 ]] --[[ Name: getChildren ]]
            -- upvalues: v16 (ref)
            if not v123 then
                return;
            else
                for _, v126 in v123:GetChildren() do
                    if v126:IsA("TextButton") then
                        local l_Name_0 = v126.Name;
                        v16.new(v126, {
                            IsEffectType = true, 
                            Name = l_Name_0, 
                            ShowEffectDescription = v124
                        });
                    end;
                end;
                return;
            end;
        end;
        local l_Content_0 = v122.effectTypeChart.Main.Content;
        if not l_Content_0 then
            return;
        else
            v128(l_Content_0.EffectTypes, true);
            v128(l_Content_0.SharedBin.Priority.Damage.Bin);
            v128(l_Content_0.SharedBin.Priority.Slowing.Bin);
            v128(l_Content_0.SharedBin.Combos.Bin.Combo1);
            v128(l_Content_0.SharedBin.Combos.Bin.Combo2);
            v128(l_Content_0.SharedBin.Combos.Bin.NoStack.Bin);
            return;
        end;
    end
};