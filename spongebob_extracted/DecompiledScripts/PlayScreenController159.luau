local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedFirst_0.PlaceIds);
local v4 = v2.CreateController({
    Name = "PlayScreenController"
});
v4.KnitInit = function(_) --[[ Line: 21 ]] --[[ Name: KnitInit ]]

end;
v4.KnitStart = function(_) --[[ Line: 24 ]] --[[ Name: KnitStart ]]
    -- upvalues: v3 (copy)
    if not v3:IsHUB() then
        return;
    else
        return;
    end;
end;
v4.OpenPlayScreen = function(_) --[[ Line: 31 ]] --[[ Name: OpenPlayScreen ]]

end;
return v4;