local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.RailUtil).Table.ToDict(script:GetChildren(), function(v1) --[[ Line: 17 ]]
    return v1.Name, require(v1);
end);
warn(script:GetChildren());
return v2;