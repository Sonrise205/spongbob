local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedFirst_0.PlaceIds);
local v6 = nil;
local v7 = v2.CreateController({
    Name = script.Name
});
v7.KnitInit = function(_) --[[ Line: 32 ]] --[[ Name: KnitInit ]]
    -- upvalues: v6 (ref), v2 (copy)
    v6 = v2.GetController("DataController");
end;
v7.KnitStart = function(_) --[[ Line: 37 ]] --[[ Name: KnitStart ]]
    -- upvalues: v5 (copy), v2 (copy)
    if not v5:IsGame() then
        return;
    else
        local function v11(v10) --[[ Line: 43 ]] --[[ Name: shardAdded ]]
            if v10.Name ~= "EggShard" then
                return;
            else
                v10.Parent = workspace.Map;
                return;
            end;
        end;
        for _, v13 in v2.PlayerGui:GetChildren() do
            if v13.Name == "EggShard" then
                v13.Parent = workspace.Map;
            end;
        end;
        v2.PlayerGui.ChildAdded:Connect(v11);
        return;
    end;
end;
return v7;