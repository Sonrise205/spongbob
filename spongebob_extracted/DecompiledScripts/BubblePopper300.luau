return {
    RaritiesPool = {
        Rare = {
            weight = 50
        }, 
        Epic = {
            weight = 35
        }, 
        Legendary = {
            weight = 10
        }, 
        Mythic = {
            weight = 4.5
        }, 
        Secret = {
            weight = 0.5
        }
    }, 
    LootPool = {
        Rare = {
            {
                type = "Inventory", 
                name = "TubMayo", 
                amount = 15, 
                weight = 100
            }
        }, 
        Epic = {
            {
                type = "Unit", 
                name = "BandSquidward", 
                extraData = {}, 
                amount = 1, 
                weight = 50
            }, 
            {
                type = "Unit", 
                name = "BandSandy", 
                extraData = {}, 
                amount = 1, 
                weight = 50
            }
        }, 
        Legendary = {
            {
                type = "Unit", 
                name = "BandPatrick", 
                extraData = {}, 
                amount = 1, 
                weight = 40
            }, 
            {
                type = "Unit", 
                name = "BandPlankton", 
                extraData = {}, 
                amount = 1, 
                weight = 40
            }, 
            {
                type = "Unit", 
                name = "BandPearl", 
                extraData = {}, 
                amount = 1, 
                weight = 10
            }, 
            {
                type = "Unit", 
                name = "BandSpongebob", 
                extraData = {}, 
                amount = 1, 
                weight = 10
            }
        }, 
        Mythic = {
            {
                type = "Unit", 
                name = "BandPearl", 
                extraData = {}, 
                amount = 1, 
                weight = 40
            }, 
            {
                type = "Unit", 
                name = "BandSpongebob", 
                extraData = {}, 
                amount = 1, 
                weight = 40
            }, 
            {
                type = "Unit", 
                name = "BandMrsPuff", 
                extraData = {}, 
                amount = 1, 
                weight = 10
            }, 
            {
                type = "Unit", 
                name = "BandMrKrabs", 
                extraData = {}, 
                amount = 1, 
                weight = 10
            }
        }, 
        Secret = {
            {
                type = "RandomUnit", 
                rarity = "Rare", 
                extraData = {
                    Shiny = true
                }, 
                poolName = "BubbleBowl", 
                weight = 20
            }, 
            {
                type = "RandomUnit", 
                rarity = "Rare", 
                extraData = {
                    Wumbo = true
                }, 
                poolName = "BubbleBowl", 
                weight = 16.5
            }, 
            {
                type = "RandomUnit", 
                rarity = "Rare", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                poolName = "", 
                weight = 14
            }, 
            {
                type = "RandomUnit", 
                rarity = "Epic", 
                extraData = {
                    Shiny = true
                }, 
                poolName = "BubbleBowl", 
                weight = 12
            }, 
            {
                type = "RandomUnit", 
                rarity = "Epic", 
                extraData = {
                    Wumbo = true
                }, 
                poolName = "BubbleBowl", 
                weight = 10
            }, 
            {
                type = "RandomUnit", 
                rarity = "Epic", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                poolName = "", 
                weight = 8
            }, 
            {
                type = "RandomUnit", 
                rarity = "Legendary", 
                extraData = {
                    Shiny = true
                }, 
                poolName = "BubbleBowl", 
                weight = 6
            }, 
            {
                type = "RandomUnit", 
                rarity = "Legendary", 
                extraData = {
                    Wumbo = true
                }, 
                poolName = "BubbleBowl", 
                weight = 5
            }, 
            {
                type = "RandomUnit", 
                rarity = "Legendary", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                poolName = "", 
                weight = 4
            }, 
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                extraData = {
                    Shiny = true
                }, 
                poolName = "BubbleBowl", 
                weight = 2.5
            }, 
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                extraData = {
                    Wumbo = true
                }, 
                poolName = "BubbleBowl", 
                weight = 1.5
            }, 
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                poolName = "BubbleBowl", 
                weight = 0.5
            }
        }
    }
};