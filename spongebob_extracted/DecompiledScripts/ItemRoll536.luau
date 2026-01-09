local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.AnimNation);
local v8 = require(l_ReplicatedStorage_0.RNGRolls);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.BreathingGradient);
local v16 = require(l_ReplicatedFirst_0.PlaceIds);
local v17 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.PromiseCountryCode);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = Random.new();
local v28 = {
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.Touch
};
local v29 = NumberRange.new(35, 42);
local v30 = NumberRange.new(6, 7.5);
local l_Quart_0 = Enum.EasingStyle.Quart;
local l_Out_0 = Enum.EasingDirection.Out;
local v33 = UDim2.fromScale(0.5, 0.95);
local v34 = UDim2.fromScale(0.5, 0.715);
local v35 = {
    Tier1 = "rbxassetid://97479394905547", 
    Tier2 = "rbxassetid://107171547596371", 
    Tier3 = "rbxassetid://89052651252140"
};
local v36 = {
    primaryMenu = true, 
    ignoreClosePrimaryMenus = true, 
    ToggleProperties = {
        Main = {
            Open = {
                Position = UDim2.fromScale(0, 0)
            }, 
            Close = {
                Position = UDim2.fromScale(0, 0)
            }
        }
    }
};
local v37 = false;
local function _(v38, v39, v40) --[[ Line: 91 ]] --[[ Name: lerpNumber ]]
    return (1 - v40) * v38 + v39 * v40;
end;
v36.Init = function(v42, v43, v44) --[[ Line: 96 ]] --[[ Name: Init ]]
    -- upvalues: v20 (ref), v4 (copy), v21 (ref), v22 (ref), v24 (ref), v25 (ref)
    v20 = v4.GetController("UIController");
    v21 = v4.GetController("DeviceTypeController");
    v22 = v4.GetService("RewardService");
    v24 = v4.GetController("AudioController");
    v25 = v4.GetController("DataController");
    v42.currentMode = v44;
    v42.ui = v43;
    v42._canvas = v43.Canvas;
    v42._holder = v42._canvas.Holder;
    v42._template = v42._holder.Template;
    v42._backgroundContent = v42.ui.BackgroundContent;
    v42._content = v42._backgroundContent.Content;
    v42._shellIcon = v42._content.ShellIcon;
    v42._continueHint = v42._content.ContinueHint;
    v42._itemName = v42._content.ItemName;
    v42._rarity = v42._content.Rarity;
    v42._template.Visible = false;
    v42._itemName.TextTransparency = 1;
    v42._itemName.UIStroke.Transparency = 1;
    v42._rarity.TextTransparency = 1;
    v42._rarity.UIStroke.Transparency = 1;
    v42.ui.Enabled = false;
end;
v36.Start = function(v45) --[[ Line: 128 ]] --[[ Name: Start ]]
    -- upvalues: v16 (copy), v17 (copy), v18 (copy), v26 (ref), v20 (ref), v23 (ref), v22 (ref), v25 (ref), v4 (copy)
    if not v16:IsHUB() then
        return;
    else
        v45.policyInfo = select(2, v17():await());
        v45.countryCode = select(2, v18():await());
        v26 = v20:GetModuleAsync("MessagePrompt"):expect();
        v23 = v20:GetModuleAsync("PlaytimePrizes"):expect();
        v45:FadeOut();
        v22.RollItem:Connect(function(v46, v47) --[[ Line: 141 ]]
            -- upvalues: v45 (copy)
            v45:QueueRewards(v46, v47);
        end);
        v25:OnChanged(v4.Player, "OLIPOPCode2", function(v48) --[[ Line: 145 ]]
            -- upvalues: v45 (copy)
            v45._myOLIPOPCode = v48;
        end, true);
        v25:OnChanged(v4.Player, "Inventory", function(v49) --[[ Line: 149 ]]
            -- upvalues: v45 (copy)
            v45._inventory = v49;
        end, true);
        return;
    end;
