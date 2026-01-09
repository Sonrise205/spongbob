local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Packages.Squash);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v5 = require(l_ReplicatedStorage_0.Levels);
local l_T_0 = v2.T;
local l_uint_0 = v2.uint;
local v8 = v2.vlq();
local l_record_0 = v2.record;
local v10 = v2.array(l_T_0(l_record_0({
    value = l_T_0(v8), 
    faction = l_T_0(l_uint_0(1)), 
    userId = l_T_0(v8)
})));
local v11 = v2.array(l_T_0(l_record_0({
    value = l_T_0(v8), 
    level = l_T_0(l_uint_0(1)), 
    userId = l_T_0(v8)
})));
local v12 = {
    allPaths = {}, 
    allPlayerPaths = {}, 
    allSeasonPaths = {}, 
    leaderboardPaths = {}, 
    leaderboardSeasonPaths = {}, 
    playerLeaderstatTemplate = {
        value = 0, 
        _dirty = false
    }, 
    leaderboardSerdes = v10, 
    tokLeaderboardSerdes = v11, 
    usernameSerdes = v2.map(v2.vlq(), v2.string()), 
    map = {
        PlayerLevel = {
            "AllTime"
        }, 
        ChallengesCompleted = {
            AllTime = {}, 
            Season = {}
        }, 
        RaidsCompleted = {
            AllTime = {}, 
            Season = {}
        }, 
        StoryCompleted = {
            AllTime = {}, 
            Season = {}
        }, 
        FeaturedStoryTime = {}, 
        UnitVariantsDiscovered = {
            "AllTime"
        }, 
        SecretSummonLuck = {
            "AllTime", 
            "Season"
        }, 
        BestTraitRollLuck = {
            "AllTime", 
            "Season"
        }, 
        WorstTraitRollLuck = {
            "AllTime", 
            "Season"
        }, 
        UnitsFused = {
            "AllTime", 
            "Season"
        }, 
        UniqueTrades = {
            "AllTime", 
            "Season"
        }, 
        AFKTime = {
            "AllTime", 
            "Season"
        }, 
        FactionStandings = {
            "1", 
            "2", 
            "3"
        }, 
        HighestFloor = {
            "AllTime"
        }
    }, 
    top100Exempt = {
        AFKTime = true, 
        FactionStandings = true, 
        UniqueTrades = true
    }, 
    serdesLookup = {
        PlayerLevel = l_T_0(l_record_0({
            AllTime = l_T_0(v10)
        })), 
        UnitVariantsDiscovered = l_T_0(l_record_0({
            AllTime = l_T_0(v10)
        })), 
        SecretSummonLuck = l_T_0(l_record_0({
            AllTime = l_T_0(v10), 
            Season = l_T_0(v10), 
            _season = l_T_0(v8)
        })), 
        BestTraitRollLuck = l_T_0(l_record_0({
            AllTime = l_T_0(v10), 
            Season = l_T_0(v10), 
            _season = l_T_0(v8)
        })), 
        WorstTraitRollLuck = l_T_0(l_record_0({
            AllTime = l_T_0(v10), 
            Season = l_T_0(v10), 
            _season = l_T_0(v8)
        })), 
        UnitsFused = l_T_0(l_record_0({
            AllTime = l_T_0(v10), 
            Season = l_T_0(v10), 
            _season = l_T_0(v8)
        })), 
        UniqueTrades = l_T_0(l_record_0({
            AllTime = l_T_0(v10), 
            Season = l_T_0(v10), 
            _season = l_T_0(v8)
        })), 
        AFKTime = l_T_0(l_record_0({
            AllTime = l_T_0(v10), 
            Season = l_T_0(v10), 
            _season = l_T_0(v8)
        })), 
        FactionStandings = l_T_0(l_record_0({
            ["1"] = l_T_0(v10), 
            ["2"] = l_T_0(v10), 
            ["3"] = l_T_0(v10)
        })), 
        HighestFloor = l_T_0(l_record_0({
            AllTime = l_T_0(v11)
        }))
    }
};
local l_map_0 = v12.map;
local l_serdesLookup_0 = v12.serdesLookup;
local l_v5_Worlds_0 = v5:GetWorlds("Story");
local v16 = v1.Keys(l_v5_Worlds_0);
local function v21(v17) --[[ Line: 140 ]] --[[ Name: getDifficultySerdes ]]
    -- upvalues: l_T_0 (copy), v10 (copy), l_record_0 (copy)
    local v18 = {};
    for _, v20 in v17 do
        v18[v20] = l_T_0(v10);
    end;
    return l_T_0(l_record_0(v18));
