local v0 = {
    DefaultRateLimiterRate = 120
};
local v1 = {
    Default = nil
};
local l_Players_0 = game:GetService("Players");
local v3 = {};
local v4 = {};
local v5 = {};
v5.__index = v5;
v5.CheckRate = function(v6, v7) --[[ Line: 59 ]] --[[ Name: CheckRate ]]
    -- upvalues: v3 (copy)
    local l__sources_0 = v6._sources;
    local v9 = os.clock();
    local v10 = l__sources_0[v7];
    if v10 ~= nil then
        v10 = math.max(v9, v10 + v6._rate_period);
        if v10 - v9 < 1 then
            l__sources_0[v7] = v10;
            return true;
        else
            return false;
        end;
    elseif typeof(v7) == "Instance" and v7:IsA("Player") and v3[v7] == nil then
        return false;
    else
        l__sources_0[v7] = v9 + v6._rate_period;
        return true;
    end;
end;
v5.CleanSource = function(v11, v12) --[[ Line: 83 ]] --[[ Name: CleanSource ]]
    v11._sources[v12] = nil;
end;
v5.Cleanup = function(v13) --[[ Line: 87 ]] --[[ Name: Cleanup ]]
    v13._sources = {};
end;
v5.Destroy = function(v14) --[[ Line: 91 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy)
    v4[v14] = nil;
end;
v1.NewRateLimiter = function(v15) --[[ Line: 96 ]] --[[ Name: NewRateLimiter ]]
    -- upvalues: v5 (copy), v4 (copy)
    if v15 <= 0 then
        error("[RateLimiter]: Invalid rate");
    end;
    local v16 = {
        _sources = {}, 
        _rate_period = 1 / v15
    };
    setmetatable(v16, v5);
    v4[v16] = true;
    return v16;
end;
for _, v18 in ipairs(l_Players_0:GetPlayers()) do
    v3[v18] = true;
end;
v1.Default = v1.NewRateLimiter(v0.DefaultRateLimiterRate);
l_Players_0.PlayerAdded:Connect(function(v19) --[[ Line: 122 ]]
    -- upvalues: v3 (copy)
    v3[v19] = true;
end);
l_Players_0.PlayerRemoving:Connect(function(v20) --[[ Line: 126 ]]
    -- upvalues: v3 (copy), v4 (copy)
    v3[v20] = nil;
    for v21 in pairs(v4) do
        v21._sources[v20] = nil;
    end;
end);
return v1;