end;
v36.Opened = function(v50) --[[ Line: 154 ]] --[[ Name: Opened ]]
    -- upvalues: v23 (ref), l_ReplicatedStorage_0 (copy), v35 (copy), v15 (copy), v7 (copy), v34 (copy), v33 (copy), v21 (ref), v5 (copy), l_UserInputService_0 (copy)
    local l_v23_GradientNameToUse_0 = v23:GetGradientNameToUse();
    if l_v23_GradientNameToUse_0 then
        v50._backgroundContent.UIGradient.Color = l_ReplicatedStorage_0.GUI.PlaytimeRewardGradients:FindFirstChild(l_v23_GradientNameToUse_0).Color;
        v50._shellIcon.Image = v35[l_v23_GradientNameToUse_0] or v35.Tier1;
    end;
    if v50._breathingConn then
        v50._breathingConn:Disconnect();
    end;
    v50._breathingConn = v15(v50._backgroundContent.UIGradient, 0.04, 0.3);
    local function v52() --[[ Line: 172 ]] --[[ Name: fadeInAndOut ]]
        -- upvalues: v50 (copy), v7 (ref), v52 (copy)
        if not v50._allToggled then
            return;
        elseif v50._fadingOut then
            return;
        else
            v7.target(v50._backgroundContent.Sparkles, {
                s = 3, 
                d = 1
            }, {
                ImageTransparency = 0.7
            }):AndThen(function() --[[ Line: 183 ]]
                -- upvalues: v50 (ref), v7 (ref), v52 (ref)
                if v50._fadingOut then
                    return;
                else
                    v7.target(v50._backgroundContent.Sparkles, {
                        s = 3, 
                        d = 1
                    }, {
                        ImageTransparency = 0
                    }):AndThen(v52);
                    return;
                end;
            end);
            return;
        end;
    end;
    task.spawn(v52);
    v7.target(v50._backgroundContent, {
        s = 20, 
        d = 0.6
    }, {
        BackgroundTransparency = 0.1
    });
    v7.target(v50._canvas, {
        s = 20, 
        d = 0.6
    }, {
        Position = UDim2.fromScale(0.5, 0.5)
    });
    v7.target(v50._shellIcon, {
        s = 12, 
        d = 0.6
    }, {
        Position = v34
    });
    v7.target(v50._continueHint, {
        s = 30, 
        d = 0.6
    }, {
        Position = v33
    });
    v21:TogglePlayerControls(false);
    v50._inputDump = v5.new();
    v50._inputDump:Add(l_UserInputService_0.InputBegan:Connect(function(v53) --[[ Line: 219 ]]
        -- upvalues: v50 (copy)
        if v53.UserInputType == Enum.UserInputType.MouseButton1 or v53.UserInputType == Enum.UserInputType.Touch then
            v50:_attemptSkip();
        end;
    end));
    v50._inputDump:Add(v21.GamepadButtonPressed:Connect(function() --[[ Line: 225 ]]
        -- upvalues: v50 (copy)
        v50:_attemptSkip();
    end));
    v50._inputDump:Add(function() --[[ Line: 229 ]]
        -- upvalues: v50 (copy)
        v50._inputDump = nil;
    end);
end;
v36.Closed = function(v54) --[[ Line: 234 ]] --[[ Name: Closed ]]
    -- upvalues: v21 (ref), l_RunService_0 (copy), v20 (ref)
    if v54._inputDump then
        v54._inputDump:Destroy();
    end;
    if v54._breathingConn then
        v54._breathingConn:Disconnect();
        v54._breathingConn = nil;
    end;
    v21:TogglePlayerControls(true);
    l_RunService_0.RenderStepped:Wait();
    l_RunService_0.RenderStepped:Wait();
    if v54._allToggled then
        v20:RevertFromToggleAll(v54._allToggled);
        table.clear(v54._allToggled);
        v54._allToggled = nil;
    end;
