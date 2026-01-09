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
                    name = "TangoKaren", 
                    amount = 1, 
                    weight = 1, 
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
                }, 
                {
                    type = "Unit", 
                    name = "TangoKaren", 
                    amount = 1, 
                    weight = 1.5, 
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
                }, 
                {
                    type = "Unit", 
                    name = "TangoKaren", 
                    amount = 1, 
                    weight = 2, 
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
                }, 
                {
                    type = "Unit", 
                    name = "TangoKaren", 
                    amount = 1, 
                    weight = 3, 
                    feature = true
                }
            }
        };
    end;
end;
return {
    WorldOrder = 4, 
    WorldName = "ChumBucket", 
    DisplayName = "Chum Bucket", 
    WorldImage = {
        Image = "rbxassetid://95202099802925", 
        ImageRectSize = Vector2.new(800, 800), 
        ImageRectOffset = Vector2.new(100, 0)
    }, 
    Chapters = {}
};