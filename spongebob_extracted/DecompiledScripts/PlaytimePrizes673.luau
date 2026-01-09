local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.PlaytimePrizesShared);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.AnimNation);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v12 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v14 = require(l_ReplicatedStorage_0.RNGRolls);
local v15 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v17 = require(l_ReplicatedStorage_0.Shared.Util.Debouncer);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.PromiseCountryCode);
local v20 = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = {
    [1] = "Tier1.Prize1", 
    [2] = "Tier1.Prize2", 
    [3] = "Tier1.Prize3", 
    [4] = "Tier1.Prize4", 
    [5] = "Tier2.Prize5", 
    [6] = "Tier2.Prize6", 
    [7] = "Tier2.Prize7", 
    [8] = "Tier3.Prize8", 
    [9] = "Tier3.Prize9"
};
local v28 = {
    primaryMenu = true, 
    blur = true
};
local v29 = {};
local v30 = 0;
local v31 = 0;
v28.Init = function(v32, v33, _) --[[ Line: 73 ]] --[[ Name: Init ]]
    -- upvalues: v22 (ref), v1 (copy), v21 (ref), v23 (ref), v24 (ref)
    v22 = v1.GetController("DataController");
    v21 = v1.GetController("UIController");
    v23 = v1.GetService("PlaytimePrizeService");
    v24 = v1.GetController("AudioController");
    v32.ui = v33;
    v32._main = v32.ui.Main;
    v32._content = v32._main.Content;
    v32._prizeBoxes = v32._content.PrizeBoxes;
    v32._prizeBoxesHolder = v32._prizeBoxes.PrizeBoxesHolder;
    v32._possibleRewards = v32._content.PossibleRewards;
    v32._rewardsScrollingFrame = v32._possibleRewards.RewardsScrollingFrame;
    v32._rewardTemplate = v32._rewardsScrollingFrame.Template;
    v32._olipopFrameTemplate = v32._rewardTemplate.Main:FindFirstChild("OLIPOPCode");
    v32._olipopFrameTemplate = v32._olipopFrameTemplate and v32._olipopFrameTemplate:Clone();
    if v32._olipopFrameTemplate then
        v32._rewardTemplate.Main.OLIPOPCode:Destroy();
    end;
    v32._rewardTemplate.Visible = false;
