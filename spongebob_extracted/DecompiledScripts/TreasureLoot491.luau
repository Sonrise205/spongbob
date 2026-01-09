local v0 = {
    RaritiesPool = {
        Rare = {
            weight = 70
        }, 
        Epic = {
            weight = 24
        }, 
        Legendary = {
            weight = 5
        }, 
        Mythic = {
            weight = 1
        }
    }, 
    LootPool = {
        Rare = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 75, 
                weight = 50
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 150, 
                weight = 35
            }, 
            {
                type = "Inventory", 
                name = "Kelp Shake", 
                amount = 3, 
                weight = 10
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 100, 
                weight = 3.5
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 200, 
                weight = 1.25
            }, 
            {
                type = "Inventory", 
                name = "Kelp Shake", 
                amount = 5, 
                weight = 0.25
            }
        }, 
        Epic = {
            {
                type = "Currency", 
                name = "Gems", 
                amount = 100, 
                weight = 50
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 200, 
                weight = 35
            }, 
            {
                type = "Inventory", 
                name = "Aged Patty", 
                amount = 5, 
                weight = 10
            }, 
            {
                type = "Currency", 
                name = "Gems", 
                amount = 150, 
                weight = 3.5
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 300, 
                weight = 1.25
            }, 
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 3, 
                weight = 0.25
            }
        }, 
        Legendary = {
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 3, 
                weight = 50
            }, 
            {
                type = "Currency", 
                name = "MagicConch", 
                amount = 2, 
                weight = 35
            }, 
            {
                type = "Unit", 
                name = "HandsomeSquidward", 
                rarity = "Mythic", 
                extraData = {}, 
                amount = 1, 
                weight = 10
            }, 
            {
                type = "RandomUnit", 
                rarity = "Rare", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 3.5
            }, 
            {
                type = "Currency", 
                name = "MagicConch", 
                amount = 3, 
                weight = 1.25
            }, 
            {
                type = "RandomUnit", 
                rarity = "Epic", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 0.25
            }
        }, 
        Mythic = {
            {
                type = "Unit", 
                name = "HandsomeSquidward", 
                rarity = "Mythic", 
                extraData = {}, 
                amount = 1, 
                weight = 50
            }, 
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 5, 
                weight = 33.5
            }, 
            {
                type = "Currency", 
                name = "MagicConch", 
                amount = 3, 
                weight = 10
            }, 
            {
                type = "Unit", 
                name = "HandsomeSquidward", 
                rarity = "Mythic", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 3.5
            }, 
            {
                type = "RandomUnit", 
                rarity = "Legendary", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 2
            }, 
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 1
            }
        }
    }
};
for _, v2 in script:GetChildren() do
    if v2:IsA("ModuleScript") then
        v0[v2.Name] = table.freeze(require(v2));
    end;
end;
return v0;