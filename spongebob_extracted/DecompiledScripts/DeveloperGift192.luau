local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.Shime);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v8 = require(v2.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.DeveloperGiftRewards);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = {
    SnowMolluskFix = {
        message = "We're sorry you didn't receive your <font color=\"#f4ff4a\">Legendary Snow Mollusk</font>\nYou should have it now!\n\nWe want to give you something extra for the inconvenience, enjoy <font color=\"#f4ff4a\">5 Trait Re-Rolls</font> to help make your units super OP!"
    }, 
    SeasonPassSkipsFix = {
        message = "We're sorry about the Season Pass issue that players experienced yesterday. The issue is resolved and missing skip purchases have been rewarded to the players that made the purchase.\n\nAs a thank you for being patient with us as we worked on a fix, we'd like to gift everyone <font color=\"#f4ff4a\">5,000 Season Pass XP</font>!"
    }, 
    InfluencerCarePackage1 = {
        title = "Gift!", 
        message = "<font weight=\"900\">Ahoy, Starfish Influencer!</font>\n\nWe\226\128\153ve gifted you <font color=\"#f4ff4a\">25,000 Coins</font>\nand <font color=\"#f4ff4a\">25 Chests</font> as a thank-you for your awesome support.\n\nThanks for being a part of the SpongeBob Tower Defense Starfish Influencers crew!"
    }, 
    QuestsFix = {
        message = "We're sorry about the Weekly/Multiplayer/Endless Quests reset issue that players have been experiencing yesterday and today. In order to fix the issue, we had to reset the quests for all players one more time.\n\nAs a thank you for being patient with us as we worked on a fix, we'd like to gift everyone <font color=\"#f4ff4a\">25 Treasure Chests</font>!"
    }, 
    InfluencerCarePackage2 = {
        title = "Gift!", 
        message = "<font weight=\"900\">Ahoy, Starfish Influencer!</font>\n\nWe\226\128\153ve gifted you <font color=\"#f4ff4a\">2,500 Gems</font>\nand <font color=\"#f4ff4a\">5 Mythic Chests</font> as a thank-you for your awesome support.\n\nThanks for being a part of the SpongeBob Tower Defense Starfish Influencers crew!"
    }, 
    PrestigeSecretUnitFix = {
        title = "Congrats!", 
        message = "You were one of the first people to reach <font color=\"#f4ff4a\">Prestige X</font>!\n\nWe underestimated your determination to achieve such a great achievement so quickly!\n\nYour real secret unit can be found in your inventory now!\n\nAs an added bonus, you can keep your\n<font color=\"#f4ff4a\">5 Star Shiny Wumbo Cyborg Plankton</font> too!", 
        buttonText = "Ok"
    }, 
    InfluencerCarePackage5 = {
        title = "Gift!", 
        message = "<font weight=\"900\">Ahoy, Starfish Influencer!</font>\nWe\226\128\153ve gifted you <font color=\"#f4ff4a\">100 Magic Conches</font> as a thank-you for your awesome support.\n\nThanks for being a part of the SpongeBob Tower Defense Starfish Influencers crew!"
    }, 
    ModCarePackage1 = {
        title = "Gift!", 
        message = "<font weight=\"900\">Ahoy, Moderator!</font>\nWe\226\128\153ve gifted you <font color=\"#f4ff4a\">50 Golden Trait Rolls, Ultra VIP Gift, Treasure Hunter Gift, 5 Secret Treasure Chests, and 20,000 Coins</font> as a thank-you for your awesome support.\n\nThanks for being a part of the SpongeBob Tower Defense Moderators crew!"
    }, 
    SummonBugFix = {
        message = "We're sorry about the summoning issue you experienced, thank you for your patience while we dealt with this issue.\n\n- <font color=\"#f4ff4a\">10,000 Gems</font>\n- <font color=\"#f4ff4a\">10 Magic Conch</font>\n"
    }, 
    KrustyKrewDailyFix = {
        message = "Hey <font color=\"#f4ff4a\">{playerName}</font>,\nSorry about the issue with your Krew+ rewards resetting! We've fixed it by setting your Krew+ track to Day 6 and making those rewards claimable again. As a thank-you, we\226\128\153ve added a bonus <font color=\"#f4ff4a\">Secret Chest</font>!\nThanks for being an awesome part of the Krusty Krew!"
    }, 
    OlympianSpongebobS4 = {
        message = "Hey <font color=\"#f4ff4a\">{playerName}</font>,\nWe're sorry about the issue that caused you not to receive the Olympian SpongeBob unit(s) you earned in Season 4."
    }, 
    OlympianSpongebobS4_2 = {
        message = "Hey <font color=\"#f4ff4a\">{playerName}</font>,\nWe identified another issue that caused you not to receive the Olympian SpongeBob unit(s) you earned in Season 4.\n\nThank you for your patience while we worked on a fix."
    }, 
    OlympianSpongebobS5 = {
        message = "Hey <font color=\"#f4ff4a\">{playerName}</font>,\nWe're sorry about the issue that caused you not to receive the Olympian SpongeBob unit(s) you earned in Season 5."
    }, 
    OlympianSpongebobS6 = {
        message = "Through your unwavering dedication in Season 6, you have been awarded Olympian SpongeBob!"
    }, 
    ModCarePackage2 = {
        title = "Gift!", 
        message = "Thank you for your continued support!\n\n<font color=\"#f4ff4a\">Enjoy these free gifts!</font>"
    }, 
    InvestorCarePackage2 = {
        title = "Gift!", 
        message = "Thank you for being such a HUGE fan of the game!\n\n<font color=\"#f4ff4a\">Enjoy these free gifts!</font>"
    }, 
    BemmyBuddy = {
        title = "Bemmy Buddy Reward", 
        message = "You did it! You befriended Bemmy Buddy! What an accomplishment, you should be proud!"
    }, 
    SpongebobVsPatrick1 = {
        title = "Turf Wars Reward", 
        message = "You've proven your might! You've unlocked a special variant of the event unit!"
    }, 
    SpongebobVsPatrick2_Spongebob = {
        title = "Turf Wars Reward", 
        message = "Your team, <font color=\"#f4ff4a\">Team SpongeBob</font>, won the event! You've unlocked this exclusive pet!"
    }, 
    SpongebobVsPatrick2_Patrick = {
        title = "Turf Wars Reward", 
        message = "Your team, <font color=\"#f4ff4a\">Team Patrick</font>, won the event! You've unlocked this exclusive pet!"
    }, 
    ["Krew+Rewards"] = {
        title = "Krew+ Rewards!", 
        message = "Claim your Krew+ rewards!"
    }, 
    GTD_Rewards1 = {
        title = "Grand Theft TD Reward", 
        message = "Thanks for Playing Grand Theft Tower Defense! Here's your reward!"
    }, 
    GTD_Rewards2 = {
        title = "Grand Theft TD Reward", 
        message = "Great job reaching level 50 in Grand Theft Tower Defense! Here's your reward!"
    }, 
    MOVIE_ITEMS = {
        title = "Robux Gift Card", 
        message = "Thanks for purchasing a Robux Gift Card! Here's your reward!"
    }, 
    ChristmasTree2025 = {
        title = "Christmas 2025", 
        message = "Thanks for celebrating the Christmas Tree lighting with us! Merry Christmas!"
    }, 
    SBBDay100Reward = {
        title = "Survive Bikini Bottom Reward", 
        message = "Great job reaching Day 100 in Survive Bikini Bottom! Here's your reward!"
    }
};
local v17 = {
    primaryMenu = true, 
    highPriority = true, 
    blur = true, 
    ToggleProperties = {
        Main = {
            Open = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                ToggleTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back)
            }, 
            Close = {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 1.1), 
                ToggleTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            }
        }, 
        Overlay = {
            Open = {
                BackgroundTransparency = 0.5
            }, 
            Close = {
                BackgroundTransparency = 1
            }, 
            ToggleTweenInfo = TweenInfo.new(0.3)
        }
    }, 
    ToggleAll = {}
};
local v18 = nil;
v17.Init = function(v19, v20, v21) --[[ Line: 224 ]] --[[ Name: Init ]]
    -- upvalues: v10 (ref), v2 (copy), v11 (ref), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v3 (copy)
    v10 = v2.GetController("UIController");
    v11 = v2.GetController("DataController");
    v12 = v2.GetController("NPEController");
    v13 = v2.GetService("DeveloperGiftService");
    v14 = v2.GetController("DeviceTypeController");
    v15 = v2.GetController("CharacterController");
    v19.currentMode = v21;
    v19.ui = v20;
    v19.main = v20.Main;
    v19.description = v19.main.Content.Description;
    v19.title = v19.main.Unsorted.Title.TitleContainer.Title;
    v19.claimButton = v19.main.Claim;
    v19.rewardsFrame = v19.main.Rewards.Main;
    v19.rewardTemplate = v19.rewardsFrame.Template:Clone();
    v19.rewardsFrame.Template:Destroy();
    v19.rewardsFrame.Visible = false;
    v19.dumpster = v3.new();
