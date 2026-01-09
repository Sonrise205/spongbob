local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v51 = {
    Stages = {}, 
    Difficulties = {
        [1] = "Normal", 
        [2] = "Hard", 
        [3] = "Nightmare", 
        [4] = "Davy Jones"
    }, 
    GetWorlds = function(v3, v4) --[[ Line: 18 ]] --[[ Name: GetWorlds ]]
        return v3.Stages[v4];
    end, 
    GetWorldData = function(v5, v6, v7) --[[ Line: 22 ]] --[[ Name: GetWorldData ]]
        local l_v5_Worlds_0 = v5:GetWorlds(v6);
        if not l_v5_Worlds_0 then
            return;
        else
            return l_v5_Worlds_0[v7];
        end;
    end, 
    GetWorldImageData = function(v9, v10, v11) --[[ Line: 31 ]] --[[ Name: GetWorldImageData ]]
        local l_v9_WorldData_0 = v9:GetWorldData(v10, v11);
        return l_v9_WorldData_0 and l_v9_WorldData_0.WorldImage;
    end, 
    GetWorldDataByWorldOrder = function(v13, v14, v15) --[[ Line: 36 ]] --[[ Name: GetWorldDataByWorldOrder ]]
        local l_v13_Worlds_0 = v13:GetWorlds(v14);
        if not l_v13_Worlds_0 then
            return;
        else
            for _, v18 in l_v13_Worlds_0 do
                if v18.WorldOrder == v15 then
                    return v18;
                end;
            end;
            return;
        end;
    end, 
    GetChapters = function(v19, v20, v21) --[[ Line: 49 ]] --[[ Name: GetChapters ]]
        local l_v19_WorldData_0 = v19:GetWorldData(v20, v21);
        if not l_v19_WorldData_0 then
            return;
        else
            return l_v19_WorldData_0.Chapters;
        end;
    end, 
    GetChapterData = function(v23, v24, v25, v26) --[[ Line: 58 ]] --[[ Name: GetChapterData ]]
        local l_v23_WorldData_0 = v23:GetWorldData(v24, v25);
        if not l_v23_WorldData_0 then
            return;
        else
            return l_v23_WorldData_0.Chapters[v26];
        end;
    end, 
    GetMaxChapters = function(v28, v29, v30) --[[ Line: 67 ]] --[[ Name: GetMaxChapters ]]
        local l_v28_WorldData_0 = v28:GetWorldData(v29, v30);
        if not l_v28_WorldData_0 then
            return 0;
        else
            return #l_v28_WorldData_0.Chapters;
        end;
    end, 
    GetDifficulties = function(v32) --[[ Line: 76 ]] --[[ Name: GetDifficulties ]]
        return v32.Difficulties;
    end, 
    GetRewards = function(v33, v34, v35, v36, v37, ...) --[[ Line: 81 ]] --[[ Name: GetRewards ]]
        local v38 = v33.Difficulties[v37];
        local l_v33_ChapterData_0 = v33:GetChapterData(v34, v35, v36);
        if not l_v33_ChapterData_0 or not v38 then
            return;
        elseif not l_v33_ChapterData_0.Rewards then
            return;
        elseif v34 == "Endless" then
            local v40 = ...;
            local v41 = {};
            if not v40 then
                for _, v43 in l_v33_ChapterData_0.Rewards do
                    for _, v45 in v43 do
                        table.insert(v41, table.clone(v45));
                    end;
                end;
                return v41;
            else
                for v46, v47 in l_v33_ChapterData_0.Rewards do
                    if v40 % v46 == 0 then
                        for _, v49 in v47 do
                            table.insert(v41, table.clone(v49));
                        end;
                    end;
                end;
                return v41;
            end;
        else
            local v50 = l_v33_ChapterData_0.LootRewards and l_v33_ChapterData_0.LootRewards[v38] and table.clone(l_v33_ChapterData_0.LootRewards[v38]);
            return table.clone(l_v33_ChapterData_0.Rewards[v38]), v50;
        end;
    end
};
local function _(v52, v53, v54) --[[ Line: 127 ]] --[[ Name: cacheStageConfig ]]
    -- upvalues: v51 (copy)
    v51.Stages[v52][v53] = v54;
