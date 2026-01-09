local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.RemoteSignal);
local _ = require(script.Parent.Parent.Types);
local l_None_0 = require(script.Parent.Parent.Util).None;
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7, v8, v9) --[[ Line: 53 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy), l_Players_0 (copy), l_None_0 (copy)
    local v10 = setmetatable({}, v4);
    v10._rs = v1.new(v5, v6, false, v8, v9);
    v10._value = v7;
    v10._perPlayer = {};
    v10._playerRemoving = l_Players_0.PlayerRemoving:Connect(function(v11) --[[ Line: 64 ]]
        -- upvalues: v10 (copy)
        v10._perPlayer[v11] = nil;
    end);
    v10._rs:Connect(function(v12) --[[ Line: 67 ]]
        -- upvalues: v10 (copy), l_None_0 (ref)
        local v13 = v10._perPlayer[v12];
        local v14 = if v13 == nil then v10._value else if v13 == l_None_0 then nil else v13;
        v10._rs:Fire(v12, v14);
    end);
    return v10;
end;
v4.Set = function(v15, v16) --[[ Line: 91 ]] --[[ Name: Set ]]
    v15._value = v16;
    table.clear(v15._perPlayer);
    v15._rs:FireAll(v16);
end;
v4.SetTop = function(v17, v18) --[[ Line: 118 ]] --[[ Name: SetTop ]]
    -- upvalues: l_Players_0 (copy)
    v17._value = v18;
    for _, v20 in ipairs(l_Players_0:GetPlayers()) do
        if v17._perPlayer[v20] == nil then
            v17._rs:Fire(v20, v18);
        end;
    end;
end;
v4.SetFilter = function(v21, v22, v23) --[[ Line: 141 ]] --[[ Name: SetFilter ]]
    -- upvalues: l_Players_0 (copy)
    for _, v25 in ipairs(l_Players_0:GetPlayers()) do
        if v22(v25, v23) then
            v21:SetFor(v25, v23);
        end;
    end;
end;
v4.SetFor = function(v26, v27, v28) --[[ Line: 163 ]] --[[ Name: SetFor ]]
    -- upvalues: l_None_0 (copy)
    if v27.Parent then
        v26._perPlayer[v27] = if v28 == nil then l_None_0 else v28;
    end;
    v26._rs:Fire(v27, v28);
end;
v4.SetForList = function(v29, v30, v31) --[[ Line: 179 ]] --[[ Name: SetForList ]]
    for _, v33 in ipairs(v30) do
        v29:SetFor(v33, v31);
    end;
end;
v4.ClearFor = function(v34, v35) --[[ Line: 206 ]] --[[ Name: ClearFor ]]
    if v34._perPlayer[v35] == nil then
        return;
    else
        v34._perPlayer[v35] = nil;
        v34._rs:Fire(v35, v34._value);
        return;
    end;
end;
v4.ClearForList = function(v36, v37) --[[ Line: 219 ]] --[[ Name: ClearForList ]]
    for _, v39 in ipairs(v37) do
        v36:ClearFor(v39);
    end;
end;
v4.ClearFilter = function(v40, v41) --[[ Line: 229 ]] --[[ Name: ClearFilter ]]
    -- upvalues: l_Players_0 (copy)
    for _, v43 in ipairs(l_Players_0:GetPlayers()) do
        if v41(v43) then
            v40:ClearFor(v43);
        end;
    end;
end;
v4.Get = function(v44) --[[ Line: 247 ]] --[[ Name: Get ]]
    return v44._value;
end;
v4.GetFor = function(v45, v46) --[[ Line: 281 ]] --[[ Name: GetFor ]]
    -- upvalues: l_None_0 (copy)
    local v47 = v45._perPlayer[v46];
    if v47 == nil then
        return v45._value;
    elseif v47 == l_None_0 then
        return nil;
    else
        return v47;
    end;
end;
v4.Destroy = function(v48) --[[ Line: 290 ]] --[[ Name: Destroy ]]
    v48._rs:Destroy();
    v48._playerRemoving:Disconnect();
end;
return v4;