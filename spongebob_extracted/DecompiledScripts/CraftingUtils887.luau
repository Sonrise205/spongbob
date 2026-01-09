local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
return {
    GetRecipeRarity = function(_, v7, v8) --[[ Line: 11 ]] --[[ Name: GetRecipeRarity ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v7.rarity then
            return v7.rarity;
        else
            local l_item_0 = v7.item;
            if v7.rngItem then
                l_item_0 = v7.rngItem[v8 or 1];
            end;
            if not l_item_0 then
                return "Common";
            elseif l_item_0.type == "Unit" then
                return select(2, v1:GetRarity(l_item_0.name));
            else
                local l_v2_ByItemName_0 = v2:GetByItemName(l_item_0.name);
                return l_v2_ByItemName_0 and l_v2_ByItemName_0.rarity or "Common";
            end;
        end;
    end, 
    GetAllCurrencies = function(_) --[[ Line: 34 ]] --[[ Name: GetAllCurrencies ]]
        -- upvalues: v5 (copy), v2 (copy)
        local v12 = {};
        for _, v14 in v5.Categories.CraftingRecipes do
            if not typeof(v14) ~= "table" and v14.materials then
                for v15, _ in v14.materials do
                    if v2:IsCurrency(v15) and not table.find(v12, v15) then
                        table.insert(v12, v15);
                    end;
                end;
            end;
        end;
        return v12;
    end
};