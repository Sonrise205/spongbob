local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Utf8Library);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = v1.GetController("DataController");
local v10 = v1.GetController("UIController");
local v11 = v1.GetController("PurchaseController");
local v12 = v1.GetService("SeasonPassService");
local v13 = nil;
local v14 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v14.Construct = function(v15) --[[ Line: 39 ]] --[[ Name: Construct ]]
    -- upvalues: v13 (ref), v10 (copy), v3 (copy)
    if not v13 then
        v13 = v10:GetModuleAsync("MessagePrompt"):expect();
    end;
    v15.dump = v3.new();
    v15.dump:Add(function() --[[ Line: 47 ]]
        -- upvalues: v15 (copy)
        v15.dump = nil;
    end);
end;
v14.Start = function(v16) --[[ Line: 52 ]] --[[ Name: Start ]]
    -- upvalues: v12 (copy), v9 (copy), v1 (copy), v5 (copy), v11 (copy), v6 (copy), v10 (copy), v13 (ref), v7 (copy), v8 (copy)
    v16.billboardPart = v16.Instance:WaitForChild("BillboardPart", 10);
    if not v16.billboardPart then
        v16:Stop();
        return;
    else
        v16.currentSeason = v12.Season:OnReady():expect();
        v16.dump:Add(v9:OnChanged(v1.Player, "Faction", function(v17) --[[ Line: 62 ]]
            -- upvalues: v16 (copy)
            local v18 = "JOIN FACTION";
            v16.factionData = v17;
            if v17.Id ~= 0 then
                v18 = "CHANGE FACTION";
            end;
            if v17.Season ~= v16.currentSeason or v17.Id == 0 then
                v16.inFaction = false;
            else
                v16.inFaction = true;
            end;
            v16.billboardPart.Attachment.BillboardGui.Interaction.TextLabel.Text = v18;
        end, true));
        local v19 = v5.new(v16.Instance:WaitForChild("Prompt"));
        local v20 = nil;
        v11:PromiseProductInfo("FactionChange", Enum.InfoType.Product):andThen(function(v21) --[[ Line: 85 ]]
            -- upvalues: v20 (ref)
            v20 = v21 and v21.PriceInRobux or 0;
        end);
        local v22 = ("You are currently in the %%s faction. Would you like to change your faction for %*%%s?"):format(v6.Robux);
        v19.localPlayerEntered:Connect(function() --[[ Line: 92 ]]
            -- upvalues: v16 (copy), v10 (ref), v20 (ref), v13 (ref), v7 (ref), v22 (copy), v8 (ref), v11 (ref)
            if not v16.inFaction or v16.factionData and v16.factionData._canChangeFaction then
                v10:Toggle("FactionSelect", true);
                return;
            elseif not v20 then
                v13:Prompt({
                    message = "Faction change is not available at this time due to a Roblox Error.", 
                    options = {
                        {
                            text = "Ok"
                        }
                    }
                });
                return;
            else
                local v23 = v7.FACTIONS.FACTION_NAMES[v16.factionData.Id];
                v13:Prompt({
                    message = string.format(v22, v23, v8:CommaNumber(v20)), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 116 ]] --[[ Name: callback ]]
                                -- upvalues: v11 (ref)
                                v11:PromptProductPurchase("FactionChange");
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
                return;
            end;
        end);
        v19.localPlayerExited:Connect(function() --[[ Line: 125 ]]
            -- upvalues: v10 (ref)
            if v10:GetToggleState("FactionSelect") then
                v10:Toggle("FactionSelect", false);
            end;
        end);
        v16.dump:Add(v19);
        return;
    end;
end;
v14.Stop = function(v24) --[[ Line: 134 ]] --[[ Name: Stop ]]
    if v24.dump then
        v24.dump:Destroy();
    end;
end;
return v14;