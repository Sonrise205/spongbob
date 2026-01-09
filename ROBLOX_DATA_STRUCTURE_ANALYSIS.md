# Roblox Codebase Data Structure Analysis
## SpongeBob Tower Defense Game - Decompiled Scripts Analysis

---

## 1. Data Structure Analysis

### 1.1 Primary Data Structures Overview

The codebase uses a **hierarchical player data system** built on top of the **ReplicaService/ReplicaController** pattern - a popular Roblox state replication framework.

#### Core Architecture Components:

```
┌─────────────────────────────────────────────────────────────┐
│                    SERVER SIDE                               │
│  ┌─────────────────┐    ┌─────────────────────────────────┐ │
│  │ ProfileService  │───▶│       ReplicaService            │ │
│  │ (Data Stores)   │    │   (State Replication)           │ │
│  └─────────────────┘    └─────────────────────────────────┘ │
│           │                           │                      │
│           ▼                           ▼                      │
│  ┌─────────────────┐    ┌─────────────────────────────────┐ │
│  │  Player Profile │    │      Replica Objects            │ │
│  │  (Persistent)   │    │   (Live State Sync)             │ │
│  └─────────────────┘    └─────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
                              │
                    RemoteEvents (Replica_*)
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    CLIENT SIDE                               │
│  ┌─────────────────────────────────────────────────────────┐ │
│  │              ReplicaController                          │ │
│  │   - Receives replica state changes                      │ │
│  │   - Listens to: SetValue, ArrayInsert, ArrayRemove...   │ │
│  └─────────────────────────────────────────────────────────┘ │
│                              │                               │
│                              ▼                               │
│  ┌─────────────────────────────────────────────────────────┐ │
│  │              DataController (Knit)                      │ │
│  │   - High-level data access API                          │ │
│  │   - Path-based data retrieval                           │ │
│  └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### 1.2 Player Data Schema

Based on analysis of `Variables314.luau`, `Profile653.luau`, and various controller scripts:

```lua
PlayerData = {
    -- Currency System
    Coins = number,              -- Primary soft currency
    Gems = number,               -- Premium currency
    GoldenSpatulas = number,     -- Special currency
    ChallengeTokens = number,    -- Challenge mode currency
    TraitRolls = number,         -- Trait reroll tokens
    GoldenTraitRolls = number,   -- Premium trait rerolls
    MagicConch = number,         -- Special summon currency
    FactionPoints = number,      -- Faction system currency
    Hearts = number,             -- Event currency
    Bubbles = number,            -- Event currency
    SeasonXP = number,           -- Season pass XP
    DriverLicense = number,      -- Challenge currency
    Swashbucks = number,         -- Event currency
    KampKredit = number,         -- Event currency
    SandDollar = number,         -- Special currency
    
    -- Player Stats
    PlayerStats = {
        Level = number,          -- Player level (1-100+)
        Experience = number,     -- Current XP
        Prestige = number,       -- Prestige level (0-10)
        TotalPlaytime = number,  -- Total playtime in seconds
    },
    
    -- Unit Inventory (Tower Defense Units)
    Units = {
        [UID: string] = {
            UnitName = string,       -- e.g., "Spongebob", "Patrick"
            Level = number,          -- 1-50
            Experience = number,     -- Unit XP
            Stars = number,          -- Fusion level (0-5)
            Shiny = boolean,         -- Shiny variant
            Mega = boolean,          -- Wumbo/Mega variant
            Trait = {
                Name = string,       -- e.g., "Strike", "Reach"
                Tier = number,       -- 1-3
            } | nil,
            Trait2 = {
                Name = string,
                Tier = number,
            } | nil,
            Relic = string | nil,    -- Equipped relic name
            Favorite = boolean,      -- Favorited units can't be sold
            _logged = boolean,       -- Tracking flag
        }
    },
    
    -- Pet System
    Pets = {
        [UID: string] = {
            PetName = string,
            Stars = number,
            Shiny = boolean,
            Mega = boolean,
        }
    },
    
    -- Loadout Configuration (6 slots)
    Loadout = {
        [1-6] = UID | nil,       -- Unit UIDs
    },
    RoguelikeLoadout = {
        [1-6] = UID | nil,       -- Roguelike-specific loadout
    },
    
    -- Team Presets
    Teams = {
        [TeamName: string] = {
            [1-6] = UID | nil,
        }
    },
    
    -- Inventory Items (Crates, Chests, Mounts, etc.)
    Inventory = {
        [ItemName: string] = number,  -- Item count
    },
    
    -- Summoning Pity System
    Pity = {
        Standard = {
            Legendary = number,
            Mythic = number,
        },
        Exclusive = {
            Legendary = number,
            Mythic = number,
        },
        Boosted = {
            Legendary = number,
            Mythic = number,
        },
    },
    
    -- Progress Tracking
    Progress = {
        [WorldName: string] = {
            [Difficulty: string] = {
                Chapter = number,
                Completed = boolean,
                FirstClear = boolean,
            }
        }
    },
    
    -- Achievements & Milestones
    Achievements = {
        [AchievementID: string] = boolean | number,
    },
    
    -- Settings
    Settings = {
        UnitAutoSell = {
            [Rarity: string] = boolean,  -- Auto-sell by rarity
        },
        TradeSettings = number,          -- 1=All, 2=Friends, 3=Disabled
        VFXSettings = number,            -- Graphics settings
    },
    
    -- Trading History
    TradingHistory = {
        [UserID: number] = timestamp,
    },
    
    -- Event-Specific Data
    BemmyData = { ... },           -- Bemmy event progress
    SpongebobVsPatrick = { ... },  -- Turf Wars event
    OlipopEvent = { ... },         -- Olipop event
    KrewPlus = { ... },            -- Subscription data
    
    -- Session Data
    DailyRewards = {
        LastClaim = timestamp,
        Streak = number,
    },
    FreeCrates = {
        [CrateID: string] = timestamp,  -- Last claim time
    },
}
```

### 1.3 Unit Template (Default Values)

```lua
UNIT_TEMPLATE = {
    Level = 1,
    Experience = 0,
    Stars = 0,
    Shiny = false,
    Mega = false,
    _logged = true
}
```

### 1.4 Rarity Hierarchy

```lua
RARITIES = {
    [1] = "Common",
    [2] = "Uncommon", 
    [3] = "Rare",
    [4] = "Epic",
    [5] = "Legendary",
    [6] = "Mythic",      -- Also "Limited"
    [7] = "Secret",
    [8] = "Exotic",
    [9] = "Prismatic"
}
```

---

## 2. Classification

### 2.1 System Categories

| System | Type | Description |
|--------|------|-------------|
| Player Data | **Player Data Store** | ProfileService-backed persistent storage |
| Replica System | **State Machine / Observer** | Real-time state replication |
| Currency System | **Resource Manager** | Multiple currency types with boost multipliers |
| Unit System | **Inventory System** | Gacha-style unit collection with upgrades |
| Trading System | **P2P Exchange** | Player-to-player item trading |
| Event System | **Temporal State Machine** | Time-limited event data |

### 2.2 Design Patterns Identified

#### **1. Replica Pattern (Observer)**
```lua
-- ReplicaController389.luau
Replica:ListenToChange(path, callback)     -- Subscribe to value changes
Replica:ListenToArrayInsert(path, callback) -- Subscribe to array insertions
Replica:ListenToArrayRemove(path, callback) -- Subscribe to array removals
```

#### **2. Knit Framework (Service Locator + Module Pattern)**
```lua
-- Controllers (Client)
v8.GetController("DataController")
v8.GetController("UIController")
v8.GetController("UnitController")

