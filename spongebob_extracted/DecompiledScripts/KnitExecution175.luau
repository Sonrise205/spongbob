local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Loader);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
v5:DebugWarn("PlayerGui");
v3.PlayerGui = v3.Player:WaitForChild("PlayerGui");
v5:DebugWarn("Grabbing controllers...");
local l_Controllers_0 = script.Parent:WaitForChild("Controllers");
local v7 = {
    "TreasureController"
};
local v8 = {
    "AudioController", 
    "DataController"
};
v5:DebugWarn("Loading first loaders");
v4.LoadDescendants(l_Controllers_0, function(v9) --[[ Line: 36 ]]
    -- upvalues: v7 (copy)
    if not table.find(v7, v9.Name) then
        return false;
    else
        return true;
    end;
end);
v5:DebugWarn("Loading regular controllers");
v4.LoadDescendants(l_Controllers_0, function(v10) --[[ Line: 46 ]]
    -- upvalues: v8 (copy)
    if table.find(v8, v10.Name) then
        return false;
    else
        return string.match(v10.Name, "Controller$") ~= nil;
    end;
end);
v5:DebugWarn("Loading last controllers");
for _, v12 in v8 do
    require(l_Controllers_0:WaitForChild(v12));
end;
v3.Start():andThen(function() --[[ Line: 62 ]]
    -- upvalues: v5 (copy), v4 (copy)
    v5:DebugWarn("Knit started!");
    v4.LoadChildren(script.Parent:WaitForChild("Components"));
    v4.LoadDescendants(script.Parent:WaitForChild("RailComponents"), function(v13) --[[ Line: 66 ]]
        local v14 = if v13.Parent then v13.Parent.Name == "RailComponents" else false;
        local v15 = true;
        if string.match(v13.Name, "Component$") == nil then
            v15 = v14;
        end;
        return v15;
    end);
end);