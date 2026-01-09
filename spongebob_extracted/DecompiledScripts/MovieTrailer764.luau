local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_SoundService_0 = game:GetService("SoundService");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Fusion).peek;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local _ = require(v5.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local _ = require(v5.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local _ = l_ReplicatedStorage_0.Models.Friendlies;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    _selectedUnit = nil, 
    _unitButtons = {}, 
    rgbHandler = v14.new(), 
    Init = function(_, _) --[[ Line: 66 ]] --[[ Name: Init ]]
        -- upvalues: v20 (ref), v5 (copy), v21 (ref), v22 (ref), v23 (ref), v24 (ref)
        v20 = v5.GetController("DataController");
        v21 = v5.GetController("UIController");
        v22 = v5.GetService("OlipopService");
        v23 = v5.GetController("AudioController");
        v24 = v5.GetController("SpongebobTrailerController");
    end, 
    Start = function(v30, v31) --[[ Line: 74 ]] --[[ Name: Start ]]
        -- upvalues: v25 (ref), v21 (ref), v26 (ref), l_SoundService_0 (copy), v19 (copy), v20 (ref), v5 (copy)
        v25 = v21:GetModuleAsync("HUD"):expect();
        v26 = v21:GetModuleAsync("Notification"):expect();
        v30.masterGroup = l_SoundService_0:WaitForChild("Master");
        v30.masterVolume = v30.masterGroup.Volume;
        v30.ui = v31;
        v30.main = v31.Main;
        v30.videoFrame = v30.main.VideoContainer.VideoFrame;
        v30.policyInfo = select(2, v19():await());
        v30.adsAllowed = v30.policyInfo and v30.policyInfo.AreAdsAllowed or false;
        v30.videoControls = v30.main.VideoContainer.VideoControls;
        v21:HandleButton(v30.videoControls.Exit, function() --[[ Line: 90 ]]
            -- upvalues: v21 (ref)
            v21:Toggle(script.Name, false);
        end);
        v30.hasAdReward = v20:Get(v5.Player, "GotSpongeBobAdReward"):expect() or false;
        v20:OnChanged(v5.Player, "GotSpongeBobAdReward", function(v32) --[[ Line: 96 ]]
            -- upvalues: v30 (copy)
            v30.hasAdReward = v32 or false;
        end);
        v21:HandleButton(v30.main.RewardPopup.BottomButtons.Confirm, function() --[[ Line: 100 ]]
            -- upvalues: v21 (ref)
            v21:Toggle(script.Name, false);
        end);
    end, 
    Opening = function(v33) --[[ Line: 111 ]] --[[ Name: Opening ]]
        -- upvalues: v6 (copy), v24 (ref), v21 (ref), v22 (ref), v18 (copy), v23 (ref)
        v33.mainDumpster = v6.new();
        v24:ToggleVideoPlayback(false);
        if v33.adsAllowed then
            v33.videoFrame:Pause();
            v33.videoFrame.Video = "rbxassetid://99893697333068";
            v33.videoFrame.TimePosition = 0;
            v33.videoFrame.Looped = false;
        end;
        v33.main.VideoContainer.Visible = true;
        v33.main.RewardPopup.Visible = false;
        v33.videoControls.Visible = false;
        v33.mainDumpster:Add(v33.main.VideoContainer.MouseEnter:Connect(function() --[[ Line: 127 ]]
            -- upvalues: v33 (copy)
            v33.videoControls.Visible = true;
        end));
        v33.mainDumpster:Add(v33.main.VideoContainer.MouseLeave:Connect(function() --[[ Line: 131 ]]
            -- upvalues: v33 (copy)
            v33.videoControls.Visible = false;
        end));
        v33.mainDumpster:Add(v33.videoFrame.Ended:Connect(function() --[[ Line: 135 ]]
            -- upvalues: v33 (copy), v21 (ref)
            if v33.hasAdReward then
                v21:Toggle(script.Name, false);
                return;
            else
                return;
            end;
        end));
        v33.mainDumpster:Add(v22.NotifyTrailerRewards:Connect(function(v34) --[[ Line: 149 ]]
            -- upvalues: v33 (copy), v18 (ref), v23 (ref)
            local v35 = v34 and v34[1];
            if not v35 then
                return;
            else
                local l_Reward_0 = v33.main.RewardPopup.Rewards.Reward;
                l_Reward_0.Visible = true;
                l_Reward_0.Content.Inner.Amount.Text = ("x%*"):format(v35.amount or 1);
                l_Reward_0.Content.Inner.Icon.Image = v18:GetIconFromRewardData(v35) or "";
                local l_v18_RewardRarity_0 = v18:GetRewardRarity(v35);
                if l_v18_RewardRarity_0 then
                    l_Reward_0.Content.Backdrop:SetAttribute("Rarity", l_v18_RewardRarity_0);
                    l_Reward_0.Content.Glow:SetAttribute("Rarity", l_v18_RewardRarity_0);
                    l_Reward_0.Content.Backdrop:AddTag("VisualizeRarity");
                    l_Reward_0.Content.Glow:AddTag("VisualizeRarity");
                end;
                v33.masterGroup.Volume = v33.masterVolume;
                v23:PlaySound({
                    name = "UI.Special_Notification"
                });
                v33.main.VideoContainer.Visible = false;
                v33.main.RewardPopup.Visible = true;
                return;
            end;
        end));
        v33.mainDumpster:Add(function() --[[ Line: 180 ]]
            -- upvalues: v33 (copy)
            v33.main.RewardPopup.Rewards.Reward.Content.Backdrop:RemoveTag("VisualizeRarity");
            v33.main.RewardPopup.Rewards.Reward.Content.Glow:RemoveTag("VisualizeRarity");
        end);
    end, 
    Opened = function(v38) --[[ Line: 186 ]] --[[ Name: Opened ]]
        -- upvalues: v21 (ref)
        if not v38.adsAllowed then
            v21:Toggle(script.Name, false);
            return;
        else
            if not v38.videoFrame.IsLoaded then
                v38.videoFrame.Loaded:Wait();
            end;
            if not v21:GetToggleState(script.Name) then
                return;
            else
                v38.masterGroup.Volume = 0;
                v38.videoFrame.TimePosition = 0;
                v38.videoFrame:Play();
                return;
            end;
        end;
    end, 
    Closing = function(v39) --[[ Line: 207 ]] --[[ Name: Closing ]]
        if v39.mainDumpster then
            v39.mainDumpster:Destroy();
            v39.mainDumpster = nil;
        end;
        v39.videoFrame:Pause();
        v39.videoFrame.Video = "";
    end, 
    Closed = function(v40) --[[ Line: 218 ]] --[[ Name: Closed ]]
        -- upvalues: v24 (ref)
        v40.masterGroup.Volume = v40.masterVolume;
        v24:ToggleVideoPlayback(true);
    end
};