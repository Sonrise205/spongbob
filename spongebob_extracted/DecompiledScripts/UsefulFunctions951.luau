local v0 = {};
local l_Debris_0 = game:GetService("Debris");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Promise);
local v8 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.WeldParts);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedStorage_0.Levels);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v15 = require(l_ReplicatedStorage_0.Conditions);
local v16 = require(l_ReplicatedStorage_0.BossBattleData);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v20 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v21 = require(l_ReplicatedFirst_0.PlaceIds);
local v22 = nil;
local v23 = {
    "K", 
    "M", 
    "B", 
    "T", 
    "Q"
};
local v24 = {
    {
        1000, 
        "M"
    }, 
    {
        900, 
        "CM"
    }, 
    {
        500, 
        "D"
    }, 
    {
        400, 
        "CD"
    }, 
    {
        100, 
        "C"
    }, 
    {
        90, 
        "XC"
    }, 
    {
        50, 
        "L"
    }, 
    {
        40, 
        "XL"
    }, 
    {
        10, 
        "X"
    }, 
    {
        9, 
        "IX"
    }, 
    {
        5, 
        "V"
    }, 
    {
        4, 
        "IV"
    }, 
    {
        1, 
        "I"
    }
};
v0.IntToRoman = function(_, v26) --[[ Line: 61 ]] --[[ Name: IntToRoman ]]
    -- upvalues: v24 (copy)
    local v27 = "";
    for _, v29 in v24 do
        local v30, v31 = table.unpack(v29);
        while v30 <= v26 do
            v27 = v27 .. v31;
            v26 = v26 - v30;
        end;
    end;
    return v27;
end;
v0.CanBuildHere = function(_, v33, v34, v35) --[[ Line: 80 ]] --[[ Name: CanBuildHere ]]
    if v35 and (Vector3.new(0, 1, 0, 0) - v35).Magnitude > 0.5 then
        return false;
    else
        local v36 = RaycastParams.new();
        v36.CollisionGroup = "BuildOffLimits";
        local v37 = v33 + Vector3.new(0, 25, 0, 0);
        return workspace:Spherecast(v37, v34, Vector3.new(-0, -50, -0, -0), v36) == nil;
    end;
end;
v0.Get2DDistance = function(_, v39, v40) --[[ Line: 101 ]] --[[ Name: Get2DDistance ]]
    local v41 = v39.X - v40.X;
    local v42 = v39.Z - v40.Z;
    return (math.sqrt(v41 * v41 + v42 * v42));
