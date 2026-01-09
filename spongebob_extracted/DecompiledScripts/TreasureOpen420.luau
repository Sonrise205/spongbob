local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = nil;
local v5 = nil;
local v6 = nil;
return {
    primaryMenu = false, 
    Init = function(v7, v8) --[[ Line: 32 ]] --[[ Name: Init ]]
        -- upvalues: v4 (ref), v1 (copy), v5 (ref), v6 (ref)
        v4 = v1.GetController("DataController");
        v5 = v1.GetController("UIController");
        v6 = v1.GetController("TreasureController");
        v7.ui = v8;
        v7.openFrame = v7.ui.Opening;
        v7.bottom = v7.openFrame.Bottom;
        v7.chances = v7.bottom.Chances;
        v7.rarityLabel = v7.openFrame.Rarity;
        v7:Reset();
    end, 
    Start = function(v9, _) --[[ Line: 47 ]] --[[ Name: Start ]]
        -- upvalues: v5 (ref), v6 (ref)
        v5:HandleButton(v9.openFrame.StopOpenAll, function() --[[ Line: 48 ]]
            -- upvalues: v6 (ref)
            v6.StopOpenAll:Fire();
        end);
    end, 
    Closed = function(v11) --[[ Line: 53 ]] --[[ Name: Closed ]]
        v11:Reset();
    end, 
    Reset = function(v12) --[[ Line: 57 ]] --[[ Name: Reset ]]
        v12.rarityLabel:RemoveTag("VisualizeRarity");
        v12.rarityLabel:SetAttribute("Rarity");
        for _, v14 in v12.chances:GetChildren() do
            if v14:IsA("Frame") then
                v14.Content.Shiny.Visible = false;
                v14.Content.Wumbo.Visible = false;
                v14.Inner.Visible = true;
                v14.Inner.UIScale.Scale = 1;
            end;
        end;
    end, 
    SetIndex = function(v15, v16, v17, v18, v19) --[[ Line: 74 ]] --[[ Name: SetIndex ]]
        v15.rarityLabel:RemoveTag("VisualizeRarity");
        v15.rarityLabel.Text = v16;
        v15.rarityLabel:SetAttribute("Rarity", v16);
        v15.rarityLabel:AddTag("VisualizeRarity");
        for v20 = 1, v17 do
            local l_FirstChild_0 = v15.chances:FindFirstChild(v20);
            if l_FirstChild_0 then
                if v18 and v19 and v20 < v17 then
                    local v22 = v18[v20] or "Normal";
                    local l_Shiny_0 = l_FirstChild_0.Content.Shiny;
                    local v24 = true;
                    if v22 ~= "Shiny" then
                        v24 = true;
                        if v22 ~= "ShinyWumbo" then
                            v24 = false;
                        end;
                    end;
                    l_Shiny_0.Visible = v24;
                    l_Shiny_0 = l_FirstChild_0.Content.Wumbo;
                    v24 = true;
                    if v22 ~= "Wumbo" then
                        v24 = true;
                        if v22 ~= "ShinyWumbo" then
                            v24 = false;
                        end;
                    end;
                    l_Shiny_0.Visible = v24;
                end;
                l_FirstChild_0.Inner.Visible = v17 <= v20;
                l_FirstChild_0.Inner.UIScale.Scale = v20 == v17 and 1.2 or 1;
            end;
        end;
        if #v15.chances:GetChildren() - 1 < v17 then
            v15.chances.Visible = false;
            v15.bottom.Title.Visible = false;
            v15.bottom.Hint.Visible = true;
            return;
        else
            v15.chances.Visible = true;
            v15.bottom.Title.Visible = true;
            v15.bottom.Hint.Visible = false;
            return;
        end;
    end, 
    ReportOpenAll = function(v25, v26) --[[ Line: 112 ]] --[[ Name: ReportOpenAll ]]
        v25.openFrame.StopOpenAll.Visible = v26 or false;
    end
};