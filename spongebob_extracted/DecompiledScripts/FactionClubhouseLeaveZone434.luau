local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v8 = v1.GetController("UIController");
local _ = v1.GetController("DataController");
local _ = v1.GetController("PlaceTeleportController");
local _ = v1.GetService("FactionService");
local v12 = v1.GetController("FactionWorldController");
local v13 = nil;
local v14 = {};
for _, v16 in script:GetChildren() do
    v14[v16.Name] = require(v16);
end;
local v17 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {}
    }
});
v17.Construct = function(v18) --[[ Line: 33 ]] --[[ Name: Construct ]]
    -- upvalues: v2 (copy)
    v18.dumpster = v2.new();
end;
v17.Start = function(v19) --[[ Line: 37 ]] --[[ Name: Start ]]
    -- upvalues: v13 (ref), v8 (copy), v4 (copy), v12 (copy)
    v13 = v8:GetModuleAsync("MessagePrompt"):expect();
    v19.thisFactionId = v19.Instance:GetAttribute("FactionId");
    local v20 = v4.new(v19.Instance);
    v19.dumpster:Add(v20);
    v19.Instance.Transparency = 1;
    v20.localPlayerEntered:Connect(function() --[[ Line: 51 ]]
        -- upvalues: v12 (ref)
        v12:ExitClubhouse();
    end);
    v20.localPlayerExited:Connect(function() --[[ Line: 69 ]]
        -- upvalues: v8 (ref)
        v8:Toggle("MessagePrompt", false);
    end);
end;
v17.Stop = function(v21) --[[ Line: 74 ]] --[[ Name: Stop ]]
    v21.dumpster:Destroy();
end;
return v17;