end;
v0.SecondsToClock = function(_, v44, v45) --[[ Line: 111 ]] --[[ Name: SecondsToClock ]]
    if v44 <= 0 then
        if v45 then
            return "00:00";
        else
            return "00:00:00";
        end;
    else
        local v46 = string.format("%02.f", v44 // 3600);
        local v47 = string.format("%02.f", (math.floor(v44 / 60 - v46 * 60)));
        local v48 = string.format("%02.f", (math.floor(v44 - v46 * 3600 - v47 * 60)));
        if v45 then
            return v47 .. ":" .. v48;
        else
            return v46 .. ":" .. v47 .. ":" .. v48;
        end;
    end;
end;
v0.RollLoot = function(_, v50, v51, v52) --[[ Line: 128 ]] --[[ Name: RollLoot ]]
    -- upvalues: v22 (ref), l_RunService_0 (copy), l_ServerStorage_0 (copy)
    if not v22 then
        if l_RunService_0:IsServer() then
            v22 = require(l_ServerStorage_0.Knit.Modules.Lootbox).GetServerSeed();
        else
            v22 = Random.new();
        end;
    end;
    local l_v22_0 = v22;
    if v52 and typeof(v52) == "number" then
        l_v22_0 = Random.new(v52);
    end;
    if typeof(next(v50)) == "number" and #v50 < 2 then
        if l_v22_0:NextNumber(0, 100) <= if typeof(v50[1]) == "number" then v50[1] else v50[1].weight then
            return v50[1], 1;
        else
            return nil;
        end;
    else
        local v54 = 0;
        for _, v56 in v50 do
            if typeof(v56) ~= "table" or not v56.ignoreRNG then
                v54 = v54 + if typeof(v56) == "number" then v56 else v56.weight;
            end;
        end;
        if not v51 then
            v54 = math.max(v54, 100);
        end;
        local v57 = l_v22_0:NextNumber(0, v54);
        local v58 = 0;
        for v59, v60 in v50 do
            if typeof(v60) ~= "table" or not v60.ignoreRNG then
                v58 = v58 + if typeof(v60) == "number" then v60 else v60.weight;
                if v57 <= v58 then
                    return v60, v59;
                end;
            end;
        end;
        return;
    end;
end;
v0.IsWorldCompleted = function(_, v62, v63, v64) --[[ Line: 196 ]] --[[ Name: IsWorldCompleted ]]
    -- upvalues: v11 (copy)
    local l_Worlds_0 = v62.Worlds;
    if not l_Worlds_0[v63] then
        return false;
    else
        local l_v11_MaxChapters_0 = v11:GetMaxChapters("Story", v63);
        local v67 = true;
        for v68 = 1, l_v11_MaxChapters_0 do
            local v69 = l_Worlds_0[v63][tostring(v68)];
            if not v69 then
                return false;
            else
                local v70 = false;
                local v71 = v64 == nil and 1 or v64;
                for v72 = v71, #v11.Difficulties - 1 do
                    if v69[tostring(v72)] == true then
                        v70 = true;
                    end;
                end;
                if not v70 then
                    v67 = false;
                end;
            end;
        end;
        return v67;
    end;
end;
v0.IsWorldUnlocked = function(_, _, _, _) --[[ Line: 231 ]] --[[ Name: IsWorldUnlocked ]]
    return true;
end;
v0.IsChapterCompleted = function(_, v78, v79, v80, v81) --[[ Line: 267 ]] --[[ Name: IsChapterCompleted ]]
    -- upvalues: v11 (copy)
    local l_Worlds_1 = v78.Worlds;
    if not l_Worlds_1[v79] then
        return false;
    else
        local v83 = l_Worlds_1[v79][tostring(v80)];
        if not v83 then
            return false;
        else
            local v84 = v81 == nil and 1 or v81;
            for v85 = v84, #v11.Difficulties do
                if v83[tostring(v85)] == true then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v0.GetClearedChapters = function(v86, v87, v88, v89) --[[ Line: 290 ]] --[[ Name: GetClearedChapters ]]
    -- upvalues: v11 (copy)
    local l_v11_MaxChapters_1 = v11:GetMaxChapters("Story", v88);
    if not v87.Worlds[v88] then
        return 0, l_v11_MaxChapters_1;
    else
        local v91 = 0;
        for v92 = 1, l_v11_MaxChapters_1 do
            if v86:IsChapterCompleted(v87, v88, v92, v89) then
                v91 = v91 + 1;
            end;
        end;
        return v91, l_v11_MaxChapters_1;
    end;
end;
v0.IsChapterUnlocked = function(v93, v94, v95, v96, v97) --[[ Line: 309 ]] --[[ Name: IsChapterUnlocked ]]
    if v95 == "ConchStreet" and v96 == 1 then
        return true;
    elseif v96 == 1 then
        return true;
    else
        return v93:IsChapterCompleted(v94, v95, v96 - 1, v97);
    end;
end;
v0.IsDifficultyCompleted = function(_, v99, v100, v101, v102) --[[ Line: 324 ]] --[[ Name: IsDifficultyCompleted ]]
    local l_Worlds_2 = v99.Worlds;
    if not l_Worlds_2[v100] then
        return false;
    else
        local v104 = l_Worlds_2[v100][tostring(v101)];
        if not v104 then
            return false;
        else
            return v104[tostring(v102)];
        end;
    end;
end;
v0.CanPlayNightmare = function(v105, v106, v107, v108) --[[ Line: 338 ]] --[[ Name: CanPlayNightmare ]]
    return v105:IsDifficultyCompleted(v106, v107, v108, 2);
end;
v0.CanPlayDavyJones = function(v109, v110, v111, v112) --[[ Line: 342 ]] --[[ Name: CanPlayDavyJones ]]
    return v109:IsDifficultyCompleted(v110, v111, v112, 3);
end;
v0.SetOriginalEmitterProps = function(_, v114) --[[ Line: 346 ]] --[[ Name: SetOriginalEmitterProps ]]
    local l_v114_Attribute_0 = v114:GetAttribute("OriginalSpeed");
    if not l_v114_Attribute_0 then
        l_v114_Attribute_0 = v114.Speed;
        v114:SetAttribute("OriginalSpeed", l_v114_Attribute_0);
    end;
    local l_v114_Attribute_1 = v114:GetAttribute("OriginalLifetime");
    if not l_v114_Attribute_1 then
        l_v114_Attribute_1 = v114.Lifetime;
        v114:SetAttribute("OriginalLifetime", l_v114_Attribute_1);
    end;
    local l_v114_Attribute_2 = v114:GetAttribute("OriginalAcceleration");
    if not l_v114_Attribute_2 then
        l_v114_Attribute_2 = v114.Acceleration;
        v114:SetAttribute("OriginalAcceleration", l_v114_Attribute_2);
    end;
    local l_v114_Attribute_3 = v114:GetAttribute("OriginalDrag");
    if not l_v114_Attribute_3 then
        l_v114_Attribute_3 = v114.Drag;
        v114:SetAttribute("OriginalDrag", l_v114_Attribute_3);
    end;
    local l_v114_Attribute_4 = v114:GetAttribute("OriginalRate");
    if not l_v114_Attribute_4 then
        l_v114_Attribute_4 = v114.Rate;
        v114:SetAttribute("OriginalRate", l_v114_Attribute_4);
    end;
    return {
        speed = l_v114_Attribute_0, 
        lifetime = l_v114_Attribute_1, 
        acceleration = l_v114_Attribute_2, 
        drag = l_v114_Attribute_3, 
        rate = l_v114_Attribute_4
    };
end;
v0.AdjustEmitterSpeed = function(v120, v121, v122, v123) --[[ Line: 386 ]] --[[ Name: AdjustEmitterSpeed ]]
    v123 = v123 or v120:SetOriginalEmitterProps(v121);
    v121.Lifetime = NumberRange.new(v123.lifetime.Min / v122, v123.lifetime.Max / v122);
    v121.Acceleration = v123.acceleration * v122 * v122;
    v121.Drag = v123.drag * v122;
    v121.Rate = v123.rate * v122;
    v121.Speed = NumberRange.new(v123.speed.Min * v122, v123.speed.Max * v122);
end;
v0.EmitterSpeedFromDistance = function(_, v125, v126, v127) --[[ Line: 404 ]] --[[ Name: EmitterSpeedFromDistance ]]
    -- upvalues: v0 (copy)
    v127 = v127 or 1;
    local v128 = v0:SetOriginalEmitterProps(v125);
    local l_Min_0 = v128.lifetime.Min;
    local l_Max_0 = v128.lifetime.Max;
    local v131 = nil;
    local l_drag_0 = v128.drag;
    local v133 = v126 * v127;
    if l_drag_0 <= 0 then
        v131 = v133 / l_Max_0;
    else
        local v134 = 0.6931471805599453 / l_drag_0;
        v131 = v133 * v134 / (1 - math.exp(-v134 * l_Max_0));
    end;
    local v135 = v131 * (v128.speed.Min / v128.speed.Max);
    local v136 = NumberRange.new(l_Min_0 / v127, l_Max_0 / v127);
    local v137 = NumberRange.new(v135, v131);
    v125.Lifetime = v136;
    v125.Speed = v137;
    return v128;
end;
v0.ScaleEmitterSize = function(_, v139, v140, v141) --[[ Line: 438 ]] --[[ Name: ScaleEmitterSize ]]
    local v142 = {};
    local l_v139_Attribute_0 = v139:GetAttribute("OriginalSize");
    if not l_v139_Attribute_0 then
        l_v139_Attribute_0 = v139.Size;
        v139:SetAttribute("OriginalSize", l_v139_Attribute_0);
    end;
    for _, v145 in l_v139_Attribute_0.Keypoints do
        table.insert(v142, NumberSequenceKeypoint.new(v145.Time, v145.Value * v140, v145.Envelope * v140));
    end;
    v139.Size = NumberSequence.new(v142);
    if not v141 then
        v139.Drag = v139.Drag * (0.5 / v140 * 2);
    end;
end;
v0.AdjustEmitterSpeedFromMultiplier = function(_, v147, v148, v149) --[[ Line: 465 ]] --[[ Name: AdjustEmitterSpeedFromMultiplier ]]
    -- upvalues: v0 (copy)
    local v150 = v0:SetOriginalEmitterProps(v147);
    v150.rate = v150.rate * v148;
    v150.speed = NumberRange.new(v150.speed.Min * v148, v150.speed.Max * v148);
    v0:AdjustEmitterSpeed(v147, v149, v150);
end;
v0.AdjustEmitterSpeedAndScale = function(_, v152, v153, v154) --[[ Line: 477 ]] --[[ Name: AdjustEmitterSpeedAndScale ]]
    -- upvalues: v0 (copy)
    local v155 = v0:SetOriginalEmitterProps(v152);
    v155.rate = v155.rate * v153;
    v155.speed = NumberRange.new(v155.speed.Min * v153, v155.speed.Max * v153);
    v0:AdjustEmitterSpeed(v152, v154, v155);
    v0:ScaleEmitterSize(v152, v153, false);
end;
v0.AdjustEmitter = function(v156, v157, v158, v159) --[[ Line: 490 ]] --[[ Name: AdjustEmitter ]]
    -- upvalues: v0 (copy)
    v159 = v159 or 1;
    local v160 = math.min(v159, 1);
    local v161 = v156:SetOriginalEmitterProps(v157);
    if v157:GetAttribute("AdjustRate") then
        v157.Rate = v161.rate * v159;
    end;
    if v157:GetAttribute("AdjustSpeed") then
        v0:AdjustEmitterSpeedFromMultiplier(v157, v159, v158);
        return;
    elseif v157:GetAttribute("AdjustSize") then
        v0:ScaleEmitterSize(v157, v159);
        v0:AdjustEmitterSpeed(v157, v158, v161);
        return;
    elseif v157:GetAttribute("AdjustSizeMin") then
        v0:ScaleEmitterSize(v157, v160);
        v0:AdjustEmitterSpeed(v157, v158, v161);
        return;
    elseif v157:GetAttribute("AdjustSpeedAndSize") then
        v0:AdjustEmitterSpeedAndScale(v157, v159, v158);
        return;
    elseif v157:GetAttribute("AdjustSpeedAndSizeMin") then
        v0:ScaleEmitterSize(v157, v160);
        v0:AdjustEmitterSpeedFromMultiplier(v157, v159, v158);
        return;
    elseif v157:GetAttribute("FountainSpeed") then
        v161.rate = v161.rate * v159;
        v161.acceleration = v161.acceleration * v159;
        v161.speed = NumberRange.new(v161.speed.Min * v159, v161.speed.Max * v159);
        v0:AdjustEmitterSpeed(v157, v158, v161);
        return;
    elseif v157:GetAttribute("FountainSpeedAndSize") then
        v161.rate = v161.rate * v159;
        v161.acceleration = v161.acceleration * v159;
        v161.speed = NumberRange.new(v161.speed.Min * v159, v161.speed.Max * v159);
        v0:AdjustEmitterSpeed(v157, v158, v161);
        v0:ScaleEmitterSize(v157, v159, true);
        return;
    else
        v0:AdjustEmitterSpeed(v157, v158, v161);
        return;
    end;
end;
v0.GetEmittersMaxLifetime = function(_, v163) --[[ Line: 536 ]] --[[ Name: GetEmittersMaxLifetime ]]
    local v164 = 0;
    for _, v166 in v163 do
        if v164 < v166.Lifetime.Max then
            v164 = v166.Lifetime.Max;
        end;
    end;
    return v164;
end;
v0.ToggleEmitters = function(_, v168, v169, v170) --[[ Line: 548 ]] --[[ Name: ToggleEmitters ]]
    for _, v172 in v168 do
        local l_v172_Attribute_0 = v172:GetAttribute("EmitCount");
        if typeof(l_v172_Attribute_0) == "number" then
            if not v169 then
                v172.Enabled = false;
            else
                v172:Emit(l_v172_Attribute_0);
                if v170 then
                    v172.Enabled = true;
                end;
            end;
        else
            v172.Enabled = v169;
        end;
    end;
end;
v0.JustEmit = function(_, v175) --[[ Line: 571 ]] --[[ Name: JustEmit ]]
    for _, v177 in v175 do
        v177:Emit(v177:GetAttribute("EmitCount") or 1);
    end;
end;
v0.ToggleInstances = function(_, v179, v180) --[[ Line: 577 ]] --[[ Name: ToggleInstances ]]
    for _, v182 in v179 do
        v182.Enabled = v180;
    end;
end;
v0.CalculateArc = function(_, v184, v185, v186, v187) --[[ Line: 583 ]] --[[ Name: CalculateArc ]]
    v187 = v187 or 0.6108652381980153;
    local v188 = v186.X - v185.X;
    local v189 = v186.Z - v185.Z;
    local v190 = math.sqrt(v188 * v188 + v189 * v189);
    local v191 = v186.Y - v185.Y;
    local v192 = v190 / v184 / math.cos(v187);
    local v193 = -((v192 * math.sin(v187) * v184 - v191) * 2) / (v184 * v184);
    return v192, Vector3.new(0, 1, 0, 0) * v193;
end;
v0.ResizePart = function(_, v195, v196) --[[ Line: 609 ]] --[[ Name: ResizePart ]]
    local l_v195_Attribute_0 = v195:GetAttribute("OriginalSize");
    if not l_v195_Attribute_0 then
        l_v195_Attribute_0 = v195.Size;
        v195:SetAttribute("OriginalSize", l_v195_Attribute_0);
    end;
    v195.Size = l_v195_Attribute_0 * Vector3.new(v196, 1, v196);
end;
v0.IterateClass = function(_, v199, v200, v201, v202) --[[ Line: 619 ]] --[[ Name: IterateClass ]]
    local v203 = not v202 and "GetDescendants" or "GetChildren";
    for _, v205 in v199[v203](v199) do
        if v205:IsA(v200) then
            v201(v205);
        end;
    end;
end;
v0.Weld = function(_, v207, v208) --[[ Line: 627 ]] --[[ Name: Weld ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v207;
    l_Weld_0.Part1 = v208;
    l_Weld_0.C0 = v207.CFrame:ToObjectSpace(v208.CFrame);
    l_Weld_0.Parent = v207;
    return l_Weld_0;
end;
v0.ValidateLoadoutNumber = function(_, v211) --[[ Line: 637 ]] --[[ Name: ValidateLoadoutNumber ]]
    v211 = tonumber(v211);
    if not v211 or v211 ~= v211 then
        return;
    else
        v211 = v211 // 1;
        local v212 = false;
        if v211 > 0 then
            v212 = v211 <= 7;
        end;
        return v212;
    end;
end;
v0.GetIconFromRewardData = function(_, v214) --[[ Line: 649 ]] --[[ Name: GetIconFromRewardData ]]
    -- upvalues: v12 (copy)
    local l_v12_ByItemName_0 = v12:GetByItemName(v214.name or v214.type);
    return l_v12_ByItemName_0 and l_v12_ByItemName_0.icon;
end;
v0.SetRewardIcon = function(_, v217, v218) --[[ Line: 654 ]] --[[ Name: SetRewardIcon ]]
    -- upvalues: v12 (copy), v17 (copy)
    if not v217 or not v218 then
        return;
    else
        local v219 = v217.name or v217.Name or v217.type;
        local l_v12_ByItemName_1 = v12:GetByItemName(v219);
        if not l_v12_ByItemName_1 then
            return;
        elseif l_v12_ByItemName_1.icon and typeof(l_v12_ByItemName_1.icon) == "string" then
            v218.Image = l_v12_ByItemName_1.icon;
            v218.ImageRectOffset = Vector2.zero;
            v218.ImageRectSize = Vector2.zero;
            if v218.ScaleType == Enum.ScaleType.Crop then
                v218.ScaleType = Enum.ScaleType.Fit;
            end;
            return;
        elseif l_v12_ByItemName_1.iconSpriteSheet or l_v12_ByItemName_1.icon and typeof(l_v12_ByItemName_1.icon) == "table" and l_v12_ByItemName_1.icon.spriteSheetName then
            local v221 = l_v12_ByItemName_1.iconSpriteSheet or l_v12_ByItemName_1.icon.spriteSheetName;
            v17:SetImage(v218, v219, v221);
            return;
        else
            return;
        end;
    end;
end;
v0.SetIcon = function(_, v223, v224, v225) --[[ Line: 684 ]] --[[ Name: SetIcon ]]
    -- upvalues: v19 (copy), v18 (copy), v12 (copy), v8 (copy), v17 (copy)
    if not v224 or not v223 or not v225 then
        return;
    else
        local l_UIGradient_0 = v223:FindFirstChildOfClass("UIGradient");
        if l_UIGradient_0 then
            l_UIGradient_0:Destroy();
            l_UIGradient_0 = nil;
        end;
        if v225.type == "Unit" then
            v19:SetImage(v223, v224);
            return;
        else
            local v227 = nil;
            v227 = if v225.isRecipe then v18:GetRecipeData(v224) else v12:GetByItemName(v224) or v18:GetRecipeData(v224);
            v227 = v227 and v8.Copy(v227, true);
            if v227 and v227.item then
                v227 = v12:GetByItemName(v227.item.name);
            end;
            if v227 and v227.rngItem then
                v227 = v12:GetByItemName(v227.rngItem[v225.rngIndex or 1].name);
            end;
            if not v227 then
                return;
            elseif v227.icon and typeof(v227.icon) == "string" then
                v223.Image = v227.icon;
                v223.ImageRectOffset = Vector2.zero;
                v223.ImageRectSize = Vector2.zero;
                if v223.ScaleType == Enum.ScaleType.Crop then
                    v223.ScaleType = Enum.ScaleType.Fit;
                end;
                return;
            else
                if v227.iconSpriteSheet or v227.icon and typeof(v227.icon) == "table" and v227.icon.spriteSheetName then
                    local v228 = v227.iconSpriteSheet or v227.icon.spriteSheetName;
                    v17:SetImage(v223, v224, v228);
                end;
                return;
            end;
        end;
    end;
end;
v0.CreateRelicIcon = function(_, v230, v231, v232, v233) --[[ Line: 740 ]] --[[ Name: CreateRelicIcon ]]
    -- upvalues: v17 (copy)
    local l_ImageLabel_0 = v230:FindFirstChildOfClass("ImageLabel");
    if l_ImageLabel_0 and not v233 then
        l_ImageLabel_0:Destroy();
    end;
    local v235 = {
        Size = UDim2.fromScale(0.8, 0.8), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    };
    if v232 then
        for v236, v237 in v232 do
            v235[v236] = v237;
        end;
    end;
    l_ImageLabel_0 = v17:CreateImage(v231, nil, v235);
    l_ImageLabel_0.Parent = v230;
    return l_ImageLabel_0;
end;
v0.CreateRelicIcon = function(_, v239, v240, v241, v242) --[[ Line: 764 ]] --[[ Name: CreateRelicIcon ]]
    -- upvalues: v17 (copy)
    local l_ImageLabel_1 = v239:FindFirstChildOfClass("ImageLabel");
    if l_ImageLabel_1 and not v242 then
        l_ImageLabel_1:Destroy();
    end;
    local v244 = {
        Size = UDim2.fromScale(0.8, 0.8), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    };
    if v241 then
        for v245, v246 in v241 do
            v244[v245] = v246;
        end;
    end;
    l_ImageLabel_1 = v17:CreateImage(v240, nil, v244);
    l_ImageLabel_1.Parent = v239;
    return l_ImageLabel_1;
end;
v0.GetRewardRarity = function(_, v248) --[[ Line: 788 ]] --[[ Name: GetRewardRarity ]]
    -- upvalues: v12 (copy), l_RunService_0 (copy)
    local l_v12_ByItemName_2 = v12:GetByItemName(v248.name or v248.type);
    if l_RunService_0:IsServer() then
        return l_v12_ByItemName_2 and l_v12_ByItemName_2.rarity;
    else
        return l_v12_ByItemName_2 and (l_v12_ByItemName_2.visualRarity or l_v12_ByItemName_2.rarity);
    end;
end;
v0.FormatDecimal = function(_, v251, v252) --[[ Line: 798 ]] --[[ Name: FormatDecimal ]]
    v252 = v252 or 1;
    if v251 // 1 == v251 then
        return (tostring(v251));
    else
        return string.format(("%%.%*f"):format(v252), v251);
    end;
end;
v0.FastTenthRound = function(_, v254) --[[ Line: 808 ]] --[[ Name: FastTenthRound ]]
    return math.floor(v254 * 10 + 0.5) / 10;
end;
v0.GetLevelCost = function(_, v256, v257) --[[ Line: 812 ]] --[[ Name: GetLevelCost ]]
    -- upvalues: v14 (copy)
    return (math.ceil(v14.PLAYER_XP_REQUIREMENTS[math.clamp(v256 - 1, 1, #v14.PLAYER_XP_REQUIREMENTS)] * (v14.PRESTIGE.XP_MULTIPLIERS[v257 or 0] or 1)));
end;
v0.GetPrestigeMasterLevelTier = function(_, v259) --[[ Line: 822 ]] --[[ Name: GetPrestigeMasterLevelTier ]]
    -- upvalues: v14 (copy)
    return (math.floor((v259 - v14.PRESTIGE.FINAL_MAX_LEVEL) / 100));
end;
v0.GetPrestigeIcon = function(_, v261, v262) --[[ Line: 829 ]] --[[ Name: GetPrestigeIcon ]]
    -- upvalues: v13 (copy), v14 (copy)
    v261 = v261 or 0;
    v262 = v262 or 1;
    if v261 < 1 then
        return v13.PRESTIGE.None;
    elseif v14.PRESTIGE.MAX_PRESTIGE <= v261 and v14.PRESTIGE.FINAL_MAX_LEVEL <= v262 then
        return v13.PRESTIGE.Master;
    else
        return v13.PRESTIGE[v261];
    end;
end;
v0.GetAttackTypeIcon = function(_, v264) --[[ Line: 844 ]] --[[ Name: GetAttackTypeIcon ]]
    -- upvalues: v14 (copy)
    return v14.TOWERS.ATTACK_TYPE_ICONS[v264];
end;
v0.GetAttackTypeIconFromIndex = function(_, v266) --[[ Line: 848 ]] --[[ Name: GetAttackTypeIconFromIndex ]]
    -- upvalues: v14 (copy)
    return v14.TOWERS.ATTACK_TYPE_ICONS[v14.TOWERS.ATTACK_TYPES[v266]];
end;
v0.GetEffectIcon = function(_, v268) --[[ Line: 852 ]] --[[ Name: GetEffectIcon ]]
    -- upvalues: v14 (copy)
    return v14.TOWERS.EFFECT_ICONS[v268];
end;
v0.GetEffectDescription = function(_, v270) --[[ Line: 856 ]] --[[ Name: GetEffectDescription ]]
    -- upvalues: v14 (copy)
    return v14.TOWERS.EFFECT_DESCRIPTIONS[v270];
end;
v0.GetEffectColor = function(_, v272) --[[ Line: 860 ]] --[[ Name: GetEffectColor ]]
    -- upvalues: v14 (copy)
    return v14.TOWERS.EFFECT_COLORS[v272];
end;
v0.Color3ToHex = function(_, v274) --[[ Line: 864 ]] --[[ Name: Color3ToHex ]]
    return (("#%*"):format((v274:ToHex())));
end;
v0.FormatTimeFromSeconds = function(_, v276, v277, v278) --[[ Line: 868 ]] --[[ Name: FormatTimeFromSeconds ]]
    local v279 = math.floor(v276 / 86400);
    local v280 = math.floor(v276 % 86400 / 3600);
    local v281 = math.floor(v276 % 3600 / 60);
    local v282 = math.ceil(v276 % 60);
    if not v278 and v279 > 0 then
        if v277 then
            local v283 = v279 > 1 and "Days" or "Day";
            return string.format("%d %s", v279, v283);
        else
            return string.format("%dd %dh %dm %ds", v279, v280, v281, v282);
        end;
    elseif v280 > 0 or v278 and v279 >= 1 then
        if v278 and v279 >= 1 then
            v280 = v280 + v279 * 24;
        end;
        if v277 then
            local v284 = v280 > 1 and "Hours" or "Hour";
            return string.format("%d %s", v280, v284);
        else
            return string.format("%dh %dm %ds", v280, v281, v282);
        end;
    elseif v281 > 0 then
        if v277 then
            local v285 = v281 > 1 and "Minutes" or "Minute";
            return string.format("%d %s", v281, v285);
        else
            return string.format("%dm %ds", v281, v282);
        end;
    elseif v277 then
        local v286 = v282 > 1 and "Seconds" or "Second";
        return string.format("%d %s", v282, v286);
    else
        return string.format("%ds", v282);
    end;
end;
v0.CommaNumber = function(_, v288) --[[ Line: 906 ]] --[[ Name: CommaNumber ]]
    local l_v288_0 = v288;
    local _ = nil;
    repeat
        local v291, v292 = string.gsub(l_v288_0, "^(-?%d+)(%d%d%d)", "%1,%2");
        l_v288_0 = v291;
    until v292 == 0;
    return l_v288_0;
end;
v0.SuffixNumber = function(v293, v294, v295, v296) --[[ Line: 922 ]] --[[ Name: SuffixNumber ]]
    -- upvalues: v23 (copy)
    if v294 == 0 then
        return v294;
    else
        v296 = v296 or 2;
        local v297 = math.floor((math.log(v294, 1000)));
        local v298 = math.pow(10, v297 * 3);
        if v295 and v294 < 100000 then
            return v293:CommaNumber((tonumber(v294)));
        else
            return ("%%.%*f"):format(v296):format(v294 / v298):gsub("%.?0+$", "") .. (v23[v297] or "");
        end;
    end;
end;
v0.IsStringEmpty = function(_, v300) --[[ Line: 938 ]] --[[ Name: IsStringEmpty ]]
    if not v300 then
        return true;
    else
        return string.gsub(v300, "%s", "") == "";
    end;
end;
v0.ClampMagnitude = function(_, v302, v303) --[[ Line: 946 ]] --[[ Name: ClampMagnitude ]]
    local l_Magnitude_0 = v302.Magnitude;
    if l_Magnitude_0 == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v302.Unit * math.min(l_Magnitude_0, v303);
    end;
end;
v0.GetMaxLoadoutSlot = function(_, v306) --[[ Line: 956 ]] --[[ Name: GetMaxLoadoutSlot ]]
    -- upvalues: v14 (copy)
    local v307 = v306 and v306.Level or 1;
    if (v306 and v306.Prestige or 0) >= 1 then
        return #v14.LOADOUT_LEVELS;
    else
        local v308 = 1;
        for v309 = 1, #v14.LOADOUT_LEVELS do
            if v14.LOADOUT_LEVELS[v309] <= v307 then
                v308 = v309;
            end;
        end;
        return v308;
    end;
end;
v0.MeetsLevelRequirement = function(_, v311, v312) --[[ Line: 975 ]] --[[ Name: MeetsLevelRequirement ]]
    local v313 = v311 and v311.Level or 1;
    if (v311 and v311.Prestige or 0) >= 1 then
        return true;
    else
        return v312 <= v313;
    end;
end;
v0.GetConditionData = function(_, v315) --[[ Line: 986 ]] --[[ Name: GetConditionData ]]
    -- upvalues: v14 (copy), v15 (copy)
    return v14.IN_GAME.CONDITIONS[v315], v15[v315];
end;
v0.GetPlacementCondition = function(v316, v317) --[[ Line: 990 ]] --[[ Name: GetPlacementCondition ]]
    if not v317 then
        return;
    else
        for _, v319 in v317 do
            local v320 = select(2, v316:GetConditionData(v319));
            if v320 and v320.placementCondition then
                return v319;
            end;
        end;
        return;
    end;
end;
v0.GetPlacementConditionData = function(v321, v322) --[[ Line: 1007 ]] --[[ Name: GetPlacementConditionData ]]
    local l_v321_PlacementCondition_0 = v321:GetPlacementCondition(v322);
    if not l_v321_PlacementCondition_0 then
        return;
    else
        local l_v321_ConditionData_0, v325 = v321:GetConditionData(l_v321_PlacementCondition_0);
        return l_v321_ConditionData_0, v325, l_v321_PlacementCondition_0;
    end;
end;
v0.FindCondition = function(_, v327, v328) --[[ Line: 1018 ]] --[[ Name: FindCondition ]]
    -- upvalues: v8 (copy)
    return v8.Find(v328, function(v329) --[[ Line: 1019 ]]
        -- upvalues: v327 (copy)
        if typeof(v329) == "string" then
            return v329 == v327;
        else
            return v329.name == v327;
        end;
    end);
end;
v0.Pluralize = function(_, v331, v332, v333) --[[ Line: 1024 ]] --[[ Name: Pluralize ]]
    if v333 then
        if string.sub(v331, -1) == "s" then
            return v331 .. "'";
        else
            return v331 .. "'s";
        end;
    elseif v332 == 1 then
        return v331;
    elseif v332 > 1 then
        if string.sub(v331, -1) ~= "s" then
            return v331 .. "s";
        else
            return v331;
        end;
    else
        return v331;
    end;
end;
v0.PromisifyTween = function(_, v335) --[[ Line: 1049 ]] --[[ Name: PromisifyTween ]]
    -- upvalues: v7 (copy)
    return v7.new(function(v336, v337) --[[ Line: 1050 ]]
        -- upvalues: v335 (copy)
        v335.Completed:Connect(function(v338) --[[ Line: 1051 ]]
            -- upvalues: v336 (copy), v337 (copy)
            if v338 == Enum.PlaybackState.Completed then
                v336();
            end;
            v337();
        end);
        v335:Play();
    end);
end;
v0.Tween = function(_, v340, v341, v342, v343) --[[ Line: 1063 ]] --[[ Name: Tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v344 = l_TweenService_0:Create(v340, v341, v342);
    v344.Completed:Once(function(v345) --[[ Line: 1066 ]]
        -- upvalues: v344 (copy), v343 (copy)
        v344:Destroy();
        if not v343 then
            return;
        else
            if v345 == Enum.PlaybackState.Completed then
                v343();
            end;
            return;
        end;
    end);
    v344:Play();
    return v344;
end;
v0.CreateBeamBetweenInstances = function(_, v347, v348) --[[ Line: 1083 ]] --[[ Name: CreateBeamBetweenInstances ]]
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Name = "BEAM_ORIGIN";
    l_Attachment_0.Parent = v347;
    local l_Attachment_1 = Instance.new("Attachment");
    l_Attachment_1.Name = "BEAM_GOAL";
    l_Attachment_1.Parent = v348;
    local l_Beam_0 = Instance.new("Beam");
    l_Beam_0.Attachment0 = l_Attachment_0;
    l_Beam_0.Attachment1 = l_Attachment_1;
    l_Beam_0.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
    l_Beam_0.TextureMode = Enum.TextureMode.Static;
    l_Beam_0.Transparency = NumberSequence.new(0);
    l_Beam_0.Texture = "rbxassetid://97403375730612";
    l_Beam_0.LightInfluence = 0;
    l_Beam_0.LightEmission = 0;
    l_Beam_0.FaceCamera = true;
    l_Beam_0.TextureSpeed = 2;
    l_Beam_0.CurveSize0 = 0;
    l_Beam_0.CurveSize1 = 0;
    l_Beam_0.Brightness = 2;
    l_Beam_0.Segments = 1;
    l_Beam_0.Width1 = 1;
    l_Beam_0.Width0 = 2;
    l_Beam_0.Parent = l_Attachment_0;
    return function() --[[ Line: 1116 ]]
        -- upvalues: l_Attachment_0 (copy), l_Attachment_1 (copy)
        if l_Attachment_0 then
            l_Attachment_0:Destroy();
        end;
        if l_Attachment_1 then
            l_Attachment_1:Destroy();
        end;
    end;
end;
v0.ConnectAnimationMarkers = function(_, v353, v354) --[[ Line: 1127 ]] --[[ Name: ConnectAnimationMarkers ]]
    for v355, v356 in v354 do
        v353:GetMarkerReachedSignal(v355):Connect(v356);
    end;
end;
v0.CreateBoundingBox = function(_, v358, v359) --[[ Line: 1133 ]] --[[ Name: CreateBoundingBox ]]
    -- upvalues: v9 (copy)
    local l_v358_BoundingBox_0, v361 = v358:GetBoundingBox();
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "BoundingBox";
    l_Part_0.Anchored = true;
    l_Part_0.Transparency = 1;
    l_Part_0.CanCollide = false;
    l_Part_0.CanTouch = false;
    l_Part_0.CanQuery = true;
    l_Part_0.CFrame = l_v358_BoundingBox_0;
    l_Part_0.Size = v361;
    if v359 and v358.PrimaryPart then
        v9(l_Part_0, v358.PrimaryPart);
    end;
    return l_Part_0;
end;
v0.NumberToWord = function(_, v364, v365) --[[ Line: 1153 ]] --[[ Name: NumberToWord ]]
    v365 = v365 or false;
    if v364 == 0 then
        if v365 then
            return "Zero";
        else
            return "zero";
        end;
    else
        local v366 = {
            "", 
            "one", 
            "two", 
            "three", 
            "four", 
            "five", 
            "six", 
            "seven", 
            "eight", 
            "nine", 
            "ten", 
            "eleven", 
            "twelve", 
            "thirteen", 
            "fourteen", 
            "fifteen", 
            "sixteen", 
            "seventeen", 
            "eighteen", 
            "nineteen"
        };
        local v367 = {
            "", 
            "", 
            "twenty", 
            "thirty", 
            "forty", 
            "fifty", 
            "sixty", 
            "seventy", 
            "eighty", 
            "ninety"
        };
        local function v368(v369) --[[ Line: 1169 ]] --[[ Name: convert_less_than_thousand ]]
            -- upvalues: v366 (copy), v367 (copy), v368 (copy)
            if v369 < 20 then
                return v366[v369 + 1];
            elseif v369 < 100 then
                if v369 % 10 == 0 then
                    return v367[math.floor(v369 / 10) + 1];
                else
                    return v367[math.floor(v369 / 10) + 1] .. "-" .. v366[v369 % 10 + 1];
                end;
            else
                local v370 = v366[math.floor(v369 / 100) + 1] .. " hundred";
                if v369 % 100 == 0 then
                    return v370;
                else
                    return v370 .. " " .. v368(v369 % 100);
                end;
            end;
        end;
        local v371 = "";
        if v364 >= 1000000000 then
            if v365 then
                return "Number Too Large";
            else
                return "Number too large";
            end;
        else
            if v364 >= 1000000 then
                v371 = v371 .. v368((math.floor(v364 / 1000000))) .. " million";
                v364 = v364 % 1000000;
                if v364 ~= 0 then
                    v371 = v371 .. " ";
                end;
            end;
            if v364 >= 1000 then
                v371 = v371 .. v368((math.floor(v364 / 1000))) .. " thousand";
                v364 = v364 % 1000;
                if v364 ~= 0 then
                    v371 = v371 .. " ";
                end;
            end;
            if v364 > 0 then
                v371 = v371 .. v368(v364);
            end;
            if v365 then
                v371 = v371:gsub("(%w)([%w'-]*)", function(v372, v373) --[[ Line: 1223 ]]
                    return v372:upper() .. v373;
                end);
            end;
            return v371;
        end;
    end;
end;
v0.ExponentialBackoff = function(_, v375, v376) --[[ Line: 1232 ]] --[[ Name: ExponentialBackoff ]]
    -- upvalues: v14 (copy), v7 (copy)
    v376 = v376 or {};
    local l_EXPONENTIAL_BACKOFF_0 = v14.EXPONENTIAL_BACKOFF;
    local v378 = v376.maxRetries or l_EXPONENTIAL_BACKOFF_0.DEFAULT_MAX_RETRIES;
    local v379 = v376.baseDelay or l_EXPONENTIAL_BACKOFF_0.DEFAULT_BASE_DELAY;
    local v380 = v376.maxDelay or l_EXPONENTIAL_BACKOFF_0.DEFAULT_MAX_DELAY;
    local v381 = v376.jitter or l_EXPONENTIAL_BACKOFF_0.DEFAULT_JITTER;
    local v382 = v378 == -1;
    return v7.new(function(v383, v384) --[[ Line: 1253 ]]
        -- upvalues: v7 (ref), v375 (copy), v376 (ref), v382 (copy), v378 (copy), v379 (copy), v380 (copy), v381 (copy)
        local v385 = 0;
        local v386 = Random.new();
        local function v387() --[[ Line: 1257 ]] --[[ Name: attemptRequest ]]
            -- upvalues: v385 (ref), v7 (ref), v375 (ref), v376 (ref), v383 (copy), v382 (ref), v378 (ref), v379 (ref), v380 (ref), v381 (ref), v386 (copy), v387 (copy), v384 (copy)
            v385 = v385 + 1;
            local v388 = {
                v7.try(v375):await()
            };
            local v389 = v388[1];
            table.remove(v388, 1);
            if v389 then
                if v376.returnTuple then
                    v383(table.unpack(v388));
                    return;
                else
                    v383(v388[1]);
                    return;
                end;
            elseif v382 or v385 < v378 then
                local v390 = math.min(v379 * 2 ^ (v385 - 1), v380);
                if v381.Max > 0 and v385 > 1 then
                    local v391 = v385 / v378;
                    local v392 = math.min(v381.Min, v381.Min * v391);
                    local v393 = math.min(v381.Max, v381.Max * v391);
                    v390 = v390 + v386:NextNumber(v392, v393);
                end;
                task.wait(v390);
                v387();
                return;
            else
                v384((("Max retries exceeded: %*"):format((tostring(result)))));
                return;
            end;
        end;
        v387();
    end);
end;
v0.SpawnWhileDo = function(_, v395, v396, v397) --[[ Line: 1301 ]] --[[ Name: SpawnWhileDo ]]
    if not v397 then
        v397 = function() --[[ Line: 1307 ]]
            return true;
        end;
    end;
    if not v397() then
        return;
    else
        local v398 = nil;
        v398 = task.spawn(function() --[[ Line: 1317 ]]
            -- upvalues: v397 (ref), v395 (copy), v398 (ref), v396 (copy)
            while true do
                if v397() then
                    if v395() then
                        v398 = nil;
                        return;
                    elseif v396 then
                        task.wait(v396);
                    end;
                else
                    return;
                end;
            end;
        end);
        return function() --[[ Line: 1331 ]]
            -- upvalues: v398 (ref)
            task.cancel(v398);
        end;
    end;
end;
v0.Lerp = function(_, v400, v401, v402) --[[ Line: 1336 ]] --[[ Name: Lerp ]]
    return v400 + (v401 - v400) * v402;
end;
v0.RemoveSpaces = function(_, v404) --[[ Line: 1340 ]] --[[ Name: RemoveSpaces ]]
    return string.gsub(v404, " ", "");
end;
v0.IsBossUnlocked = function(v405, v406, v407) --[[ Line: 1345 ]] --[[ Name: IsBossUnlocked ]]
    -- upvalues: v16 (copy), v8 (copy)
    if v407 == 1 then
        return true;
    elseif not v406 then
        return false;
    else
        local v408 = v407 - 1;
        local l_v16_BossFromIndex_0 = v16:GetBossFromIndex(v408);
        if not l_v16_BossFromIndex_0 or not l_v16_BossFromIndex_0.Tiers then
            return false;
        else
            return v405:IsTierCompleted(v406, v408, #v8.Keys(l_v16_BossFromIndex_0.Tiers)) or false;
        end;
    end;
end;
v0.IsTierCompleted = function(_, v411, v412, v413) --[[ Line: 1370 ]] --[[ Name: IsTierCompleted ]]
    -- upvalues: v16 (copy)
    local l_v16_BossFromIndex_1 = v16:GetBossFromIndex(v412);
    if not l_v16_BossFromIndex_1 or not l_v16_BossFromIndex_1.Name then
        return false;
    else
        local v415 = v411[l_v16_BossFromIndex_1.Name];
        if not v415 then
            return false;
        else
            local v416 = v415[tostring(v413)];
            return v416 and v416.TotalClears > 0 or false;
        end;
    end;
end;
v0.IsTierUnlocked = function(v417, v418, v419, v420) --[[ Line: 1388 ]] --[[ Name: IsTierUnlocked ]]
    if v419 == 1 and v420 == 1 then
        return true;
    elseif v420 == 1 then
        return true;
    else
        return v417:IsTierCompleted(v418, v419, v420 - 1);
    end;
end;
v0.GetNextBossAndTier = function(v421, v422, v423, v424) --[[ Line: 1402 ]] --[[ Name: GetNextBossAndTier ]]
    -- upvalues: v16 (copy), v8 (copy)
    if not v422 or not v423 then
        return;
    else
        local v425 = v423 + (v424 and 0 or 1);
        local l_v16_BossFromIndex_2 = v16:GetBossFromIndex(v422);
        local v427 = l_v16_BossFromIndex_2 and l_v16_BossFromIndex_2.Tiers;
        if not l_v16_BossFromIndex_2 or not v427 then
            return;
        elseif v425 <= #v8.Keys(v427) then
            return v422, v425, v427[v425];
        else
            return v421:GetNextBossAndTier(v422 + 1, 1, true);
        end;
    end;
end;
v0.Highlight = function(_, v429, v430) --[[ Line: 1444 ]] --[[ Name: Highlight ]]
    -- upvalues: v0 (copy)
    local v431 = "#ebff33";
    if v430 then
        v431 = v0:Color3ToHex(v430);
    end;
    return (("<font color=\"%*\">%*</font>"):format(v431, v429));
end;
v0.GetTotalPets = function(_, v433) --[[ Line: 1453 ]] --[[ Name: GetTotalPets ]]
    -- upvalues: v8 (copy)
    local v434 = 0;
    for _, v436 in v433 do
        v434 = v434 + #v8.Keys(v436);
    end;
    return v434;
end;
v0.CreateDebugPart = function(_, v438) --[[ Line: 1463 ]] --[[ Name: CreateDebugPart ]]
    -- upvalues: l_Debris_0 (copy)
    v438 = v438 or {};
    if v438.RemoveDelay == nil then
        v438.RemoveDelay = 5;
    end;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Color = Color3.new(1, 0, 0);
    l_Part_1.Transparency = 0.6;
    l_Part_1.CastShadow = false;
    l_Part_1.CanCollide = false;
    l_Part_1.CanQuery = false;
    l_Part_1.CanTouch = false;
    l_Part_1.EnableFluidForces = false;
    l_Part_1.Name = "DebugPart";
    l_Part_1.Anchored = true;
    l_Part_1.Parent = v438.Parent or workspace;
    if v438.RemoveDelay then
        l_Debris_0:AddItem(l_Part_1, v438.RemoveDelay);
        v438.RemoveDelay = nil;
    end;
    for v440, v441 in v438 do
        pcall(function() --[[ Line: 1488 ]]
            -- upvalues: l_Part_1 (copy), v440 (copy), v441 (copy)
            l_Part_1[v440] = v441;
        end);
    end;
    return l_Part_1;
end;
v0.VerifyTowerOfKarateReleased = function(_) --[[ Line: 1496 ]] --[[ Name: VerifyTowerOfKarateReleased ]]
    -- upvalues: v21 (copy), v20 (copy)
    if not v21:IsReleaseBranch() then
        return true, 0;
    else
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        if l_workspace_ServerTimeNow_0 < v20.TOK_RELEASE_TIME then
            return false, v20.TOK_RELEASE_TIME - l_workspace_ServerTimeNow_0;
        else
            return true, 0;
        end;
    end;
end;
v0.ValidateString = function(_, v445, v446) --[[ Line: 1510 ]] --[[ Name: ValidateString ]]
    if typeof(v445) ~= "string" then
        return false;
    else
        local v447 = utf8.len(v445);
        if v447 == nil then
            return false;
        elseif v446 and v446 < v447 then
            return false;
        else
            return true;
        end;
    end;
end;
return v0;