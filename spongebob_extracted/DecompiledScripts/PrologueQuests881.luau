return {
    [1] = {
        name = "The Krusty Scheme", 
        required = 50, 
        objective = "Defeat <rich><amount> enemy waves</rich> on <rich>any endless map</rich> to \"prove your fighting spirit.\"", 
        rewards = {
            {
                type = "Inventory", 
                name = "BranFlakes", 
                amount = 10
            }
        }, 
        dialogue = {
            speaker = "MrKrabs", 
            intro = "Listen here, me little fry cook! Times are tough and me wallet\226\128\153s thinner than a sea cucumber\226\128\153s spine. But I\226\128\153ve got a plan! Wrestlin'. That\226\128\153s right! Tag-team mayhem! All we need is a duo brave\226\128\148or dumb\226\128\148enough to fight. You in?", 
            complete = "Har har har! You didn't even break a sweat. That\226\128\153s the spirit! We\226\128\153ll make wrestlin\226\128\153 legends outta you yet. Or at least a few bucks."
        }
    }, 
    [2] = {
        name = "Krusty Krushers Tryouts", 
        required = 1, 
        objective = "Complete a raid with <rich>only SpongeBob and Patrick units.</rich>", 
        rewards = {
            {
                type = "Inventory", 
                name = "BranFlakes", 
                amount = 25
            }
        }, 
        dialogue = {
            speaker = "MrKrabs", 
            intro = "I\226\128\153m holdin\226\128\153 secret tryouts at the Krusty Krab to find me golden duo. SpongeBob and Patrick are... available. But let\226\128\153s make sure they\226\128\153ve got what it takes. Help 'em train!", 
            complete = "Not bad! They may not be the brightest barnacles in the reef, but they\226\128\153ve got gumption. And Patrick only broke three chairs this time!"
        }
    }, 
    [3] = {
        name = "Marketing Mayhem", 
        required = 3, 
        objective = "Complete <rich><amount> challenge maps</rich> while using a <rich>Mr. Krabs tower.</rich>", 
        rewards = {
            {
                type = "Inventory", 
                name = "BranFlakes", 
                amount = 50
            }
        }, 
        dialogue = {
            speaker = "MrKrabs", 
            intro = "Now that we\226\128\153ve got some muscle, it\226\128\153s time to sell the show! Posters! Hype! Holographic chum ads! Get out there and spread the word, and make sure the Chum Bucket ain't stealing our crowd!", 
            complete = "Y\226\128\153see that? Butts in seats and pockets full o\226\128\153 coins. Wrestlin\226\128\153 sells better than Krabby Patties in Jellyfish Fields!"
        }
    }, 
    [4] = {
        name = "Enter: The Crushers", 
        required = 3, 
        objective = "Defeat a <rich>Tier V Boss</rich> in Boss Battles <rich><amount> Times.</rich>", 
        rewards = {
            {
                type = "Inventory", 
                name = "BranFlakes", 
                amount = 75
            }
        }, 
        dialogue = {
            speaker = "MrKrabs", 
            intro = "It\226\128\153s official\226\128\148SpongeBob and Patrick are now the Krusty Krushers! But... the ring is full of hazards: slime traps, spiked anchors, and that terrifying Hot Dog Man. We need to toughen \226\128\152em up!", 
            complete = "They handled themselves better than I thought! Especially Patrick... who tried to eat one of the bosses. That\226\128\153s... commitment."
        }
    }, 
    [5] = {
        name = "Pick Your Champion", 
        required = 1, 
        selectTeam = true, 
        rewards = {
            {
                type = "Unit", 
                name = "DuelSpongebob", 
                amount = 1, 
                noDisplay = true
            }, 
            {
                type = "Unit", 
                name = "BuffPatrick", 
                amount = 1, 
                noDisplay = true
            }
        }, 
        dialogue = {
            speaker = "MrKrabs", 
            intro = "Alright, me bucko. It\226\128\153s time. You\226\128\153ve trained both, but now I need ya to choose: Will you throw your lot in with SpongeBob\226\128\153s scrappy skill... or Patrick\226\128\153s unpredictable powerhouse style? Choose wisely\226\128\148there's no turnin\226\128\153 back!"
        }
    }
};