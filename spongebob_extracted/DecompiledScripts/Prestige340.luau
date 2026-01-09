local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Silo);
local v7 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.PrestigeRewards);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.AnimatedSprite);
local v15 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v16 = require(v4.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out);
local v32 = v6.new({
    Stats = {
        Level = 1, 
        Prestige = 0
    }, 
    processingRequest = false
}, {
    SetStats = function(v28, v29) --[[ Line: 49 ]]
        v28.Stats = v29;
    end, 
    SetProcessing = function(v30, v31) --[[ Line: 53 ]]
        v30.processingRequest = v31;
    end
});
local v33 = {
    primaryMenu = true, 
    blur = true, 
    ignoreClosePrimaryMenus = false, 
    animating = false, 
    ToggleAll = {}
};
local function v35(v34) --[[ Line: 67 ]] --[[ Name: selectStats ]]
    return v34.Stats;
end;
local function v37(v36) --[[ Line: 71 ]] --[[ Name: selectProcessing ]]
    return v36.processingRequest;
end;
v33.Init = function(v38, v39) --[[ Line: 75 ]] --[[ Name: Init ]]
    -- upvalues: v19 (ref), v4 (copy), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v25 (ref), v16 (copy), v12 (copy), v13 (copy), v15 (copy), l_TweenService_0 (copy), v14 (copy)
    v19 = v4.GetController("DataController");
    v20 = v4.GetController("UIController");
    v21 = v4.GetService("StatsService");
    v22 = v4.GetController("DeviceTypeController");
    v23 = v4.GetController("AudioController");
    v24 = v4.GetController("UnitViewerController");
    v25 = v4.GetController("TreasureController");
    v38.ui = v39;
    v38.main = v39.Main;
    v38.prestigeFrame = v38.main.PrestigeFrame;
    v38.prestigeContent = v38.prestigeFrame.Content.Prestige;
    v38.nextPrestigeFrame = v38.prestigeContent.Visual;
    v38.exitBtn = v38.prestigeFrame.Exit;
    v38.confirmBtn = v38.prestigeFrame.Content.Confirm;
    v38.playerLevelLabel = v38.prestigeFrame.Content.PlayerLevel;
    v38.prestigeVisual = v38.main.PrestigeVisual;
    v38.prestigeEmblem = v38.prestigeVisual.Emblem;
    v38.prestigeText = v38.prestigeVisual.PrestigeText;
    v38.rewardBin = v38.prestigeVisual.RewardsDisplay;
    v38.rewardTemplate = v38.rewardBin.Template:Clone();
    v38.rewardBin.Template:Destroy();
    v38.prestigeFrame.Visible = true;
    v38.prestigeVisual.Visible = false;
    v38.rewardBox = v38.nextPrestigeFrame.Next.RewardBox;
    v38.rewardVisualizer = v16.new({}, {
        Template = v38.rewardBox.Rewards.Template, 
        Parent = v38.rewardBox.Rewards, 
        renderMethod = function(v40, v41) --[[ Line: 111 ]] --[[ Name: renderMethod ]]
            -- upvalues: v12 (ref), v13 (ref), v15 (ref)
            v40.Content.Amount.Text = ("x%*"):format(v41.amount or 1);
            v40.Content.Amount.Visible = v41.type ~= "Unit";
            if v41.type == "Unit" then
                local v42 = v41.rarity or select(2, v12:GetRarity(v41.name));
                v13:SetImage(v40.Content.Icon, v41.name);
                if v42 == "Secret" then
                    v40.Content.Icon.ImageColor3 = Color3.new(0, 0, 0);
                end;
            else
                v40.Content.Icon.Image = v15:GetIconFromRewardData(v41) or "";
            end;
            return {
                v40.Content.Backdrop, 
                v40.Content.Glow
            };
        end
    });
    local v43 = TweenInfo.new(1.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
    local v44 = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
    v38.inTweens = {
        l_TweenService_0:Create(v38.prestigeEmblem.UIScale, v43, {
            Scale = 1.8
        }), 
        l_TweenService_0:Create(v38.prestigeEmblem.Icon, v43, {
            ImageTransparency = 0
        }), 
        l_TweenService_0:Create(v38.prestigeText, v43, {
            TextTransparency = 0
        })
    };
    v38.iconTweens = {
        l_TweenService_0:Create(v38.prestigeEmblem.Icon.Icon.UIScale, v44, {
            Scale = 2
        }), 
        l_TweenService_0:Create(v38.prestigeEmblem.Icon.Icon, v44, {
            ImageTransparency = 1
        })
    };
    v38.spritePlayer1 = v14.new({
        spriteSheet = v38.prestigeVisual.Particles, 
        frameCount = 16, 
        frameSize = Vector2.new(256, 256), 
        framesPerAxis = Vector2int16.new(4, 4), 
        frameOffset = Vector2int16.new(0, 0), 
        fps = 30, 
        loops = false
    });
    v38.spritePlayer2 = v14.new({
        spriteSheet = v38.prestigeVisual.Particles2, 
        frameCount = 16, 
        frameSize = Vector2.new(256, 256), 
        framesPerAxis = Vector2int16.new(4, 4), 
        frameOffset = Vector2int16.new(0, 0), 
        fps = 30, 
        loops = false
    });
end;
v33.Start = function(v45, _) --[[ Line: 169 ]] --[[ Name: Start ]]
    -- upvalues: v26 (ref), v20 (ref), v32 (copy), v19 (ref), v4 (copy), v21 (ref), v37 (copy), v9 (copy), v11 (copy), v15 (copy), v35 (copy)
    v26 = v20:GetModuleAsync("PromptOverlay"):expect();
    v32:Dispatch(v32.Actions.SetStats(v19:Get(v4.Player, "PlayerStats"):expect()));
    v19:OnChanged(v4.Player, "PlayerStats", function(v47) --[[ Line: 174 ]]
        -- upvalues: v32 (ref)
        v32:Dispatch(v32.Actions.SetStats(v47));
    end);
    v20:HandleButton(v45.exitBtn, function() --[[ Line: 178 ]]
        -- upvalues: v20 (ref)
        v20:Toggle(script.Name, false);
    end);
    v20:HandleButton(v45.confirmBtn, function() --[[ Line: 182 ]]
        -- upvalues: v32 (ref), v45 (copy), v21 (ref)
        local l_v32_State_0 = v32:GetState();
        local _ = l_v32_State_0.Stats.Level;
        local _ = l_v32_State_0.Stats.Prestige;
        if l_v32_State_0.processingRequest then
            return;
        elseif v45:IsMaxPrestige() then
            v45:AttemptMaxPrestigeClaims();
            return;
        elseif not v45:CanPrestige() then
            return;
        else
            v32:Dispatch(v32.Actions.SetProcessing(true));
            v21:Prestige():andThen(function(v51, v52, v53) --[[ Line: 204 ]]
                -- upvalues: v45 (ref)
                v45.doPrestigeAnimation = v51;
                v45.newPrestige = v52;
                v45.rewardsEarned = v53;
            end):finally(function() --[[ Line: 208 ]]
                -- upvalues: v32 (ref)
                task.delay(2, function() --[[ Line: 209 ]]
                    -- upvalues: v32 (ref)
                    v32:Dispatch(v32.Actions.SetProcessing(false));
                end);
            end);
            return;
        end;
    end);
    local function v59() --[[ Line: 215 ]] --[[ Name: updateDisabledState ]]
        -- upvalues: v32 (ref), v45 (copy)
        local l_Stats_0 = v32:GetState().Stats;
        local _ = l_Stats_0.Level or 1;
        local _ = l_Stats_0.Prestige or 0;
        local v57 = v45:IsMaxPrestige();
        local v58 = v45:IsPrestigeMaster();
        if not v57 then
            v45.confirmBtn.Content.Disabled.Visible = not v45:CanPrestige();
            return;
        elseif not v58 then
            v45.confirmBtn.Content.Disabled.Visible = true;
            return;
        elseif not v45.claimedPrestigeMaster then
            v45.confirmBtn.Content.Disabled.Visible = false;
            return;
        else
            v45.confirmBtn.Content.Disabled.Visible = not v45:CanClaimInfiniteLevel();
            return;
        end;
    end;
    v32:Watch(v37, function(v60) --[[ Line: 246 ]]
        -- upvalues: v26 (ref), v45 (copy), v59 (copy)
        v26:Toggle(v60);
        if v60 then
            v45.prestigeFrame.Visible = false;
            v45.confirmBtn.Content.Disabled.Visible = true;
            return;
        else
            if v45.doPrestigeAnimation then
                task.delay(1, function() --[[ Line: 259 ]]
                    -- upvalues: v45 (ref)
                    v45:DoPrestigeAnimation();
                end);
            else
                v45.prestigeFrame.Visible = true;
            end;
            v59();
            return;
        end;
    end);
    local v61 = 0;
    local function v72() --[[ Line: 272 ]] --[[ Name: updateUI ]]
        -- upvalues: v32 (ref), v9 (ref), v45 (copy), v61 (ref), v20 (ref), v11 (ref), v15 (ref), v59 (copy)
        local l_v32_State_1 = v32:GetState();
        local v63 = l_v32_State_1.Stats.Level or 1;
        local v64 = l_v32_State_1.Stats.Prestige or 0;
        local v65 = math.clamp(v64 + 1, 1, v9.PRESTIGE.MAX_PRESTIGE);
        local v66 = v45:IsMaxPrestige();
        local v67 = v45:IsPrestigeMaster();
        if v61 ~= v65 then
            v61 = v65;
            local v68 = not v20:GetToggleState(script.Name);
            v45.rewardVisualizer:ChangeRewards(v11[v65], nil, v68);
        end;
        if v66 and not v67 then
            local v69 = not v20:GetToggleState(script.Name);
            v45.rewardVisualizer:ChangeRewards(v11.PrestigeMaster, nil, v69);
        end;
        if v67 and v45.claimedPrestigeMaster then
            local v70 = not v20:GetToggleState(script.Name);
            v45.rewardVisualizer:ChangeRewards(v11.PrestigeInfinite, nil, v70);
        end;
        v45.nextPrestigeFrame.Current.Current.Image = v15:GetPrestigeIcon(v64, v63) or "";
        v45.nextPrestigeFrame.Current.Current.Hint.Text = v9.PRESTIGE.TITLES[v64] or "";
        v45.nextPrestigeFrame.Current.Visible = not v66;
        v45.prestigeContent.Visual.Arrow.Visible = v45.nextPrestigeFrame.Current.Visible;
        if not v66 then
            v45.nextPrestigeFrame.Next.Next.Next.Image = v15:GetPrestigeIcon(v65) or "";
        end;
        if not v67 or not v45.claimedPrestigeMaster then
            v45.nextPrestigeFrame.Next.Next.Next.Hint.Text = v9.PRESTIGE.TITLES[v66 and "Master" or v65] or "";
        else
            v45.nextPrestigeFrame.Next.Next.Next.Hint.Text = "Every 100 Levels";
        end;
        v45.playerLevelLabel.Text = ("Level %*"):format((v15:CommaNumber(v63)));
        if v66 then
            v45.confirmBtn.Content.Title.Text = "Claim Rewards!";
            v45.prestigeContent.HintFrame.Visible = false;
            v45.nextPrestigeFrame.Next.Next.Next.Image = v15:GetPrestigeIcon(v9.PRESTIGE.MAX_PRESTIGE, v9.PRESTIGE.FINAL_MAX_LEVEL) or "";
            if v67 and v45.claimedPrestigeMaster then
                v45.prestigeContent.Hint.Text = "Every 100 levels collect rewards!";
            else
                local v71 = v15:CommaNumber(v9.PRESTIGE.FINAL_MAX_LEVEL);
                v45.prestigeContent.Hint.Text = ("Reach level %* to collect rewards!"):format(v71);
            end;
        else
            v45.confirmBtn.Content.Title.Text = "Prestige!";
            v45.prestigeContent.HintFrame.Visible = true;
        end;
        v59();
    end;
    v45.claimedPrestigeMaster = v19:Get(v4.Player, "ClaimedPrestigeMaster"):expect() or false;
    v45.LastInfiniteLevelClaim = v19:Get(v4.Player, "LastInfiniteLevelClaim"):expect() or 0;
    v19:OnChanged(v4.Player, "ClaimedPrestigeMaster", function(v73) --[[ Line: 344 ]]
        -- upvalues: v45 (copy), v72 (copy)
        v45.claimedPrestigeMaster = v73;
        v72();
    end);
    v19:OnChanged(v4.Player, "LastInfiniteLevelClaim", function(v74) --[[ Line: 349 ]]
        -- upvalues: v45 (copy), v72 (copy)
        v45.LastInfiniteLevelClaim = v74;
        v72();
    end);
    v32:Watch(v35, v72);
end;
v33.Opened = function(v75) --[[ Line: 357 ]] --[[ Name: Opened ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), v22 (ref), v20 (ref), v25 (ref)
    v75.inputDump = v5.new();
    if v75.rewardVisualizer then
        v75.rewardVisualizer:Render();
    end;
    v75.inputDump:Add(l_UserInputService_0.InputBegan:Connect(function(v76, _) --[[ Line: 365 ]]
        -- upvalues: v22 (ref), v75 (copy), v20 (ref), v25 (ref)
        if v22:IsConsole() then
            return;
        elseif v75.ignoreClosePrimaryMenus then
            return;
        elseif not v75.canClose then
            return;
        else
            if v76.UserInputType == Enum.UserInputType.MouseButton1 or v76.UserInputType == Enum.UserInputType.Touch then
                if v75.unitsEarned then
                    v20:Toggle(script.Name, false);
                    v25.UnitGained:Fire(v75.unitsEarned, {
                        fromReward = true
                    });
                    v75.unitsEarned = nil;
                    return;
                else
                    v75.ignoreClosePrimaryMenus = false;
                    v75.prestigeFrame.Visible = true;
                    v75.prestigeVisual.Visible = false;
                    v75:_resetAnimations();
                end;
            end;
            return;
        end;
    end));
    local v78 = nil;
    v78 = v22:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 396 ]]
        -- upvalues: v75 (copy), v78 (ref)
        if v75.ignoreClosePrimaryMenus then
            return;
        elseif not v75.canClose then
            return;
        else
            v75.prestigeFrame.Visible = true;
            v75.prestigeVisual.Visible = false;
            v75:_resetAnimations();
            v75.ignoreClosePrimaryMenus = false;
            v78();
            v78 = nil;
            return;
        end;
    end);
    v75.inputDump:Add(function() --[[ Line: 416 ]]
        -- upvalues: v78 (ref), v75 (copy)
        if v78 then
            v78();
            v78 = nil;
        end;
        v75.inputDump = nil;
    end);
