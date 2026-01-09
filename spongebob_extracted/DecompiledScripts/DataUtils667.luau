local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_ReplicatedStorage_0.Packages;
local v2 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v3 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v10 = {
    TryGetValueFromTablePath = function(v4, v5, v6, v7, v8) --[[ Line: 19 ]] --[[ Name: TryGetValueFromTablePath ]]
        -- upvalues: v3 (copy)
        v3:Assert(v5, "Must provide a table.");
        v3:Assert(type(v5) == "table", "Must provide a table, not a", (type(v5)));
        v3:Assert(v7 and type(v7) == "string" or v7 == nil, "Invalid separator given! Must be string or nil.");
        local l_v6_0 = v6;
        if typeof(l_v6_0) == "string" then
            v7 = v7 or ".";
            l_v6_0 = string.split(v6, v7);
        end;
        if #l_v6_0 == 1 then
            return v5[l_v6_0[1]];
        else
            return v4:DeeplyIndexTable(v5, l_v6_0, v8);
        end;
    end
};
v10.TrySetKeyFromTablePath = function(_, v12, v13, v14) --[[ Line: 48 ]] --[[ Name: TrySetKeyFromTablePath ]]
    -- upvalues: v10 (copy)
    local v15 = string.split(v13, ".");
    local v16 = table.remove(v15, #v15);
    local v17 = v10:DeeplyIndexTable(v12, v15);
    if not v17 then
        return;
    else
        v17[v16] = v14;
        warn("Set key", v16, "to value", v14, "in table", v17);
        return;
    end;
end;
v10.DeeplyIndexTable = function(v18, v19, v20, v21) --[[ Line: 64 ]] --[[ Name: DeeplyIndexTable ]]
    return v18:DeepIndexGeneric(v19, v20, v21, function(_, _, v24, v25) --[[ Line: 65 ]]
        return v24 and v24[v25];
    end);
end;
v10.DeepIndexHierarchy = function(v26, v27, v28, v29) --[[ Line: 71 ]] --[[ Name: DeepIndexHierarchy ]]
    return v26:DeepIndexGeneric(v27, v28, v29, function(_, _, v32, v33) --[[ Line: 72 ]]
        return v32 and v32:FindFirstChild(v33);
    end);
end;
v10.DeepIndexGeneric = function(_, v35, v36, _, v38) --[[ Line: 78 ]] --[[ Name: DeepIndexGeneric ]]
    if typeof(v36) == "string" then
        v36 = string.split(v36, ".");
    end;
    local l_v35_0 = v35;
    for _, v41 in ipairs(v36) do
        l_v35_0 = v38(v35, v36, l_v35_0, v41);
        if l_v35_0 == nil then
            return nil;
        end;
    end;
    return l_v35_0;
end;
v10.GetGenericModuleDependency = function(_, v43, v44, v45) --[[ Line: 128 ]] --[[ Name: GetGenericModuleDependency ]]
    -- upvalues: v10 (copy)
    local v46 = v10:DeeplyIndexTable(v43, v44, true);
    if v46 ~= nil and typeof(v46) == "table" then
        return v46, false;
    else
        local v47 = v10:DeeplyIndexTable(v45, v44, false);
        return require(v47), true;
    end;
end;
v10.ForEach = function(_, v49, v50) --[[ Line: 149 ]] --[[ Name: ForEach ]]
    for v51, v52 in pairs(v49) do
        v50(v51, v52);
    end;
end;
v10._packIntoKnitModuleTable = function(_, v54, v55, v56) --[[ Line: 158 ]] --[[ Name: _packIntoKnitModuleTable ]]
    -- upvalues: v2 (copy), v10 (copy)
    local v57 = v2.Copy(v56);
    local v58 = table.remove(v57, #v57);
    v10:DeeplyIndexTable(v55, v57)[v58] = v54;
end;
return v10;