end;
v17.Start = function(v22) --[[ Line: 249 ]] --[[ Name: Start ]]
    -- upvalues: v11 (ref), v2 (copy), v18 (ref), v15 (ref), v10 (ref), v13 (ref), v14 (ref)
    v11:OnChanged(v2.Player, "ApologiesToClaim", function(v23) --[[ Line: 250 ]]
        -- upvalues: v18 (ref), v15 (ref), v22 (copy), v10 (ref)
        v18 = v23;
        if v18 and next(v18) ~= nil then
            if v15:CharactersHidden() then
                return;
            else
                v22:Prompt(table.remove(v18, 1));
                return;
            end;
        else
            local l_v10_ScreenGui_0 = v10:GetScreenGui("Shop");
            if v22.lastApology == "Krew+Rewards" and l_v10_ScreenGui_0.KrewDetails.Visible then
                v10:Toggle(script.Name, false):andThen(function() --[[ Line: 267 ]]
                    -- upvalues: v10 (ref)
                    v10:Toggle("Shop", true);
                end);
                return;
            else
                v10:Toggle(script.Name, false);
                return;
            end;
        end;
    end);
    local function v25() --[[ Line: 276 ]] --[[ Name: claim ]]
        -- upvalues: v10 (ref), v13 (ref)
        if not v10:GetToggleState(script.Name) then
            return;
        else
            v13:Claim();
            return;
        end;
    end;
    v10:HandleButton(v22.claimButton, v25);
    v14:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, v25);