end;
v33.Closed = function(v79) --[[ Line: 426 ]] --[[ Name: Closed ]]
    if v79.inputDump then
        v79.inputDump:Destroy();
    end;
    if v79.animationDump then
        v79.animationDump:Destroy();
    end;
    v79.ignoreClosePrimaryMenus = false;
    v79.canClose = nil;
    v79.rewardsEarned = nil;
    v79.prestigeFrame.Visible = true;
    v79.prestigeVisual.Visible = false;
    v79:_resetAnimations();
    v79.rewardVisualizer:ClearAll();
end;
v33.CanPrestige = function(v80) --[[ Line: 448 ]] --[[ Name: CanPrestige ]]
    -- upvalues: v32 (copy), v9 (copy)
    local l_Stats_1 = v32:GetState().Stats;
    local v82 = l_Stats_1.Level or 1;
    local _ = l_Stats_1.Prestige or 0;
    local v84 = false;
    if v9.PRESTIGE.BASE_MAX_LEVEL <= v82 then
        v84 = not v80:IsMaxPrestige();
    end;
    return v84;
end;
v33.IsMaxPrestige = function(_) --[[ Line: 456 ]] --[[ Name: IsMaxPrestige ]]
    -- upvalues: v32 (copy), v9 (copy)
    return (v32:GetState().Stats.Prestige or 0) >= v9.PRESTIGE.MAX_PRESTIGE;
