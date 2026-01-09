local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v8 = require(l_ReplicatedStorage_0.RNGRolls);
local v9 = require(l_ReplicatedStorage_0.SummoningPools);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local v15 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    _itemObjects = {}, 
    Init = function(v21, v22) --[[ Line: 52 ]] --[[ Name: Init ]]
        -- upvalues: v16 (ref), v1 (copy), v17 (ref), v18 (ref), v19 (ref)
        v16 = v1.GetController("DataController");
        v17 = v1.GetController("UIController");
        v18 = v1.GetController("PurchaseController");
        v19 = v1.GetService("TreasureService");
        v21.ui = v22;
        v21.main = v22.Main.Main;
        v21.exitBtn = v21.main.Exit;
        v21.content = v21.main.Content;
        v21.bin = v21.content.Bin;
        v21.templateItem = v21.bin.Rare.Units.Template;
        v21.templateItem.Visible = false;
    end, 
    Start = function(v23, _) --[[ Line: 69 ]] --[[ Name: Start ]]
        -- upvalues: v20 (ref), v17 (ref), v16 (ref), v1 (copy)
        v20 = v17:GetModuleAsync("MessagePrompt"):expect();
        v17:HandleButton(v23.exitBtn, function() --[[ Line: 73 ]]
            -- upvalues: v17 (ref)
            v17:Toggle(script.Name, false);
        end);
        v16:OnChanged(v1.Player, "Settings.GachaAutoSell", function(v25) --[[ Line: 77 ]]
            -- upvalues: v23 (copy)
            v23._autoSellData = v25 or {};
        end, true);
    end, 
    Opened = function(v26) --[[ Line: 86 ]] --[[ Name: Opened ]]
        if not v26._populatedItems then
            v26:ShowDropChances("TreasureChest");
        end;
    end, 
    Opening = function(_) --[[ Line: 92 ]] --[[ Name: Opening ]]

    end, 
    Closing = function(_) --[[ Line: 99 ]] --[[ Name: Closing ]]

    end, 
    Closed = function(v29) --[[ Line: 106 ]] --[[ Name: Closed ]]
        -- upvalues: v17 (ref)
        if v29._openSource then
            v17:Toggle(v29._openSource, true);
            v29._openSource = nil;
        end;
        if v29.dump then
            v29.dump:Destroy();
        end;
        v29._populatedItems = nil;
    end, 
    OpenFromShop = function(v30, v31) --[[ Line: 128 ]] --[[ Name: OpenFromShop ]]
        v30._openedFromShop = true;
        v30:ShowDropChances(v31);
    end, 
    ShowDropChances = function(v32, v33, v34) --[[ Line: 134 ]] --[[ Name: ShowDropChances ]]
        -- upvalues: v2 (copy), v8 (copy), v18 (ref), v1 (copy), v17 (ref)
        v33 = v33 or "TreasureChest";
        v32._openSource = v34;
        if v32.dump then
            v32.dump:Destroy();
        end;
        v32.dump = v2.new();
        for _, v36 in v32.bin:GetChildren() do
            if v36:IsA("Frame") then
                v36.Visible = false;
            end;
        end;
        local l_v8_RarityPool_0 = v8:GetRarityPool(v33);
        if v33 == "TreasureChest" then
            local v38 = v18:HasGamepass(v1.Player, "TreasureHunter") or false;
            local v39 = v18:HasGamepass(v1.Player, "UltraTreasureHunter") or false;
            l_v8_RarityPool_0 = if not v38 or v39 then if not v39 or v38 then if v38 and v39 then l_v8_RarityPool_0.BothTreasureHunters.Epic else l_v8_RarityPool_0.Normal.Rare else l_v8_RarityPool_0.UltraTreasureHunter.Rare else l_v8_RarityPool_0.TreasureHunter.Epic;
        end;
        for v40, v41 in l_v8_RarityPool_0 do
            v32:PopulateItems(v33, v40, v41.weight);
        end;
        v32.dump:Add(function() --[[ Line: 171 ]]
            -- upvalues: v32 (copy)
            v32.dump = nil;
        end);
        v32._populatedItems = true;
        v17:Toggle(script.Name, true);
    end, 
    PopulateItems = function(v42, v43, v44, v45) --[[ Line: 179 ]] --[[ Name: PopulateItems ]]
        -- upvalues: v8 (copy), v4 (copy), v12 (copy), v11 (copy), v14 (copy), v13 (copy), v10 (copy), v9 (copy), v7 (copy), v15 (copy), v17 (ref), v20 (ref), v19 (ref)
        local l_FirstChild_0 = v42.bin:FindFirstChild(v44);
        local l_v8_LootPool_0 = v8:GetLootPool(v43);
        l_v8_LootPool_0 = l_v8_LootPool_0 and l_v8_LootPool_0[v44];
        if not l_FirstChild_0 or not l_v8_LootPool_0 then
            return;
        else
            l_v8_LootPool_0 = v4.Copy(l_v8_LootPool_0, true);
            table.sort(l_v8_LootPool_0, function(v48, v49) --[[ Line: 192 ]]
                return (v48.weight or v48.Weight) > (v49.weight or v49.Weight);
            end);
            l_FirstChild_0.Title.Chance.Visible = v45 ~= nil;
            if v45 then
                l_FirstChild_0.Title.Chance.Text = ("%*%%"):format(v45);
            end;
            local v50 = v42._autoSellData[v43] and v42._autoSellData[v43][v44];
            for v51, v52 in l_v8_LootPool_0 do
                local v53 = v42.templateItem:Clone();
                v53.Visible = true;
                v53.Name = "Index_" .. v51;
                v53.Content.AutoSell.Visible = false;
                local v54 = nil;
                if v52.type == "Unit" then
                    v12:SetImage(v53.Content.UnitIcon, v52.name);
                    v53.Content.UnitIcon.Visible = true;
                    v53.Content.Icon.Visible = false;
                    v54 = select(2, v11:GetRarity(v52.name));
                elseif v52.type == "RandomUnit" then
                    v53.Content.UnitIcon.Visible = true;
                    v53.Content.Icon.Visible = false;
                    v54 = v52.rarity;
                elseif v52.type == "Pet" then
                    v14:SetImage(v53.Content.UnitIcon, v52.name);
                    v53.Content.UnitIcon.Visible = true;
                    v53.Content.Icon.Visible = false;
                    v54 = select(2, v13:GetRarity(v52.name));
                else
                    v54 = v10:GetRewardRarity(v52);
                    v53.Content.Icon.Image = v10:GetIconFromRewardData(v52) or "";
                    v53.Content.UnitIcon.Visible = false;
                    v53.Content.Icon.Visible = true;
                end;
                do
                    local l_v53_0 = v53;
                    if v52.type == "RandomUnit" then
                        local v56 = 1;
                        local l_v9_UnitsPool_0 = v9:GetUnitsPool(v52.pool or v52.poolName);
                        l_v9_UnitsPool_0 = l_v9_UnitsPool_0 and l_v9_UnitsPool_0[v54];
                        do
                            local l_v56_0, l_l_v9_UnitsPool_0_0 = v56, l_v9_UnitsPool_0;
                            v42.dump:Add(v7.Simple(1, function() --[[ Line: 240 ]]
                                -- upvalues: l_l_v9_UnitsPool_0_0 (ref), l_v56_0 (ref), v12 (ref), l_v53_0 (ref)
                                if not l_l_v9_UnitsPool_0_0 then
                                    return;
                                else
                                    if l_v56_0 > #l_l_v9_UnitsPool_0_0 then
                                        l_v56_0 = 1;
                                    end;
                                    local v60 = l_l_v9_UnitsPool_0_0[l_v56_0];
                                    v12:SetImage(l_v53_0.Content.UnitIcon, v60.name);
                                    l_v56_0 = l_v56_0 + 1;
                                    return;
                                end;
                            end, true));
                        end;
                    end;
                    if v52.extraData then
                        l_v53_0.Content.Shiny.Visible = v52.extraData.Shiny or false;
                        l_v53_0.Content.Wumbo.Visible = v52.extraData.Wumbo or v52.extraData.Mega or false;
                    end;
                    local l_Stars_0 = l_v53_0.Content.Stars;
                    local v62 = false;
                    if v52.extraData ~= nil then
                        v62 = (v52.extraData.Stars or 0) >= 1;
                    end;
                    l_Stars_0.Visible = v62;
                    if v52.extraData and v52.extraData.Stars and v52.extraData.Stars >= 1 then
                        l_v53_0.Content.Stars.Main.Amount.Text = v52.extraData.Stars;
                    end;
                    l_v53_0.Content.Mystery.Visible = v52.type == "RandomUnit";
                    l_v53_0.Content.Chance.Text = ("%*%%"):format(v52.weight or v52.Weight);
                    l_v53_0.Content.Amount.Text = ("x%*"):format(v52.amount or v52.Amount or 1);
                    l_v53_0.Content.Glow:SetAttribute("Rarity", v54);
                    l_v53_0.Content.Backdrop:SetAttribute("Rarity", v54);
                    l_v53_0.Content.AutoSell.Visible = v50 and v50[tostring(v51)] or false;
                    l_v53_0.Parent = l_FirstChild_0.Units;
                    if v54 ~= nil then
                        task.defer(function() --[[ Line: 276 ]]
                            -- upvalues: l_v53_0 (ref)
                            l_v53_0.Content.Glow:AddTag("VisualizeRarity");
                            l_v53_0.Content.Backdrop:AddTag("VisualizeRarity");
                        end);
                    end;
                    if v52.type ~= "RandomUnit" then
                        v42.dump:Add(v15.new(l_v53_0, {
                            Name = v52.name, 
                            IsUnit = v52.type == "Unit", 
                            IsPet = v52.type == "Pet"
                        }));
                    end;
                    l_Stars_0 = true;
                    if v52.type ~= "Unit" then
                        l_Stars_0 = true;
                        if v52.type ~= "Pet" then
                            l_Stars_0 = true;
                            if v52.type ~= "RandomUnit" then
                                l_Stars_0 = false;
                            end;
                        end;
                    end;
                    v17:HandleButton(l_v53_0, function() --[[ Line: 292 ]]
                        -- upvalues: l_Stars_0 (copy), l_v53_0 (ref), v20 (ref), v19 (ref), v43 (copy), v44 (copy), v51 (copy)
                        if not l_Stars_0 then
                            return;
                        elseif not l_v53_0.Content.AutoSell.Visible then
                            v20:Prompt({
                                message = "You are about to place this item to auto-sell. Do you want to proceed?", 
                                options = {
                                    {
                                        text = "Yes", 
                                        callback = function() --[[ Line: 304 ]] --[[ Name: callback ]]
                                            -- upvalues: l_v53_0 (ref), v19 (ref), v43 (ref), v44 (ref), v51 (ref)
                                            l_v53_0.Content.AutoSell.Visible = true;
                                            v19:ToggleAutoSell(v43, v44, v51);
                                        end
                                    }, 
                                    {
                                        text = "No"
                                    }
                                }
                            });
                            return;
                        else
                            l_v53_0.Content.AutoSell.Visible = false;
                            v19:ToggleAutoSell(v43, v44, v51);
                            return;
                        end;
                    end);
                    v42.dump:Add(l_v53_0);
                    l_FirstChild_0.Visible = true;
                    v42.dump:Add(function() --[[ Line: 324 ]]
                        -- upvalues: l_v53_0 (ref)
                        l_v53_0 = nil;
                    end);
                end;
            end;
            return;
        end;
    end
};