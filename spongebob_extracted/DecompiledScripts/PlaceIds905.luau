local l_GameId_0 = game.GameId;
local l_PlaceId_0 = game.PlaceId;
local v2 = {
    "Lobby", 
    "Trading", 
    "Factions", 
    "KarateLobby"
};
local v3 = {
    [6594435384] = {
        Lobby = 123662243100680, 
        Game = 137461635848196, 
        AFK = 130510139246181, 
        Trading = 123780435956703, 
        Cave = 80487143225414, 
        Factions = 133840327318175, 
        KarateLobby = 124398716501784
    }, 
    [6789374318] = {
        Lobby = 82547113284939, 
        Game = 89161734699335, 
        AFK = 73271282499481, 
        Trading = 90671404083546, 
        Cave = 116770429549043, 
        Factions = 113893025119701
    }, 
    [6790081571] = {
        Lobby = 112642345119817, 
        Game = 90753913217772, 
        AFK = 120539595774221, 
        Trading = 139990231502528, 
        Cave = 134799930505905, 
        Factions = 85590600600219, 
        KarateLobby = 104926345480848
    }, 
    [6766791959] = {
        Lobby = 101094576267378, 
        Game = 106699412240819, 
        AFK = 81315794004863, 
        Factions = 104043370858466, 
        Trading = 76189773458395, 
        KarateLobby = 122120989099258
    }, 
    [6789747932] = {
        Lobby = 75527615342856, 
        Game = 122736969027188, 
        AFK = 100673480872583
    }, 
    [6786481280] = {
        Lobby = 90596310269112, 
        Game = 104526133535566, 
        AFK = 104385909792225, 
        Trading = 118750361225542, 
        Factions = 96172177772919, 
        KarateLobby = 87569224034071
    }, 
    [7275922773] = {
        Lobby = 119333277926628, 
        Game = 110731333499695, 
        AFK = 88223949266460, 
        Trading = 128807234486615, 
        Cave = 125704348148529
    }, 
    [7308622495] = {
        Lobby = 130103752467709, 
        Game = 98992261221292, 
        AFK = 120539595774221, 
        Trading = 135588227629632
    }, 
    [7334658276] = {
        Lobby = 80621257136448, 
        Game = 85565898566846, 
        Cave = 117050171138594
    }, 
    [7583798486] = {
        Lobby = 114221230882203, 
        Game = 117207656099381, 
        AFK = 120467320580870, 
        Trading = 73406480155048, 
        Factions = 95659373232165
    }, 
    [7827595580] = {
        Lobby = 140090983987952, 
        Game = 95166803218897, 
        Factions = 74502622011978, 
        Trading = 138719525598533, 
        AFK = 91575135709363
    }
};
local v4 = {
    Lobby = "Would you like to return to the Lobby?", 
    AFK = "Would you like to teleport to the AFK Rock?", 
    Trading = "Would you like to teleport to the Trading Hub?"
};
local v5 = v3[l_GameId_0];
if not v5 then
    warn("[PlaceIds] Could not find destinations for GameId: " .. l_GameId_0);
    return;
else
    local v6 = nil;
    for v7, v8 in v5 do
        if v8 == l_PlaceId_0 then
            v6 = v7;
            break;
        end;
    end;
    return {
        GetPlaceIds = function(_) --[[ Line: 122 ]] --[[ Name: GetPlaceIds ]]
            -- upvalues: v5 (copy)
            return v5;
        end, 
        GetDestination = function(_) --[[ Line: 126 ]] --[[ Name: GetDestination ]]
            -- upvalues: v6 (ref)
            return v6;
        end, 
        GetDestinationId = function(_, v12) --[[ Line: 130 ]] --[[ Name: GetDestinationId ]]
            -- upvalues: v5 (copy)
            local v13 = v5[v12];
            if not v13 then
                warn("PlaceId not found for Destination: " .. v12);
            end;
            return v13;
        end, 
        GetDestinationPrompt = function(_, v15) --[[ Line: 139 ]] --[[ Name: GetDestinationPrompt ]]
            -- upvalues: v4 (copy)
            return v4[v15];
        end, 
        IsHUB = function(_) --[[ Line: 144 ]] --[[ Name: IsHUB ]]
            -- upvalues: v2 (copy), v6 (ref)
            return table.find(v2, v6) ~= nil;
        end, 
        IsLobby = function(_) --[[ Line: 148 ]] --[[ Name: IsLobby ]]
            -- upvalues: v6 (ref)
            return v6 == "Lobby";
        end, 
        IsKarateLobby = function(_) --[[ Line: 152 ]] --[[ Name: IsKarateLobby ]]
            -- upvalues: v6 (ref)
            return v6 == "KarateLobby";
        end, 
        IsAFK = function(_) --[[ Line: 156 ]] --[[ Name: IsAFK ]]
            -- upvalues: v6 (ref)
            return v6 == "AFK";
        end, 
        IsGame = function(_) --[[ Line: 160 ]] --[[ Name: IsGame ]]
            -- upvalues: v6 (ref)
            return v6 == "Game";
        end, 
        IsTrading = function(_) --[[ Line: 164 ]] --[[ Name: IsTrading ]]
            -- upvalues: v6 (ref)
            return v6 == "Trading";
        end, 
        IsFactionWorld = function(_) --[[ Line: 168 ]] --[[ Name: IsFactionWorld ]]
            -- upvalues: v6 (ref)
            return v6 == "Factions";
        end, 
        IsCave = function(_) --[[ Line: 173 ]] --[[ Name: IsCave ]]
            -- upvalues: v6 (ref)
            return v6 == "Cave";
        end, 
        IsReleaseBranch = function(_) --[[ Line: 177 ]] --[[ Name: IsReleaseBranch ]]
            -- upvalues: l_GameId_0 (copy)
            return l_GameId_0 == 6594435384;
        end, 
        IsTestBranch = function(_) --[[ Line: 181 ]] --[[ Name: IsTestBranch ]]
            -- upvalues: l_GameId_0 (copy)
            return l_GameId_0 == 6790081571;
        end
    };
end;