end;
v33.IsPrestigeMaster = function(v86) --[[ Line: 464 ]] --[[ Name: IsPrestigeMaster ]]
    -- upvalues: v32 (copy), v9 (copy)
    if not v86:IsMaxPrestige() then
        return false;
    else
        return (v32:GetState().Stats.Level or 1) >= v9.PRESTIGE.FINAL_MAX_LEVEL;
    end;
end;
v33.CanClaimPrestigeMaster = function(v87) --[[ Line: 475 ]] --[[ Name: CanClaimPrestigeMaster ]]
    if not v87:IsPrestigeMaster() then
        return false;
    elseif v87.claimedPrestigeMaster then
        return false;
    else
        return true;
    end;
end;
v33.CanClaimInfiniteLevel = function(v88) --[[ Line: 487 ]] --[[ Name: CanClaimInfiniteLevel ]]
    -- upvalues: v32 (copy), v15 (copy)
    if not v88:IsPrestigeMaster() then
        return false;
    elseif not v88.claimedPrestigeMaster then
        return false;
    else
        local v89 = v32:GetState().Stats.Level or 1;
        return v15:GetPrestigeMasterLevelTier(v89) ~= v88.LastInfiniteLevelClaim;
    end;
end;
v33.DoPrestigeAnimation = function(v90) --[[ Line: 502 ]] --[[ Name: DoPrestigeAnimation ]]
    -- upvalues: v9 (copy), v15 (copy), v23 (ref), v7 (copy), v5 (copy), v12 (copy), v13 (copy), v18 (copy), l_TweenService_0 (copy), v27 (copy)
    v90:_resetAnimations();
    v90.ignoreClosePrimaryMenus = true;
    v90.canClose = false;
    local v91 = v90:IsPrestigeMaster();
    local v92 = v91 and v9.PRESTIGE.FINAL_MAX_LEVEL or 1;
    v90.prestigeEmblem.Icon.Image = v15:GetPrestigeIcon(v90.newPrestige, v92) or "";
    v90.prestigeEmblem.Icon.Icon.Image = v90.prestigeEmblem.Icon.Image;
    v90.prestigeText.Text = v9.PRESTIGE.TITLES[v91 and "Master" or v90.newPrestige] or "";
    v90.newPrestige = nil;
    v90.prestigeFrame.Visible = false;
    v90.prestigeVisual.Visible = true;
    v90.spritePlayer1:Play();
    v90.spritePlayer2:Play();
    local v93 = {};
    local v94 = {};
    v23:PlaySound({
        name = "UI.Prestige", 
        soundGroup = "Master.SFX.VFX"
    });
    for _, v96 in v90.inTweens do
        table.insert(v93, v7.fromEvent(v96.Completed));
        v96:Play();
    end;
    for _, v98 in v90.iconTweens do
        table.insert(v94, v7.fromEvent(v98.Completed));
    end;
    v90.animationDump = v5.new();
    local v99 = {};
    local v100 = {};
    local v101 = {};
    local v102 = v90.rewardsEarned or {};
    for _, v104 in v102 do
        local v105 = v90.rewardTemplate:Clone();
        v105.Stars.Visible = false;
        v105.Shiny.Visible = false;
        v105.Wumbo.Visible = false;
        local v106 = nil;
        if v104.type == "Unit" then
            local l_info_0 = v104.UnitInfo.info;
            local l_v12_Rarity_0, v109 = v12:GetRarity(l_info_0.Name);
            l_info_0.Rarity = l_v12_Rarity_0;
            v106 = v109;
            v13:SetImage(v105.Icon, l_info_0.Name);
            v101[v104.UnitInfo.uid] = l_info_0;
            v105.Stars.Visible = l_info_0.Stars >= 5;
            v105.Shiny.Visible = l_info_0.Shiny or false;
            v105.Wumbo.Visible = l_info_0.Mega or false;
            v105.Amount.Visible = false;
        else
            v106 = v15:GetRewardRarity(v104);
            v105.Icon.Image = v15:GetIconFromRewardData(v104) or "";
            v105.Amount.Text = ("x%*"):format(v104.amount or 1);
            v105.Amount.Visible = true;
        end;
        if v106 then
            v90.animationDump:Add(v18.new(v105.Glow, v106));
            v90.animationDump:Add(v18.new(v105.Backdrop, v106));
        end;
        v105.UIScale.Scale = 0;
        v105.Visible = true;
        v105.Parent = v90.rewardBin;
        v90.animationDump:Add(v105);
        local v110 = l_TweenService_0:Create(v105.UIScale, v27, {
            Scale = 1
        });
        table.insert(v100, v110);
        table.insert(v99, v7.fromEvent(v110.Completed));
    end;
    if next(v101) then
        v90.unitsEarned = v101;
    end;
    v90.animationDump:Add(function() --[[ Line: 599 ]]
        -- upvalues: v90 (copy)
        v90.animationDump = nil;
    end);
    v7.allSettled(v93):finally(function() --[[ Line: 603 ]]
        -- upvalues: v90 (copy)
        v90.prestigeEmblem.Icon.Icon.UIScale.Scale = 1;
        for _, v112 in v90.iconTweens do
            v112:Play();
        end;
    end);
    v7.allSettled(v94):finally(function() --[[ Line: 611 ]]
        -- upvalues: v100 (copy)
        for v113, v114 in v100 do
            task.delay(v113 * 0.3, function() --[[ Line: 613 ]]
                -- upvalues: v114 (copy)
                v114:Play();
            end);
        end;
    end);
    v7.allSettled(v99):finally(function() --[[ Line: 619 ]]
        -- upvalues: v100 (copy), v99 (copy), v93 (copy), v90 (copy)
        for _, v116 in v100 do
            v116:Destroy();
        end;
        table.clear(v100);
        table.clear(v99);
        table.clear(v93);
        v90.canClose = true;
        v90.prestigeVisual.ContinueHint.Visible = true;
        v90.ignoreClosePrimaryMenus = false;
        v90.doPrestigeAnimation = false;
    end);