-- Services (Server, accessed via client)
v8.GetService("UnitService")
v8.GetService("CurrencyService")
v8.GetService("TradingService")
v8.GetService("GameService")
```

#### **3. Promise Pattern (Async Operations)**
```lua
v9:_getReplica(token):andThen(function(replica)
    return v7:TryGetValueFromTablePath(replica.Data, path)
end)
```

#### **4. Factory Pattern (Unit Creation)**
```lua
-- GiveUnitServer804.luau
v4:Create(player, {
    {
        UnitName = unitName,
        ExtraData = {
            Level = level,
            Stars = stars,
            Trait = trait,
            Shiny = isShiny,
            Mega = isMega
        }
    }
})
```

---

## 3. Remote Interaction Mapping

### 3.1 ReplicaService Remote Events

The system uses a centralized set of RemoteEvents for data synchronization:

| Remote Event | Purpose | Data Flow |
|--------------|---------|-----------|
| `Replica_ReplicaRequestData` | Request initial player data | Client → Server |
| `Replica_ReplicaSetValue` | Single value update | Server → Client |
| `Replica_ReplicaSetValues` | Batch value updates | Server → Client |
| `Replica_ReplicaArrayInsert` | Array insertion | Server → Client |
| `Replica_ReplicaArraySet` | Array element update | Server → Client |
| `Replica_ReplicaArrayRemove` | Array removal | Server → Client |
| `Replica_ReplicaWrite` | Execute write function | Server → Client |
| `Replica_ReplicaSignal` | Custom signals | Bidirectional |
| `Replica_ReplicaSetParent` | Hierarchy changes | Server → Client |
| `Replica_ReplicaCreate` | New replica creation | Server → Client |
| `Replica_ReplicaDestroy` | Replica destruction | Server → Client |

### 3.2 Knit Services (Client-Accessible)

Based on script analysis, these are the primary services:

| Service | Primary Functions | Risk Level |
|---------|-------------------|------------|
| **UnitService** | Create, Delete, Upgrade, Fuse units | 🔴 HIGH |
| **CurrencyService** | Increment/Decrement currencies | 🔴 HIGH |
| **TradingService** | Trade initiation, acceptance, cancellation | 🔴 HIGH |
| **GameService** | Game state, gold management | 🟡 MEDIUM |
| **SettingsService** | Player preferences | 🟢 LOW |
| **UnitService.MythicBannerIndex** | Banner rotation | 🟢 LOW |
| **CardService** | Roguelike cards | 🟢 LOW |
| **PetService** | Pet management | 🟡 MEDIUM |
| **SessionService** | Match settings | 🟢 LOW |
| **FactionService** | Faction points | 🟡 MEDIUM |
| **BoostsService** | Currency multipliers | 🟡 MEDIUM |
| **BemmyBuddyService** | Event tracking | 🟢 LOW |
| **TowerKarateService** | Tower of Karate mode | 🟢 LOW |

### 3.3 Critical Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          UNIT SUMMON FLOW                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│   Client                           Server                                    │
│   ──────                           ──────                                    │
│                                                                              │
│   [Summon Button Press]                                                      │
│         │                                                                    │
│         ▼                                                                    │
│   UnitService:Summon(bannerType, count)                                     │
│         │                                                                    │
│         ├────────────── RemoteFunction ──────────────▶│                     │
│         │                                             │                      │
│         │                                    ┌────────▼────────┐            │
│         │                                    │  Validate:       │            │
│         │                                    │  - Has Gems?     │            │
│         │                                    │  - Valid Banner? │            │
│         │                                    │  - Not Exploited?│            │
│         │                                    └────────┬────────┘            │
│         │                                             │                      │
│         │                                    ┌────────▼────────┐            │
│         │                                    │  Roll Units:     │            │
│         │                                    │  - Apply Pity    │            │
│         │                                    │  - Apply Luck    │            │
│         │                                    │  - Generate UIDs │            │
│         │                                    └────────┬────────┘            │
│         │                                             │                      │
│         │                                    ┌────────▼────────┐            │
│         │                                    │  Update Replica: │            │
│         │                                    │  - Deduct Gems   │            │
│         │                                    │  - Add Units     │            │
│         │                                    │  - Update Pity   │            │
│         │                                    └────────┬────────┘            │
│         │                                             │                      │
│         │◀──────────── Replica Events ────────────────┤                     │
│         │                                             │                      │
│   ┌─────▼─────┐                                                             │
│   │ DataController                                                          │
│   │ OnChanged()  │◀─ Replica:ListenToChange("Units", ...)                   │
│   └─────┬─────┘                                                             │
│         │                                                                    │
│   ┌─────▼─────┐                                                             │
│   │ UI Update │                                                             │
│   │ Animations│                                                             │
│   └───────────┘                                                             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 3.4 Remote → Data Field Mapping

| Remote/Service Method | Data Fields Affected | Operation |
|-----------------------|---------------------|-----------|
| `UnitService:Create` | `Units[UID]` | ArrayInsert |
| `UnitService:Delete` | `Units[UID]` | ArrayRemove |
| `UnitService:Upgrade` | `Units[UID].Level`, `Units[UID].Experience` | SetValue |
| `UnitService:Fuse` | `Units[UID].Stars` | SetValue + ArrayRemove (fodder) |
| `UnitService:SetTrait` | `Units[UID].Trait`, `Units[UID].Trait2` | SetValue |
| `CurrencyService:Increment` | `Coins`, `Gems`, etc. | SetValue |
| `GameService:IncrementGold` | In-game gold (not persistent) | SetValue |
| `TradingService:AddUnit` | Trade replica state | SetValues |
| `TradingService:Complete` | Both players' `Units`, `Inventory` | BatchWrite |
| `FactionService:AddPoints` | `FactionPoints` | SetValue |
| `SettingsService:Set` | `Settings.*` | SetValue |

---

## 4. Potential Vulnerabilities

### 🔴 Critical Risk Areas

#### 4.1 Trading System Vulnerabilities

```lua
-- Trade772.luau analysis
-- Potential issues:
-- 1. Race conditions in trade confirmation
-- 2. Unit UID spoofing if not validated server-side
-- 3. Trade window timing exploits