end;
v28.Start = function(v35) --[[ Line: 100 ]] --[[ Name: Start ]]
    -- upvalues: v18 (copy), v19 (copy), v25 (ref), v21 (ref), v26 (ref), v27 (copy), v29 (copy), v6 (copy), v17 (copy), v23 (ref), v24 (ref), v22 (ref), v1 (copy), v8 (copy), v16 (copy), v30 (ref), v31 (ref), v2 (copy), v5 (copy)
    v35.policyInfo = select(2, v18():await());
    v35.countryCode = select(2, v19():await());
    v25 = v21:GetModuleAsync("HUD"):expect();
    v26 = v21:GetModuleAsync("MessagePrompt"):expect();
    v25:ToggleNotifier(script.Name, false);
    v21:HandleButton(v35._main.Exit, function() --[[ Line: 108 ]]
        -- upvalues: v21 (ref)
        v21:Toggle(script.Name, false);
    end);
    for v36, v37 in v27 do
        v29[v36] = v6(v35._prizeBoxesHolder, v37);
        v21:HandleButton(v29[v36].Icon, function() --[[ Line: 115 ]]
            -- upvalues: v17 (ref), v35 (copy), v29 (ref), v36 (copy), v23 (ref), v24 (ref)
            if not v17("ClaimingPrize", 0.5) then
                return;
            else
                v35._lastTier = v29[v36].Parent.Name;
                v23:ClaimPrize(v36):andThen(function(v38) --[[ Line: 122 ]]
                    -- upvalues: v24 (ref)
                    if not v38 then
                        return;
                    else
                        v24:PlaySound({
                            name = "UI.DailyReward", 
                            soundGroup = "Master.SFX.UI"
                        });
                        return;
                    end;
                end);
                return;
            end;
        end);
    end;
    v22:OnChanged(v1.Player, "ClaimedPlaytimeRewards", function(v39) --[[ Line: 136 ]]
        -- upvalues: v29 (ref), v8 (ref), v16 (ref)
        v39 = v39 or {};
        for _, v41 in v39 do
            local v42 = v29[v41];
            if not v42:GetAttribute("ClaimedAnimation") then
                v42:SetAttribute("ClaimedAnimation", true);
                v8.target(v42.Timer, {
                    s = 30, 
                    d = 1
                }, {
                    TextTransparency = 1
                });
                v8.target(v42.Icon, {
                    s = 30, 
                    d = 1
                }, {
                    ImageTransparency = 0.5
                });
                v8.target(v42.Timer.UIStroke, {
                    s = 30, 
                    d = 1
                }, {
                    Transparency = 1
                });
                v8.target(v42.Timer, {
                    s = 30, 
                    d = 1
                }, {
                    TextTransparency = 1
                });
                v42.Claimed.Visible = true;
                v8.target(v42.Claimed.UIScale, {
                    s = 30, 
                    d = 0.5
                }, {
                    Scale = 1
                });
                if v42:FindFirstChild("Luck") and v42:FindFirstChild("LuckAmount") then
                    v8.target(v42.Luck, {
                        s = 30, 
                        d = 0.5
                    }, {
                        ImageTransparency = 1
                    });
                    v8.target(v42.LuckAmount, {
                        s = 30, 
                        d = 0.5
                    }, {
                        TextTransparency = 1
                    });
                    v8.target(v42.LuckAmount.UIStroke, {
                        s = 30, 
                        d = 1
                    }, {
                        Transparency = 1
                    });
                end;
            end;
        end;
        for v43, v44 in v29 do
            if not table.find(v39, v43) and v44:GetAttribute("ClaimedAnimation") then
                v44:SetAttribute("ClaimedAnimation");
                v8.target(v44.Timer, {
                    s = 30, 
                    d = 1
                }, {
                    TextTransparency = 0
                });
                v8.target(v44.Icon, {
                    s = 30, 
                    d = 1
                }, {
                    ImageTransparency = 0
                });
                v8.target(v44.Timer.UIStroke, {
                    s = 30, 
                    d = 1
                }, {
                    Transparency = 0
                });
                v8.target(v44.Timer, {
                    s = 30, 
                    d = 1
                }, {
                    TextTransparency = 0
                });
                v44.Claimed.Visible = true;
                v8.target(v44.Claimed.UIScale, {
                    s = 30, 
                    d = 0.5
                }, {
                    Scale = 0
                });
                v44.Timer.TextColor3 = v16.Solid.White;
                if v44:FindFirstChild("Luck") and v44:FindFirstChild("LuckAmount") then
                    v8.target(v44.Luck, {
                        s = 30, 
                        d = 0.5
                    }, {
                        ImageTransparency = 0
                    });
                    v8.target(v44.LuckAmount, {
                        s = 30, 
                        d = 0.5
                    }, {
                        TextTransparency = 0
                    });
                    v8.target(v44.LuckAmount.UIStroke, {
                        s = 30, 
                        d = 1
                    }, {
                        Transparency = 0
                    });
                end;
            end;
        end;
    end, true);
    v22:OnChanged(v1.Player, "CurrentSessionPlaytime", function(v45) --[[ Line: 236 ]]
        -- upvalues: v30 (ref), v31 (ref), v35 (copy)
        v30 = v45;
        v31 = os.time();
        v35:_updateTimers(v30);
    end, true);
    v2.Simple(v5.TIMER_INTERVAL, function() --[[ Line: 243 ]]
        -- upvalues: v30 (ref), v31 (ref), v35 (copy)
        if not v30 and not v31 then
            return;
        else
            v35:_updateTimers(v30 + (os.time() - v31));
            return;
        end;
    end);
end;
v28.GetGradientNameToUse = function(v46) --[[ Line: 252 ]] --[[ Name: GetGradientNameToUse ]]
    return v46._lastTier;
