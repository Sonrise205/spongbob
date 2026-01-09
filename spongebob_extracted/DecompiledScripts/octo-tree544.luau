local function v5(v0, v1, v2) --[[ Line: 45 ]] --[[ Name: IsPointInBox ]]
    local v3 = v2 / 2;
    local v4 = false;
    if v0.X >= v1.X - v3 then
        v4 = false;
        if v0.X <= v1.X + v3 then
            v4 = false;
            if v0.Y >= v1.Y - v3 then
                v4 = false;
                if v0.Y <= v1.Y + v3 then
                    v4 = false;
                    if v0.Z >= v1.Z - v3 then
                        v4 = v0.Z <= v1.Z + v3;
                    end;
                end;
            end;
        end;
    end;
    return v4;
end;
local function _(v6, v7) --[[ Line: 55 ]] --[[ Name: RoundTo ]]
    return math.round(v6 / v7) * v7;
end;
local function _(v9, v10) --[[ Line: 59 ]] --[[ Name: SwapRemove ]]
    local v11 = #v9;
    v9[v10] = v9[v11];
    v9[v11] = nil;
end;
local function v13(v14) --[[ Line: 65 ]] --[[ Name: CountNodesInRegion ]]
    -- upvalues: v13 (copy)
    local v15 = 0;
    if v14.Nodes then
        return #v14.Nodes;
    else
        for _, v17 in ipairs(v14.Regions) do
            v15 = v15 + v13(v17);
        end;
        return v15;
    end;
end;
local function v24(v18, v19, v20) --[[ Line: 77 ]] --[[ Name: GetTopRegion ]]
    local l_Size_0 = v18.Size;
    local v22 = Vector3.new(math.round(v19.X / l_Size_0) * l_Size_0, math.round(v19.Y / l_Size_0) * l_Size_0, math.round(v19.Z / l_Size_0) * l_Size_0);
    local v23 = v18.Regions[v22];
    if not v23 and v20 then
        v23 = {
            Regions = {}, 
            Level = 1, 
            Size = l_Size_0, 
            Radius = math.sqrt(l_Size_0 * l_Size_0 + l_Size_0 * l_Size_0 + l_Size_0 * l_Size_0), 
            Center = v22
        };
        table.freeze(v23);
        v18.Regions[v22] = v23;
    end;
    return v23;
end;
local function v49(v25, v26, v27) --[[ Line: 95 ]] --[[ Name: GetRegionsInRadius ]]
    -- upvalues: v24 (copy)
    local v28 = {};
    local function v29(v30) --[[ Line: 97 ]] --[[ Name: ScanRegions ]]
        -- upvalues: v26 (copy), v27 (copy), v28 (copy), v29 (copy)
        for _, v32 in ipairs(v30) do
            if (v26 - v32.Center).Magnitude < v27 + v32.Radius then
                if v32.Nodes then
                    table.insert(v28, v32);
                else
                    v29(v32.Regions);
                end;
            end;
        end;
    end;
    local v33 = {};
    local l_Size_1 = v25.Size;
    local v35 = math.ceil(v27 / l_Size_1);
    if v27 < v25.Size then
        for v36 = 0, 26 do
            local v37 = v36 % 3 - 1;
            local v38 = math.floor(v36 / 9) - 1;
            local v39 = math.floor(v36 / 3) % 3 - 1;
            local v40 = Vector3.new(v37 * v27, v38 * v27, v39 * v27);
            local v41 = v24(v25, v26 + v40, false);
            if v41 and not v33[v41] then
                v33[v41] = true;
                v29(v41.Regions);
            end;
        end;
        return v28;
    elseif v35 <= 3 then
        for v42 = -v35, v35 do
            for v43 = -v35, v35 do
                for v44 = -v35, v35 do
                    local v45 = Vector3.new(v42 * l_Size_1, v43 * l_Size_1, v44 * l_Size_1);
                    local v46 = v24(v25, v26 + v45, false);
                    if v46 and not v33[v46] then
                        v33[v46] = true;
                        v29(v46.Regions);
                    end;
                end;
            end;
        end;
        return v28;
    else
        for _, v48 in v25.Regions do
            if (v26 - v48.Center).Magnitude < v27 + v48.Radius then
                v29(v48.Regions);
            end;
        end;
        return v28;
    end;
