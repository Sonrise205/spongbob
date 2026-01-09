return {
    RaritiesPool = {
        Uncommon = {
            weight = 45
        }, 
        Rare = {
            weight = 33
        }, 
        Epic = {
            weight = 13.5
        }, 
        Legendary = {
            weight = 5
        }, 
        Mythic = {
            weight = 2.5
        }, 
        Secret = {
            weight = 1
        }
    }, 
    LootPool = {
        Uncommon = {
            {
                type = "Inventory", 
                name = "TubMayo", 
                amount = 15, 
                weight = 100
            }
        }, 
        Rare = {
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
        Epic = {
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
        Legendary = {
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
        Mythic = {
            {
                type = "Unit", 
                name = "BandMrsPuff", 
                extraData = {}, 
                amount = 1, 
                weight = 50
            }, 
            {
                type = "Unit", 
                name = "BandMrKrabs", 
                extraData = {}, 
                amount = 1, 
                weight = 50
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
                poolName = "BubbleBowl", 
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
                poolName = "BubbleBowl", 
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
                poolName = "BubbleBowl", 
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