-- The READY_RESET_TIME (3 seconds) and CONFIRM_TIME (5 seconds) 
-- create potential windows for manipulation
v8.TRADING.READY_RESET_TIME = 3
v8.TRADING.CONFIRM_TIME = 5
```

**Mitigation Check:** Server must validate:
- Unit ownership
- Unit exists in player's inventory
- Unit is not locked/favorite
- UID hasn't changed mid-trade

#### 4.2 Currency Manipulation

```lua
-- CurrencyServer862.luau
-- The CurrencyService:Increment function accepts currency type as string
-- Server must validate:
-- 1. Currency type is valid
-- 2. Amount is positive for legitimate operations
-- 3. Source of currency is legitimate (game completion, purchase, etc.)
```

#### 4.3 Unit Duplication Risks

```lua
-- Key areas for dupe checks:
-- 1. Trade completion - ensure atomic transactions
-- 2. Fusion - ensure fodder units are deleted
-- 3. Unit creation from crates - ensure single-use
```

### 🟡 Medium Risk Areas

#### 4.4 Unsanitized Inputs

The admin commands system (visible in various `Admin*Server*.luau` files) accepts:
- Player names/IDs
- Currency amounts
- Unit names
- Item names

**Check:** Ensure admin permission validation is robust.

#### 4.5 Pity System Manipulation

```lua
-- Variables314.luau
MAX_PITY = {
    Standard = { Legendary = 200, Mythic = 400 },
    Exclusive = { Legendary = 200, Mythic = 400 },
    Boosted = { Legendary = 100, Mythic = 200 }
}
```

**Check:** Pity counters should only increment server-side.

### 🟢 Low Risk (but noteworthy)

#### 4.6 Auto-Sell Settings
The `Settings.UnitAutoSell` system could be abused if not properly validated when selling units in bulk.

---

## 5. Key Code Snippets

### 5.1 DataController - Reading Player Data

```lua
-- DataController87.luau
v9.Get = function(_, player, path)
    local userId = tostring(player.UserId)
    return v9:_getReplica(userId):andThen(function(replica)
        return v7:TryGetValueFromTablePath(replica.Data, path)
    end)
