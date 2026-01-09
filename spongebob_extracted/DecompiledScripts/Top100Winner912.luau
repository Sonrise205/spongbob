local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v5 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = require(v2.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
return {
    highPriority = true, 
    primaryMenu = true, 
    ToggleAll = {}, 
    Init = function(v17, v18, v19) --[[ Line: 40 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v2 (copy), v11 (ref), v12 (ref), v13 (ref), v14 (ref), v15 (ref), l_TweenService_0 (copy), v3 (copy)
        v10 = v2.GetController("UIController");
        v11 = v2.GetController("DataController");
        v12 = v2.GetController("BlurController");
        v13 = v2.GetController("AudioController");
        v14 = v2.GetService("FactionService");
        v15 = v2.GetService("LeaderboardService");
        v17.currentMode = v19;
        v17.ui = v18;
        v17.main = v17.ui.Main;
        local l_Background_0 = v17.main.Background;
        local l_Content_0 = v17.main.Content;
        local l_Inner_0 = l_Content_0.Inner.Inner;
        v17.claimButton = l_Inner_0.Confirm;
        local l_CloudsBack_0 = l_Background_0.CloudsBack;
        local l_CloudsFront_0 = l_Background_0.CloudsFront;
        local l_Angels_0 = l_Background_0.Angels;
        v17.rewardsFrame = l_Inner_0.Rewards;
        local v26 = {};
        for _, v28 in l_Background_0:GetChildren() do
            if v28.Name == "LightRay" then
                v28.ImageTransparency = 1;
                table.insert(v26, v28);
            end;
        end;
        l_CloudsBack_0.AnchorPoint = Vector2.new(0.5, 0);
        l_CloudsFront_0.AnchorPoint = Vector2.new(0.5, 0);
        l_Angels_0.AnchorPoint = Vector2.new(0, 1);
        l_Angels_0.Position = UDim2.fromScale(0, -0.1);
        l_Content_0.AnchorPoint = Vector2.new(0.5, 0);
        l_Content_0.Position = UDim2.fromScale(0.5, 1);
        v17.claimButton.Visible = true;
        v17.main.BackgroundTransparency = 1;
        v17.main.Visible = true;
        local v29 = {
            ["in"] = {
                clouds = TweenInfo.new(2.5, Enum.EasingStyle.Exponential), 
                angels = TweenInfo.new(2, Enum.EasingStyle.Exponential), 
                content = TweenInfo.new(1.5, Enum.EasingStyle.Cubic), 
                background = TweenInfo.new(1), 
                lightRays = TweenInfo.new(3.5)
            }, 
            out = {
                clouds = TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), 
                angels = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), 
                content = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), 
                background = TweenInfo.new(1.75, Enum.EasingStyle.Quad, Enum.EasingDirection.In), 
                lightRays = TweenInfo.new(1.75, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            }
        };
        v17.tweens = {
            [true] = {
                l_TweenService_0:Create(l_CloudsBack_0, v29["in"].clouds, {
                    AnchorPoint = Vector2.new(0.5, 1)
                }), 
                l_TweenService_0:Create(l_CloudsFront_0, v29["in"].clouds, {
                    AnchorPoint = Vector2.new(0.5, 1)
                }), 
                l_TweenService_0:Create(l_Content_0, v29["in"].content, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.475)
                }), 
                l_TweenService_0:Create(v17.main, v29["in"].background, {
                    BackgroundTransparency = 0.1
                }), 
                l_TweenService_0:Create(l_Angels_0, v29["in"].angels, {
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.fromScale(0, 0)
                })
            }, 
            [false] = {
                l_TweenService_0:Create(l_CloudsBack_0, v29.out.clouds, {
                    AnchorPoint = Vector2.new(0.5, 0)
                }), 
                l_TweenService_0:Create(l_CloudsFront_0, v29.out.clouds, {
                    AnchorPoint = Vector2.new(0.5, 0)
                }), 
                l_TweenService_0:Create(l_Content_0, v29.out.content, {
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.fromScale(0.5, 1)
                }), 
                l_TweenService_0:Create(v17.main, v29.out.background, {
                    BackgroundTransparency = 1
                }), 
                l_TweenService_0:Create(l_Angels_0, v29["in"].angels, {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0, -0.1)
                })
            }
        };
        for _, v31 in v26 do
            table.insert(v17.tweens[true], l_TweenService_0:Create(v31, v29["in"].lightRays, {
                ImageTransparency = 0
            }));
            table.insert(v17.tweens[false], l_TweenService_0:Create(v31, v29.out.lightRays, {
                ImageTransparency = 1
            }));
        end;
        v17.dumpster = v3.new();
    end, 
    Start = function(_) --[[ Line: 140 ]] --[[ Name: Start ]]
        -- upvalues: v16 (ref), v10 (ref)
        v16 = v10:GetModuleAsync("Notification"):expect();
    end, 
    Closed = function(v33) --[[ Line: 144 ]] --[[ Name: Closed ]]
        v33.dumpster:Destroy();
    end, 
    Opened = function(v34) --[[ Line: 148 ]] --[[ Name: Opened ]]
        -- upvalues: v7 (copy), v4 (copy), v9 (copy), v13 (ref), v12 (ref), v5 (copy), v10 (ref), v15 (ref), v16 (ref)
        local v35 = {};
        for v36, v37 in v34.placementData.previous do
            if v7.LEADERBOARDS.PLACEMENT_PRIZES[v36] then
                local v38 = v4.Copy(v7.LEADERBOARDS.PLACEMENT_PRIZES[v36], true);
                v38.amount = v37;
                table.insert(v35, v38);
            end;
        end;
        v34.dumpster:Add(v9.new(v35, {
            template = v34.rewardsFrame.Template, 
            parent = v34.rewardsFrame
        }));
        task.wait();
        v13:PlaySound({
            name = "SFX.Angels", 
            soundGroup = "Master.SFX.UI", 
            duckMusic = true
        });
        v12:SetBlur(v12.DEFAULT_SIZE, 1.5);
        for _, v40 in v34.tweens[true] do
            v40.Completed:Once(function() --[[ Line: 179 ]]
                -- upvalues: v40 (copy)
                v40:Destroy();
            end);
            v40:Play();
        end;
        local function v45() --[[ Line: 186 ]] --[[ Name: close ]]
            -- upvalues: v34 (copy), v5 (ref), v10 (ref), v12 (ref)
            local v41 = {};
            for _, v43 in v34.tweens[false] do
                table.insert(v41, v5.new(function(v44) --[[ Line: 190 ]]
                    -- upvalues: v43 (copy)
                    v43.Completed:Once(function() --[[ Line: 191 ]]
                        -- upvalues: v43 (ref), v44 (copy)
                        v43:Destroy();
                        v44();
                    end);
                    v43:Play();
                end));
            end;
            v5.all(v41):andThen(function() --[[ Line: 200 ]]
                -- upvalues: v10 (ref)
                v10:Toggle(script.Name, false);
            end);
            v12:SetBlur(0, 1.5);
        end;
        v34.dumpster:Add(v10:HandleButton(v34.claimButton, function() --[[ Line: 207 ]]
            -- upvalues: v34 (copy), v15 (ref), v45 (copy), v13 (ref), v16 (ref)
            v34.dumpster:Remove("ClaimButton");
            v15:ClaimSeasonPrize():andThen(function() --[[ Line: 210 ]]
                -- upvalues: v45 (ref), v13 (ref), v16 (ref)
                v45();
                v13:PlaySound({
                    name = "UI.Success", 
                    soundGroup = "Master.SFX.UI"
                });
                v16:Notify({
                    message = "Rewards successfully claimed!", 
                    isPositive = true
                });
            end);
        end), "ClaimButton");
    end, 
    Open = function(v46, v47) --[[ Line: 228 ]] --[[ Name: Open ]]
        -- upvalues: v10 (ref)
        v46.placementData = v47;
        v10:Toggle(script.Name, true);
    end
};