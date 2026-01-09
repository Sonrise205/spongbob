for _, v1 in script:GetChildren() do
    if v1:IsA("ModuleScript") then
        require(v1).LootRewards = {
            Normal = {
                {
                    type = "Inventory", 
                    name = "TreasureChest", 
                    amount = 1, 
                    weight = 10, 
                    feature = true
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 5, 
                    extraData = {}
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 2.5, 
                    extraData = {
                        Shiny = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 1.5, 
                    extraData = {
                        Mega = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 0.5, 
                    extraData = {
                        Shiny = true, 
                        Mega = true
                    }
                }
            }, 
            Hard = {
                {
                    type = "Inventory", 
                    name = "TreasureChest", 
                    amount = 1, 
                    weight = 12.5, 
                    feature = true
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 5, 
                    extraData = {}
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 2.5, 
                    extraData = {
                        Shiny = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 1.5, 
                    extraData = {
                        Mega = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 0.5, 
                    extraData = {
                        Shiny = true, 
                        Mega = true
                    }
                }
            }, 
            Nightmare = {
                {
                    type = "Inventory", 
                    name = "TreasureChest", 
                    amount = 1, 
                    weight = 15, 
                    feature = true
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 5, 
                    extraData = {}
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 2.5, 
                    extraData = {
                        Shiny = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 1.5, 
                    extraData = {
                        Mega = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 0.5, 
                    extraData = {
                        Shiny = true, 
                        Mega = true
                    }
                }
            }, 
            ["Davy Jones"] = {
                {
                    type = "Inventory", 
                    name = "TreasureChest", 
                    amount = 1, 
                    weight = 20, 
                    feature = true
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 5, 
                    extraData = {}
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 2.5, 
                    extraData = {
                        Shiny = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 1.5, 
                    extraData = {
                        Mega = true
                    }
                }, 
                {
                    type = "Unit", 
                    name = "GloveWorldSpongebob", 
                    amount = 1, 
                    weight = 0.5, 
                    extraData = {
                        Shiny = true, 
                        Mega = true
                    }
                }
            }
        };
    end;
end;
return {
    WorldOrder = 6, 
    WorldName = "RockBottom", 
    DisplayName = "Rock Bottom", 
    WorldImage = {
        Image = "rbxassetid://95202099802925", 
        ImageRectSize = Vector2.new(800, 800), 
        ImageRectOffset = Vector2.new(100, 0)
    }, 
    Chapters = {}
};