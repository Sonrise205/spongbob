local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = {};
local v5 = {
    Configs = {}, 
    GetFloorData = function(v4) --[[ Line: 17 ]] --[[ Name: GetFloorData ]]
        -- upvalues: v3 (copy)
        return v3[v4];
    end
};
local v6 = require(script.Floors);
for v7, v8 in v6.FloorConfigs do
    v3[v7] = v8;
end;
v5.Configs = v6.Config;
v5.Configs.PlayerAttackSpeed = 1.7;
return v1.Table.Lock(v5);