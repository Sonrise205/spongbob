local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = {};
task.spawn(function() --[[ Line: 22 ]]
    -- upvalues: v3 (copy)
    while task.wait(30) do
        for _, v5 in v3 do
            v5.dumpster:Destroy();
        end;
    end;
end);
local function _(v6, v7) --[[ Line: 30 ]] --[[ Name: getTablePath ]]
    if typeof(v6) ~= "string" then
        return v6;
    else
        return string.split(v6, v7 or ".");
    end;
end;
local function _(v9, v10) --[[ Line: 38 ]] --[[ Name: getStringPath ]]
    if typeof(v9) == "string" then
        return v9;
    else
        return table.concat(v9, v10 or ".");
    end;
end;
local function v23(v12, v13, v14) --[[ Line: 46 ]] --[[ Name: parseInstancePath ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v15 = if typeof(v13) == "string" then v13 else table.concat(v13, v14 or ".");
    local v16 = ("%*.%*"):format(v12:GetFullName(), v15);
    local v17 = v3[v16];
    if v17 then
        if v17.instance.Parent then
            return v17.instance;
        else
            v3[v16] = nil;
        end;
    end;
    local v18 = if typeof(v13) ~= "string" then v13 else string.split(v13, v14 or ".");
    local l_v12_0 = v12;
    for _, v21 in v18 do
        l_v12_0 = l_v12_0:FindFirstChild(v21);
        if not l_v12_0 then
            return;
        end;
    end;
    local v22 = v1.new();
    v22:Add(l_v12_0.Destroying:Once(function() --[[ Line: 71 ]]
        -- upvalues: v22 (copy)
        v22:Destroy();
    end));
    v3[v16] = {
        instance = l_v12_0, 
        dumpster = v22
    };
    v22:Add(function() --[[ Line: 80 ]]
        -- upvalues: v3 (ref), v16 (copy)
        v3[v16] = nil;
    end);
    return l_v12_0;
end;
local function v31(v24, v25, v26) --[[ Line: 87 ]] --[[ Name: parsePath ]]
    local l_v24_0 = v24;
    local v28 = if typeof(v25) ~= "string" then v25 else string.split(v25, v26 or ".");
    for _, v30 in v28 do
        l_v24_0 = l_v24_0[v30];
        if not l_v24_0 then
            return;
        end;
    end;
    return l_v24_0;
end;
local function v41(v32, v33, v34, v35) --[[ Line: 101 ]] --[[ Name: setPath ]]
    local l_v32_0 = v32;
    local v37 = if typeof(v33) ~= "string" then v33 else string.split(v33, v35 or ".");
    for v38 = 1, #v37 - 1 do
        local v39 = v37[v38];
        if not l_v32_0[v39] then
            l_v32_0[v39] = {};
        end;
        l_v32_0 = l_v32_0[v39];
    end;
    local v40 = v37[#v37];
    if l_v32_0 and typeof(l_v32_0) == "table" then
        l_v32_0[v40] = v34;
        return true;
    else
        return false;
    end;
end;
return function(v42, v43, v44, v45) --[[ Line: 124 ]]
    -- upvalues: v41 (copy), v23 (copy), v31 (copy)
    assert(v42 ~= nil, "Root must be provided.");
    local v46 = true;
    if typeof(v43) ~= "string" then
        v46 = typeof(v43) == "table";
    end;
    assert(v46, "Path must be a string or a string array.");
    if v44 ~= nil then
        return (v41(v42, v43, v44, v45));
    elseif typeof(v42) == "Instance" then
        return v23(v42, v43, v45);
    else
        local v47;
        v47, v46 = next(v42);
        if typeof(v47) == "number" and typeof(v46) == "Instance" then
            for _, v49 in v42 do
                local v50 = v23(v49, v43, v45);
                if v50 then
                    return v50;
                end;
            end;
            return;
        else
            return v31(v42, v43, v45);
        end;
    end;
end;