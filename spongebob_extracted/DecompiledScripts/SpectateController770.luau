local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = nil;
local v5 = v1.CreateController({
    Name = script.Name, 
    Client = {}
});
v5.KnitInit = function(_) --[[ Line: 30 ]] --[[ Name: KnitInit ]]
    -- upvalues: v4 (ref), v1 (copy)
    v4 = v1.GetController("DataController");
end;
v5.KnitStart = function(_) --[[ Line: 35 ]] --[[ Name: KnitStart ]]

end;
return v5;