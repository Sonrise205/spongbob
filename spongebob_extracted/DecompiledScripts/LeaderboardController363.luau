local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Squash);
local v4 = require(l_ReplicatedStorage_0.Packages.DeltaCompress);
local v5 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.LeaderboardsShared);
local v8 = nil;
local v9 = nil;
local v10 = {};
local v11 = v1.CreateController({
    Name = script.Name, 
    Client = {}, 
    UsernamesChanged = v5.new()
});
v11.KnitInit = function(_) --[[ Line: 39 ]] --[[ Name: KnitInit ]]
    -- upvalues: v8 (ref), v1 (copy), v9 (ref)
    v8 = v1.GetController("DataController");
    v9 = v1.GetService("LeaderboardService");
end;
v11.KnitStart = function(v13) --[[ Line: 45 ]] --[[ Name: KnitStart ]]
    -- upvalues: v9 (ref), v3 (copy), v10 (ref), v7 (copy), v4 (copy)
    local v14 = v9:GetUsernamesCache():expect();
    if not v14 then
        return;
    else
        local v15 = v3.frombuffer(v14);
        v10 = v7.usernameSerdes.des(v15);
        v9.UsernamesUpdated:Connect(function(v16) --[[ Line: 54 ]]
            -- upvalues: v10 (ref), v4 (ref), v13 (copy)
            if v16 == nil then
                return;
            else
                v10 = v4.applyImmutable(v10, v16);
                v13.UsernamesChanged:Fire(v10);
                return;
            end;
        end);
        return;
    end;
end;
v11.GetUsername = function(_, v18) --[[ Line: 66 ]] --[[ Name: GetUsername ]]
    -- upvalues: v10 (ref)
    return v10[v18];
end;
return v11;