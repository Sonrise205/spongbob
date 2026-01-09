local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
return {
    {
        displayName = "{amount} Pet Crate", 
        type = "Inventory", 
        name = "PetCrate", 
        crateDisplayName = "Pet Crate", 
        amount = 1, 
        cost = {
            currency = "Gems", 
            amount = 500
        }, 
        canPurchaseMultiple = true
    }
};