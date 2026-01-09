local l_CollectionService_0 = game:GetService("CollectionService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Fusion);
local v11 = require(l_ReplicatedStorage_0.Packages.Tree);
local v12 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v15 = require(v7.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.OlipopQuests);
local v19 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v20 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v22 = require(v7.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local _ = require(v7.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v24 = require(l_ReplicatedFirst_0.PlaceIds);
local v25 = require(l_ReplicatedStorage_0.Levels);
local v26 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v27 = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v28 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v29 = require(v7.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v30 = require(v7.Player.PlayerScripts.Knit.Controllers.UIController.GuiModules.MessagePrompt);
local v31 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v32 = require(l_ReplicatedStorage_0.Shared.Util.PromiseCountryCode);
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = "OLIPOP";
local l_OLIPOP_0 = v14.OLIPOP;
local l_TOTAL_QUESTS_0 = v18.TOTAL_QUESTS;
local v45 = {
    {
        speaker = "FlyingDutchman", 
        message = "Yarrr! I be seekin\226\128\153 a new crew for me grandest voyage yet\226\128\148but not just any scallywags. I need the bold, the brave, and the battle-tested!"
    }, 
    {
        speaker = "Spongebob", 
        message = "And fun! Don\226\128\153t forget fun, Dutchman! We\226\128\153re looking for pirates who love adventure and jellyfishing! But mostly adventure!"
    }, 
    {
        speaker = "FlyingDutchman", 
        message = "Aye\226\128\166 and to join our crew, ye\226\128\153ll need to prove ye\226\128\153re more than just a sponge in square pants. There be five questlines standin\226\128\153 between you and true pirate glory."
    }, 
    {
        speaker = "Spongebob", 
        message = "Each one unlocks the next! First you start with Story Quests\226\128\166 then Challenge Quests\226\128\166 then Raids, etc.! It\226\128\153s like climbing a big ol\226\128\153 Krabby Patty tower!"
    }, 
    {
        speaker = "FlyingDutchman", 
        message = "And at the top o\226\128\153 that tower? The {itemName} Relics. Five of \226\128\152em! Powerful, mystical treasures we need for our epic journey across the cursed seas."
    }, 
    {
        speaker = "Spongebob", 
        message = "If you can find all five and bring \226\128\152em back to us\226\128\148you\226\128\153ll earn some super exclusive rewards! Like, \226\128\152people-write-songs-about-you\226\128\153 kind of rewards!"
    }, 
    {
        speaker = "FlyingDutchman", 
        message = "So\226\128\166 what say ye? Will ye rise to the challenge\226\128\148or walk the plank like the rest of the lily-livered landfolk?"
    }
};
local v46 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v47 = {
    [true] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffea00")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#c74900"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#58290a"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#58290a")
    }, 
    [false] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#948800")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#6a2700"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#58290a"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#58290a")
    }
};
local v48 = {
    "Spongebob", 
    "FlyingDutchman"
};
local v49 = {};
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = false;
local v55 = v8.new();
local v56 = v8.new();
local v57 = v8.new();
local v58 = v8.new();
local v59 = v24:IsLobby() and l_ReplicatedStorage_0.OlipopViewModels;
return {
    primaryMenu = true, 
    isAdvertisementUI = true, 
    blur = true, 
    ToggleAll = {}, 
    rarityVisualObjects = {}, 
    Init = function(v60, v61, v62) --[[ Line: 186 ]] --[[ Name: Init ]]
        -- upvalues: v33 (ref), v7 (copy), v34 (ref), v35 (ref), v36 (ref), v37 (ref), v38 (ref), v39 (ref), v40 (ref), l_TweenService_0 (copy)
        v33 = v7.GetController("UIController");
        v34 = v7.GetController("EventController");
        v35 = v7.GetController("DataController");
        v36 = v7.GetService("UnitService");
        v37 = v7.GetService("TurfWarsService");
        v38 = v7.GetController("AudioController");
        v39 = v7.GetService("MissionService");
        v40 = v7.GetService("OlipopService");
        v60.currentMode = v62;
        v60.ui = v61;
        v60.main = v61.Main;
        local l_Window_0 = v60.main.Window;
        v60.exitButton = l_Window_0.Exit;
        local l_Backdrop_0 = l_Window_0.Backdrop;
        v60.topBackdrop = l_Backdrop_0.Top;
        v60.bottomBackdrop = l_Backdrop_0.Bottom;
        local l_Bar_0 = l_Window_0.TimerBar.Bar;
        v60.timerBarFill = l_Bar_0.Fill;
        v60.timerBarLabel = l_Bar_0.Timer;
        v60.timerBarTitle = l_Bar_0.Title;
        v60.content = l_Window_0.Content;
        local l_Buttons_0 = v60.content.Top.Buttons;
        v60.dialog = v60.content.Dialog;
        v60.speakerLabel = v60.dialog.Title.Title;
        v60.dialogLabel = v60.dialog.Dialog;
        v60.startQuestButton = v60.dialog.Confirm;
        v60.viewportsContainer = v60.dialog.Viewports;
        v60.viewportGradient = v60.viewportsContainer.UIGradient;
        local l_Quests_0 = v60.content.Quests;
        v60.questsContainer = l_Quests_0.Bin;
        v60.questTemplate = v60.questsContainer.Template:Clone();
        v60.finalTemplate = v60.questsContainer.FinalTemplate:Clone();
        v60.titleTemplate = v60.questsContainer.TitleTemplate:Clone();
        v60.pageTemplate = v60.questsContainer.PageTemplate:Clone();
        v60.claimGrandPrize = v60.content.Overview.ClaimGrandPrizes;
        v60.claimGrandPrize.Visible = false;
        local l_Info_0 = v60.content.Info;
        l_Info_0.Visible = false;
        v60.pages = {
            Overview = v60.content.Overview, 
            Quests = l_Quests_0, 
            Info = l_Info_0
        };
        v60.tabButtons = {
            Overview = l_Buttons_0.Overview, 
            Quests = l_Buttons_0.Quests, 
            Info = l_Buttons_0.Info
        };
        v60.questTemplate.Content.Claimed.Visible = false;
        v60.finalTemplate.Content.Claimed.Visible = false;
        v60.questsContainer.Template:Destroy();
        v60.questsContainer.FinalTemplate:Destroy();
        v60.questsContainer.TitleTemplate:Destroy();
        v60.questsContainer.PageTemplate:Destroy();
        v60.tabButtons.Info.Visible = false;
        v60.backdropTweens = {
            top = l_TweenService_0:Create(v60.topBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Position = UDim2.fromScale(0, -1)
            }), 
            bottom = l_TweenService_0:Create(v60.bottomBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Position = UDim2.fromScale(0, 0)
            })
        };
    end, 
    Start = function(v69) --[[ Line: 286 ]] --[[ Name: Start ]]
        -- upvalues: v41 (ref), v33 (ref), v31 (copy), v32 (copy), v42 (ref), l_RunService_0 (copy), v48 (copy), l_UserInputService_0 (copy), v34 (ref), v16 (copy), v40 (ref), v38 (ref), v35 (ref), v7 (copy), v30 (copy)
        v41 = v33:GetModuleAsync("Notification"):expect();
        v69.policyInfo = select(2, v31():await());
        v69.adsAllowed = v69.policyInfo and v69.policyInfo.AreAdsAllowed or false;
        v69.countryCode = select(2, v32():await());
        local l_Info_1 = v69.tabButtons.Info;
        local v71 = false;
        if v69.adsAllowed == true then
            v71 = v69.countryCode == "US";
        end;
        l_Info_1.Visible = v71;
        if not v69.adsAllowed then
            v42 = "Canned Bread";
            v69.main.Window.Content.Overview.Header.Title.Text = "Journey for the Bread Relics";
            v69.main.Window.Content.Overview.Header.Info.Text = "Join SpongeBob and the Flying Dutchman on an adventure for the mystical Bread Relics! Complete quests to collect all 5 Relics and unlock the Grand Prize!";
            v69.main.Window.Title.TitleContainer.Title.Text = "Dutchman's Crew Trials";
        end;
        v69:SetPage("Overview");
        if l_RunService_0:IsStudio() then
            l_Info_1 = 0;
            v71 = {};
            for _, v73 in v48 do
                table.insert(v71, {
                    speaker = v73, 
                    message = ("Test dialog for %*"):format(v73)
                });
            end;
            local l_v71_0 = v71 --[[ copy: 2 -> 8 ]];
            do
                local l_l_Info_1_0 = l_Info_1;
                l_UserInputService_0.InputBegan:Connect(function(v76, v77) --[[ Line: 317 ]]
                    -- upvalues: v33 (ref), l_l_Info_1_0 (ref), l_v71_0 (copy), v69 (copy)
                    if v77 then
                        return;
                    elseif v76.KeyCode == Enum.KeyCode.RightBracket then
                        local v78 = not v33:GetToggleState(script.Name);
                        v33:Toggle(script.Name, v78);
                        return;
                    else
                        if v76.KeyCode == Enum.KeyCode.LeftBracket then
                            l_l_Info_1_0 = l_l_Info_1_0 + 1;
                            if l_l_Info_1_0 > #l_v71_0 then
                                l_l_Info_1_0 = 1;
                            end;
                            v69:_updateDialog(l_v71_0[l_l_Info_1_0]);
                        end;
                        return;
                    end;
                end);
            end;
        end;
        v33:HandleButton(v69.exitButton, function() --[[ Line: 336 ]]
            -- upvalues: v33 (ref)
            v33:Toggle(script.Name, false);
        end);
        l_Info_1, v71 = v34:GetTimestamps();
        l_Info_1 = l_Info_1.UnixTimestamp;
        v71 = v71.UnixTimestamp;
        v34:ObserveTimeLeft(function(v79, _, v81) --[[ Line: 350 ]]
            -- upvalues: v69 (copy), v16 (ref), v71 (ref), l_Info_1 (ref)
            if v81 then
                return;
            else
                v69.timerBarLabel.Text = v16:FormatTimeFromSeconds(v79 or 0);
                local v82 = math.clamp(1 - v79 / (v71 - l_Info_1), 0, 1);
                v69.timerBarFill.Size = UDim2.fromScale(v82, 1);
                return;
            end;
        end);
        v33:HandleButton(v69.claimGrandPrize, function() --[[ Line: 363 ]]
            -- upvalues: v40 (ref), v41 (ref), v38 (ref)
            v40:ClaimGrandPrize():andThen(function(v83, v84) --[[ Line: 364 ]]
                -- upvalues: v41 (ref), v38 (ref)
                if not v83 then
                    v41:Notify({
                        message = v84 or "Something went wrong!", 
                        isPositive = false, 
                        duration = 4
                    });
                    return;
                else
                    v38:PlaySound({
                        name = "UI.Success", 
                        soundGroup = "Master.SFX.UI"
                    });
                    return;
                end;
            end);
        end);
        v69.hasCode = v35:Get(v7.Player, "OLIPOPCode"):expect() ~= nil;
        v35:OnChanged(v7.Player, "OLIPOPCode", function(v85) --[[ Line: 384 ]]
            -- upvalues: v69 (copy)
            local v86 = v85 and v85.code;
            v69.hasCode = v86 ~= nil;
            v69.main.Window.Content.Info.CodeEarned.List.RewardInfo.PromoCode.Text = v86 or "";
            v69.main.Window.Content.Info.CodeEarned.Visible = v86 ~= nil;
            v69.main.Window.Content.Info.Instructions.Visible = v86 == nil;
        end, true);
        v40.NotifyOLIPOPCodeReward:Connect(function(v87) --[[ Line: 393 ]]
            -- upvalues: v69 (copy), v30 (ref), v33 (ref)
            if not v69.main.Window.Content.Info.CodeEarned.Visible then
                v69.main.Window.Content.Info.CodeEarned.PromoCode.Text = v87;
                v69.main.Window.Content.Info.CodeEarned.Visible = true;
            end;
            v30:Prompt({
                message = "Ye be one of today\226\128\153s lucky winners!\nYou have received a FREE OLIPOP code!", 
                options = {
                    {
                        text = "Ok!", 
                        callback = function() --[[ Line: 404 ]]
                            -- upvalues: v69 (ref)
                            v69:SetPage("Info");
                        end
                    }
                }
            });
            v33:Toggle(script.Name, true);
        end);
        v69:_setupRelicsAndPrizes();
        v69.nextCodesAt = v40.NextCodesTimestamp:OnReady():expect();
        v69.codesRemaining = v40.CodesRemaining:OnReady():expect();
        v40.NextCodesTimestamp:Observe(function(v88) --[[ Line: 419 ]]
            -- upvalues: v69 (copy), v33 (ref)
            v69.nextCodesAt = v88;
            if typeof(v69.codesRemaining) ~= "number" then
                return;
            else
                if v69.codesRemaining < 1 and v33:GetToggleState(script.Name) then
                    v69:_startNextCodeReleaseCountdown();
                end;
                return;
            end;
        end);
        local l_Remaining_0 = v69.main.Window.Content.Info.Instructions.Remaining;
        l_Remaining_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 433 ]]
            -- upvalues: v69 (copy), l_Remaining_0 (copy)
            v69.main.Window.Content.Info.Instructions.Title.Visible = l_Remaining_0.Visible;
        end);
        v40.CodesRemaining:Observe(function(v90) --[[ Line: 437 ]]
            -- upvalues: v69 (copy), v33 (ref)
            v69.codesRemaining = v90;
            if v69._outOfStock then
                return;
            else
                if typeof(v69.codesRemaining) == "number" then
                    v69.main.Window.Content.Info.Instructions.Remaining.Text = ("%* REMAINING"):format(v69.codesRemaining);
                else
                    v69.main.Window.Content.Info.Instructions.Remaining.Text = v69.codesRemaining or "";
                end;
                v69.main.Window.Content.Info.Instructions.Remaining.Visible = true;
                v69.main.Window.Content.Info.Instructions.Countdown.Visible = false;
                v69.main.Window.Content.Info.Instructions.CountdownTitle.Visible = false;
                if v69.hasCode then
                    return;
                else
                    v69.main.Window.Content.Info.Instructions.Visible = true;
                    v69.main.Window.Content.Info.CodeEarned.Visible = false;
                    if typeof(v69.codesRemaining) == "number" and v69.codesRemaining < 1 then
                        if v33:GetToggleState(script.Name) then
                            v69:_startNextCodeReleaseCountdown();
                        end;
                        return;
                    else
                        return;
                    end;
                end;
            end;
        end);
        v40.OlipopOutOfStock:Observe(function(v91) --[[ Line: 469 ]]
            -- upvalues: v69 (copy)
            v69._outOfStock = v91;
            if v69.hasCode then
                return;
            else
                v69.main.Window.Content.Info.Instructions.Visible = not v91;
                v69.main.Window.Content.Info.OutOfStock.Visible = v91;
                return;
            end;
        end);
    end, 
    Opening = function(v92) --[[ Line: 481 ]] --[[ Name: Opening ]]
        -- upvalues: v35 (ref), v7 (copy), l_OLIPOP_0 (copy), v59 (copy), l_ContentProvider_0 (copy), v55 (copy), v33 (ref), v37 (ref), v54 (ref), l_RunService_0 (copy), l_TOTAL_QUESTS_0 (copy), l_TweenService_0 (copy), v18 (copy), v57 (copy), v16 (copy), v25 (copy), v8 (copy), v15 (copy), v40 (ref), v41 (ref), v38 (ref), v12 (copy), v50 (ref), v49 (copy), v45 (copy)
        if v92.rarityVisualObjects then
            for _, v94 in v92.rarityVisualObjects do
                if v94:GetAttribute("Rarity") then
                    v94:AddTag("VisualizeRarity");
                end;
            end;
        end;
        local v95 = v35:Get(v7.Player, l_OLIPOP_0.DATA_KEY):expect();
        if not v92.preloadedViewModels then
            local l_v59_Children_0 = v59:GetChildren();
            task.spawn(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, l_v59_Children_0);
            v92.preloadedViewModels = true;
        end;
        v92.topBackdrop.Position = UDim2.fromScale(0, 0);
        v92.bottomBackdrop.Position = UDim2.fromScale(0, 1);
        v55:Add(function() --[[ Line: 502 ]]
            -- upvalues: v92 (copy)
            for _, v98 in v92.backdropTweens do
                v98:Cancel();
            end;
        end);
        for _, v100 in v92.backdropTweens do
            v100:Play();
        end;
        local v101 = true;
        v92.startQuestButton.Visible = false;
        v92.tabButtons.Quests.Content.Locked.Visible = false;
        if not v101 then
            v55:Add(v33:HandleButton(v92.startQuestButton, function() --[[ Line: 523 ]]
                -- upvalues: v37 (ref), v101 (ref), v92 (copy), v54 (ref)
                v37:StartQuest():andThen(function(v102) --[[ Line: 524 ]]
                    -- upvalues: v101 (ref), v92 (ref), v54 (ref)
                    if not v102 then
                        return;
                    else
                        v101 = true;
                        v92.startQuestButton.Visible = false;
                        v92.tabButtons.Quests.Content.Locked.Visible = false;
                        v54 = true;
                        return;
                    end;
                end);
            end));
        end;
        v55:Add(l_RunService_0.RenderStepped:Connect(function(v103) --[[ Line: 539 ]]
            -- upvalues: v92 (copy)
            local l_UIGradient_0 = v92.main.Window.Content.Info.CodeEarned.List.RewardInfo.UIStroke.UIGradient;
            l_UIGradient_0.Rotation = l_UIGradient_0.Rotation + 30 * v103;
        end));
        v55:Add(v33:HandleButton(v92.tabButtons.Overview, function() --[[ Line: 543 ]]
            -- upvalues: v92 (copy)
            v92:SetPage("Overview");
        end));
        v55:Add(v33:HandleButton(v92.tabButtons.Info, function() --[[ Line: 547 ]]
            -- upvalues: v92 (copy)
            if not v92.countryCode or v92.countryCode ~= "US" then
                return;
            else
                v92:SetPage("Info");
                return;
            end;
        end));
        v55:Add(v33:HandleButton(v92.tabButtons.Quests, function() --[[ Line: 555 ]]
            -- upvalues: v92 (copy)
            v92:SetPage("Quests");
        end));
        v55:Add(v35:OnChanged(v7.Player, "Inventory", function(v105) --[[ Line: 559 ]]
            -- upvalues: v92 (copy)
            v105 = v105 or {};
            v92.inventory = v105;
            for v106, v107 in v92.relicSlots do
                if not v105[v106] then
                    v107.Content.LockedState.Visible = true;
                else
                    v107.Content.LockedState.Visible = false;
                end;
            end;
        end, true));
        local v108 = {};
        local v109 = {};
        local function _() --[[ Line: 577 ]] --[[ Name: updateQuestDialog ]]

        end;
        local function v118(v111, v112, v113) --[[ Line: 581 ]] --[[ Name: toggleQuestDetails ]]
            -- upvalues: l_TOTAL_QUESTS_0 (ref)
            local l_Content_0 = v111.frame.Content;
            local l_Claim_0 = l_Content_0.Info.Claim;
            if not v113 then
                l_Content_0.Title.Visible = v112;
            end;
            l_Claim_0.Visible = v112;
            if v111.index == l_TOTAL_QUESTS_0 then
                return;
            else
                for _, v117 in v111.rewardVisualizers do
                    v117:GetButton(1).Interactable = v112;
                end;
                return;
            end;
        end;
        local function _() --[[ Line: 600 ]] --[[ Name: scrollToActiveQuest ]]
            -- upvalues: v108 (copy), v95 (ref), l_RunService_0 (ref), v92 (copy), l_TweenService_0 (ref)
            local v119 = v108[v95.questline] and v108[v95.questline][v95.quest];
            if not v119 then
                return;
            else
                local l_frame_0 = v119.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 608 ]]
                    -- upvalues: v92 (ref), l_frame_0 (copy), l_TweenService_0 (ref)
                    local v121 = v92.questsContainer.CanvasPosition.Y + l_frame_0.AbsolutePosition.Y - v92.questsContainer.AbsolutePosition.Y - (v92.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_0.AbsoluteSize.Y / 2);
                    if v121 < 0 or v92.questsContainer.AbsoluteCanvasSize.Y < v121 then
                        v121 = 0;
                    end;
                    local v122 = l_TweenService_0:Create(v92.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v121)
                    });
                    v122.Completed:Once(function() --[[ Line: 623 ]]
                        -- upvalues: v122 (copy)
                        v122:Destroy();
                    end);
                    v122:Play();
                end);
                return;
            end;
        end;
        local function v132(v124, v125) --[[ Line: 631 ]] --[[ Name: updateQuestState ]]
            -- upvalues: v108 (copy), v18 (ref), v95 (ref), v118 (copy)
            local v126 = v108[v125] and v108[v125][v124];
            if not v126 then
                warn("No quest entry found for index:", v124, "and questline:", v125);
                return;
            else
                local l_Content_1 = v126.frame.Content;
                local v128 = v18.util.IsQuestCompleted(v95, v124, v125);
                if v128 then
                    l_Content_1.Claimed.Visible = true;
                    v118(v126, false, true);
                end;
                if v95.questline == v125 and v124 <= v95.quest then
                    l_Content_1.Blocked.Visible = false;
                    if not v128 then
                        v118(v126, true);
                    end;
                    return;
                elseif v128 then
                    return;
                else
                    local v129 = v124 - 1;
                    local l_v125_0 = v125;
                    if v129 < 1 then
                        l_v125_0 = math.clamp(l_v125_0, 1, 1e999);
                        v129 = 5;
                    end;
                    if v18.util.GetQuestInfo(v95, v129, l_v125_0) then
                        local v131 = v18.util.IsQuestCompleted(v95, v129, l_v125_0);
                        l_Content_1.Blocked.Visible = not v131;
                        v118(v126, v131);
                        if not v131 then
                            return;
                        end;
                    else
                        warn("no previous quest info for", v124, v125);
                    end;
                    v118(v126, true);
                    return;
                end;
            end;
        end;
        local function _() --[[ Line: 699 ]] --[[ Name: updateGrandPrizeClaimVisibility ]]
            -- upvalues: v92 (copy), v18 (ref), v95 (ref)
            v92.claimGrandPrize.Visible = v18.util.AreAllCompleted(v95);
            v92.claimGrandPrize.Claimed.Visible = v95.claimedGrandPrize;
            v92.claimGrandPrize.Content.Visible = not v92.claimGrandPrize.Claimed.Visible;
            v92.claimGrandPrize.Interactable = not v95.claimedGrandPrize;
        end;
        local function v138() --[[ Line: 706 ]] --[[ Name: updateAllQuestStates ]]
            -- upvalues: v108 (copy), v132 (copy), v92 (copy), v18 (ref), v95 (ref)
            for v134, v135 in v108 do
                for v136, _ in v135 do
                    v132(v136, v134);
                end;
            end;
            v92.claimGrandPrize.Visible = v18.util.AreAllCompleted(v95);
            v92.claimGrandPrize.Claimed.Visible = v95.claimedGrandPrize;
            v92.claimGrandPrize.Content.Visible = not v92.claimGrandPrize.Claimed.Visible;
            v92.claimGrandPrize.Interactable = not v95.claimedGrandPrize;
        end;
        v92.claimGrandPrize.Visible = v18.util.AreAllCompleted(v95);
        v92.claimGrandPrize.Claimed.Visible = v95.claimedGrandPrize;
        v92.claimGrandPrize.Content.Visible = not v92.claimGrandPrize.Claimed.Visible;
        v92.claimGrandPrize.Interactable = not v95.claimedGrandPrize;
        local v139 = {
            [1] = "Story", 
            [2] = "Challenge", 
            [3] = "Raid", 
            [4] = "Boss Battle", 
            [5] = "Rogue"
        };
        local function v186() --[[ Line: 726 ]] --[[ Name: refreshQuests ]]
            -- upvalues: v57 (ref), v92 (copy), v108 (copy), v109 (copy), v18 (ref), v95 (ref), l_TOTAL_QUESTS_0 (ref), v139 (copy), v16 (ref), v25 (ref), v8 (ref), v15 (ref), l_OLIPOP_0 (ref), v35 (ref), v7 (ref), v40 (ref), v41 (ref), v118 (copy), v38 (ref), v33 (ref), v132 (copy), v12 (ref)
            v57:Destroy();
            v57:Add(function() --[[ Line: 728 ]]
                -- upvalues: v92 (ref), v108 (ref), v109 (ref)
                v92:_clearQuests();
                table.clear(v108);
                table.clear(v109);
            end);
            if v18.util.IsQuestCompleted(v95, l_TOTAL_QUESTS_0) then
                return;
            else
                local function v176(v140, v141, v142) --[[ Line: 740 ]] --[[ Name: addQuest ]]
                    -- upvalues: v109 (ref), v92 (ref), v139 (ref), v16 (ref), v25 (ref), v8 (ref), v15 (ref), v108 (ref), l_OLIPOP_0 (ref), v35 (ref), v7 (ref), v40 (ref), v41 (ref), v118 (ref), v38 (ref), v33 (ref), v18 (ref), v95 (ref), v132 (ref)
                    if v141 == 1 then
                        v109[v142] = v92.pageTemplate:Clone();
                        v109[v142].Name = ("Questline_%*"):format(v142);
                        v109[v142].LayoutOrder = v142;
                        v109[v142].Parent = v92.questsContainer;
                        local v143 = v92.titleTemplate:Clone();
                        v143.Name = ("Questline_%*"):format(v142);
                        v143.Title.Text = ("%* Quests"):format(v139[v142]);
                        v143.LayoutOrder = -1;
                        v143.Parent = v109[v142];
                    end;
                    local l_objective_0 = v140.objective;
                    local v145 = if v141 < 5 then v92.questTemplate:Clone() else v92.finalTemplate:Clone();
                    local l_Content_2 = v145.Content;
                    v145.Visible = true;
                    v145.Name = ("Quest_%*"):format(v141);
                    v145.LayoutOrder = v141;
                    if l_objective_0 then
                        local v147 = string.upper((("Quest %*"):format((string.format("%0.2i", v141)))));
                        l_Content_2.Title.Title.Text = ("%*"):format(v147);
                        while true do
                            local v148, v149 = string.find(l_objective_0, "<rich>.-</rich>");
                            if v148 and v149 then
                                local v150 = utf8.len(l_objective_0);
                                l_objective_0 = ("%*</font>%*"):format(string.sub(l_objective_0, 1, v148 - 1) .. ("<font color=\"#ebff33\">%*"):format((string.sub(l_objective_0, v148 + 6, v149 - 7))), (string.sub(l_objective_0, v149 + 1, v150)));
                            else
                                break;
                            end;
                        end;
                        l_objective_0 = string.gsub(l_objective_0, "<amount>", v16:CommaNumber(v140.required));
                        if v140.map then
                            local v151 = nil;
                            for _, v153 in v25.Stages do
                                for v154, v155 in v153 do
                                    if v154 == v140.map then
                                        v151 = v155.DisplayName;
                                        break;
                                    end;
                                end;
                            end;
                            l_objective_0 = string.gsub(l_objective_0, "<map>", v151);
                        end;
                        if v141 < 5 then
                            l_Content_2.Info.Description.Text = l_objective_0;
                        end;
                    end;
                    local v156 = v8.new();
                    v156:AttachTo(v145);
                    local v157 = {};
                    local v158 = 1;
                    if not v92.adsAllowed and v141 == 5 then
                        v158 = 2;
                    end;
                    table.insert(v157, v15.new({
                        v140.rewards[v158]
                    }, {
                        template = l_Content_2.Rewards.Primary, 
                        parent = l_Content_2.Rewards, 
                        hideOwnedAmount = #v140.rewards > 1, 
                        hideExistCount = true, 
                        retainLayoutOrder = true, 
                        tooltipPredicate = function(v159) --[[ Line: 821 ]] --[[ Name: tooltipPredicate ]]
                            return v159.Interactable;
                        end
                    }));
                    if #v140.rewards > 1 then
                        local v160 = 2;
                        if not v92.adsAllowed then
                            v160 = 3;
                        end;
                        table.insert(v157, v15.new({
                            v140.rewards[v160]
                        }, {
                            template = l_Content_2.Rewards.Secondary, 
                            parent = l_Content_2.Rewards, 
                            hideOwnedAmount = true, 
                            hideExistCount = true, 
                            retainLayoutOrder = true, 
                            tooltipPredicate = function(v161) --[[ Line: 842 ]] --[[ Name: tooltipPredicate ]]
                                return v161.Interactable;
                            end
                        }));
                    end;
                    for _, v163 in v157 do
                        v156:Add(v163);
                    end;
                    v145.Parent = v109[v142];
                    local v164 = {
                        index = v141, 
                        frame = v145, 
                        questInfo = v140, 
                        rewardVisualizers = v157
                    };
                    if not v108[v142] then
                        v108[v142] = {};
                    end;
                    v108[v142][v141] = v164;
                    local l_Claim_1 = l_Content_2.Info.Claim;
                    if l_objective_0 then
                        local l_NotCompleted_0 = l_Claim_1.Content.NotCompleted;
                        local l_Fill_0 = l_NotCompleted_0.Fill;
                        local l_Amount_0 = l_NotCompleted_0.Amount;
                        local v169 = {
                            l_OLIPOP_0.DATA_KEY, 
                            "progress", 
                            v142, 
                            v141
                        };
                        local l_l_NotCompleted_0_0 = l_NotCompleted_0 --[[ copy: 11 -> 18 ]];
                        v156:Add(v35:OnChanged(v7.Player, v169, function(v171) --[[ Line: 877 ]]
                            -- upvalues: l_l_NotCompleted_0_0 (copy), v140 (copy), l_Fill_0 (copy), l_Amount_0 (copy), v16 (ref)
                            l_l_NotCompleted_0_0.Visible = v171 < v140.required;
                            l_Fill_0.Size = UDim2.fromScale(v171 / v140.required, 1);
                            l_Amount_0.Text = ("%*/%*"):format(v16:CommaNumber(v171), (v16:CommaNumber(v140.required)));
                            if v171 == v140.required then

                            end;
                        end, true));
                    end;
                    local function _(v172) --[[ Line: 888 ]] --[[ Name: claimQuest ]]
                        -- upvalues: v40 (ref), v41 (ref), l_Content_2 (copy), l_Claim_1 (copy), v118 (ref), v164 (copy), v38 (ref)
                        v40:ClaimQuest(v172):andThen(function(v173) --[[ Line: 889 ]]
                            -- upvalues: v41 (ref), l_Content_2 (ref), l_Claim_1 (ref), v118 (ref), v164 (ref), v38 (ref)
                            if not v173 then
                                v41:Notify({
                                    message = "Something went wrong!", 
                                    isPositive = false, 
                                    duration = 4
                                });
                                return;
                            else
                                l_Content_2.Claimed.Visible = true;
                                l_Claim_1.Visible = false;
                                v118(v164, false, true);
                                v38:PlaySound({
                                    name = "UI.Success", 
                                    soundGroup = "Master.SFX.UI"
                                });
                                return;
                            end;
                        end);
                    end;
                    v33:HandleButton(l_Claim_1, function() --[[ Line: 911 ]]
                        -- upvalues: v18 (ref), v95 (ref), v141 (copy), v142 (copy), v140 (copy), v41 (ref), v40 (ref), l_Content_2 (copy), l_Claim_1 (copy), v118 (ref), v164 (copy), v38 (ref)
                        if v18.util.IsQuestCompleted(v95, v141, v142) then
                            return;
                        elseif v18.util.GetProgress(v95, v141, v142) < v140.required then
                            v41:Notify({
                                message = "Quest not complete!", 
                                isPositive = false, 
                                duration = 4
                            });
                            return;
                        else
                            v40:ClaimQuest(nil):andThen(function(v175) --[[ Line: 889 ]]
                                -- upvalues: v41 (ref), l_Content_2 (ref), l_Claim_1 (ref), v118 (ref), v164 (ref), v38 (ref)
                                if not v175 then
                                    v41:Notify({
                                        message = "Something went wrong!", 
                                        isPositive = false, 
                                        duration = 4
                                    });
                                    return;
                                else
                                    l_Content_2.Claimed.Visible = true;
                                    l_Claim_1.Visible = false;
                                    v118(v164, false, true);
                                    v38:PlaySound({
                                        name = "UI.Success", 
                                        soundGroup = "Master.SFX.UI"
                                    });
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end);
                    v132(v141, v142);
                end;
                local v177 = false;
                v57:Add(function() --[[ Line: 935 ]]
                    -- upvalues: v177 (ref)
                    v177 = true;
                end);
                for v178, v179 in v18.util.GetAllQuests(v95) do
                    local v180 = string.match(v178, "%d+");
                    v180 = v180 and tonumber(v180);
                    if not v180 then
                        --[[ close >= 8 ]]
                    else
                        do
                            local l_v180_0 = v180;
                            v12.each(v179, function(v182, v183) --[[ Line: 949 ]]
                                -- upvalues: v12 (ref), v177 (ref), v176 (copy), l_v180_0 (ref)
                                return v12.defer(function(v184, v185) --[[ Line: 950 ]]
                                    -- upvalues: v177 (ref), v176 (ref), v182 (copy), v183 (copy), l_v180_0 (ref)
                                    if v177 then
                                        return v185();
                                    else
                                        v184(v176(v182, v183, l_v180_0));
                                        return;
                                    end;
                                end);
                            end);
                        end;
                    end;
                end;
                return;
            end;
        end;
        local v187 = v50 ~= "Quests";
        v49.Quests = function() --[[ Line: 963 ]]
            -- upvalues: v187 (ref), v186 (copy), v108 (copy), v95 (ref), l_RunService_0 (ref), v92 (copy), l_TweenService_0 (ref)
            if v187 then
                v186();
                v187 = false;
            end;
            local v188 = v108[v95.questline] and v108[v95.questline][v95.quest];
            if not v188 then
                return;
            else
                local l_frame_1 = v188.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 608 ]]
                    -- upvalues: v92 (ref), l_frame_1 (copy), l_TweenService_0 (ref)
                    local v190 = v92.questsContainer.CanvasPosition.Y + l_frame_1.AbsolutePosition.Y - v92.questsContainer.AbsolutePosition.Y - (v92.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_1.AbsoluteSize.Y / 2);
                    if v190 < 0 or v92.questsContainer.AbsoluteCanvasSize.Y < v190 then
                        v190 = 0;
                    end;
                    local v191 = l_TweenService_0:Create(v92.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v190)
                    });
                    v191.Completed:Once(function() --[[ Line: 623 ]]
                        -- upvalues: v191 (copy)
                        v191:Destroy();
                    end);
                    v191:Play();
                end);
                return;
            end;
        end;
        v55:Add(v35:OnChanged(v7.Player, {
            l_OLIPOP_0.DATA_KEY, 
            "quest"
        }, function() --[[ Line: 973 ]]
            -- upvalues: v95 (ref), v35 (ref), v7 (ref), l_OLIPOP_0 (ref), v138 (copy), v50 (ref), v108 (copy), l_RunService_0 (ref), v92 (copy), l_TweenService_0 (ref), v54 (ref)
            v95 = v35:Get(v7.Player, l_OLIPOP_0.DATA_KEY):expect();
            v138();
            if v50 == "Quests" then
                local v192 = v108[v95.questline] and v108[v95.questline][v95.quest];
                if v192 then
                    local l_frame_2 = v192.frame;
                    l_RunService_0.PreRender:Once(function() --[[ Line: 608 ]]
                        -- upvalues: v92 (ref), l_frame_2 (copy), l_TweenService_0 (ref)
                        local v194 = v92.questsContainer.CanvasPosition.Y + l_frame_2.AbsolutePosition.Y - v92.questsContainer.AbsolutePosition.Y - (v92.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_2.AbsoluteSize.Y / 2);
                        if v194 < 0 or v92.questsContainer.AbsoluteCanvasSize.Y < v194 then
                            v194 = 0;
                        end;
                        local v195 = l_TweenService_0:Create(v92.questsContainer, TweenInfo.new(0.2), {
                            CanvasPosition = Vector2.new(0, v194)
                        });
                        v195.Completed:Once(function() --[[ Line: 623 ]]
                            -- upvalues: v195 (copy)
                            v195:Destroy();
                        end);
                        v195:Play();
                    end);
                end;
            end;
            if v54 then
                v92:SetPage("Quests");
                v54 = false;
            end;
        end));
        v55:Add(v35:OnChanged(v7.Player, {
            l_OLIPOP_0.DATA_KEY, 
            "claimedGrandPrize"
        }, function() --[[ Line: 988 ]]
            -- upvalues: v95 (ref), v35 (ref), v7 (ref), l_OLIPOP_0 (ref), v138 (copy)
            v95 = v35:Get(v7.Player, l_OLIPOP_0.DATA_KEY):expect();
            v138();
        end));
        v55:Add(v35:OnChanged(v7.Player, {
            l_OLIPOP_0.DATA_KEY, 
            "completion", 
            l_TOTAL_QUESTS_0
        }, function(v196) --[[ Line: 996 ]]
            -- upvalues: v186 (copy)
            if v196 then
                v186();
            end;
        end));
        if v50 == "Quests" then
            v186();
            local v197 = v108[v95.questline] and v108[v95.questline][v95.quest];
            if v197 then
                local l_frame_3 = v197.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 608 ]]
                    -- upvalues: v92 (copy), l_frame_3 (copy), l_TweenService_0 (ref)
                    local v199 = v92.questsContainer.CanvasPosition.Y + l_frame_3.AbsolutePosition.Y - v92.questsContainer.AbsolutePosition.Y - (v92.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_3.AbsoluteSize.Y / 2);
                    if v199 < 0 or v92.questsContainer.AbsoluteCanvasSize.Y < v199 then
                        v199 = 0;
                    end;
                    local v200 = l_TweenService_0:Create(v92.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v199)
                    });
                    v200.Completed:Once(function() --[[ Line: 623 ]]
                        -- upvalues: v200 (copy)
                        v200:Destroy();
                    end);
                    v200:Play();
                end);
            end;
        end;
        v92._doingDialog = false;
        v49.Overview = function() --[[ Line: 1011 ]]
            -- upvalues: v92 (copy), v45 (ref), v33 (ref)
            if v92._doingDialog then
                return;
            else
                v92._doingDialog = true;
                task.spawn(function() --[[ Line: 1018 ]]
                    -- upvalues: v45 (ref), v33 (ref), v92 (ref)
                    for _, v202 in v45 do
                        if v33:GetToggleState(script.Name) then
                            v92:_updateDialog(v202);
                            task.wait(v202.duration or 5);
                        else
                            break;
                        end;
                    end;
                    v92:_updateDialog({
                        message = "Complete these exclusive {questType} quests for some awesome rewards!"
                    });
                    v92._doingDialog = false;
                end);
                return;
            end;
        end;
        if v50 == "Overview" then
            task.spawn(function() --[[ Line: 1034 ]]
                -- upvalues: v49 (ref)
                v49.Overview();
            end);
        end;
        if typeof(v92.codesRemaining) == "number" and v92.codesRemaining < 1 then
            v92:_startNextCodeReleaseCountdown();
        end;
        v55:Add(function() --[[ Line: 1043 ]]
            -- upvalues: v49 (ref)
            table.clear(v49);
        end);
        v92.claimGrandPrize.Visible = v18.util.AreAllCompleted(v95);
        v92.claimGrandPrize.Claimed.Visible = v95.claimedGrandPrize;
        v92.claimGrandPrize.Content.Visible = not v92.claimGrandPrize.Claimed.Visible;
        v92.claimGrandPrize.Interactable = not v95.claimedGrandPrize;
    end, 
    Closed = function(v203) --[[ Line: 1050 ]] --[[ Name: Closed ]]
        -- upvalues: v55 (copy), v56 (copy), v57 (copy), v58 (copy), v52 (ref), v51 (ref), v54 (ref)
        v55:Destroy();
        v56:Destroy();
        v57:Destroy();
        v58:Destroy();
        v52 = nil;
        v51 = nil;
        v54 = false;
        if v203.rarityVisualObjects then
            for _, v205 in v203.rarityVisualObjects do
                v205:RemoveTag("VisualizeRarity");
            end;
        end;
    end, 
    SetPage = function(v206, v207) --[[ Line: 1068 ]] --[[ Name: SetPage ]]
        -- upvalues: v50 (ref), v49 (copy), v58 (copy), v47 (copy), v11 (copy)
        if not v206.pages[v207] then
            return;
        elseif v50 == v207 then
            return;
        else
            v50 = v207;
            local v208 = v49[v50];
            if v208 then
                v208();
            end;
            v206.dialog.Visible = v50 ~= "Standings";
            if v50 ~= "Standings" then
                v58:Destroy();
            end;
            for v209, v210 in v206.pages do
                v210.Visible = v209 == v207;
            end;
            for v211, v212 in v206.tabButtons do
                local l_v47_0 = v47;
                local v214 = v211 == v207;
                for v215, v216 in l_v47_0[v214] do
                    if v11.Exists(v212, v215) then
                        v11.Find(v212, v215).Color = v216;
                    end;
                end;
            end;
            return;
        end;
    end, 
    _startNextCodeReleaseCountdown = function(v217) --[[ Line: 1106 ]] --[[ Name: _startNextCodeReleaseCountdown ]]
        -- upvalues: v55 (copy), v16 (copy), v28 (copy)
        if not v217.adsAllowed then
            return;
        elseif v217.countryCode and v217.countryCode ~= "US" then
            return;
        elseif v217.hasCode or v217._outOfStock then
            return;
        elseif typeof(v217.codesRemaining) == "number" and v217.codesRemaining >= 1 then
            return;
        else
            v217.main.Window.Content.Info.Instructions.Visible = true;
            v217.main.Window.Content.Info.CodeEarned.Visible = false;
            local v218 = v217.nextCodesAt - workspace:GetServerTimeNow();
            v217.main.Window.Content.Info.Instructions.Countdown.Visible = true;
            v217.main.Window.Content.Info.Instructions.CountdownTitle.Visible = true;
            v217.main.Window.Content.Info.Instructions.Remaining.Visible = false;
            local l_Countdown_0 = v217.main.Window.Content.Info.Instructions.Countdown;
            local _ = v217.main.Window.Content.Info.Instructions.CountdownTitle;
            local function v221() --[[ Line: 1138 ]] --[[ Name: update ]]
                -- upvalues: v218 (ref), v55 (ref), v217 (copy), l_Countdown_0 (copy), v16 (ref)
                if v218 < 1 then
                    if v55 and v55:Get("NextCodeReleaseCountdown") then
                        v55:Remove("NextCodeReleaseCountdown");
                    end;
                    if typeof(v217.codesRemaining) == "number" and v217.codesRemaining < 1 then
                        l_Countdown_0.Text = "Codes Refreshing...";
                    end;
                    return;
                else
                    l_Countdown_0.Text = ("Check back in %*!"):format((v16:FormatTimeFromSeconds(v218)));
                    return;
                end;
            end;
            v55:Add(v28.Simple(1, function() --[[ Line: 1154 ]]
                -- upvalues: v218 (ref), v221 (copy)
                v218 = v218 - 1;
                v221();
            end), "NextCodeReleaseCountdown");
            v221();
            return;
        end;
    end, 
    _updateDialog = function(v222, v223) --[[ Line: 1162 ]] --[[ Name: _updateDialog ]]
        -- upvalues: v18 (copy), v51 (ref), v52 (ref), v20 (copy), v59 (copy), v16 (copy), v46 (copy), v53 (ref), v55 (copy), v56 (copy), v17 (copy), v19 (copy)
        local l_message_0 = v223.message;
        local v225 = v223.speaker or "Spongebob";
        local v226 = "Dutchman's";
        local v227 = "Bread";
        if v222.adsAllowed then
            v226 = "OLIPOP";
            v227 = "OLIPOP";
        end;
        if string.find(l_message_0, "{questType}") then
            l_message_0 = string.gsub(l_message_0, "{questType}", v226);
        end;
        if string.find(l_message_0, "{itemName}") then
            l_message_0 = string.gsub(l_message_0, "{itemName}", v227);
        end;
        if v223.questData then
            local v228 = v18.util.GetQuestInfo(v223.questData);
            local v229 = v18.util.IsQuestFinished(v223.questData);
            local v230 = v229 and "complete" or "intro";
            l_message_0 = v228.dialogue[v230] or v228.dialogue.intro;
            v225 = if v229 then v228.dialogue.outroSpeaker or v228.dialogue.speaker else v228.dialogue.speaker;
        end;
        if not l_message_0 or v51 == l_message_0 and v52 == v225 then
            return;
        else
            if v225 ~= v52 then
                local v231 = v20.new(v222.viewportsContainer, v225, {
                    container = v59, 
                    AnchorPoint = Vector2.zero, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(-1, 0)
                });
                local l_viewport_0 = v231.viewHandler.viewport;
                v222.viewportGradient:Clone().Parent = l_viewport_0;
                v16:Tween(l_viewport_0, v46, {
                    Position = UDim2.new()
                });
                if v53 then
                    local l_v53_0 = v53;
                    local l_viewport_1 = l_v53_0.viewHandler.viewport;
                    v16:Tween(l_viewport_1, v46, {
                        Position = UDim2.fromScale(1, 0)
                    }, function() --[[ Line: 1237 ]]
                        -- upvalues: l_v53_0 (copy)
                        l_v53_0:Destroy();
                    end);
                end;
                v53 = v231;
                if v55:Get("DialogViewportCleanup") then
                    v55:Remove("DialogViewportCleanup", true);
                end;
                v55:Add(function() --[[ Line: 1249 ]]
                    -- upvalues: v231 (copy), v53 (ref)
                    v231:Destroy();
                    v53 = nil;
                end, "DialogViewportCleanup");
            end;
            v56:Destroy();
            v51 = l_message_0;
            v52 = v225;
            local v235 = utf8.len(l_message_0) * 0.025;
            v222.dialogLabel.Text = l_message_0;
            v222.dialogLabel.MaxVisibleGraphemes = 0;
            v222.speakerLabel.Text = v17:GetUnitValue(v225, "FullName");
            local v237 = v19("IntValue", 0, TweenInfo.new(v235, Enum.EasingStyle.Linear), {
                Value = utf8.len(v222.dialogLabel.Text)
            }, function(v236) --[[ Line: 1273 ]]
                -- upvalues: v222 (copy)
                v222.dialogLabel.MaxVisibleGraphemes = v236;
            end);
            v56:Add(v237);
            return;
        end;
    end, 
    _clearQuests = function(v238) --[[ Line: 1281 ]] --[[ Name: _clearQuests ]]
        -- upvalues: v22 (copy)
        v22.deferClearBrowser(v238.questsContainer, {
            filterClass = "Frame", 
            forceDefer = true, 
            predicate = function(v239) --[[ Line: 1287 ]] --[[ Name: predicate ]]
                -- upvalues: v238 (copy)
                return v239 ~= v238.stardomFrame;
            end
        });
    end, 
    _setupRelicsAndPrizes = function(v240) --[[ Line: 1294 ]] --[[ Name: _setupRelicsAndPrizes ]]
        -- upvalues: v26 (copy), v27 (copy), v33 (ref), v29 (copy), v17 (copy), v16 (copy), l_CollectionService_0 (copy)
        v240.relicSlots = {};
        local function v245(v241) --[[ Line: 1297 ]] --[[ Name: relicSlotAdded ]]
            -- upvalues: v240 (copy), v26 (ref), v27 (ref), v33 (ref), v29 (ref)
            local v242 = string.match(v241.Name, "%d+") or 0;
            v242 = v242 and tonumber(v242);
            if not v242 then
                return;
            else
                local v243 = ("OlipopRelic%*"):format(v242);
                if not v240.adsAllowed then
                    v243 = ("BreadRelic%*"):format(v242);
                end;
                local l_v26_ByItemName_0 = v26:GetByItemName(v243);
                if not l_v26_ByItemName_0 then
                    return;
                else
                    if l_v26_ByItemName_0.iconSpriteSheet then
                        v27:SetImage(v241.Content.Icon, v243, l_v26_ByItemName_0.iconSpriteSheet);
                    else
                        v241.Content.Icon.Image = l_v26_ByItemName_0.icon or "";
                    end;
                    v240.relicSlots[v243] = v241;
                    v241.Content.Backdrop:SetAttribute("Rarity", l_v26_ByItemName_0.Rarity);
                    table.insert(v240.rarityVisualObjects, v241.Content.Backdrop);
                    v33:HandleButton(v241);
                    v29.new(v241, {
                        Name = v243
                    });
                    return;
                end;
            end;
        end;
        local function v250(v246) --[[ Line: 1339 ]] --[[ Name: grandPrizeAdded ]]
            -- upvalues: v17 (ref), v16 (ref), v240 (copy), v33 (ref), v29 (ref)
            local l_v246_Attribute_0 = v246:GetAttribute("ItemName");
            local v248 = v246:GetAttribute("IsUnit") or false;
            if not l_v246_Attribute_0 then
                return;
            else
                local v249 = nil;
                v249 = if v248 then select(2, v17:GetRarity(l_v246_Attribute_0)) else v16:GetRewardRarity({
                    type = "Inventory", 
                    name = l_v246_Attribute_0
                });
                if v249 then
                    v246.Content.Backdrop:SetAttribute("Rarity", v249);
                    table.insert(v240.rarityVisualObjects, v246.Content.Backdrop);
                end;
                v33:HandleButton(v246);
                v29.new(v246, {
                    Name = l_v246_Attribute_0, 
                    IsUnit = v248
                });
                return;
            end;
        end;
        local function v255(v251, v252) --[[ Line: 1365 ]] --[[ Name: handleTaggedObjects ]]
            -- upvalues: l_CollectionService_0 (ref)
            for _, v254 in l_CollectionService_0:GetTagged(v251) do
                task.spawn(v252, v254);
            end;
            l_CollectionService_0:GetInstanceAddedSignal(v251):Connect(v252);
        end;
        v255("Olipop_UI_Relic", v245);
        v255("Olipop_UI_GrandPrize", v250);
    end
};