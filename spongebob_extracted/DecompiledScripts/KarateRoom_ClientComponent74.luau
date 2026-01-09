local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v6 = v3.new({
    Tag = "KarateRoom", 
    Extensions = {}
});
v6.Construct = function(v7) --[[ Line: 18 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v7.dump = v4.new();
    v7.room = v7.Instance;
    v7.roomIndex = v7.room:GetAttribute("RoomIndex");
    v7.originalTransparencies = {};
    v7.toggleObjects = {};
    for _, v9 in v7.room:GetDescendants() do
        if v9:IsA("BasePart") or v9:IsA("Texture") or v9:IsA("Decal") then
            v7.originalTransparencies[v9] = v9.Transparency;
        elseif v9:IsA("ParticleEmitter") or v9:IsA("Beam") or v9:IsA("SurfaceGui") then
            table.insert(v7.toggleObjects, v9);
        end;
    end;
end;
v6.Start = function(_) --[[ Line: 40 ]] --[[ Name: Start ]]
    -- upvalues: v5 (copy), v2 (copy)
end;
v6.Stop = function(v11) --[[ Line: 75 ]] --[[ Name: Stop ]]
    v11.dump:Destroy();
end;
return v6;