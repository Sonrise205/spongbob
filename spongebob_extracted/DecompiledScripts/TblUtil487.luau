local v0 = {};
local l_HttpService_0 = game:GetService("HttpService");
local v2 = Random.new();
local function v10(v3, v4) --[[ Line: 35 ]] --[[ Name: Copy ]]
    if not v4 then
        return (table.clone(v3));
    else
        local function v5(v6) --[[ Line: 39 ]] --[[ Name: DeepCopy ]]
            -- upvalues: v5 (copy)
            local v7 = table.clone(v6);
            for v8, v9 in v7 do
                if type(v9) == "table" then
                    v7[v8] = v5(v9);
                end;
            end;
            return v7;
        end;
        return (v5(v3));
    end;
end;
local function v11(v12, v13) --[[ Line: 79 ]] --[[ Name: Sync ]]
    -- upvalues: v11 (copy)
    assert(type(v12) == "table", "First argument must be a table");
    assert(type(v13) == "table", "Second argument must be a table");
    local v14 = table.clone(v12);
    for v15, v16 in pairs(v14) do
        local v17 = v13[v15];
        if v17 == nil then
            v14[v15] = nil;
        elseif type(v16) ~= type(v17) then
            if type(v17) == "table" then
                local function v18(v19) --[[ Line: 39 ]] --[[ Name: DeepCopy ]]
                    -- upvalues: v18 (copy)
                    local v20 = table.clone(v19);
                    for v21, v22 in v20 do
                        if type(v22) == "table" then
                            v20[v21] = v18(v22);
                        end;
                    end;
                    return v20;
                end;
                v14[v15] = v18(v17);
            else
                v14[v15] = v17;
            end;
        elseif type(v16) == "table" then
            v14[v15] = v11(v16, v17);
        end;
    end;
    for v23, v24 in pairs(v13) do
        if v14[v23] == nil then
            if type(v24) == "table" then
                local function v25(v26) --[[ Line: 39 ]] --[[ Name: DeepCopy ]]
                    -- upvalues: v25 (copy)
                    local v27 = table.clone(v26);
                    for v28, v29 in v27 do
                        if type(v29) == "table" then
                            v27[v28] = v25(v29);
                        end;
                    end;
                    return v27;
                end;
                v14[v23] = v25(v24);
            else
                v14[v23] = v24;
            end;
        end;
    end;
    return v14;
end;
local function v30(v31, v32) --[[ Line: 151 ]] --[[ Name: Reconcile ]]
    -- upvalues: v30 (copy)
    assert(type(v31) == "table", "First argument must be a table");
    assert(type(v32) == "table", "Second argument must be a table");
    local v33 = table.clone(v31);
    for v34, v35 in v32 do
        local v36 = v31[v34];
        if v36 == nil then
            if type(v35) == "table" then
                local function v37(v38) --[[ Line: 39 ]] --[[ Name: DeepCopy ]]
                    -- upvalues: v37 (copy)
                    local v39 = table.clone(v38);
                    for v40, v41 in v39 do
                        if type(v41) == "table" then
                            v39[v40] = v37(v41);
                        end;
                    end;
                    return v39;
                end;
                v33[v34] = v37(v35);
            else
                v33[v34] = v35;
            end;
        elseif type(v36) == "table" then
            if type(v35) == "table" then
                v33[v34] = v30(v36, v35);
            else
                local function v42(v43) --[[ Line: 39 ]] --[[ Name: DeepCopy ]]
                    -- upvalues: v42 (copy)
                    local v44 = table.clone(v43);
                    for v45, v46 in v44 do
                        if type(v46) == "table" then
                            v44[v45] = v42(v46);
                        end;
                    end;
                    return v44;
                end;
                v33[v34] = v42(v36);
            end;
        end;
    end;
    return v33;
end;
local function v50(v47, v48) --[[ Line: 204 ]] --[[ Name: SwapRemove ]]
    local v49 = #v47;
    v47[v48] = v47[v49];
    v47[v49] = nil;
end;
local function v55(v51, v52) --[[ Line: 229 ]] --[[ Name: SwapRemoveFirstValue ]]
    local v53 = table.find(v51, v52);
    if v53 then
        local v54 = #v51;
        v51[v53] = v51[v54];
        v51[v54] = nil;
    end;
    return v53;
