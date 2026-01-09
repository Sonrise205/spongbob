return {
    RaritiesPool = {
        Normal = {
            Rare = {
                Rare = {
                    weight = 70
                }, 
                Epic = {
                    weight = 24
                }, 
                Legendary = {
                    weight = 5.39
                }, 
                Mythic = {
                    weight = 0.5
                }, 
                Secret = {
                    weight = 0.1
                }, 
                Exotic = {
                    weight = 0.01
                }
            }, 
            Epic = {
                Epic = {
                    weight = 75
                }, 
                Legendary = {
                    weight = 22.225
                }, 
                Mythic = {
                    weight = 2.5
                }, 
                Secret = {
                    weight = 0.25
                }, 
                Exotic = {
                    weight = 0.025
                }
            }, 
            Legendary = {
                Legendary = {
                    weight = 95
                }, 
                Mythic = {
                    weight = 4.615
                }, 
                Secret = {
                    weight = 0.35
                }, 
                Exotic = {
                    weight = 0.035
                }
            }, 
            Mythic = {
                Mythic = {
                    weight = 99.45
                }, 
                Secret = {
                    weight = 0.5
                }, 
                Exotic = {
                    weight = 0.05
                }
            }
        }, 
        TreasureHunter = {
            Epic = {
                Epic = {
                    weight = 84
                }, 
                Legendary = {
                    weight = 12.6
                }, 
                Mythic = {
                    weight = 3
                }, 
                Secret = {
                    weight = 0.35
                }, 
                Exotic = {
                    weight = 0.05
                }
            }, 
            Legendary = {
                Legendary = {
                    weight = 95
                }, 
                Mythic = {
                    weight = 4.45
                }, 
                Secret = {
                    weight = 0.5
                }, 
                Exotic = {
                    weight = 0.05
                }
            }, 
            Mythic = {
                Mythic = {
                    weight = 99.45
                }, 
                Secret = {
                    weight = 0.5
                }, 
                Exotic = {
                    weight = 0.05
                }
            }
        }, 
        UltraTreasureHunter = {
            Rare = {
                Rare = {
                    weight = 65
                }, 
                Epic = {
                    weight = 22
                }, 
                Legendary = {
                    weight = 11.39
                }, 
                Mythic = {
                    weight = 1.5
                }, 
                Secret = {
                    weight = 0.1
                }, 
                Exotic = {
                    weight = 0.01
                }
            }, 
            Epic = {
                Epic = {
                    weight = 75
                }, 
                Legendary = {
                    weight = 19.95
                }, 
                Mythic = {
                    weight = 4.5
                }, 
                Secret = {
                    weight = 0.5
                }, 
                Exotic = {
                    weight = 0.05
                }
            }, 
            Legendary = {
                Legendary = {
                    weight = 92
                }, 
                Mythic = {
                    weight = 7.285
                }, 
                Secret = {
                    weight = 0.65
                }, 
                Exotic = {
                    weight = 0.065
                }
            }, 
            Mythic = {
                Mythic = {
                    weight = 98.9
                }, 
                Secret = {
                    weight = 1
                }, 
                Exotic = {
                    weight = 0.1
                }
            }
        }, 
        BothTreasureHunters = {
            Epic = {
                Epic = {
                    weight = 74.5
                }, 
                Legendary = {
                    weight = 19.9
                }, 
                Mythic = {
                    weight = 4.5
                }, 
                Secret = {
                    weight = 1
                }, 
                Exotic = {
                    weight = 0.1
                }
            }, 
            Legendary = {
                Legendary = {
                    weight = 92
                }, 
                Mythic = {
                    weight = 7.285
                }, 
                Secret = {
                    weight = 0.65
                }, 
                Exotic = {
                    weight = 0.065
                }
            }, 
            Mythic = {
                Mythic = {
                    weight = 98.9
                }, 
                Secret = {
                    weight = 1
                }, 
                Exotic = {
                    weight = 0.1
                }
            }
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
                weight = 40
            }, 
            {
                type = "Inventory", 
                name = "Kelp Shake", 
                amount = 5, 
                weight = 8
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 200, 
                weight = 1.5
            }, 
            {
                type = "Inventory", 
                name = "Kelp Shake", 
                amount = 10, 
                weight = 0.5
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
                weight = 40
            }, 
            {
                type = "Inventory", 
                name = "Aged Patty", 
                amount = 5, 
                weight = 8
            }, 
            {
                type = "Currency", 
                name = "Coins", 
                amount = 250, 
                weight = 1.5
            }, 
            {
                type = "Inventory", 
                name = "Aged Patty", 
                amount = 10, 
                weight = 0.5
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
                weight = 40
            }, 
            {
                type = "RandomUnit", 
                rarity = "Epic", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 8
            }, 
            {
                type = "RandomUnit", 
                rarity = "Legendary", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 1.5
            }, 
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 5, 
                weight = 0.5
            }
        }, 
        Mythic = {
            {
                type = "Currency", 
                name = "TraitRolls", 
                amount = 5, 
                weight = 50
            }, 
            {
                type = "Currency", 
                name = "MagicConch", 
                amount = 3, 
                weight = 40
            }, 
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 1, 
                weight = 5
            }, 
            {
                type = "Unit", 
                name = "HelenTheFelon", 
                extraData = {}, 
                amount = 1, 
                weight = 4.5
            }, 
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 0.5
            }
        }, 
        Secret = {
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 10, 
                weight = 60
            }, 
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 25
            }, 
            {
                type = "Unit", 
                name = "HelenTheFelon", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1, 
                weight = 10.45
            }, 
            {
                type = "Unit", 
                name = "SirPinchAlot", 
                extraData = {}, 
                weight = 4.5
            }, 
            {
                type = "Unit", 
                name = "SirPinchAlot", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 0.05
            }
        }, 
        BoostedSecret = {
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 10, 
                weight = 43.9
            }, 
            {
                type = "RandomUnit", 
                rarity = "Mythic", 
                pool = "Standard", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 25
            }, 
            {
                type = "Unit", 
                name = "SirPinchAlot", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1, 
                weight = 22
            }, 
            {
                type = "Unit", 
                name = "SirPinchAlot", 
                extraData = {}, 
                weight = 9
            }, 
            {
                type = "Unit", 
                name = "SirPinchAlot", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                weight = 0.1
            }
        }, 
        Exotic = {
            {
                type = "Currency", 
                name = "GoldenTraitRolls", 
                amount = 100, 
                weight = 45, 
                showAmount = true
            }, 
            {
                type = "Unit", 
                name = "HelenTheFelon", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true, 
                    Stars = 5
                }, 
                amount = 1, 
                weight = 26
            }, 
            {
                type = "Inventory", 
                name = "NeptunesCrownReroll", 
                amount = 1, 
                weight = 16.45
            }, 
            {
                type = "Unit", 
                name = "SirPinchAlot", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1, 
                weight = 8
            }, 
            {
                type = "Unit", 
                name = "FilthyBoys", 
                extraData = {}, 
                amount = 1, 
                weight = 4.5
            }, 
            {
                type = "Unit", 
                name = "FilthyBoys", 
                extraData = {
                    Shiny = true, 
                    Wumbo = true
                }, 
                amount = 1, 
                weight = 0.05
            }
        }
    }
};