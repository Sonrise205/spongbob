local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(script.Parent.CreateGui);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_StarterGui_0 (copy), v2 (copy)
    local v4 = nil;
    local v5 = nil;
    local v6 = nil;
    local function _(v7, v8, v9) --[[ Line: 9 ]] --[[ Name: Create ]]
        -- upvalues: v4 (ref)
        local v10 = Instance.new(v7);
        v10.Name = v8;
        v10.Parent = v9 or v4;
        return v10;
    end;
    v4 = script.Parent.CmdrClient;
    v4.Parent = l_ReplicatedStorage_0;
    local l_RemoteFunction_0 = Instance.new("RemoteFunction");
    l_RemoteFunction_0.Name = "CmdrFunction";
    l_RemoteFunction_0.Parent = v4;
    v5 = l_RemoteFunction_0;
    l_RemoteFunction_0 = Instance.new("RemoteEvent");
    l_RemoteFunction_0.Name = "CmdrEvent";
    l_RemoteFunction_0.Parent = v4;
    v6 = l_RemoteFunction_0;
    l_RemoteFunction_0 = Instance.new("Folder");
    l_RemoteFunction_0.Name = "Commands";
    l_RemoteFunction_0.Parent = v4;
    l_RemoteFunction_0 = Instance.new("Folder");
    l_RemoteFunction_0.Name = "Types";
    l_RemoteFunction_0.Parent = v4;
    script.Parent.Shared.Parent = v4;
    v3.ReplicatedRoot = v4;
    v3.RemoteFunction = v5;
    v3.RemoteEvent = v6;
    v3:RegisterTypesIn(script.Parent.BuiltInTypes);
    v3:RegisterTypesIn(script.Parent.WWSTypes);
    script.Parent.BuiltInTypes:Destroy();
    script.Parent.WWSTypes:Destroy();
    script.Parent.BuiltInCommands.Name = "Server commands";
    if l_StarterGui_0:FindFirstChild("Cmdr") == nil then
        v2();
    end;
end;