end;
local function v61(v56, v57) --[[ Line: 257 ]] --[[ Name: Map ]]
    assert(type(v56) == "table", "First argument must be a table");
    assert(type(v57) == "function", "Second argument must be a function");
    local v58 = table.create(#v56);
    for v59, v60 in v56 do
        v58[v59] = v57(v60, v59, v56);
    end;
    return v58;
end;
local function v70(v62, v63) --[[ Line: 287 ]] --[[ Name: Filter ]]
    assert(type(v62) == "table", "First argument must be a table");
    assert(type(v63) == "function", "Second argument must be a function");
    local v64 = table.create(#v62);
    if #v62 > 0 then
        local v65 = 0;
        for v66, v67 in v62 do
            if v63(v67, v66, v62) then
                v65 = v65 + 1;
                v64[v65] = v67;
            end;
        end;
        return v64;
    else
        for v68, v69 in v62 do
            if v63(v69, v68, v62) then
                v64[v68] = v69;
            end;
        end;
        return v64;
    end;
end;
local function v80(v71, v72, v73) --[[ Line: 330 ]] --[[ Name: Reduce ]]
    assert(type(v71) == "table", "First argument must be a table");
    assert(type(v72) == "function", "Second argument must be a function");
    local l_v73_0 = v73;
    if #v71 > 0 then
        local v75 = 1;
        if v73 == nil then
            l_v73_0 = v71[1];
            v75 = 2;
        end;
        for v76 = v75, #v71 do
            l_v73_0 = v72(l_v73_0, v71[v76], v76, v71);
        end;
        return l_v73_0;
    else
        local v77 = nil;
        if v73 == nil then
            l_v73_0 = next(v71);
            v77 = l_v73_0;
        end;
        for v78, v79 in next, v71, v77 do
            l_v73_0 = v72(l_v73_0, v79, v78, v71);
        end;
        return l_v73_0;
    end;
end;
local function v87(v81, ...) --[[ Line: 373 ]] --[[ Name: Assign ]]
    local v82 = table.clone(v81);
    for _, v84 in {
        ...
    } do
        for v85, v86 in v84 do
            v82[v85] = v86;
        end;
    end;
    return v82;
end;
local function v93(v88, v89) --[[ Line: 402 ]] --[[ Name: Extend ]]
    local v90 = table.clone(v88);
    for _, v92 in v89 do
        table.insert(v90, v92);
    end;
    return v90;
end;
local function v98(v94) --[[ Line: 427 ]] --[[ Name: Reverse ]]
    local v95 = #v94;
    local v96 = table.create(v95);
    for v97 = 1, v95 do
        v96[v97] = v94[v95 - v97 + 1];
    end;
    return v96;
end;
local function v107(v99, v100) --[[ Line: 454 ]] --[[ Name: Shuffle ]]
    -- upvalues: v2 (copy)
    assert(type(v99) == "table", "First argument must be a table");
    local v101 = table.clone(v99);
    local v102 = if typeof(v100) == "Random" then v100 else v2;
    for v103 = #v99, 2, -1 do
        local v104 = v102:NextInteger(1, v103);
        local v105 = v101[v104];
        local v106 = v101[v103];
        v101[v103] = v105;
        v101[v104] = v106;
    end;
    return v101;
end;
local function v119(v108, v109, v110) --[[ Line: 484 ]] --[[ Name: Sample ]]
    -- upvalues: v2 (copy)
    assert(type(v108) == "table", "First argument must be a table");
    assert(type(v109) == "number", "Second argument must be a number");
    local v111 = table.clone(v108);
    local v112 = table.create(v109);
    local v113 = if typeof(v110) == "Random" then v110 else v2;
    local v114 = #v108;
    v109 = math.clamp(v109, 1, v114);
    for v115 = 1, v109 do
        local v116 = v113:NextInteger(v115, v114);
        local v117 = v111[v116];
        local v118 = v111[v115];
        v111[v115] = v117;
        v111[v116] = v118;
    end;
    table.move(v111, 1, v109, 1, v112);
    return v112;
end;
local function v129(v120, v121) --[[ Line: 521 ]] --[[ Name: Flat ]]
    local v122 = if type(v121) == "number" then v121 else 1;
    local v123 = table.create(#v120);
    local function v124(v125, v126) --[[ Line: 524 ]] --[[ Name: Scan ]]
        -- upvalues: v122 (copy), v124 (copy), v123 (copy)
        for _, v128 in v125 do
            if type(v128) == "table" and v126 < v122 then
                v124(v128, v126 + 1);
            else
                table.insert(v123, v128);
            end;
        end;
    end;
    v124(v120, 0);
    return v123;
end;
local function v140(v130, v131) --[[ Line: 558 ]] --[[ Name: FlatMap ]]
    -- upvalues: v61 (copy)
    local v132 = v61(v130, v131);
    local v133 = table.create(#v132);
    local v134 = 1;
    local function v135(v136, v137) --[[ Line: 524 ]] --[[ Name: Scan ]]
        -- upvalues: v134 (copy), v135 (copy), v133 (copy)
        for _, v139 in v136 do
            if type(v139) == "table" and v137 < v134 then
                v135(v139, v137 + 1);
            else
                table.insert(v133, v139);
            end;
        end;
    end;
    v135(v132, 0);
    return v133;
end;
local function v144(v141) --[[ Line: 584 ]] --[[ Name: Keys ]]
    local v142 = table.create(#v141);
    for v143 in v141 do
        table.insert(v142, v143);
    end;
    return v142;
end;
local function v149(v145) --[[ Line: 614 ]] --[[ Name: Values ]]
    local v146 = table.create(#v145);
    for _, v148 in v145 do
        table.insert(v146, v148);
    end;
    return v146;
end;
local function v154(v150, v151) --[[ Line: 653 ]] --[[ Name: Find ]]
    for v152, v153 in v150 do
        if v151(v153, v152, v150) then
            return v153, v152;
        end;
    end;
    return nil, nil;
end;
local function v159(v155, v156) --[[ Line: 682 ]] --[[ Name: Every ]]
    for v157, v158 in v155 do
        if not v156(v158, v157, v155) then
            return false;
        end;
    end;
    return true;
end;
local function v164(v160, v161) --[[ Line: 711 ]] --[[ Name: Some ]]
    for v162, v163 in v160 do
        if v161(v163, v162, v160) then
            return true;
        end;
    end;
    return false;
end;
local function v168(v165, v166) --[[ Line: 737 ]] --[[ Name: Truncate ]]
    local v167 = #v165;
    v166 = math.clamp(v166, 1, v167);
    if v166 == v167 then
        return (table.clone(v165));
    else
        return (table.move(v165, 1, v166, 1, table.create(v166)));
    end;
end;
local function v184(...) --[[ Line: 770 ]] --[[ Name: Zip ]]
    assert(select("#", ...) > 0, "Must supply at least 1 table");
    local function v175(v169, v170) --[[ Line: 772 ]] --[[ Name: ZipIteratorArray ]]
        v170 = v170 + 1;
        local v171 = {};
        for v172, v173 in v169 do
            local v174 = v173[v170];
            if v174 ~= nil then
                v171[v172] = v174;
            else
                return nil, nil;
            end;
        end;
        return v170, v171;
    end;
    local function v182(v176, v177) --[[ Line: 785 ]] --[[ Name: ZipIteratorMap ]]
        local v178 = {};
        for v179, v180 in v176 do
            local v181 = next(v180, v177);
            if v181 ~= nil then
                v178[v179] = v181;
            else
                return nil, nil;
            end;
        end;
        return v177, v178;
    end;
    local v183 = {
        ...
    };
    if #v183[1] > 0 then
        return v175, v183, 0;
    else
        return v182, v183, nil;
    end;
end;
local function v190(v185) --[[ Line: 823 ]] --[[ Name: Lock ]]
    local function v186(v187) --[[ Line: 824 ]] --[[ Name: Freeze ]]
        -- upvalues: v186 (copy)
        for v188, v189 in pairs(v187) do
            if type(v189) == "table" then
                v187[v188] = v186(v189);
            end;
        end;
        return table.freeze(v187);
    end;
    return v186(v185);
end;
local function v192(v191) --[[ Line: 853 ]] --[[ Name: IsEmpty ]]
    return next(v191) == nil;
end;
local function v194(v193) --[[ Line: 865 ]] --[[ Name: EncodeJSON ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONEncode(v193);
end;
local function v196(v195) --[[ Line: 877 ]] --[[ Name: DecodeJSON ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONDecode(v195);
end;
v0.Copy = v10;
v0.Sync = v11;
v0.Reconcile = v30;
v0.SwapRemove = v50;
v0.SwapRemoveFirstValue = v55;
v0.Map = v61;
v0.Filter = v70;
v0.Reduce = v80;
v0.Assign = v87;
v0.Extend = v93;
v0.Reverse = v98;
v0.Shuffle = v107;
v0.Sample = v119;
v0.Flat = v129;
v0.FlatMap = v140;
v0.Keys = v144;
v0.Values = v149;
v0.Find = v154;
v0.Every = v159;
v0.Some = v164;
v0.Truncate = v168;
v0.Zip = v184;
v0.Lock = v190;
v0.IsEmpty = v192;
v0.EncodeJSON = v194;
v0.DecodeJSON = v196;
v0.ShallowReconcile = function(v197, v198) --[[ Line: 930 ]] --[[ Name: ShallowReconcile ]]
    assert(type(v197) == "table", "First argument must be a table");
    assert(type(v198) == "table", "Second argument must be a table");
    local v199 = table.clone(v197);
    for v200, v201 in v198 do
        if v197[v200] == nil then
            v199[v200] = v201;
        end;
    end;
    return v199;
end;
v0.ToDict = function(v202, v203) --[[ Line: 967 ]] --[[ Name: ToDict ]]
    local v204 = {};
    for v205, v206 in ipairs(v202) do
        local v207, v208 = v203(v206, v205);
        v204[v207] = v208;
    end;
    return v204;
end;
v0.Weak = function(v209, v210) --[[ Line: 983 ]] --[[ Name: Weak ]]
    assert(not v210 or v210 == "k" or v210 == "v" or v210 == "kv", "Invalid mode");
    assert(not v209 or typeof(v209) == "table" and not getmetatable(v209), "Invalid table");
    return (setmetatable(v209 or {}, {
        __mode = v210 or "k"
    }));
end;
v0.GreedyMesh2D = function(v211, v212) --[[ Line: 1018 ]] --[[ Name: GreedyMesh2D ]]
    local v213 = #v211;
    local v214 = #v211[1];
    local v215 = table.create(v213);
    local v216 = {};
    local v220 = v212 or function(v217, _, _) --[[ Line: 1024 ]]
        return not not v217;
    end;
    for v221 = 1, v213 do
        v215[v221] = table.create(v214, false);
    end;
    local function v229(v222, v223) --[[ Line: 1034 ]] --[[ Name: findMaxRectangle ]]
        -- upvalues: v214 (copy), v211 (copy), v215 (copy), v213 (copy), v220 (copy)
        local v224 = 0;
        local v225 = 0;
        while v223 + v224 <= v214 and v211[v222][v223 + v224] and not v215[v222][v223 + v224] do
            v224 = v224 + 1;
        end;
        while true do
            if v222 + v225 <= v213 then
                for v226 = 0, v224 - 1 do
                    local v227 = v222 + v225;
                    local v228 = v223 + v226;
                    if not v220(v211[v227][v228], v227, v228) or v215[v227][v228] then
                        return v224, v225;
                    end;
                end;
                v225 = v225 + 1;
            else
                return v224, v225;
            end;
        end;
    end;
    for v230 = 1, v213 do
        for v231 = 1, v214 do
            if v211[v230][v231] and not v215[v230][v231] then
                local v232, v233 = v229(v230, v231);
                for v234 = 0, v233 - 1 do
                    for v235 = 0, v232 - 1 do
                        v215[v230 + v234][v231 + v235] = true;
                    end;
                end;
                table.insert(v216, {
                    Position = Vector2.new(v230, v231), 
                    Size = Vector2.new(v232, v233)
                });
            end;
        end;
    end;
    return v216;
end;
v0.BinarySearch = function(v236, v237, v238) --[[ Line: 1106 ]] --[[ Name: BinarySearch ]]
    local v241 = v238 or function(v239, v240) --[[ Line: 1107 ]]
        return v239 < v240;
    end;
    local v242 = 1;
    local v243 = #v236;
    while true do
        if v242 <= v243 then
            local v244 = math.floor((v242 + v243) / 2);
            local v245 = v236[v244];
            if v241(v245, v237) then
                v242 = v244 + 1;
            elseif v241(v237, v245) then
                v243 = v244 - 1;
            else
                return v244;
            end;
        else
            return nil;
        end;
    end;
end;
return v0;