end;
v28.Opened = function(v47) --[[ Line: 256 ]] --[[ Name: Opened ]]
    -- upvalues: v25 (ref), v12 (copy)
    v25:ToggleNotifier(script.Name, false);
    if v47.dump then
        v47.dump:Destroy();
    end;
    v47.dump = v12.new();
    v47:_populateItems();
end;
v28.Closed = function(v48) --[[ Line: 268 ]] --[[ Name: Closed ]]
    if v48.dump then
        v48.dump:Destroy();
    end;
end;
v28._updateTimers = function(_, v50) --[[ Line: 276 ]] --[[ Name: _updateTimers ]]
    -- upvalues: v29 (copy), v5 (copy), v25 (ref), v16 (copy), v7 (copy)
    for v51, v52 in v29 do
        if not v52:GetAttribute("ClaimedAnimation") and v5.REWARDS[v51] then
            local v53 = v5.REWARDS[v51].time - v50;
            if v53 < 0 then
                if v52.Timer.Text ~= "OPEN" then
                    v25:ToggleNotifier(script.Name, true);
                    v52.Timer.Text = "OPEN";
                    v52.Timer.TextColor3 = v16.Solid.Normal;
                end;
            elseif v53 < 3600 then
                v52.Timer.Text = v7:FormatMMSS(v53);
            else
                v52.Timer.Text = v7:FormatHHMMSS(v53);
            end;
        end;
    end;