end;
v36.FadeOut = function(v55) --[[ Line: 258 ]] --[[ Name: FadeOut ]]
    -- upvalues: v7 (copy), v33 (copy)
    v55._fadingOut = true;
    v7.target(v55._continueHint, {
        s = 30, 
        d = 1
    }, {
        Position = v33 + UDim2.fromScale(0, 0.5)
    });
    v7.target(v55._backgroundContent.Sparkles, {
        s = 5, 
        d = 1
    }, {
        ImageTransparency = 0
    });
    v7.target(v55._backgroundContent, {
        s = 30, 
        d = 0.6
    }, {
        BackgroundTransparency = 1
    }):Await();
    v55._fadingOut = false;
end;
v36.CanOpen = function(v56) --[[ Line: 276 ]] --[[ Name: CanOpen ]]
    local v57 = true;
    if v56.currentMode ~= "Lobby" then
        v57 = true;
        if v56.currentMode ~= "Trading" then
            v57 = v56.currentMode == "Factions";
        end;
    end;
    return v57;
end;
v36.QueueRewards = function(v58, v59, v60) --[[ Line: 280 ]] --[[ Name: QueueRewards ]]
    v58:_doRoll(v59[1], v60);
end;
v36._doRoll = function(v61, v62, v63) --[[ Line: 287 ]] --[[ Name: _doRoll ]]
    -- upvalues: v20 (ref), v24 (ref), v8 (copy), v6 (copy), v37 (ref), v5 (copy), v27 (copy), v29 (copy), v9 (copy), v11 (copy), v10 (copy), v13 (copy), v12 (copy), v19 (copy), v14 (copy), v30 (copy), v7 (copy), v34 (copy), v26 (ref), v33 (copy), l_UserInputService_0 (copy), v28 (copy), v21 (ref), l_RunService_0 (copy), l_Quart_0 (copy), l_Out_0 (copy)
    if v20:GetToggleState(script.Name) then
        return;
    else
        if not v61._allToggled then
            v61._allToggled = v20:ToggleAll({
                script.Name
            }, false);
        end;
        v20:Toggle(script.Name, true);
        v24:FadeMusicVolume(0.3, 0.5);
        local v64 = nil;
        task.delay(0.5, function() --[[ Line: 302 ]]
            -- upvalues: v64 (ref), v24 (ref)
            v64 = v24:PlaySound({
                name = "ItemRoll.Background", 
                extraData = {
                    fadeIn = true, 
                    fadeTime = 2.25
                }, 
                properties = {
                    Volume = 1.1
                }
            });
        end);
        local l_v8_LootPool_0 = v8:GetLootPool(v63);
        l_v8_LootPool_0 = v6.Copy(l_v8_LootPool_0, true);
        if not v61.policyInfo or not v61.policyInfo.AreAdsAllowed then
            l_v8_LootPool_0 = v6.Filter(l_v8_LootPool_0, function(v66) --[[ Line: 321 ]]
                return not v66.isAd;
            end);
        end;
        if v61.countryCode ~= "US" then
            l_v8_LootPool_0 = v6.Filter(l_v8_LootPool_0, function(v67) --[[ Line: 328 ]]
                return v67.type ~= "OLIPOPCode";
            end);
            l_v8_LootPool_0 = v6.Filter(l_v8_LootPool_0, function(v68) --[[ Line: 332 ]]
                return v68.name ~= "OLIPOPRaceCar";
            end);
        end;
        if v62.type ~= "OLIPOPCode" and v61._myOLIPOPCode ~= nil then
            l_v8_LootPool_0 = v6.Filter(l_v8_LootPool_0, function(v69) --[[ Line: 338 ]]
                return v69.type ~= "OLIPOPCode";
            end);
        end;
        if v62.name == "OLIPOPRaceCar" and v61._inventory and v61._inventory.OLIPOPRaceCar then
            l_v8_LootPool_0 = v6.Filter(l_v8_LootPool_0, function(v70) --[[ Line: 344 ]]
                return v70.name ~= "OLIPOPRaceCar";
            end);
        end;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        l_v8_LootPool_0 = v6.Filter(l_v8_LootPool_0, function(v72) --[[ Line: 351 ]]
            -- upvalues: l_workspace_ServerTimeNow_0 (copy)
            if v72.startOn and l_workspace_ServerTimeNow_0 < v72.startOn then
                return false;
            elseif v72.expireOn and l_workspace_ServerTimeNow_0 >= v72.expireOn then
                return false;
            else
                return true;
            end;
        end);
        v37 = false;
        local v73 = v5.new();
        local v74 = v27:NextInteger(v29.Min, v29.Max);
        local v75 = nil;
        local v76 = {};
        for v77 = 1, 50 do
            local v78 = v9:RollLoot(l_v8_LootPool_0, true);
            if v77 == v74 then
                v78 = v62;
            end;
            local v79 = v77 - 1;
            local v80 = v61._canvas.AbsoluteSize.X / 1915;
            local v81 = v61._template:Clone();
            v81.Visible = true;
            v81.AnchorPoint = Vector2.new(0, 0.5);
            v81.Size = UDim2.fromOffset(300 * v80, 300 * v80);
            v81.Position = UDim2.new(0, 295 * v80 * v79, 0.5, 0);
            v81.Parent = v61._holder;
            local v82 = nil;
            if v78.type == "Unit" then
                v11:SetImage(v81.Icon, v78.name);
                v82 = select(2, v10:GetRarity(v78.name));
            elseif v78.type == "Pet" then
                v13:SetImage(v81.Icon, v78.name);
                v82 = select(2, v12:GetRarity(v78.name));
            elseif v78.type == "RandomBoost" then
                v82 = v78.rarity;
            elseif v78.type == "OLIPOPCode" then
                v82 = "Limited";
                v19:SetImage(v81.Icon, "Secret_Olipop", "OlipopSprites");
            else
                v81.Icon.Image = v9:GetIconFromRewardData(v78) or "";
                v82 = v9:GetRewardRarity(v78);
            end;
            if string.find(v78.name, "GIFT_") then
                local l_UICorner_0 = Instance.new("UICorner");
                l_UICorner_0.CornerRadius = UDim.new(1, 0);
                l_UICorner_0.Parent = v81.Icon;
            end;
            if v74 == v77 then
                v61._rarity.Text = v82;
                if v78.amount and v78.amount > 1 then
                    local v84 = v14:GetDisplayName(v78.name) or v78.name;
                    if v84:sub(-1, -1) == "s" then
                        v61._itemName.Text = ("x%* %*"):format(v78.amount, v84 or v78.name);
                    else
                        v61._itemName.Text = ("x%* %*s"):format(v78.amount, v84 or v78.name);
                    end;
                elseif v78.type == "OLIPOPCode" then
                    v61._itemName.Text = "FREE OLIPOP Code";
                else
                    v61._itemName.Text = v14:GetDisplayName(v78.name) or v78.name;
                end;
                v61._rarity:SetAttribute("Rarity", v82);
            end;
            if v77 == v74 then
                v75 = v81;
            end;
            table.insert(v76, v81);
        end;
        local v85 = v61._canvas.AbsolutePosition.X + v61._canvas.AbsoluteSize.X / 2;
        local v86 = v75.AbsolutePosition.X + v75.AbsoluteSize.X / 2 - v85;
        local v87 = 150 * (1.0E-4 * v61._canvas.AbsoluteSize.X / 2);
        local v88 = v61._holder.Position - UDim2.new(0, v86 + v87, 0, 0);
        local v89 = v27:NextInteger(v30.Min, v30.Max);
        local v90 = false;
        local function v98() --[[ Line: 464 ]] --[[ Name: finishCallback ]]
            -- upvalues: v90 (ref), v73 (copy), v76 (copy), v75 (ref), v7 (ref), v61 (copy), v34 (ref), v24 (ref), v64 (ref), v62 (copy), v26 (ref), v5 (ref), v33 (ref), l_UserInputService_0 (ref), v28 (ref), v21 (ref), v20 (ref)
            if v90 then
                return;
            else
                v90 = true;
                v73:Destroy();
                for _, v92 in v76 do
                    if v92 == v75 then
                        v7.target(v92.Icon, {
                            s = 30, 
                            d = 0.4
                        }, {
                            Size = UDim2.fromScale(1.45, 1.45)
                        });
                        v7.target(v92, {
                            s = 30, 
                            d = 0.7
                        }, {
                            Position = UDim2.new(v92.Position.X.Scale, v92.Position.X.Offset, 1.1, 0)
                        });
                    else
                        v7.target(v92.Icon, {
                            s = 30, 
                            d = 1
                        }, {
                            ImageTransparency = 1
                        }):AndThen(function() --[[ Line: 493 ]]
                            -- upvalues: v92 (copy)
                            v92:Destroy();
                        end);
                    end;
                end;
                table.clear(v76);
                v7.target(v61._itemName, {
                    s = 30, 
                    d = 1
                }, {
                    TextTransparency = 0
                });
                v7.target(v61._itemName.UIStroke, {
                    s = 30, 
                    d = 1
                }, {
                    Transparency = 0
                });
                v7.target(v61._shellIcon, {
                    s = 30, 
                    d = 1
                }, {
                    Position = v34 + UDim2.fromScale(0, 0.5)
                });
                v24:StopSound(v64, {
                    fadeOut = true, 
                    fadeTime = 0.5
                });
                v24:PlaySound({
                    properties = {
                        Volume = 0.5
                    }, 
                    name = "ItemRoll.Reward", 
                    soundGroup = "Master.SFX.UI"
                });
                local v93 = nil;
                if v62.type == "OLIPOPCode" then
                    v93 = v26:Prompt({
                        message = "You have received a FREE OLIPOP code! Check the Playtime Rewards Menu for your code!", 
                        options = {
                            {
                                text = "Ok!", 
                                callback = function() --[[ Line: 542 ]]
                                    -- upvalues: v93 (ref)
                                    v93 = nil;
                                end
                            }
                        }
                    });
                end;
                local v94 = false;
                local function v95() --[[ Line: 559 ]] --[[ Name: doTap ]]
                    -- upvalues: v94 (ref)
                    v94 = true;
                end;
                v61._dumpsterContinue = v5.new();
                v7.target(v61._continueHint, {
                    s = 30, 
                    d = 1
                }, {
                    Position = v33
                });
                v61._dumpsterContinue:Add(l_UserInputService_0.InputBegan:Connect(function(v96, _) --[[ Line: 569 ]]
                    -- upvalues: v28 (ref), v93 (ref), v94 (ref)
                    if not table.find(v28, v96.UserInputType) then
                        return;
                    elseif v93 then
                        return;
                    else
                        v94 = true;
                        return;
                    end;
                end));
                v61._dumpsterContinue:Add(v21.GamepadButtonPressed:Connect(v95));
                repeat
                    task.wait(0.1);
                until v94 == true;
                v61._dumpsterContinue:Destroy();
                v61._dumpsterContinue = nil;
                v24:FadeMusicVolume(1, 0.5);
                v7.target(v61._itemName, {
                    s = 30, 
                    d = 1
                }, {
                    TextTransparency = 1
                });
                v7.target(v61._itemName.UIStroke, {
                    s = 50, 
                    d = 1
                }, {
                    Transparency = 1
                });
                v7.target(v75.Icon, {
                    s = 30, 
                    d = 1
                }, {
                    ImageTransparency = 1
                });
                v61:FadeOut();
                v20:Toggle(script.Name, false);
                v75:Destroy();
                v61._holder.Position = UDim2.fromScale(0, 0);
                v61._itemName:RemoveTag("VisualizeRarity");
                v61._rarity:RemoveTag("VisualizeRarity");
                v61._itemName.TextTransparency = 1;
                v61._itemName.UIStroke.Transparency = 1;
                v61._rarity.TextTransparency = 1;
                v61._rarity.UIStroke.Transparency = 1;
                return;
            end;
        end;
        local v99 = 1;
        local v100 = false;
        local function v104(v101) --[[ Line: 632 ]] --[[ Name: addArch ]]
            -- upvalues: v76 (copy), v61 (copy)
            if not v76[v101] then
                return;
            else
                local v102 = math.abs(v76[v101].AbsolutePosition.X + v76[v101].AbsoluteSize.X / 2 - v61._canvas.AbsoluteSize.X / 2) / v61._canvas.AbsoluteSize.X * 2;
                local v103 = math.sin((1 - v102) * 0 + 0.7 * v102);
                v76[v101].Position = UDim2.new(v76[v101].Position.X.Scale, v76[v101].Position.X.Offset, v103 / 1.6 + 0.4, 0);
                v76[v101].Icon.ImageTransparency = v103 + 0;
                v76[v101].Icon.Size = UDim2.fromScale(-v103 / 1.4 + 0.85, -v103 / 1.4 + 0.85);
                return;
            end;
        end;
        local v105 = {};
        for v106 = 1, 15 do
            local v107 = v99 + v106 - 1;
            v104(v107);
            v105[v76[v107]] = v76[v107].Position;
        end;
        for v108 = 1, 15 do
            local v109 = v99 + v108 - 1;
            v76[v109].Position = UDim2.new(v76[v109].Position.X.Scale, v76[v109].Position.X.Offset, 2.5, 0);
        end;
        v24:PlaySound({
            properties = {
                Volume = 1
            }, 
            name = "ItemRoll.Open", 
            soundGroup = "Master.SFX.UI"
        });
        for v110 = 1, 15 do
            local v111 = v99 + v110 - 1;
            v7.target(v76[v111], {
                s = 30, 
                d = 0.4
            }, {
                Position = v105[v76[v111]]
            });
            task.wait(0.05);
        end;
        table.clear(v105);
        task.wait(0.25);
        v73:Add(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 697 ]]
            -- upvalues: v76 (copy), v99 (ref), v24 (ref), v104 (copy), v37 (ref), v100 (ref), v7 (ref), v61 (copy), l_Quart_0 (ref), l_Out_0 (ref), v88 (copy), v98 (copy)
            if v76[v99] and v76[v99].AbsolutePosition.X <= 0.5 then
                v99 = v99 + 1;
                v24:PlaySound({
                    properties = {
                        Volume = 0.25
                    }, 
                    name = "ItemRoll.SingleTick", 
                    soundGroup = "Master.SFX.UI"
                });
            end;
            v104(v99);
            for v112 = 1, 15 do
                v104(v99 - v112);
                v104(v99 + v112);
            end;
            if v37 and not v100 then
                v100 = true;
                v7.tween(v61._holder, TweenInfo.new(1.5, l_Quart_0, l_Out_0), {
                    Position = v88
                }):AndThen(v98);
            end;
        end));
        v7.tween(v61._holder, TweenInfo.new(v89, l_Quart_0, l_Out_0), {
            Position = v88
        }):AndThen(v98);
        return;
    end;
end;
v36._attemptSkip = function(v113) --[[ Line: 746 ]] --[[ Name: _attemptSkip ]]
    -- upvalues: v37 (ref), v7 (copy), v33 (copy)
    v37 = true;
    v7.target(v113._continueHint, {
        s = 30, 
        d = 1
    }, {
        Position = v33 + UDim2.fromScale(0, 0.5)
    });
end;
return v36;