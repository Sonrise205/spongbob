local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v2 = {
    name = "Story", 
    speaker = "Secret Agent Star", 
    start = v1:GetForCTUnix({
        year = 2025, 
        month = 4, 
        day = 22, 
        hour = 14
    }), 
    completionRewards = {
        [1] = {
            required = 6, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "Coupe", 
                    amount = 1
                }
            }
        }, 
        [2] = {
            required = 12, 
            rewards = {
                {
                    type = "Unit", 
                    name = "SecretAgentStar", 
                    amount = 1
                }, 
                {
                    type = "Inventory", 
                    name = "SecretTreasureChest", 
                    amount = 1
                }
            }
        }
    }, 
    batches = {}
};
v2.batches[1] = {
    name = "Infiltration & Interference", 
    expire = v1:GetForCTUnix({
        year = 2025, 
        month = 4, 
        day = 25, 
        hour = 23, 
        minute = 59
    }), 
    quests = {
        [1] = {
            name = "Fry Cook Foil", 
            map = "ChumBucket", 
            required = 5, 
            objective = "Collect <amount> <objective> from the <map>", 
            collect = {
                name = "SabotageSchematic", 
                chance = 50, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Currency", 
                    name = "Gems", 
                    amount = 2000
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Shhh. You didn't hear this from me, but someone's trying to deep-fry our secrets. The Tattletale Strangler's back, and he's poking around the Chum Bucket. Get those schematics before he makes a mess."
                    }
                }, 
                complete = {
                    {
                        Dialog = "Nice work! That greasy goon's back in jail, and the Chum Bucket is sabotage-free... for now. But why target it at all? Something smells fishy. And not the good kind."
                    }
                }
            }
        }, 
        [2] = {
            name = "Memory Lane", 
            map = "Mermalair", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 4, 
                day = 23, 
                hour = 14
            }), 
            required = 3, 
            objective = "Collect <amount> <objective> from the <map>", 
            collect = {
                name = "LostGadget", 
                chance = 100, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 20
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Mermaid Man's lost his marbles\226\128\148and his gadgets. He's mumbling something about \"E... V... I...\" before he forgets again. Let's jog his memory."
                    }
                }, 
                complete = {
                    {
                        Dialog = "You did it! He shouted \"E.V.I.L.!\" right before screaming \"EVIL!\" Classic. But why would E.V.I.L. want his gear?"
                    }
                }
            }
        }, 
        [3] = {
            name = "Sting & Listen", 
            map = "JellyfishFields", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 4, 
                day = 24, 
                hour = 14
            }), 
            required = 5, 
            objective = "Collect <amount> <objective> from <map>", 
            collect = {
                name = "AudioTape", 
                chance = 50, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "EpicTreasureChest", 
                    amount = 15
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "I turned the Confess-a-Bear into a spy gadget, but the jellyfish ran off with its tapes! Get 'em back before someone hears my snack log."
                    }
                }, 
                complete = {
                    {
                        Dialog = "Phew! Okay, so maybe I confessed to eating 48 pickles... but more importantly, one of the tapes caught strange static: \"...Kode... rising...\" Creepy, huh?"
                    }
                }
            }
        }
    }
};
v2.batches[2] = {
    name = "Food & Fakes", 
    start = v1:GetForCTUnix({
        year = 2025, 
        month = 4, 
        day = 29, 
        hour = 14
    }), 
    expire = v1:GetForCTUnix({
        year = 2025, 
        month = 5, 
        day = 2, 
        hour = 23, 
        minute = 59
    }), 
    quests = {
        [1] = {
            name = "Sauce Sleuth", 
            map = "KrustyKrab", 
            required = 5, 
            objective = "Collect <amount> <objective> from the <map>", 
            collect = {
                name = "MysteryCondiment", 
                chance = 50, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Currency", 
                    name = "TraitRolls", 
                    amount = 25
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Bubble Bass is cooking up a secret sauce and someone's stealing ingredients! What if this is part of E.V.I.L.'s plot to replace the Krabby Patty?!"
                    }
                }, 
                complete = {
                    {
                        Dialog = "It's... glitter ketchup. Weird. But also... fabulous? Still, the real mystery is who told him the recipe in the first place."
                    }
                }
            }
        }, 
        [2] = {
            name = "Masked Mayhem", 
            map = "PattyVault", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 4, 
                day = 30, 
                hour = 14
            }), 
            required = 3, 
            objective = "Collect <amount> <objective> from the <map>", 
            collect = {
                name = "SecretRecipeBlueprints", 
                chance = 100, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 3
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Sandy's in full Miss Appear mode. Someone raided the vault, and not for jelly! Help her recover those blueprints. They might be clues."
                    }
                }, 
                complete = {
                    {
                        Dialog = "Peanut Butter Pickle Pops?! That's what they stole? Wait... encrypted in the blueprints is a weird code. I think it's part of... the Krabby Kode!"
                    }
                }
            }
        }, 
        [3] = {
            name = "Belt Backfire", 
            map = "ConchStreet", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 5, 
                day = 1, 
                hour = 14
            }), 
            required = 5, 
            objective = "Collect <amount> <objective> from <map>", 
            collect = {
                name = "UtilityBeltComponents", 
                chance = 50, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "EpicTreasureChest", 
                    amount = 15
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Man Ray says he's gone straight\226\128\148but he needs his belt back. I smell a trap. Or maybe that's just downtown air. Help him out, but stay sharp."
                    }
                }, 
                complete = {
                    {
                        Dialog = "Called it. The moment he powered up, he tried to blast us with a laser. Luckily, I was ready with... jelly. Man Ray's rebooted. But someone tipped him off. E.V.I.L.?"
                    }
                }
            }
        }
    }
};
v2.batches[3] = {
    name = "Systems & Shadows", 
    start = v1:GetForCTUnix({
        year = 2025, 
        month = 5, 
        day = 6, 
        hour = 14
    }), 
    expire = v1:GetForCTUnix({
        year = 2025, 
        month = 5, 
        day = 9, 
        hour = 23, 
        minute = 59
    }), 
    quests = {
        [1] = {
            name = "Data Dump", 
            map = "BoatingSchool", 
            required = 3, 
            objective = "Collect <amount> <objective> from <map>", 
            collect = {
                name = "CorruptedDataChips", 
                chance = 100, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Currency", 
                    name = "Gems", 
                    amount = 2000
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Karen's system went kaboom and her data's all over the place. She mentioned someone hacked her drive... maybe even E.V.I.L. Get those chips, agent!"
                    }
                }, 
                complete = {
                    {
                        Dialog = "One of these chips had a logo... a lemon wearing sunglasses?! That's their calling card! It's definitely E.V.I.L."
                    }
                }
            }
        }, 
        [2] = {
            name = "Remote Ruckus", 
            map = "MiddleAges", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 5, 
                day = 7, 
                hour = 14
            }), 
            required = 3, 
            objective = "Collect <amount> <objective> from <map>", 
            collect = {
                name = "ControlModule", 
                chance = 100, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Currency", 
                    name = "MagicConch", 
                    amount = 20
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Medieval anchovies are on a rampage! Someone's controlling them with high-tech modules. Get those things before they bite someone's mayonnaise."
                    }
                }, 
                complete = {
                    {
                        Dialog = "These modules were playing a scrambled message. I unscrambled it with mustard and... it says 'Krabby Kode: Phase 2.' Oh no."
                    }
                }
            }
        }, 
        [3] = {
            name = "Signal Jam", 
            map = "SandysTreedome", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 5, 
                day = 8, 
                hour = 14
            }), 
            required = 5, 
            objective = "Collect <amount> <objective> from <map>", 
            collect = {
                name = "SignalDisruptor", 
                chance = 50, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "EpicTreasureChest", 
                    amount = 15
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Someone's jamming my spy walkie-talkie. Either E.V.I.L. or a really strong microwave. Either way, find those disruptors!"
                    }
                }, 
                complete = {
                    {
                        Dialog = "Thanks! Also, I picked up a new signal\226\128\148coordinates and a time: \"Rock Bottom. Midnight.\" Spooky. Mysterious. Midnight snack-worthy."
                    }
                }
            }
        }
    }
};
v2.batches[4] = {
    name = "Truth & Trials", 
    start = v1:GetForCTUnix({
        year = 2025, 
        month = 5, 
        day = 13, 
        hour = 14
    }), 
    expire = v1:GetForCTUnix({
        year = 2025, 
        month = 5, 
        day = 19, 
        hour = 23, 
        minute = 59
    }), 
    quests = {
        [1] = {
            name = "Graveyard Shift", 
            map = "RockBottom", 
            required = 5, 
            objective = "Collect <amount> <objective> from <map>", 
            collect = {
                name = "FlickeringLantern", 
                chance = 50, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Currency", 
                    name = "GoldenTraitRolls", 
                    amount = 10
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Rock Bottom's gone ghostly. Lanterns flicker, shadows whisper... and Nosferatu's calling you in. Bring a flashlight and a spare pair of pants."
                    }
                }, 
                complete = {
                    {
                        Dialog = "He said we're being tested. But by who? Nosferatu's got answers \226\128\148 and I think he's the only one left who knows the full Krabby Kode."
                    }
                }
            }
        }, 
        [2] = {
            name = "Phantasm Files", 
            map = "FlyingDutchmanShip", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 5, 
                day = 14, 
                hour = 14
            }), 
            required = 3, 
            objective = "Collect <amount> <objective> from the <map>", 
            collect = {
                name = "ShadowRelic", 
                chance = 100, 
                amount = 1
            }, 
            rewards = {
                {
                    type = "Inventory", 
                    name = "ChallengeGift", 
                    amount = 3
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "Nosferatu's opened the vault. Inside are old relics, clues from the first E.V.I.L. era. Collect them, but watch your back\226\128\148these ghosts don't like visitors."
                    }
                }, 
                complete = {
                    {
                        Dialog = "Each relic is a piece of the Krabby Kode. Put 'em together and... boom. A portal opens. Nosferatu nods. He says: \"You\226\128\153re almost ready.\" Gulp."
                    }
                }
            }
        }, 
        [3] = {
            name = "Final Flicker", 
            start = v1:GetForCTUnix({
                year = 2025, 
                month = 5, 
                day = 15, 
                hour = 14
            }), 
            required = 5, 
            objective = "Complete <amount> Challenges on Davy Jones' Difficulty", 
            rewards = {
                {
                    type = "Inventory", 
                    name = "LegendaryTreasureChest", 
                    amount = 5
                }
            }, 
            dialogue = {
                intro = {
                    {
                        Dialog = "This is it. Nosferatu says E.V.I.L. is watching. If we win this, we shut them down for good\226\128\148or at least make them take a long lunch break."
                    }
                }, 
                complete = {
                    {
                        Dialog = "We stopped E.V.I.L. this time. But if they ever return... we'll be ready. Probably. If I'm awake."
                    }
                }
            }
        }
    }
};
return v2;