end

v9.OnChanged = function(_, player, path, callback, fireImmediately)
    local userId = tostring(player.UserId)
    return v9:_getReplica(userId):andThen(function(replica)
        local connection = replica:ListenToChange(path, callback)
        if fireImmediately then
            task.spawn(function()
                callback(v9:Get(player, path):expect(), nil)
            end)
        end
        return connection
    end)
end
```

### 5.2 Unit Creation (Server)

```lua
-- GiveUnitServer804.luau
local unitData = {
    Level = level,
    Stars = stars,
    Trait = trait,
    Trait2 = trait2,
    Relic = relic,
    Shiny = isShiny,
    Mega = isMega
}

for i = 1, count do
    table.insert(unitsToCreate, {
        UnitName = unitName,
        ExtraData = unitData
    })
end

UnitService:Create(player, unitsToCreate)
```

### 5.3 Replica State Listeners

```lua
-- ReplicaController389.luau
Replica:ListenToChange(path, function(newValue, oldValue)
    -- Triggered when value at path changes
end)

Replica:ListenToArrayInsert(path, function(index, value)
    -- Triggered when item inserted
end)

Replica:ListenToArrayRemove(path, function(index, removedValue)
    -- Triggered when item removed
end)
```

---

## 6. Visual Schema

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           PLAYER DATA SCHEMA                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PlayerData                                                                  │
│  │                                                                           │
│  ├── Currencies ─────────────────────────────────────────────────────────┐  │
│  │   ├── Coins: number                                                   │  │
│  │   ├── Gems: number                                                    │  │
│  │   ├── GoldenSpatulas: number                                          │  │
│  │   ├── ChallengeTokens: number                                         │  │
│  │   ├── TraitRolls: number                                              │  │
│  │   ├── GoldenTraitRolls: number                                        │  │
│  │   ├── MagicConch: number                                              │  │
│  │   └── [+15 more event currencies]                                     │  │
│  │                                                                        │  │
│  ├── PlayerStats ────────────────────────────────────────────────────────┤  │
│  │   ├── Level: 1-1000                                                   │  │
│  │   ├── Experience: number                                              │  │
│  │   └── Prestige: 0-10                                                  │  │
│  │                                                                        │  │
│  ├── Units ──────────────────────────────────────────────────────────────┤  │
│  │   └── [UID: string]                                                   │  │
│  │       ├── UnitName: string                                            │  │
│  │       ├── Level: 1-50                                                 │  │
│  │       ├── Experience: number                                          │  │
│  │       ├── Stars: 0-5                                                  │  │
│  │       ├── Shiny: boolean                                              │  │
│  │       ├── Mega: boolean                                               │  │
│  │       ├── Trait: { Name, Tier } | nil                                 │  │
│  │       ├── Trait2: { Name, Tier } | nil                                │  │
│  │       ├── Relic: string | nil                                         │  │
│  │       └── Favorite: boolean                                           │  │
│  │                                                                        │  │
│  ├── Pets ───────────────────────────────────────────────────────────────┤  │
│  │   └── [UID: string]                                                   │  │
│  │       ├── PetName: string                                             │  │
│  │       ├── Stars: 0-5                                                  │  │
│  │       ├── Shiny: boolean                                              │  │
│  │       └── Mega: boolean                                               │  │
│  │                                                                        │  │
│  ├── Loadouts ───────────────────────────────────────────────────────────┤  │
│  │   ├── Loadout: [6 UIDs]                                               │  │
│  │   ├── RoguelikeLoadout: [6 UIDs]                                      │  │
│  │   └── Teams: { [name]: [6 UIDs] }                                     │  │
│  │                                                                        │  │
│  ├── Inventory ──────────────────────────────────────────────────────────┤  │
│  │   └── [ItemName: string]: count                                       │  │
│  │                                                                        │  │
│  ├── Pity ───────────────────────────────────────────────────────────────┤  │
│  │   ├── Standard: { Legendary, Mythic }                                 │  │
│  │   ├── Exclusive: { Legendary, Mythic }                                │  │
│  │   └── Boosted: { Legendary, Mythic }                                  │  │
│  │                                                                        │  │
│  ├── Progress ───────────────────────────────────────────────────────────┤  │
│  │   └── [World]: { [Difficulty]: { Chapter, Completed, FirstClear } }   │  │
│  │                                                                        │  │
│  ├── Settings ───────────────────────────────────────────────────────────┤  │
│  │   ├── UnitAutoSell: { [Rarity]: boolean }                             │  │
│  │   ├── TradeSettings: 1|2|3                                            │  │
│  │   └── VFXSettings: number                                             │  │
│  │                                                                        │  │
│  └── Events ─────────────────────────────────────────────────────────────┤  │
│      ├── BemmyData: { ... }                                              │  │
│      ├── SpongebobVsPatrick: { ... }                                     │  │
│      ├── OlipopEvent: { ... }                                            │  │
│      └── KrewPlus: { ... }                                               │  │
│                                                                           │  │
└───────────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 7. Summary

### Architecture Style
- **Framework:** Knit (Service/Controller pattern)
- **Data Replication:** ReplicaService (Observer pattern)
- **Data Persistence:** ProfileService-compatible
- **Communication:** Promise-based async with RemoteEvents/Functions

### Key Files
| File | Purpose |
|------|---------|
| `ReplicaController389.luau` | Client-side data replication |
| `DataController87.luau` | High-level data access API |
| `DataUtils667.luau` | Path-based table utilities |
| `Variables314.luau` | Game constants and templates |
| `ClientWire91.luau` | Knit service communication wrapper |

### Security Considerations
1. All data mutations happen server-side
2. Client receives read-only replicas
3. Pity system should be validated server-side
4. Trading requires atomic transactions
5. Admin commands need proper permission checks