end;
local v56 = {
    Story = {
        Normal = 5, 
        Hard = 7, 
        Nightmare = 9, 
        ["Davy Jones"] = 12
    }, 
    Raid = {
        Hard = 25, 
        Nightmare = 35, 
        ["Davy Jones"] = 50
    }
};
local function v69(v57, v58, v59) --[[ Line: 146 ]] --[[ Name: loadChapter ]]
    -- upvalues: v1 (copy), v2 (copy), v56 (copy)
    local v60 = tonumber(string.match(v59.Name, "%d+"));
    if not v60 then
        return;
    else
        local v61 = require(v59);
        v58.Chapters[v60] = v61;
        if v57 == "Endless" or v57 == "Challenge" then
            return;
        elseif not v61.Rewards then
            return;
        else
            for v62, v63 in v61.Rewards do
                if not v1.Find(v63, function(v64) --[[ Line: 165 ]]
                    return v64.type == "SeasonXP";
                end) then
                    local v65 = v2.PLAYER_SEASON_XP_REWARDS[v57];
                    local v66 = v65 and v65[v62];
                    if v66 then
                        table.insert(v63, {
                            type = "SeasonXP", 
                            name = "SeasonXP", 
                            amount = v66
                        });
                    end;
                end;
                if v56[v57] and v56[v57][v62] then
                    table.insert(v63, 1, {
                        type = "Currency", 
                        name = "Swashbucks", 
                        amount = v56[v57][v62]
                    });
                end;
                local v67 = v2.CHAPTER_COINS_REWARDS[v57];
                if v67 then
                    local v68 = v67[v62];
                    if v68 then
                        table.insert(v63, {
                            type = "Currency", 
                            name = "Coins", 
                            amount = v68
                        });
                    end;
                end;
            end;
            return;
        end;
    end;
end;
for _, v71 in script:GetChildren() do
    local l_Name_0 = v71.Name;
    v51.Stages[l_Name_0] = {};
    for _, v74 in v71:GetChildren() do
        if v74:IsA("ModuleScript") then
            local v75 = require(v74);
            local l_Name_1 = v74.Name;
            v51.Stages[l_Name_0][l_Name_1] = v75;
            for _, v78 in v74:GetChildren() do
                if v78:IsA("ModuleScript") then
                    v69(l_Name_0, v75, v78);
                end;
            end;
        end;
    end;
end;
for _, v80 in script.Endless:GetChildren() do
    local v81 = table.clone(v51.Stages.Story[v80.Name]);
    v81.Chapters = {};
    local l_Name_2 = v80.Name;
    v51.Stages.Endless[l_Name_2] = v81;
    for _, v84 in v80:GetChildren() do
        if v84:IsA("ModuleScript") then
            v69("Endless", v81, v84);
        end;
    end;
end;
for _, v86 in v51:GetWorlds("Challenge") do
    local v87 = v86.Chapters[1];
    local l_Rewards_0 = v87.Rewards;
    if not l_Rewards_0 then
        local v89 = v1.Copy(v2.CHALLENGES.REWARDS, true);
        if v86.WorldName == "GooLagoon" then
            local v90 = {
                Hard = 30, 
                Nightmare = 40, 
                ["Davy Jones"] = 50
            };
            local v91 = {
                Hard = 1, 
                Nightmare = 2, 
                ["Davy Jones"] = 3
            };
            for v92, _ in v89 do
                local v96 = v1.Find(v89[v92], function(v94) --[[ Line: 288 ]]
                    local v95 = false;
                    if v94.type == "Currency" then
                        v95 = v94.name == "SandDollar";
                    end;
                    return v95;
                end);
                if v96 then
                    v96.amount = v90[v92] or v96.amount;
                end;
                table.insert(v89[v92], {
                    type = "Inventory", 
                    name = "SuperGoo", 
                    amount = 1
                });
                local v97 = v91[v92];
                table.insert(v89[v92], {
                    type = "Inventory", 
                    name = "IceCreamCone", 
                    amount = v97
                });
            end;
        end;
        v87.Rewards = v89;
    else
        for v98 in v2.DIFFICULTY_INDEX do
            local v99 = l_Rewards_0[v98] or {};
            l_Rewards_0[v98] = v1.Extend(v99, v2.CHALLENGES.REWARDS[v98]);
        end;
    end;
end;
return v51;