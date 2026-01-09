local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.GetButtons);
local v7 = require(l_ReplicatedStorage_0.Packages.Tree);
local v8 = require(v2.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v9 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v10 = require(l_ReplicatedFirst_0.PlaceIds);
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = {
    "Content/UIGradient", 
    "Content/UIStroke", 
    "Content/Title/UIStroke"
};
local v19 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 4, 31)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 4, 31))
});
local v20 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
});
return {
    primaryMenu = true, 
    blur = true, 
    _pages = {}, 
    _pageButtonObjects = {}, 
    PageChanged = v3.new(), 
    dumpster = v9.new(), 
    Init = function(v21, v22, v23) --[[ Line: 61 ]] --[[ Name: Init ]]
        -- upvalues: v11 (ref), v2 (copy), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v18 (copy), v7 (copy)
        v11 = v2.GetController("UIController");
        v12 = v2.GetController("EventController");
        v13 = v2.GetController("FastTravelController");
        v14 = v2.GetController("DataController");
        v15 = v2.GetController("PlaceTeleportController");
        v21.currentMode = v23;
        v21.ui = v22;
        v21.main = v22.Main.Window;
        v21.content = v21.main.Content;
        v21.indexContent = v21.content.Bin.Collection.Main;
        v21.navBar = v21.content.Top.Buttons;
        v21.pagesBin = v21.content.Bin;
        v21.exitBtn = v21.main.Exit;
        v21.timerBar = v21.main.TimerBar;
        v21.activeColors = {};
        v21.inactiveColors = {};
        for _, v25 in v18 do
            v21.activeColors[v25] = v7.Find(v21.navBar.Overview, v25).Color;
            v21.inactiveColors[v25] = v7.Find(v21.navBar.Collection, v25).Color;
        end;
    end, 
    Start = function(v26) --[[ Line: 91 ]] --[[ Name: Start ]]
        -- upvalues: v16 (ref), v11 (ref), v17 (ref), v10 (copy), v15 (ref), v13 (ref), v6 (copy), v12 (ref), v5 (copy)
        v16 = v11:GetModuleAsync("RaidShop"):expect();
        v17 = v11:GetModuleAsync("MessagePrompt"):expect();
        v11:HandleButton(v26.pagesBin.Overview.Teleport.Confirm, function() --[[ Line: 95 ]]
            -- upvalues: v26 (copy), v17 (ref), v10 (ref), v15 (ref), v13 (ref), v11 (ref)
            if v26.currentMode ~= "Lobby" then
                v17:Prompt({
                    message = v10:GetDestinationPrompt("Lobby"), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 102 ]] --[[ Name: callback ]]
                                -- upvalues: v15 (ref)
                                v15:Teleport("Lobby");
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
                return;
            else
                v13:Travel("Raids");
                v11:Toggle(script.Name, false);
                return;
            end;
        end);
        for _, v28 in v26.pagesBin:GetChildren() do
            if v28:IsA("Frame") then
                v26._pages[v28.Name] = v28;
                v28.Visible = false;
            end;
        end;
        v26._pageButtons = v6(v26.navBar, function(v29) --[[ Line: 127 ]]
            return v29:GetAttribute("Locked") ~= true;
        end, function(v30) --[[ Line: 129 ]]
            -- upvalues: v11 (ref), v16 (ref), v26 (copy)
            v11:HandleButton(v30, function() --[[ Line: 130 ]]
                -- upvalues: v30 (copy), v16 (ref), v26 (ref)
                if v30.Name == "Shop" then
                    v16:OpenFrom(script.Name);
                end;
                v26:SetPage(v30.Name);
            end);
        end, true);
        v26:SetPage("Overview");
        v11:HandleButton(v26.exitBtn, function() --[[ Line: 142 ]]
            -- upvalues: v11 (ref)
            v11:Toggle(script.Name, false);
        end);
        v12.EventEnded:Connect(function() --[[ Line: 146 ]]
            -- upvalues: v11 (ref)
            if v11:GetToggleState(script.Name) then
                v11:Toggle(script.Name, false);
            end;
        end);
        local l_v12_Timestamps_0, v32 = v12:GetTimestamps();
        l_v12_Timestamps_0 = l_v12_Timestamps_0.UnixTimestamp;
        v32 = v32.UnixTimestamp;
        v12:ObserveTimeLeft(function(v33, _, v35) --[[ Line: 157 ]]
            -- upvalues: v26 (copy), v5 (ref), v32 (ref), l_v12_Timestamps_0 (ref)
            v26.timerBar.Bar.Title.Text = v35 and "Event Begins In" or "Event Ends In";
            v26.timerBar.Bar.Timer.Text = v5:FormatTimeFromSeconds(v33 or 0);
            local v36 = math.clamp(1 - v33 / (v32 - l_v12_Timestamps_0), 0, 1);
            v26.timerBar.Bar.Fill.Size = UDim2.fromScale(v36, 1);
        end);
    end, 
    Opening = function(v37) --[[ Line: 169 ]] --[[ Name: Opening ]]
        -- upvalues: v8 (copy), v4 (copy), v14 (ref), v2 (copy), v20 (copy), v19 (copy)
        for _, v39 in v37.indexContent:GetChildren() do
            local l_Model_0 = v39.ViewportFrame.WorldModel:FindFirstChildOfClass("Model");
            if l_Model_0 then
                local v41 = l_Model_0:GetAttribute("Animation") or v39.Name;
                local v42 = v8.new(v41, l_Model_0, "Friendlies");
                if v42 then
                    v42:Play("Idle");
                    v37.dumpster:Add(v42);
                end;
                local v43 = select(2, v4:GetRarity(v39.Name));
                v39.TowerInfo.Rarity.Text = v43;
                v39.TowerInfo.Rarity:SetAttribute("Rarity", v43);
                v39.TowerInfo.Rarity:AddTag("VisualizeRarity");
                v37.dumpster:Add(function() --[[ Line: 191 ]]
                    -- upvalues: v39 (copy)
                    v39.TowerInfo.Rarity:RemoveTag("VisualizeRarity");
                end);
            end;
        end;
        v37.dumpster:Add(v14:OnChanged(v2.Player, "UnitsIndex", function(v44) --[[ Line: 196 ]]
            -- upvalues: v37 (copy), v20 (ref), v19 (ref)
            if not v44 then
                return;
            else
                for _, v46 in v37.indexContent:GetChildren() do
                    if v44.Index[v46.Name] then
                        v46.ViewportFrame.UIGradient.Color = v20;
                    else
                        v46.ViewportFrame.UIGradient.Color = v19;
                    end;
                end;
                return;
            end;
        end, true));
    end, 
    Closed = function(v47) --[[ Line: 211 ]] --[[ Name: Closed ]]
        v47.dumpster:Clean();
    end, 
    SetPage = function(v48, v49) --[[ Line: 216 ]] --[[ Name: SetPage ]]
        -- upvalues: v7 (copy)
        if not v48._pages[v49] then
            return;
        else
            v48._currentPage = v49;
            for v50, v51 in v48._pageButtons do
                local v52 = if v50 == v49 then v48.activeColors else v48.inactiveColors;
                if not v48._pageButtonObjects[v50] then
                    v48._pageButtonObjects[v50] = {};
                end;
                for v53, v54 in v52 do
                    local v55 = v48._pageButtonObjects[v50][v53];
                    if not v55 then
                        v55 = v7.Find(v51, v53);
                        v48._pageButtonObjects[v50][v53] = v55;
                    end;
                    if v55 then
                        v55.Color = v54;
                    end;
                end;
            end;
            for v56, v57 in v48._pages do
                v57.Visible = v56 == v49;
            end;
            v48.PageChanged:Fire(v48._currentPage);
            return;
        end;
    end
};