end;
v17.Opening = function(v26) --[[ Line: 288 ]] --[[ Name: Opening ]]
    -- upvalues: v18 (ref), v6 (copy), l_PreferredInput_0 (copy), l_GuiService_0 (copy)
    if not v18 or #v18 < 1 then
        return;
    else
        local v27 = v6.new(v26.claimButton.Content, 1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, nil, nil, 0.5);
        v26.dumpster:Add(v27);
        v27:Play();
        v26.dumpster:Add(l_PreferredInput_0.Observe(function(v28) --[[ Line: 304 ]]
            -- upvalues: l_GuiService_0 (ref), v26 (copy)
            if v28 == "Gamepad" then
                l_GuiService_0.SelectedObject = v26.claimButton;
                return;
            else
                l_GuiService_0.SelectedObject = nil;
                return;
            end;
        end));
        v26:Prompt(table.remove(v18, 1));
        return;
    end;
end;
v17.Closed = function(v29) --[[ Line: 315 ]] --[[ Name: Closed ]]
    -- upvalues: l_GuiService_0 (copy)
    v29.dumpster:Destroy();
    l_GuiService_0.SelectedObject = nil;
    v29.rewardsFrame.Visible = false;
end;
v17.OnJoin = function(_) --[[ Line: 321 ]] --[[ Name: OnJoin ]]
    -- upvalues: v18 (ref), v11 (ref), v2 (copy)
    if not v18 then
        v18 = v11:Get(v2.Player, "ApologiesToClaim"):expect();
    end;
    local v31 = false;
    if v18 ~= nil then
        v31 = #v18 > 0;
    end;
    return v31;
end;
v17.Prompt = function(v32, v33) --[[ Line: 331 ]] --[[ Name: Prompt ]]
    -- upvalues: v16 (copy), v2 (copy), v11 (ref), v9 (copy), v8 (copy), v10 (ref)
    local v34 = string.match(v33, "^(.-)%s*//") or v33;
    local v35 = v16[v34];
    if not v35 then
        return;
    else
        v32.dumpster:Destroy();
        v32.lastApology = v34;
        local v36 = v35.message or "";
        v36 = string.gsub(v36, "{playerName}", v2.Player.Name);
        v32.title.Text = v35.title or "Sorry!";
        v32.description.Text = v36;
        v32.claimButton.Content.Title.Text = v35.buttonText or "Claim";
        v32.dumpster:Add(v11:Get(v2.Player, "ApologyRewards"):andThen(function(v37) --[[ Line: 349 ]]
            -- upvalues: v33 (copy), v9 (ref), v32 (copy), v8 (ref)
            local v38 = v37 and v37[v33];
            if not v38 then
                local v39 = v9[v33];
                if not v39 or not v39.rewards then
                    return;
                else
                    v38 = v39.rewards;
                end;
            end;
            v32.rewardsFrame.Visible = true;
            v32.dumpster:Add(v8.new(v38, {
                template = v32.rewardTemplate, 
                parent = v32.rewardsFrame, 
                showSecrets = true
            }));
        end));
        if not v10:GetToggleState(script.Name) then
            v10:Toggle(script.Name, true);
        end;
        return;
    end;
end;
return v17;