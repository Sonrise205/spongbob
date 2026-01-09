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
                    type = "Pet", 
                    name = "KampKaren", 
                    amount = 1, 
                    weight = 0.5, 
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
                    type = "Pet", 
                    name = "KampKaren", 
                    amount = 1, 
                    weight = 0.5, 
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
                    type = "Pet", 
                    name = "KampKaren", 
                    amount = 1, 
                    weight = 0.5, 
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
                    type = "Pet", 
                    name = "KampKaren", 
                    amount = 1, 
                    weight = 0.5, 
                    feature = true
                }
            }
        };
        if tonumber(string.match(v1.Name, "%d+")) then

        end;
    end;
end;
return {
    WorldOrder = 6, 
    WorldName = "KampKoral", 
    DisplayName = "Kamp Koral", 
    WorldImage = {
        Image = "", 
        ImageRectSize = Vector2.new(800, 800), 
        ImageRectOffset = Vector2.new(100, 0)
    }, 
    Chapters = {}
};