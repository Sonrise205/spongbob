local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local v5 = {};
local v6 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        v2.Player.PlayerGui
    }
});
v6.Construct = function(v7) --[[ Line: 17 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v7.dumpster = v3.new();
end;
v6.Start = function(v8) --[[ Line: 21 ]] --[[ Name: Start ]]
    -- upvalues: v5 (copy)
    local v9 = v8.Instance:GetAttribute("SpinSpeed") or 10;
    v5[v8.Instance] = v9;
end;
v6.Stop = function(v10) --[[ Line: 26 ]] --[[ Name: Stop ]]
    -- upvalues: v5 (copy)
    v10.dumpster:Destroy();
    if v5[v10.Instance] then
        v5[v10.Instance] = nil;
    end;
end;
v2.OnStart():andThen(function() --[[ Line: 34 ]]
    -- upvalues: l_RunService_0 (copy), v5 (copy)
    l_RunService_0.RenderStepped:Connect(function(v11) --[[ Line: 35 ]]
        -- upvalues: v5 (ref)
        for v12, v13 in v5 do
            v12.Rotation = (v12.Rotation + v13 * v11) % 360;
        end;
    end);
end);
return v6;