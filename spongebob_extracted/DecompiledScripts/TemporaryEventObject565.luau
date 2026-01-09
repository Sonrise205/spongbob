local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = v2.GetController("EventController");
local v7 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        v2.Player.PlayerGui
    }
});
v7.Construct = function(v8) --[[ Line: 31 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v8.dump = v4.new();
    v8.dump:Add(function() --[[ Line: 35 ]]
        -- upvalues: v8 (copy)
        v8.dump = nil;
    end);
end;
v7.Start = function(v9) --[[ Line: 41 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy)
    local l_Attribute_0 = v9.Instance:GetAttribute("Event");
    if not v6:IsActive(l_Attribute_0) then
        v9.Instance:Destroy();
        return;
    else
        v9.dump:Add(v6.EventEnded:Connect(function() --[[ Line: 50 ]]
            -- upvalues: v9 (copy)
            v9.Instance:Destroy();
        end));
        return;
    end;
end;
v7.Stop = function(v11) --[[ Line: 55 ]] --[[ Name: Stop ]]
    if v11.dump then
        v11.dump:Destroy();
    end;
end;
return v7;