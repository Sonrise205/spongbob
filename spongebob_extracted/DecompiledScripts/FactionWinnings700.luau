local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
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
return {
    highPriority = true, 
    primaryMenu = true, 
    ToggleAll = {}, 
    Init = function(v16, v17, v18) --[[ Line: 39 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v2 (copy), v11 (ref), v12 (ref), v13 (ref), v14 (ref), v3 (copy)
        v10 = v2.GetController("UIController");
        v11 = v2.GetController("DataController");
        v12 = v2.GetController("BlurController");
        v13 = v2.GetController("AudioController");
        v14 = v2.GetService("FactionService");
        v16.currentMode = v18;
        v16.ui = v17;
        v16.frames = {
            [1] = v17["1"], 
            [2] = v17["2"], 
            [3] = v17["3"]
        };
        for _, v20 in v16.frames do
            v20.Visible = false;
        end;
        v16.dumpster = v3.new();
    end, 
    Start = function(_) --[[ Line: 63 ]] --[[ Name: Start ]]
        -- upvalues: v15 (ref), v10 (ref)
        v15 = v10:GetModuleAsync("Notification"):expect();
    end, 
    Closed = function(v22) --[[ Line: 67 ]] --[[ Name: Closed ]]
        v22.dumpster:Destroy();
    end, 
    OnJoin = function(v23) --[[ Line: 71 ]] --[[ Name: OnJoin ]]
        -- upvalues: v7 (copy)
        local v24 = v23:_getPendingGrandPrize();
        local v25 = v7.FACTIONS.GRAND_PRIZES[tostring(v24)];
        local v26 = false;
        if v24 ~= nil then
            v26 = v25 ~= nil;
        end;
        return v26;
    end, 
    Opened = function(v27) --[[ Line: 78 ]] --[[ Name: Opened ]]
        -- upvalues: v10 (ref), v7 (copy), l_TweenService_0 (copy), v9 (copy), v13 (ref), v12 (ref), v5 (copy), v14 (ref), v15 (ref)
        local v28, v29, v30 = v27:_getPendingGrandPrize();
        if not v28 or not v29 or not v30 then
            v10:Toggle(script.Name, false);
            return;
        else
            local v31 = v7.FACTIONS.GRAND_PRIZES[tostring(v28)][v29];
            local v32 = v27.frames[v29];
            local l_Background_0 = v32.Background;
            local l_Content_0 = v32.Content;
            local l_Inner_0 = l_Content_0.Inner.Inner;
            local l_Info_0 = l_Inner_0.Info;
            local l_Confirm_0 = l_Inner_0.Confirm;
            local l_CloudsBack_0 = l_Background_0.CloudsBack;
            local l_CloudsFront_0 = l_Background_0.CloudsFront;
            local l_Main_0 = l_Inner_0.Rewards.Main;
            local v41 = {};
            local v42 = {};
            for _, v44 in l_Background_0:GetChildren() do
                if v44.Name == "Faction" then
                    v44.Image = v7.FACTIONS.BANNER_IMAGES[v30];
                    v44.AnchorPoint = Vector2.new(0.5, 1);
                    table.insert(v41, v44);
                elseif v44.Name == "LightRay" then
                    v44.ImageTransparency = 1;
                    table.insert(v42, v44);
                end;
            end;
            l_CloudsBack_0.AnchorPoint = Vector2.new(0.5, 0);
            l_CloudsFront_0.AnchorPoint = Vector2.new(0.5, 0);
            l_Content_0.AnchorPoint = Vector2.new(0.5, 0);
            l_Content_0.Position = UDim2.fromScale(0.5, 1);
            l_Info_0.Season.Text = ("in Season %*"):format(v28);
            l_Confirm_0.Visible = true;
            v32.BackgroundTransparency = 1;
            v32.Visible = true;
            local v45 = {
                ["in"] = {
                    clouds = TweenInfo.new(2.5, Enum.EasingStyle.Exponential), 
                    banner = TweenInfo.new(2, Enum.EasingStyle.Exponential), 
                    content = TweenInfo.new(1.5, Enum.EasingStyle.Cubic), 
                    background = TweenInfo.new(1), 
                    lightRays = TweenInfo.new(3.5)
                }, 
                out = {
                    clouds = TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), 
                    banner = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), 
                    content = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), 
                    background = TweenInfo.new(1.75, Enum.EasingStyle.Quad, Enum.EasingDirection.In), 
                    lightRays = TweenInfo.new(1.75, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                }
            };
            local v46 = {
                [true] = {
                    l_TweenService_0:Create(l_CloudsBack_0, v45["in"].clouds, {
                        AnchorPoint = Vector2.new(0.5, 1)
                    }), 
                    l_TweenService_0:Create(l_CloudsFront_0, v45["in"].clouds, {
                        AnchorPoint = Vector2.new(0.5, 1)
                    }), 
                    l_TweenService_0:Create(l_Content_0, v45["in"].content, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5)
                    }), 
                    l_TweenService_0:Create(v32, v45["in"].background, {
                        BackgroundTransparency = 0.1
                    })
                }, 
                [false] = {
                    l_TweenService_0:Create(l_CloudsBack_0, v45.out.clouds, {
                        AnchorPoint = Vector2.new(0.5, 0)
                    }), 
                    l_TweenService_0:Create(l_CloudsFront_0, v45.out.clouds, {
                        AnchorPoint = Vector2.new(0.5, 0)
                    }), 
                    l_TweenService_0:Create(l_Content_0, v45.out.content, {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 1)
                    }), 
                    l_TweenService_0:Create(v32, v45.out.background, {
                        BackgroundTransparency = 1
                    })
                }
            };
            for _, v48 in v42 do
                table.insert(v46[true], l_TweenService_0:Create(v48, v45["in"].lightRays, {
                    ImageTransparency = 0
                }));
                table.insert(v46[false], l_TweenService_0:Create(v48, v45.out.lightRays, {
                    ImageTransparency = 1
                }));
            end;
            for _, v50 in v41 do
                table.insert(v46[true], l_TweenService_0:Create(v50, v45["in"].banner, {
                    AnchorPoint = Vector2.new(0.5, 0)
                }));
                table.insert(v46[false], l_TweenService_0:Create(v50, v45.out.banner, {
                    AnchorPoint = Vector2.new(0.5, 1)
                }));
            end;
            v27.dumpster:Add(v9.new(v31, {
                template = l_Main_0.Template, 
                parent = l_Main_0
            }));
            task.wait();
            v13:PlaySound({
                name = "SFX.Angels", 
                soundGroup = "Master.SFX.UI", 
                duckMusic = true
            });
            v12:SetBlur(v12.DEFAULT_SIZE, 1.5);
            for _, v52 in v46[true] do
                v52.Completed:Once(function() --[[ Line: 216 ]]
                    -- upvalues: v52 (copy)
                    v52:Destroy();
                end);
                v52:Play();
            end;
            local function v57() --[[ Line: 223 ]] --[[ Name: close ]]
                -- upvalues: v46 (copy), v5 (ref), v10 (ref), v12 (ref)
                local v53 = {};
                for _, v55 in v46[false] do
                    table.insert(v53, v5.new(function(v56) --[[ Line: 227 ]]
                        -- upvalues: v55 (copy)
                        v55.Completed:Once(function() --[[ Line: 228 ]]
                            -- upvalues: v55 (ref), v56 (copy)
                            v55:Destroy();
                            v56();
                        end);
                        v55:Play();
                    end));
                end;
                v5.all(v53):andThen(function() --[[ Line: 237 ]]
                    -- upvalues: v10 (ref)
                    v10:Toggle(script.Name, false);
                end);
                v12:SetBlur(0, 1.5);
            end;
            v27.dumpster:Add(v10:HandleButton(l_Confirm_0, function() --[[ Line: 244 ]]
                -- upvalues: v27 (copy), v14 (ref), v28 (copy), v57 (copy), v13 (ref), v15 (ref)
                v27.dumpster:Remove("ClaimButton");
                v14:ClaimGrandPrize(v28):andThen(function() --[[ Line: 247 ]]
                    -- upvalues: v57 (ref), v13 (ref), v15 (ref)
                    v57();
                    v13:PlaySound({
                        name = "UI.Success", 
                        soundGroup = "Master.SFX.UI"
                    });
                    v15:Notify({
                        message = "Rewards successfully claimed!", 
                        isPositive = true
                    });
                end);
            end), "ClaimButton");
            return;
        end;
    end, 
    _getPendingGrandPrize = function(_) --[[ Line: 267 ]] --[[ Name: _getPendingGrandPrize ]]
        -- upvalues: v11 (ref), v2 (copy)
        for v59, v60 in (v11:Get(v2.Player, "PendingFactionGrandPrizes"):expect()) do
            if not v60.claimed then
                return tonumber(v59), v60.place, v60.id;
            end;
        end;
    end
};