end;
local v22 = {
    "Normal", 
    "Hard", 
    "Nightmare"
};
local v23 = {
    "Hard", 
    "Nightmare", 
    "Davy Jones"
};
local v24 = {
    "Hard", 
    "Nightmare"
};
local v25 = v21(v22);
local v26 = v21(v23);
local v27 = v21(v24);
local v28 = {
    "Solo", 
    "Duo", 
    "Trio", 
    "Quad"
};
local v29 = nil;
local v30 = {};
for _, v32 in v28 do
    v30[v32] = l_T_0(v10);
end;
v29 = l_record_0(v30);
for _, v34 in v16 do
    local v35 = ("EndlessWaves_%*"):format(v34);
    l_map_0[v35] = {
        A = table.clone(v28), 
        B = table.clone(v28)
    };
    l_serdesLookup_0[v35] = l_T_0(l_record_0({
        A = l_T_0(v29), 
        B = l_T_0(v29)
    }));
end;
l_map_0.FeaturedStoryTime = table.clone(v22);
l_map_0.StoryCompleted.AllTime = table.clone(v22);
l_map_0.StoryCompleted.Season = table.clone(v22);
l_map_0.ChallengesCompleted.AllTime = table.clone(v23);
l_map_0.ChallengesCompleted.Season = table.clone(v23);
l_map_0.RaidsCompleted.AllTime = table.clone(v24);
l_map_0.RaidsCompleted.Season = table.clone(v24);
l_serdesLookup_0.StoryCompleted = l_T_0(l_record_0({
    AllTime = v25, 
    Season = v25, 
    _season = l_T_0(v8)
}));
l_serdesLookup_0.ChallengesCompleted = l_T_0(l_record_0({
    AllTime = v26, 
    Season = v26, 
    _season = l_T_0(v8)
}));
l_serdesLookup_0.RaidsCompleted = l_T_0(l_record_0({
    AllTime = v27, 
    Season = v27, 
    _season = l_T_0(v8)
}));
l_serdesLookup_0.FeaturedStoryTime = v25;
v12.serdes = l_record_0(v12.serdesLookup);
v30 = function(v36, v37, v38) --[[ Line: 201 ]] --[[ Name: generatePaths ]]
    -- upvalues: v30 (copy)
    v38 = v38 or {};
    v37 = v37 or "";
    for v39, v40 in v36 do
        local l_v37_0 = v37;
        local v42 = if typeof(v40) == "string" then v40 else v39;
        l_v37_0 = if v37 ~= "" then v37 .. "." .. v42 else v42;
        if typeof(v40) == "table" then
            if next(v40) == nil then
                table.insert(v38, l_v37_0);
            elseif #v40 > 0 then
                for _, v44 in v40 do
                    table.insert(v38, l_v37_0 .. "." .. v44);
                end;
            else
                v30(v40, l_v37_0, v38);
            end;
        else
            table.insert(v38, l_v37_0);
        end;
    end;
    return v38;
end;
for v45, v46 in l_map_0 do
    local v47 = v30(v46);
    v12.leaderboardPaths[v45] = v47;
    for _, v49 in v47 do
        local v50 = string.split(v49, ".");
        for v51 = #v50, 1, -1 do
            if v50[v51] == "Season" then
                local v52 = v12.leaderboardSeasonPaths[v45];
                if not v52 then
                    v52 = {};
                    v12.leaderboardSeasonPaths[v45] = v52;
                end;
                v52[v49] = true;
                break;
            end;
        end;
    end;
    for _, v54 in (v30(v46, v45)) do
        table.insert(v12.allPaths, v54);
        local v55 = false;
        local v56 = string.split(v54, ".");
        for v57 = #v56, 1, -1 do
            if v56[v57] == "Season" then
                v12.allSeasonPaths[v54] = true;
                v55 = true;
                break;
            end;
        end;
        if v55 then
            v54 = v54 .. (".%*"):format((tostring(v4.SEASON)));
        end;
        table.insert(v12.allPlayerPaths, v54);
    end;
end;
v12.leaderboardSeasonPaths.FactionStandings = {};
for _, v59 in v12.map.FactionStandings do
    v12.allSeasonPaths[("FactionStandings.%*"):format(v59)] = true;
    v12.leaderboardSeasonPaths.FactionStandings[v59] = true;
end;
v12.GetSerdes = function(v60, v61) --[[ Line: 288 ]] --[[ Name: GetSerdes ]]
    return v60.serdesLookup[v61];
end;
return v12;