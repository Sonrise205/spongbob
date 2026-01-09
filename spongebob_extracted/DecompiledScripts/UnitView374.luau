local l_CollectionService_0 = game:GetService("CollectionService");
local _ = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.TraitsData);
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out);
return {
    primaryMenu = true, 
    ignoreClosePrimaryMenus = true, 
    ToggleAll = {}, 
    _mainVisualsDump = v5.new(), 
    ToggleProperties = {
        Main = {
            Open = {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.fromScale(0, 0)
            }, 
            Close = {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.fromScale(0, 0)
            }
        }
    }, 
    Init = function(v19, v20) --[[ Line: 59 ]] --[[ Name: Init ]]
        -- upvalues: v12 (ref), v4 (copy), v13 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref), l_TweenService_0 (copy)
        v12 = v4.GetController("DataController");
        v13 = v4.GetController("UnitViewerController");
        v14 = v4.GetController("UIController");
        v15 = v4.GetController("BlurController");
        v16 = v4.GetController("UnitController");
        v17 = v4.GetController("PetController");
        v19.ui = v20;
        v19.main = v20.Main;
        v19.viewOptions = v19.main.ViewOptions;
        v19.hintLabel = v19.main.Hint;
        v19.unitInfo2 = v19.main.UnitInfo2;
        v19.summonedDisplay = v19.main.SummonedUnitsDisplay;
        v19.summonTemplate = v19.summonedDisplay.Template:Clone();
        v19.summonedDisplay.Template:Destroy();
        v19.viewOptions.Visible = false;
        v19.summonedDisplay.Visible = false;
        local v21 = TweenInfo.new(0.2, Enum.EasingStyle.Back);
        local v22 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0.2);
        local v23 = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
        v19.tweenIns = {
            l_TweenService_0:Create(v19.unitInfo2.Inner, v21, {
                Position = UDim2.fromScale(0, 0)
            }), 
            l_TweenService_0:Create(v19.hintLabel, v22, {
                TextTransparency = 0
            }), 
            l_TweenService_0:Create(v19.hintLabel.UIStroke, v22, {
                Transparency = 0
            }), 
            l_TweenService_0:Create(v19.main.AutoSold.UIScale, v23, {
                Scale = 1
            })
        };
        v19:_resetTweenStates();
    end, 
    Start = function(v24, _) --[[ Line: 109 ]] --[[ Name: Start ]]
        -- upvalues: v13 (ref), v7 (copy), v11 (copy), v10 (copy), v8 (copy)
        v13.FinishedTweeningIn:Connect(function(v26, v27, v28, v29) --[[ Line: 110 ]]
            -- upvalues: v24 (copy), v7 (ref), v11 (ref), v10 (ref), v8 (ref)
            if v24._visualDump then
                v24._visualDump:Destroy();
            end;
            local _, v31 = v7:GetRarity(v26);
            local l_v7_UnitValue_0 = v7:GetUnitValue(v26, "Type");
            local l_v7_UnitValue_1 = v7:GetUnitValue(v26, "FullName");
            local v34 = nil;
            local v35 = nil;
            local v36 = nil;
            local v37 = nil;
            if l_v7_UnitValue_0 == "Resource" then
                v37 = v7:GetGold(v27);
            else
                v34 = v7:GetTotalDamage(v27);
                v35 = v7:GetRange(v27);
                v36 = v7:GetAttackCooldown(v27);
            end;
            v24.main.AutoSold.UIScale.Scale = 0;
            v24.main.AutoSold.Visible = v27.AutoSold or false;
            v24.unitInfo2.Inner.Content.UnitName.Text = l_v7_UnitValue_1;
            v24.unitInfo2.Inner.Content.UnitTags.ShinyStatus.Visible = v27.Shiny or false;
            v24.unitInfo2.Inner.Content.UnitTags.WumboStatus.Visible = v27.Mega or false;
            v24.unitInfo2.Inner.Content.UnitTags.Rarity.Text = v31;
            v24.unitInfo2.Inner.Content.Stats.GOLD.Visible = l_v7_UnitValue_0 == "Resource";
            v24.unitInfo2.Inner.Content.Stats.DMG.Visible = l_v7_UnitValue_0 ~= "Resource";
            v24.unitInfo2.Inner.Content.Stats.RNG.Visible = l_v7_UnitValue_0 ~= "Resource";
            v24.unitInfo2.Inner.Content.Stats.SPA.Visible = l_v7_UnitValue_0 ~= "Resource";
            v24.unitInfo2.Inner.Content.Stars.Visible = v27.Stars and v27.Stars >= 1;
            if v27.Stars and v27.Stars >= 1 then
                for _, v39 in v24.unitInfo2.Inner.Content.Stars:GetChildren() do
                    if v39.Name ~= "Main" and v39:IsA("ImageLabel") then
                        v39.Visible = false;
                    end;
                end;
                for v40 = 1, v27.Stars do
                    local l_FirstChild_0 = v24.unitInfo2.Inner.Content.Stars:FindFirstChild(v40);
                    if l_FirstChild_0 then
                        l_FirstChild_0.Visible = true;
                    end;
                end;
                v24.unitInfo2.Inner.Content.Stars.Main.Amount.Text = v27.Stars;
            end;
            local l_ImageLabel_0 = v24.unitInfo2.Inner.Content.Traits.Trait:FindFirstChildOfClass("ImageLabel");
            local l_ImageLabel_1 = v24.unitInfo2.Inner.Content.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
            if l_ImageLabel_0 then
                l_ImageLabel_0:Destroy();
                l_ImageLabel_0 = nil;
            end;
            if l_ImageLabel_1 then
                l_ImageLabel_1:Destroy();
                l_ImageLabel_1 = nil;
            end;
            if v27.Trait then
                v11:CreateTraitIcon(v27.Trait.Name, v24.unitInfo2.Inner.Content.Traits.Trait);
            end;
            if v27.Trait2 then
                v11:CreateTraitIcon(v27.Trait2.Name, v24.unitInfo2.Inner.Content.Traits.Trait2);
            end;
            v24.unitInfo2.Inner.Content.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v27.Level or 1);
            v24.unitInfo2.Inner.Content.Level.Visible = v27.Level and v27.Level >= 100;
            v24.unitInfo2.Inner.Content.Traits.Visible = v27.Trait ~= nil;
            if l_v7_UnitValue_0 == "Resource" then
                v24.unitInfo2.Inner.Content.Stats.GOLD.Stat.StatAmount.Text = v10:FormatDecimal(v37 or 0);
            else
                v24.unitInfo2.Inner.Content.Stats.DMG.Stat.StatAmount.Text = v10:FormatDecimal(v34 or 0);
                v24.unitInfo2.Inner.Content.Stats.RNG.Stat.StatAmount.Text = v10:FormatDecimal(v35 or 0);
                v24.unitInfo2.Inner.Content.Stats.SPA.Stat.StatAmount.Text = v10:FormatDecimal(v36 or 0);
            end;
            v24._visualDump = v24._mainVisualsDump:Extend();
            v24._visualDump:Add(v8.new(v24.unitInfo2.Inner.Content.UnitTags.Rarity, v31));
            v24._visualDump:Add(v8.new(v24.unitInfo2.Inner, v31));
            v24._visualDump:Add(v8.new(v24.unitInfo2.Inner.Content.UIStroke, v31));
            v24._visualDump:Add(function() --[[ Line: 211 ]]
                -- upvalues: v24 (ref)
                v24._visualDump = nil;
            end);
            v24:_playTweenIns();
            if v28 and not v29 then
                v24:CreateSummonFrame(v26, v31, v27);
            end;
        end);
    end, 
    Opened = function(v44) --[[ Line: 223 ]] --[[ Name: Opened ]]
        -- upvalues: v15 (ref)
        v15:SetUnitDepthMode(true);
        v44:_resetTweenStates();
    end, 
    Closed = function(v45) --[[ Line: 228 ]] --[[ Name: Closed ]]
        -- upvalues: v15 (ref), l_CollectionService_0 (copy)
        v15:SetUnitDepthMode(false);
        if v45._mainVisualsDump then
            v45._mainVisualsDump:Destroy();
        end;
        if v45._closedCallback then
            v45._closedCallback();
            v45._closedCallback = nil;
        end;
        v45:_resetTweenStates();
        local v46 = l_CollectionService_0:GetTagged("SummonBanner")[1];
        if v46 then
            v46.Enabled = true;
        end;
    end, 
    CreateSummonFrame = function(v47, v48, v49, v50) --[[ Line: 249 ]] --[[ Name: CreateSummonFrame ]]
        -- upvalues: v9 (copy), v8 (copy), l_TweenService_0 (copy), v18 (copy)
        v47.summonedDisplay.Visible = true;
        local v51 = v47.summonTemplate:Clone();
        v51.Visible = true;
        v51.UIScale.Scale = 0;
        v51.Shiny.Visible = v50 and v50.Shiny or false;
        v51.Wumbo.Visible = v50 and v50.Mega or false;
        v51.Parent = v47.summonedDisplay;
        v47._mainVisualsDump:Construct(v9, v51, v48);
        v47._mainVisualsDump:Add(v8.new(v51.Glow, v49));
        v47._mainVisualsDump:Add(v8.new(v51.Backdrop, v49));
        v47._mainVisualsDump:Add(v51);
        local v52 = 1;
        if v50 and v50.Mega then
            v52 = 1.2;
        end;
        local v53 = l_TweenService_0:Create(v51.UIScale, v18, {
            Scale = v52
        });
        v53:Play();
        v53.Completed:Once(function() --[[ Line: 276 ]]
            -- upvalues: v53 (ref)
            v53:Destroy();
            v53 = nil;
        end);
    end, 
    _playTweenIns = function(v54) --[[ Line: 282 ]] --[[ Name: _playTweenIns ]]
        for _, v56 in v54.tweenIns do
            v56:Play();
        end;
    end, 
    _resetTweenStates = function(v57) --[[ Line: 288 ]] --[[ Name: _resetTweenStates ]]
        v57.hintLabel.TextTransparency = 1;
        v57.hintLabel.UIStroke.Transparency = 1;
        v57.unitInfo2.Inner.Position = UDim2.fromScale(-1, 0);
        v57.main.AutoSold.UIScale.Scale = 0;
        v57.main.AutoSold.Visible = false;
    end
};