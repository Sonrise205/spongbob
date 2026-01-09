local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = {
    PC = "Press [Tab] to mount or dismount", 
    Console = "Press [Y] to mount or dismount", 
    Mobile = "Press Mount button above jump button to mount or dismount"
};
local function v4(v3) --[[ Line: 21 ]] --[[ Name: ReconcileMountData ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.Reconcile(v3, {
        rarity = "Common", 
        hint = v2, 
        isMount = true
    });
end;
local v5 = {
    Boatmobile = {
        displayName = "Boatmobile", 
        rarity = "Rare", 
        icon = "rbxassetid://122301181083998", 
        description = "A sleek, ocean-ready ride perfect for underwater cruising!"
    }, 
    PattyWagon = {
        displayName = "Patty Wagon", 
        rarity = "Legendary", 
        icon = "rbxassetid://90599189705238", 
        description = "A burger-shaped vehicle that's as fast as it is delicious!"
    }, 
    RoadReaper = {
        displayName = "Road Reaper", 
        rarity = "Mythic", 
        icon = "rbxassetid://86325454426639", 
        description = "A menacing motorcycle that strikes fear into all who cross its path!"
    }, 
    BassBlaster3000 = {
        displayName = "Bass Blaster 3000", 
        rarity = "Epic", 
        icon = "rbxassetid://91939616539717", 
        description = "A speedy ride with a fierce flame design, built to blast through the streets!"
    }, 
    PioneerRock = {
        displayName = "Pioneer Rock", 
        rarity = "Limited", 
        icon = "rbxassetid://111532554066221", 
        description = "Pioneers used to ride these things for miles!"
    }, 
    PinkJellyfish = {
        displayName = "Pink Jellyfish", 
        rarity = "Limited", 
        icon = "rbxassetid://88853404267135", 
        description = "A bouncy, buzzing ride that floats through the air with scouting flair!"
    }, 
    BlueJellyfish = {
        displayName = "Blue Jellyfish", 
        rarity = "Limited", 
        icon = "rbxassetid://114867881410923", 
        description = "A bouncy, buzzing ride that floats through the air with electric flair!"
    }, 
    YellowJellyfish = {
        displayName = "Yellow Jellyfish", 
        rarity = "Limited", 
        icon = "rbxassetid://96987021191415", 
        description = "A bouncy, buzzing ride that floats through the air with goofy charm!"
    }, 
    Coupe = {
        displayName = "Coupe", 
        rarity = "Limited", 
        icon = "rbxassetid://78191101981114", 
        description = "A compact, bubbly ride built for smooth Bikini Bottom cruising!"
    }, 
    GloveBalloon = {
        displayName = "Glove Balloon", 
        rarity = "Limited", 
        icon = "rbxassetid://136347265290708", 
        description = "A floaty, glove-shaped ride full of whimsical charm!"
    }, 
    GoldenLimousine = {
        displayName = "Golden Limo", 
        rarity = "Secret", 
        icon = "rbxassetid://110664617393063", 
        description = "A massive, golden ride that lets you cruise in over-the-top luxury!"
    }, 
    GoofySeaBear = {
        displayName = "Goofy Sea Bear", 
        rarity = "Limited", 
        icon = "rbxassetid://80891595745177", 
        description = "A wild, wobbly creature that bounces along with goofy, unpredictable moves!"
    }, 
    SeriousSeaBear = {
        displayName = "Serious Sea Bear", 
        rarity = "Limited", 
        icon = "rbxassetid://89563035828267", 
        description = "A fierce, electric predator that carries you with raw, unstoppable power!"
    }, 
    FocusedSeaBear = {
        displayName = "Focused Sea Bear", 
        rarity = "Limited", 
        icon = "rbxassetid://82163517082311", 
        description = "A sharp-eyed beast that moves with steady, unshakable precision!"
    }, 
    ["#1BubbleBlower"] = {
        displayName = "#1 Bubble Blower", 
        rarity = "Secret", 
        icon = "rbxassetid://112932099738522", 
        description = "A champion's ride that soars high on streams of bubbly victory!"
    }, 
    JellyfishDragon = {
        displayName = "Jellyfish Dragon", 
        rarity = "Mythic", 
        icon = "rbxassetid://77943791713158", 
        description = "A stinging serpent that zips through the skies with electric fury!"
    }, 
    WarSeahorse = {
        displayName = "War Seahorse", 
        rarity = "Legendary", 
        icon = "rbxassetid://126924730233974", 
        description = "A battle steed that charges through waves with unstoppable force!"
    }, 
    NeptuneTrident = {
        displayName = "Neptune's Trident", 
        rarity = "Limited", 
        icon = "rbxassetid://118922890181097", 
        description = "A divine relic that carries you through sea and sky with unstoppable grace!"
    }, 
    LionFish = {
        displayName = "Lion Fish", 
        rarity = "Secret", 
        icon = "rbxassetid://105992125087833", 
        description = "A fierce, wild beast of the deep that charges with roaring power and untamed spirit!"
    }, 
    Chariot = {
        displayName = "Chariot", 
        rarity = "Limited", 
        icon = "rbxassetid://75405461418520", 
        description = "A swift, royal ride built for commanding the battlefield with style and speed!"
    }, 
    FlyingDutchmanShip = {
        displayName = "Flying Dutchman Ship", 
        rarity = "Limited", 
        icon = "rbxassetid://70682505084383", 
        description = "A haunted vessel that soars through the skies, leaving ghostly green flames in its wake!"
    }, 
    GooLagoonSurfboard = {
        displayName = "Goo Lagoon Surfboard", 
        rarity = "Epic", 
        icon = "rbxassetid://135407057501346", 
        description = "A slick board built for catching waves straight from the lagoon!"
    }, 
    BubbleTaxi = {
        displayName = "Bubble Taxi", 
        rarity = "Epic", 
        icon = "rbxassetid://106090530848217", 
        description = "A bubbly ride personally crafted by Bubble Buddy, perfect for floating through Bikini Bottom in squeaky-clean style!"
    }, 
    Bubble = {
        displayName = "Bubble", 
        rarity = "Epic", 
        icon = "rbxassetid://87247206633081", 
        description = "A giant, shimmering sphere that floats you through the sea carefree!"
    }, 
    InvisibleBoatmobile = {
        displayName = "Invisible Boatmobile", 
        rarity = "Limited", 
        icon = "", 
        description = "The legendary, unseen ride of Mermaid Man and Barnacle Boy\226\128\148swift, stealthy, and totally invisible!"
    }, 
    AirPlankton = {
        displayName = "Air Plankton", 
        rarity = "Limited", 
        icon = "rbxassetid://93477766679751", 
        description = "Plankton\226\128\153s menacing aircraft built for sky-high mischief!"
    }, 
    BikiniBottomBus = {
        displayName = "Bikini Bottom Bus", 
        rarity = "Mythic", 
        icon = "rbxassetid://114591387654361", 
        description = "The iconic coral cruiser that\226\128\153s been rolling through town for generations!"
    }, 
    FlyingIceCreamTruck = {
        displayName = "Flying Ice Cream Truck", 
        rarity = "Limited", 
        icon = "rbxassetid://99093485069963", 
        description = "A legendary frozen truck that falls from the sky, reserved for those cooler than Larry\226\128\148and somehow still alive to tell the tale!"
    }, 
    SandMechHelmet = {
        displayName = "Sand Mech Helmet", 
        rarity = "Secret", 
        icon = "rbxassetid://138838773494989", 
        description = "A towering headpiece from the Patrick's war machine, built for defense and intimidation in style!"
    }, 
    SandJet = {
        displayName = "Sand Jet", 
        rarity = "Mythic", 
        icon = "rbxassetid://119494394811270", 
        description = "A high-speed, sand-sculpted flyer launched straight from the battlefield \226\128\148 light, sharp, and ready for air assault!"
    }, 
    JellyAngler = {
        displayName = "Jelly Angler", 
        rarity = "Limited", 
        icon = "rbxassetid://98437139638336", 
        description = "A glowing deep-sea ride, perfect for luring jellyfish and cruising the depths!"
    }, 
    PineappleRV = {
        displayName = "Pineapple RV", 
        rarity = "Limited", 
        icon = "rbxassetid://82238347514847", 
        description = "A rolling slice of home-on-wheels, packed with comfort and chaos!"
    }, 
    ManRayHotRod = {
        displayName = "Man Ray Hot Rod", 
        rarity = "Exotic", 
        icon = "rbxassetid://103575409302775", 
        description = "A turbo-charged menace, built for burning rubber and villainous getaways in style!"
    }, 
    PlanktonsTank = {
        displayName = "Plankton's Tank", 
        rarity = "Secret", 
        icon = "rbxassetid://121857203021225", 
        description = "A massive armored war machine powered by Plankton\226\128\153s big plans and even bigger ego!"
    }, 
    HauntedBoat = {
        displayName = "Haunted House Boat", 
        rarity = "Exotic", 
        icon = "rbxassetid://111737900106607", 
        description = "A spooky vessel that glides through the deep with eerie lights and ghostly whispers!"
    }, 
    JellyfishNet = {
        displayName = "Jellyfish Net", 
        rarity = "Legendary", 
        icon = "rbxassetid://127878332531299", 
        description = "A classic net ride that bounces along, perfect for jellyfish chasers on the move!"
    }, 
    AcornSubmersible = {
        displayName = "Acorn Submersible", 
        rarity = "Mythic", 
        icon = "rbxassetid://137993481369713", 
        description = "Sandy\226\128\153s trusty acorn-shaped sub, built for deep dives and daring adventures!"
    }, 
    Dorudon = {
        displayName = "Dorudon", 
        rarity = "Exotic", 
        icon = "rbxassetid://116277099233724", 
        description = "An ancient sea beast that surges through the ocean with primeval power!"
    }, 
    SpongeFUNTrain = {
        displayName = "Krusty Sponge FUN Train", 
        rarity = "Exotic", 
        icon = "rbxassetid://94222291434288", 
        description = "A flashy, money-grabbing ride from Mr. Krabs' scheme, decked out to squeeze every drop of FUN (and profit)!"
    }, 
    ["#1BubbleBloxy"] = {
        displayName = "#1 Bubble Bloxy", 
        rarity = "Limited", 
        icon = "rbxassetid://92825490916799", 
        description = "A celebratory ride that fizzes with the taste of victory, honoring the 2025 Roblox Innovation Award for Best Use of IP!"
    }, 
    HydroHowler = {
        displayName = "Hydro Howler 7000", 
        rarity = "Legendary", 
        icon = "rbxassetid://107268907055130", 
        description = "A turbo-charged hot rod of the sea, roaring with power and dripping with style!"
    }, 
    BubbleBoat = {
        displayName = "Bubble Boat", 
        rarity = "Mythic", 
        icon = "rbxassetid://74956156347754", 
        description = "A delicate ride of pure bubbles, floating with every puff of exhaust!"
    }, 
    OLIPOPRaceCar = {
        displayName = "OLIPOP Racecar", 
        rarity = "Limited", 
        icon = "rbxassetid://74069872222425", 
        description = "A slick, soda-fueled speedster that zips ahead with fizzy flair and bubbly boost!", 
        untradable = true, 
        isAd = true
    }, 
    ShellCart = {
        displayName = "Shell Cart", 
        rarity = "Limited", 
        icon = "rbxassetid://73780226732053", 
        description = "A snug, seashell ride that rolls smoothly through Bikini Bottom with seaside charm!"
    }, 
    PoliceBoatmobile = {
        displayName = "Police Boatmobile", 
        rarity = "Limited", 
        icon = "rbxassetid://79887668238681", 
        description = "A siren-blaring patrol ride built for justice on the waves of the Bikini Bottom!"
    }, 
    TikiBoat = {
        displayName = "Tiki Boat", 
        rarity = "Mythic", 
        icon = "rbxassetid://97015809779629", 
        description = "A handcrafted vessel carved from island wood, sailing with the spirit of the tropics!"
    }, 
    KarateThrone = {
        displayName = "Karate Throne", 
        rarity = "Secret", 
        icon = "rbxassetid://125402825272811", 
        description = "Forged from focus and discipline, this throne embodies true karate power!"
    }, 
    RobotBattleSuit = {
        displayName = "Robot Battle Suit", 
        rarity = "Secret", 
        icon = "rbxassetid://118619100804510", 
        description = "A towering mech of metal and might, built for big brawls and Bikini Bottom domination!"
    }, 
    MobileKrustyKrab = {
        displayName = "Mobile Krusty Krab", 
        rarity = "Secret", 
        icon = "rbxassetid://83397677986272", 
        description = "A fully loaded restaurant on wheels, serving up speed, grease, and Krabby Patties on the go!"
    }, 
    FamilyBoatmobile = {
        displayName = "Family Boatmobile", 
        rarity = "Secret", 
        icon = "rbxassetid://121066426618287", 
        description = "A spacious retro cruiser built for big families and smooth, easy travels!"
    }, 
    AlaskanBullWorm = {
        displayName = "Alaskan Bull Worm", 
        rarity = "Exotic", 
        icon = "rbxassetid://122898833366701", 
        description = "A massive, sand-churning beast that turns every ride into utter chaos!"
    }, 
    SwashbucklerHorn = {
        displayName = "Swashbuckler Horn", 
        rarity = "Mythic", 
        icon = "rbxassetid://135959176983348", 
        description = "A colossal horn of the high seas, charging onward on blustery pirate spirit!"
    }, 
    SeaShipAtlantis = {
        displayName = "Sea Ship Atlantis", 
        rarity = "Secret", 
        icon = "rbxassetid://104543717686963", 
        description = "A regal, ancient vessel infused with Atlantean power, gliding with timeless majesty across the deep!"
    }, 
    WinnebagoBoatmobile = {
        displayName = "Winnebago Boatmobile", 
        rarity = "Limited", 
        icon = "rbxassetid://105552725225163", 
        description = "A roomy, wave-roaming cruiser packed with vacation spirit, perfect for long hauls across Bikini Bottom or the treacherous Underworld!"
    }, 
    Jerkmaker9000 = {
        displayName = "Jerkmaker-9000", 
        rarity = "Limited", 
        icon = "rbxassetid://102536144538342", 
        description = "Plankton\226\128\153s fruitcake contraption, rolling along with clunky holiday chaos!"
    }, 
    SantasSleigh = {
        displayName = "Santa's Sleigh", 
        rarity = "Secret", 
        icon = "rbxassetid://105897280221884", 
        description = "A festive sleigh pulled by Gary himself, gliding with festive cheer and seasonal sparkle!"
    }
};
return v1.Map(v5, function(v6) --[[ Line: 408 ]]
    -- upvalues: v4 (copy)
    return v4(v6);
end);