end;
v33.AttemptMaxPrestigeClaims = function(v117) --[[ Line: 635 ]] --[[ Name: AttemptMaxPrestigeClaims ]]
    -- upvalues: v32 (copy), v21 (ref), v9 (copy)
    if not v117:IsPrestigeMaster() then
        return;
    elseif v117:CanClaimPrestigeMaster() then
        v32:Dispatch(v32.Actions.SetProcessing(true));
        v21:ClaimPrestigeMaster():andThen(function(v118, v119) --[[ Line: 645 ]]
            -- upvalues: v117 (copy), v9 (ref)
            v117.doPrestigeAnimation = v118 or false;
            v117.newPrestige = v9.PRESTIGE.MAX_PRESTIGE;
            v117.rewardsEarned = v119;
        end):finally(function() --[[ Line: 649 ]]
            -- upvalues: v32 (ref)
            task.delay(2, function() --[[ Line: 650 ]]
                -- upvalues: v32 (ref)
                v32:Dispatch(v32.Actions.SetProcessing(false));
            end);
        end);
        return;
    elseif not v117:CanClaimInfiniteLevel() then
        return;
    else
        v117.doPrestigeAnimation = false;
        v32:Dispatch(v32.Actions.SetProcessing(true));
        v21:ClaimInfiniteReward():finally(function() --[[ Line: 668 ]]
            -- upvalues: v32 (ref)
            task.delay(1, function() --[[ Line: 669 ]]
                -- upvalues: v32 (ref)
                v32:Dispatch(v32.Actions.SetProcessing(false));
            end);
        end);
        return;
    end;
end;
v33._resetAnimations = function(v120) --[[ Line: 675 ]] --[[ Name: _resetAnimations ]]
    if v120.animationDump then
        v120.animationDump:Destroy();
    end;
    v120.canClose = false;
    v120.prestigeVisual.ContinueHint.Visible = false;
    v120.prestigeEmblem.UIScale.Scale = 0;
    v120.prestigeEmblem.Icon.ImageTransparency = 1;
    v120.prestigeEmblem.Icon.Icon.UIScale.Scale = 0;
    v120.prestigeEmblem.Icon.Icon.ImageTransparency = 0;
    v120.prestigeText.TextTransparency = 1;
end;
return v33;