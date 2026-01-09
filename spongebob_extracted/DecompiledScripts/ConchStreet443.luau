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
    WorldOrder = 1, 
    WorldName = "ConchStreet", 
    DisplayName = "Conch Street", 
    WorldImage = {
        Image = "rbxassetid://119318723617688", 
        ImageRectSize = Vector2.new(800, 500), 
        ImageRectOffset = Vector2.new(-100, 0)
    }, 
    Chapters = {}
};