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
                }
            }, 
            Hard = {
                {
                    type = "Inventory", 
                    name = "TreasureChest", 
                    amount = 1, 
                    weight = 12.5, 
                    feature = true
                }
            }, 
            Nightmare = {
                {
                    type = "Inventory", 
                    name = "TreasureChest", 
                    amount = 1, 
                    weight = 15, 
                    feature = true
                }
            }, 
            ["Davy Jones"] = {
                {
                    type = "Inventory", 
                    name = "TreasureChest", 
                    amount = 1, 
                    weight = 20, 
                    feature = true
                }
            }
        };
    end;
end;
return {
    WorldOrder = 3, 
    WorldName = "KrustyKrab", 
    DisplayName = "Krusty Krab", 
    WorldImage = {
        Image = "rbxassetid://107353865706783", 
        ImageRectSize = Vector2.new(800, 500), 
        ImageRectOffset = Vector2.new(0, 15)
    }, 
    Chapters = {}
};