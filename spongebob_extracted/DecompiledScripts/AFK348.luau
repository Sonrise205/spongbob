local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("StarterGui");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedFirst_0.PlaceIds);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v17 = require(v4.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
return {
    primaryMenu = false, 
    Init = function(v22, v23, v24) --[[ Line: 47 ]] --[[ Name: Init ]]
        -- upvalues: v18 (ref), v4 (copy), v19 (ref), v20 (ref), v21 (ref), v9 (copy), v5 (copy)
        v18 = v4.GetController("UIController");
        v19 = v4.GetService("AFKService");
        v20 = v4.GetController("PlaceTeleportController");
        v21 = v4.GetController("DataController");
        v22.currentMode = v24;
        v22.ui = v23;
        v22.main = v23.Main;
        v22.title = v22.main.Title;
        v22.returnButton = v22.main.Return.Button;
        v22.timeFrame = v22.main.Time;
        v22.timeLabel = v22.timeFrame.Timer;
        v22.rewardsContainer = v22.main.Rewards.Inner;
        v22.timeFrame.Visible = false;
        v22.regularTemplate = v22.rewardsContainer.RegularTemplate:Clone();
        v22.rewardsContainer.RegularTemplate:Destroy();
        v22.exclusiveTemplate = v22.rewardsContainer.ExclusiveTemplate:Clone();
        v22.rewardsContainer.ExclusiveTemplate:Destroy();
        v22.currentMode = v9:GetDestination();
        v22.dumpster = v5.new();
    end, 
    Start = function(v25) --[[ Line: 76 ]] --[[ Name: Start ]]
        -- upvalues: l_GuiService_0 (copy), v18 (ref), v20 (ref), v4 (copy), v7 (copy), v11 (copy), v19 (ref), v21 (ref)
        if v25.currentMode ~= "AFK" then
            return;
        else
            local function v27() --[[ Line: 81 ]] --[[ Name: offsetTitle ]]
                -- upvalues: l_GuiService_0 (ref), v25 (copy)
                local l_Height_0 = l_GuiService_0.TopbarInset.Height;
                v25.title.Position = UDim2.fromOffset(0, l_Height_0 + l_Height_0 * 0.25);
            end;
            local l_Height_1 = l_GuiService_0.TopbarInset.Height;
            v25.title.Position = UDim2.fromOffset(0, l_Height_1 + l_Height_1 * 0.25);
            l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(v27);
            v18:HandleButton(v25.returnButton, function() --[[ Line: 89 ]]
                -- upvalues: v20 (ref)
                v20:Teleport("Lobby");
            end);
            l_Height_1 = function() --[[ Line: 93 ]] --[[ Name: startTimer ]]
                -- upvalues: v25 (copy), v4 (ref), v7 (ref), v11 (ref)
                v25.dumpster:Destroy();
                local l_Attribute_0 = v4.Player:GetAttribute("NextAFKReward");
                if not l_Attribute_0 then
                    return;
                else
                    v25.timeFrame.Visible = true;
                    v25.dumpster:Add(v7.Simple(0.5, function() --[[ Line: 103 ]]
                        -- upvalues: l_Attribute_0 (copy), v25 (ref), v11 (ref)
                        local v30 = math.max(0, l_Attribute_0 - workspace:GetServerTimeNow());
                        v25.timeLabel.Text = v11:FormatMMSS(v30);
                    end, true));
                    return;
                end;
            end;
            l_Height_1();
            v4.Player:GetAttributeChangedSignal("NextAFKReward"):Connect(l_Height_1);
            v19.Reward:Connect(function(v31) --[[ Line: 112 ]]
                -- upvalues: v25 (copy)
                v25:CreateReward(v31);
            end);
            v21:Get(v4.Player, "AFKRewards"):andThen(function(v32) --[[ Line: 116 ]]
                -- upvalues: v25 (copy)
                for _, v34 in v32 do
                    v25:CreateReward(v34);
                end;
            end);
            return;
        end;
    end, 
    Closed = function(_) --[[ Line: 123 ]] --[[ Name: Closed ]]

    end, 
    CreateReward = function(v36, v37) --[[ Line: 128 ]] --[[ Name: CreateReward ]]
        -- upvalues: v16 (copy), v13 (copy), v12 (copy), v17 (copy), v14 (copy), v10 (copy)
        local l_FirstChild_0 = v36.rewardsContainer:FindFirstChild(v37.name);
        if l_FirstChild_0 then
            local v39 = string.gsub(l_FirstChild_0.Icon.Amount.Text, "x", "");
            l_FirstChild_0.Icon.Amount.Text = ("x%*"):format(tonumber(v39) + v37.amount);
            return;
        else
            local v40 = v37.type == "Unit";
            local v41 = (if v40 then v36.exclusiveTemplate else v36.regularTemplate):Clone();
            v41.LayoutOrder = v40 and 1 or v37.type == "Currency" and 2 or 1;
            v41.Name = v37.name;
            local l_Icon_0 = v41.Icon;
            local l_Icon_1 = l_Icon_0.Icon;
            local l_Viewport_0 = l_Icon_0.Viewport;
            local l_Backdrop_0 = l_Icon_0.Backdrop;
            local l_Amount_0 = l_Icon_0.Amount;
            local l_Title_0 = v41.Title;
            local v48 = not v40 and v16:GetByItemName(v37.name);
            local v49 = if v40 then select(2, v13:GetRarity(v37.name)) else if v48 then v48.rarity else "Common";
            v12.new(l_Backdrop_0, v49);
            l_Icon_1.Visible = not v40;
            l_Viewport_0.Visible = v40;
            l_Amount_0.Text = ("x%*"):format(v37.amount);
            v41.Parent = v36.rewardsContainer;
            v17.new(v41, {
                Name = v37.name, 
                IsUnit = v40 or false
            });
            if v40 then
                v14.new(l_Viewport_0, v37.name);
                l_Title_0.Text = v13:GetUnitValue(v37.name, "FullName");
                return;
            else
                l_Title_0.Text = v48 and v48.displayName or v48.DisplayName or v37.name;
                l_Icon_1.Image = v48.icon or v10:GetIconFromRewardData(v37) or "";
                return;
            end;
        end;
    end
};