local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v5.Construct = function(_) --[[ Line: 30 ]] --[[ Name: Construct ]]

end;
v5.Start = function(v7) --[[ Line: 34 ]] --[[ Name: Start ]]
    -- upvalues: v1 (copy)
    if v1.Player.Character and v7.Instance:IsDescendantOf(v1.Player.Character) then
        v7.Instance:Destroy();
    end;
end;
v5.Stop = function(_) --[[ Line: 41 ]] --[[ Name: Stop ]]

end;
return v5;