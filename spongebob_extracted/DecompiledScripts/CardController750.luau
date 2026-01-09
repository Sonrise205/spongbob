local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.CardsData);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local _ = v5.ROGUELIKE;
local v9 = nil;
local v10 = nil;
local v11 = v1.CreateController({
    Name = script.Name, 
    Client = {}
});
v11.KnitInit = function(_) --[[ Line: 37 ]] --[[ Name: KnitInit ]]
    -- upvalues: v9 (ref), v1 (copy), v10 (ref)
    v9 = v1.GetController("DataController");
    v10 = v1.GetService("CardService");
end;
v11.KnitStart = function(_) --[[ Line: 43 ]] --[[ Name: KnitStart ]]

end;
v11.GetModifier = function(_, v15) --[[ Line: 49 ]] --[[ Name: GetModifier ]]
    -- upvalues: v10 (ref), v7 (copy)
    local v16 = v10.Modifiers:Get();
    if not v16 then
        return;
    else
        return v7(v16, v15);
    end;
end;
v11.GetBuffCards = function(_) --[[ Line: 58 ]] --[[ Name: GetBuffCards ]]
    -- upvalues: v10 (ref), v3 (copy), v6 (copy)
    local v18 = v10.BuffCards:Get();
    if not v18 then
        return {};
    else
        return v3.Map(v18, function(v19) --[[ Line: 64 ]]
            -- upvalues: v6 (ref)
            return v6:GetBuffCard(v19);
        end);
    end;
end;
v11.GetCurseCards = function(_) --[[ Line: 69 ]] --[[ Name: GetCurseCards ]]
    -- upvalues: v10 (ref), v3 (copy), v6 (copy)
    local v21 = v10.CurseCards:Get();
    if not v21 then
        return {};
    else
        return v3.Map(v21, function(v22) --[[ Line: 75 ]]
            -- upvalues: v6 (ref)
            return v6:GetCurseCard(v22);
        end);
    end;
end;
v11.GetAllCards = function(v23) --[[ Line: 80 ]] --[[ Name: GetAllCards ]]
    -- upvalues: v3 (copy)
    local l_v23_BuffCards_0 = v23:GetBuffCards();
    local l_v23_CurseCards_0 = v23:GetCurseCards();
    return v3.Extend(l_v23_BuffCards_0, l_v23_CurseCards_0);
end;
v11.GetTowerStatModifier = function(v26, v27, v28) --[[ Line: 87 ]] --[[ Name: GetTowerStatModifier ]]
    local l_v26_AllCards_0 = v26:GetAllCards();
    local v30 = 0;
    if not l_v26_AllCards_0 or #l_v26_AllCards_0 < 1 then
        return 0;
    else
        for _, v32 in l_v26_AllCards_0 do
            if v32.buffs then
                for _, v34 in v32.buffs do
                    if v34.type == "TowerStat" and v34.name == v27 and (not v34.unitTypeInclusion or v28 == v34.unitTypeInclusion) then
                        v30 = v30 + v34.amount;
                    end;
                end;
            end;
            for _, v36 in v32.nerfs do
                if v36.type == "TowerStat" and v36.name == v27 and (not v36.unitTypeExclusion or v28 ~= v36.unitTypeExclusion) then
                    v30 = v30 + v36.amount;
                end;
            end;
        end;
        return v30;
    end;
end;
return v11;