return {
    _order = 1, 
    _displayName = "Going Rogue", 
    FullCompletionRewards = {
        {
            type = "Unit", 
            name = "BikiniBottomPD", 
            extraData = {
                Shiny = true, 
                Wumbo = true
            }, 
            amount = 1
        }
    }; 
    {
        Name = "Rogue1", 
        DisplayName = "Rogue Warrior I", 
        Description = "Complete Wave 100 in Rogue Mode", 
        Type = "Rogue_Wave_100", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "RogueCrate", 
                amount = 3
            }
        }
    }, 
    {
        Name = "Rogue2", 
        DisplayName = "Rogue Warrior II", 
        Description = "Complete Wave 200 in Rogue Mode", 
        Type = "Rogue_Wave_200", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "RogueCrate", 
                amount = 5
            }
        }
    }, 
    {
        Name = "Rogue3", 
        DisplayName = "Rogue Warrior III", 
        Description = "Complete Wave 300 in Rogue Mode", 
        Type = "Rogue_Wave_300", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "RogueCrate", 
                amount = 10
            }
        }
    }, 
    {
        Name = "Rogue4", 
        DisplayName = "Unscathed", 
        Description = "Completed Wave 300 in Rogue Mode without Taking Damage", 
        Type = "Rogue_Wave_300_NoDamage", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "RogueCrate", 
                amount = 15
            }
        }
    }, 
    {
        Name = "Rogue5", 
        DisplayName = "OP No Way", 
        Description = "Completed Wave 300 in Rogue Mode without using Secret or Exotic Units", 
        Type = "Rogue_Wave_300_MythicOrWorse", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Inventory", 
                name = "SecretFormulaReroll", 
                amount = 1
            }
        }
    }, 
    {
        Name = "Rogue6", 
        DisplayName = "Totally Cursed", 
        Description = "Completed Wave 300 in Rogue Mode with 5 Cursed Cards in Your Hand", 
        Type = "Rogue_Wave_300_CursedCards", 
        RequiredValue = 1, 
        Rewards = {
            {
                type = "Unit", 
                name = "BusStation", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1
            }
        }
    }
};