end;
local v50 = {};
v50.__index = v50;
local function v53(v51) --[[ Line: 160 ]] --[[ Name: CreateOctree ]]
    -- upvalues: v50 (copy)
    local v52 = setmetatable({}, v50);
    v52.Size = v51 or 512;
    v52.Regions = {};
    return v52;
end;
v50.ClearAllNodes = function(v54) --[[ Line: 167 ]] --[[ Name: ClearAllNodes ]]
    table.clear(v54.Regions);
end;
v50.GetAllNodes = function(v55) --[[ Line: 171 ]] --[[ Name: GetAllNodes ]]
    local v56 = {};
    local function v57(v58) --[[ Line: 173 ]] --[[ Name: GetNodes ]]
        -- upvalues: v56 (copy), v57 (copy)
        for _, v60 in v58 do
            local l_Nodes_0 = v60.Nodes;
            if l_Nodes_0 then
                table.move(l_Nodes_0, 1, #l_Nodes_0, #v56 + 1, v56);
            else
                v57(v60.Regions);
            end;
        end;
    end;
    v57(v55.Regions);
    return v56;
end;
v50.ForEachNode = function(v62) --[[ Line: 187 ]] --[[ Name: ForEachNode ]]
    local function v63(v64) --[[ Line: 188 ]] --[[ Name: GetNodes ]]
        -- upvalues: v62 (copy), v63 (copy)
        local v65 = v64 or v62.Regions;
        for _, v67 in v65 do
            local l_Nodes_1 = v67.Nodes;
            if l_Nodes_1 then
                for _, v70 in l_Nodes_1 do
                    coroutine.yield(v70);
                end;
            else
                v63(v67.Regions);
            end;
        end;
    end;
    return coroutine.wrap(v63);
end;
v50.FindFirstNode = function(v71, v72) --[[ Line: 203 ]] --[[ Name: FindFirstNode ]]
    for v73 in v71:ForEachNode() do
        if v73.Object == v72 then
            return v73;
        end;
    end;
    return nil;
end;
v50.CountNodes = function(v74) --[[ Line: 212 ]] --[[ Name: CountNodes ]]
    return #v74:GetAllNodes();
end;
v50.CreateNode = function(v75, v76, v77) --[[ Line: 216 ]] --[[ Name: CreateNode ]]
    local v78 = v75:_getRegion(4, v76);
    local v79 = {
        Region = v78, 
        Position = v76, 
        Object = v77
    };
    if v78.Nodes then
        table.insert(v78.Nodes, v79);
        return v79;
    else
        error("region does not contain nodes array");
        return v79;
    end;
end;
v50.RemoveNode = function(_, v81) --[[ Line: 231 ]] --[[ Name: RemoveNode ]]
    -- upvalues: v13 (copy)
    if not v81.Region then
        return;
    else
        local l_Nodes_2 = v81.Region.Nodes;
        local v83 = table.find(l_Nodes_2, v81);
        if v83 then
            local v84 = #l_Nodes_2;
            l_Nodes_2[v83] = l_Nodes_2[v84];
            l_Nodes_2[v84] = nil;
        end;
        if #l_Nodes_2 == 0 then
            local l_Region_0 = v81.Region;
            while l_Region_0 do
                local l_Parent_0 = l_Region_0.Parent;
                if l_Parent_0 and v13(l_Region_0) == 0 then
                    local v87 = table.find(l_Parent_0.Regions, l_Region_0);
                    if v87 then
                        local l_Regions_0 = l_Parent_0.Regions;
                        local v89 = #l_Regions_0;
                        l_Regions_0[v87] = l_Regions_0[v89];
                        l_Regions_0[v89] = nil;
                    end;
                end;
                l_Region_0 = l_Parent_0;
            end;
        end;
        v81.Region = nil;
        return;
    end;
end;
v50.ChangeNodePosition = function(v90, v91, v92) --[[ Line: 260 ]] --[[ Name: ChangeNodePosition ]]
    v91.Position = v92;
    local v93 = v90:_getRegion(4, v92);
    if v93 == v91.Region then
        return;
    else
        table.insert(v93.Nodes, v91);
        v90:RemoveNode(v91);
        v91.Region = v93;
        return;
    end;
end;
v50.SearchRadius = function(v94, v95, v96) --[[ Line: 271 ]] --[[ Name: SearchRadius ]]
    -- upvalues: v49 (copy)
    local v97 = {};
    local v98 = v49(v94, v95, v96);
    for _, v100 in ipairs(v98) do
        if v100.Nodes ~= nil then
            for _, v102 in ipairs(v100.Nodes) do
                if (v102.Position - v95).Magnitude < v96 then
                    table.insert(v97, v102);
                end;
            end;
        end;
    end;
    return v97;
end;
v50.ForEachInRadius = function(v103, v104, v105) --[[ Line: 286 ]] --[[ Name: ForEachInRadius ]]
    -- upvalues: v49 (copy)
    local v106 = v49(v103, v104, v105);
    return coroutine.wrap(function() --[[ Line: 288 ]]
        -- upvalues: v106 (copy), v104 (copy), v105 (copy)
        for _, v108 in ipairs(v106) do
            if v108.Nodes ~= nil then
                for _, v110 in ipairs(v108.Nodes) do
                    if (v110.Position - v104).Magnitude < v105 then
                        coroutine.yield(v110);
                    end;
                end;
            end;
        end;
    end);
end;
v50.GetNearest = function(v111, v112, v113, v114) --[[ Line: 301 ]] --[[ Name: GetNearest ]]
    local v115 = v111:SearchRadius(v112, v113);
    table.sort(v115, function(v116, v117) --[[ Line: 303 ]]
        -- upvalues: v112 (copy)
        return (v116.Position - v112).Magnitude < (v117.Position - v112).Magnitude;
    end);
    if v114 ~= nil and v114 < #v115 then
        return table.move(v115, 1, v114, 1, table.create(v114));
    else
        return v115;
    end;
end;
v50._getRegion = function(v118, v119, v120) --[[ Line: 314 ]] --[[ Name: _getRegion ]]
    -- upvalues: v5 (copy), v24 (copy)
    local function v121(v122, v123, v124) --[[ Line: 315 ]] --[[ Name: GetRegion ]]
        -- upvalues: v5 (ref), v120 (copy), v118 (copy), v119 (copy), v121 (copy)
        local v125 = nil;
        for _, v127 in v123 do
            if v5(v120, v127.Center, v127.Size) then
                v125 = v127;
                break;
            end;
        end;
        if not v125 then
            local v128 = v118.Size / 2 ^ (v124 - 1);
            local v129 = if v122 then v122.Center else Vector3.new(math.round(v120.X / v128) * v128, math.round(v120.Y / v128) * v128, math.round(v120.Z / v128) * v128);
            local l_v129_0 = v129;
            if v122 then
                l_v129_0 = l_v129_0 + Vector3.new(if v120.X > v129.X then v128 / 2 else -v128 / 2, if v120.Y > v129.Y then v128 / 2 else -v128 / 2, if v120.Z > v129.Z then v128 / 2 else -v128 / 2);
            end;
            local v131 = {
                Regions = {}, 
                Level = v124, 
                Size = v128, 
                Radius = math.sqrt(v128 * v128 + v128 * v128 + v128 * v128), 
                Center = l_v129_0, 
                Parent = v122, 
                Nodes = if v124 == 4 then {} else nil
            };
            table.freeze(v131);
            table.insert(v123, v131);
            v125 = v131;
        end;
        if v124 == v119 then
            return v125;
        else
            return v121(v125, v125.Regions, v124 + 1);
        end;
    end;
    local v132 = v24(v118, v120, true);
    return v121(v132, v132.Regions, 2);
end;
v50.__iter = v50.ForEachNode;
return {
    new = v53
};