end;
v28._populateItems = function(v54) --[[ Line: 302 ]] --[[ Name: _populateItems ]]
    -- upvalues: v14 (copy), v22 (ref), v1 (copy), v3 (copy), v10 (copy), v4 (copy), v11 (copy), v20 (copy), v9 (copy), v13 (copy), l_ReplicatedStorage_0 (copy), v2 (copy), v15 (copy), v26 (ref)
    local l_v14_LootPool_0 = v14:GetLootPool("PlaytimePrize");
    local v56 = v54.policyInfo and v54.policyInfo.AreAdsAllowed or false;
    local v57 = v54.countryCode == "US";
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local function v77(v59, v60) --[[ Line: 309 ]] --[[ Name: makeItem ]]
        -- upvalues: v56 (copy), v57 (copy), v22 (ref), v1 (ref), v54 (copy), l_workspace_ServerTimeNow_0 (copy), v3 (ref), v10 (ref), v4 (ref), v11 (ref), v20 (ref), v9 (ref), v13 (ref), l_ReplicatedStorage_0 (ref), v2 (ref), v14 (ref), v15 (ref), v26 (ref)
        if v60.isAd and not v56 then
            return;
        elseif v60.type == "OLIPOPCode" and not v57 then
            return;
        elseif v60.name == "OLIPOPRaceCar" and not v57 then
            return;
        else
            if v60.name == "OLIPOPRaceCar" then
                local v61 = v22:Get(v1.Player, "Inventory"):expect();
                if v61 and v61.OLIPOPRaceCar then
                    return;
                end;
            end;
            local v62 = v54._rewardTemplate:Clone();
            v62.Visible = true;
            v62.Name = "Index_" .. v59;
            local v63 = nil;
            local v64 = nil;
            if v60.startOn and l_workspace_ServerTimeNow_0 < v60.startOn then
                v62.Visible = false;
                v54.dump:Add(task.delay(v60.startOn - l_workspace_ServerTimeNow_0, function() --[[ Line: 344 ]]
                    -- upvalues: v62 (ref)
                    v62.Visible = true;
                end));
            end;
            if v60.expireOn then
                v54.dump:Add(task.delay(v60.expireOn - l_workspace_ServerTimeNow_0, function() --[[ Line: 350 ]]
                    -- upvalues: v62 (ref)
                    v62.Visible = false;
                end));
            end;
            if v60.type == "OLIPOPCode" then
                v63 = v54._olipopFrameTemplate:Clone();
                v63.Visible = false;
                v63.Parent = v62.Main;
                v22:OnChanged(v1.Player, "OLIPOPCode2", function(v65) --[[ Line: 360 ]]
                    -- upvalues: v64 (ref), v63 (ref)
                    v64 = v65 and v65.code or nil;
                    if not v65 then
                        v63.Visible = false;
                        v63.PromoCode.Text = "xxxxxxxxxx";
                        return;
                    else
                        v63.PromoCode.Text = v65.code or "";
                        v63.Visible = true;
                        return;
                    end;
                end, true);
            end;
            local v66 = nil;
            if v60.type == "Unit" then
                v3:SetImage(v62.Main.Inner.Icon.Content.Info.Icon, v60.name);
                v66 = select(2, v10:GetRarity(v60.name));
            elseif v60.type == "Pet" then
                v4:SetImage(v62.Main.Inner.Icon.Content.Info.Icon, v60.name);
                v66 = select(2, v11:GetRarity(v60.name));
            elseif v60.type == "RandomBoost" then
                v66 = v60.rarity;
            elseif v60.type == "OLIPOPCode" then
                v66 = "Limited";
                v20:SetImage(v62.Main.Inner.Icon.Content.Info.Icon, "Secret_Olipop", "OlipopSprites");
            else
                v62.Main.Inner.Icon.Content.Info.Icon.Image = v9:GetIconFromRewardData(v60) or "";
                v66 = v9:GetRewardRarity(v60);
            end;
            if string.find(v60.name, "GIFT_") then
                local l_UICorner_0 = Instance.new("UICorner");
                l_UICorner_0.CornerRadius = UDim.new(1, 0);
                l_UICorner_0.Parent = v62.Main.Inner.Icon.Content.Info.Icon;
            end;
            v62.Main.Inner.Info.Chance.Text = ("1 in %*"):format((v9:CommaNumber((math.floor((1 / v60.weight or v60.Weight or 0) + 0.5)))));
            local v68 = v60.amount or v60.Amount or 1;
            if v68 > 1 then
                v62.Main.Inner.Icon.Content.Info.Amount.Text = ("x%*"):format(v68);
            else
                v62.Main.Inner.Icon.Content.Info.Amount.Text = "";
            end;
            if v60.name and v60.type and v60.type == "Inventory" and v13:IsMount(v60.name) then
                l_ReplicatedStorage_0.GUI.MountIcon:Clone().Parent = v62.Main.Inner.Icon.Content;
            end;
            v62.Main.Inner.Icon.Content.Glow:SetAttribute("Rarity", v66);
            v62.Main.Inner.Icon.Content.Backdrop:SetAttribute("Rarity", v66);
            if v60.type == "Unit" then
                v62.Main.Inner.Info.Title.Text = v10:GetUnitValue(v60.name, "FullName");
            elseif v60.type == "Pet" then
                v62.Main.Inner.Info.Title.Text = v11:GetPetValue(v60.name, "FullName");
            elseif v60.type == "OLIPOPCode" then
                v62.Main.Inner.Info.Title.Text = "FREE OLIPOP Code";
            else
                v62.Main.Inner.Info.Title.Text = v13:GetDisplayName(v60.name) or v60.name;
            end;
            if v66 == "Secret" then
                v62.Main.Inner.Info.Title:SetAttribute("Rarity", "SecretLight");
            else
                v62.Main.Inner.Info.Title:SetAttribute("Rarity", v66);
            end;
            v62.Parent = v54._rewardsScrollingFrame;
            if v60.type == "Unit" then
                v62.ZIndex = 5;
                local v69 = 0;
                do
                    local l_v69_0 = v69;
                    v54.dump:Add(v2.Simple(1, function() --[[ Line: 444 ]]
                        -- upvalues: l_v69_0 (ref), v62 (ref)
                        l_v69_0 = l_v69_0 + 1;
                        l_v69_0 = math.round(l_v69_0);
                        if l_v69_0 > 4 then
                            l_v69_0 = 1;
                        end;
                        if l_v69_0 == 1 then
                            v62.Main.Inner.Icon.Shiny.Visible = true;
                            v62.Main.Inner.Icon.Wumbo.Visible = true;
                            return;
                        elseif l_v69_0 == 2 then
                            v62.Main.Inner.Icon.Shiny.Visible = true;
                            v62.Main.Inner.Icon.Wumbo.Visible = false;
                            return;
                        elseif l_v69_0 == 3 then
                            v62.Main.Inner.Icon.Shiny.Visible = false;
                            v62.Main.Inner.Icon.Wumbo.Visible = true;
                            return;
                        else
                            if l_v69_0 == 4 then
                                v62.Main.Inner.Icon.Shiny.Visible = false;
                                v62.Main.Inner.Icon.Wumbo.Visible = false;
                            end;
                            return;
                        end;
                    end));
                end;
            end;
            if v60.type == "RandomBoost" then
                v62.Main.Inner.Icon.Mystery.Visible = true;
                v62.Main.Inner.Info.Title.Text = "Random Boost";
                local v71 = 0;
                local l_v14_LootPool_1 = v14:GetLootPool("RandomBoosts");
                local v73 = {};
                for _, v75 in l_v14_LootPool_1 do
                    table.insert(v73, v75.name);
                end;
                do
                    local l_v71_0 = v71;
                    v54.dump:Add(v2.Simple(1, function() --[[ Line: 482 ]]
                        -- upvalues: l_v71_0 (ref), v73 (copy), v60 (copy), v62 (ref), v9 (ref)
                        l_v71_0 = l_v71_0 + 1;
                        if l_v71_0 >= #v73 then
                            l_v71_0 = 1;
                        end;
                        v60.name = v73[l_v71_0];
                        v62.Main.Inner.Icon.Content.Info.Icon.Image = v9:GetIconFromRewardData(v60) or "";
                    end, true));
                end;
            else
                v62.Main.Inner.Icon.Mystery.Visible = false;
            end;
            if v66 ~= nil then
                task.defer(function() --[[ Line: 499 ]]
                    -- upvalues: v62 (ref)
                    v62.Main.Inner.Icon.Content.Glow:AddTag("VisualizeRarity");
                    v62.Main.Inner.Icon.Content.Backdrop:AddTag("VisualizeRarity");
                    v62.Main.Inner.Info.Title:AddTag("VisualizeRarity");
                end);
            end;
            if v60.type ~= "RandomBoost" and v60.type ~= "OLIPOPCode" then
                v54.dump:Add(v15.new(v62, {
                    Name = v60.name, 
                    IsUnit = v60.type == "Unit", 
                    IsPet = v60.type == "Pet"
                }));
            end;
            if v60.type == "OLIPOPCode" then
                v62.Active = true;
                v62.Activated:Connect(function() --[[ Line: 517 ]]
                    -- upvalues: v54 (ref), v26 (ref)
                    if v54._prompt then
                        return;
                    else
                        v54._prompt = v26:Prompt({
                            message = "<font color=\"#ff2529\">You haven't received a OLIPOP code yet!</font>\n\n<font size=\"36\">Claim your <font color=\"#00ff11\">FREE</font> <font color=\"#fcff50\">Pineapple Paradise</font> 4-pack by entering your code at  <font color=\"#0ce7ff\">drinkolipop.com/freesoda</font>\n<font color=\"#ffaa20\">Important: Your code will disappear once the event ends. Be sure to copy, save, or redeem it now before it\226\128\153s gone for good!</font></font>", 
                            options = {
                                {
                                    text = "Ok", 
                                    callback = function() --[[ Line: 534 ]] --[[ Name: callback ]]
                                        -- upvalues: v54 (ref)
                                        v54._prompt = nil;
                                    end
                                }
                            }
                        });
                        return;
                    end;
                end);
            end;
            v54.dump:Add(v62);
            v54.dump:Add(function() --[[ Line: 545 ]]
                -- upvalues: v62 (ref)
                v62 = nil;
            end);
            return;
        end;
    end;
    for v78, v79 in l_v14_LootPool_0 do
        v77(v78, v79);
    end;
end;
return v28;