local v0 = require(script.Parent);
local _ = require(script.Parent.Parent.Types);
local v2 = require(script.Parent.Parent.Util);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(not v2.IsServer, "ClientComm must be constructed from the client");
    assert(typeof(v4) == "Instance", "Parent must be of type Instance");
    local l_DefaultCommFolderName_0 = v2.DefaultCommFolderName;
    if v6 then
        l_DefaultCommFolderName_0 = v6;
    end;
    local v8 = v4:WaitForChild(l_DefaultCommFolderName_0, v2.WaitForChildTimeout);
    assert(v8 ~= nil, "Could not find namespace for ClientComm in parent: " .. l_DefaultCommFolderName_0);
    local v9 = setmetatable({}, v3);
    v9._instancesFolder = v8;
    v9._usePromise = v5;
    return v9;
end;
v3.GetFunction = function(v10, v11, v12, v13) --[[ Line: 95 ]] --[[ Name: GetFunction ]]
    -- upvalues: v0 (copy)
    return v0.GetFunction(v10._instancesFolder, v11, v10._usePromise, v12, v13);
end;
v3.GetSignal = function(v14, v15, v16, v17) --[[ Line: 123 ]] --[[ Name: GetSignal ]]
    -- upvalues: v0 (copy)
    return v0.GetSignal(v14._instancesFolder, v15, v16, v17);
end;
v3.GetProperty = function(v18, v19, v20, v21) --[[ Line: 165 ]] --[[ Name: GetProperty ]]
    -- upvalues: v0 (copy)
    return v0.GetProperty(v18._instancesFolder, v19, v20, v21);
end;
v3.BuildObject = function(v22, v23, v24) --[[ Line: 192 ]] --[[ Name: BuildObject ]]
    local v25 = {};
    local l_RF_0 = v22._instancesFolder:FindFirstChild("RF");
    local l_RE_0 = v22._instancesFolder:FindFirstChild("RE");
    local l_RP_0 = v22._instancesFolder:FindFirstChild("RP");
    if l_RF_0 then
        for _, v30 in l_RF_0:GetChildren() do
            if v30:IsA("RemoteFunction") then
                local l_v22_Function_0 = v22:GetFunction(v30.Name, v23, v24);
                v25[v30.Name] = function(_, ...) --[[ Line: 203 ]]
                    -- upvalues: l_v22_Function_0 (copy)
                    return l_v22_Function_0(...);
                end;
            end;
        end;
    end;
    if l_RE_0 then
        for _, v34 in l_RE_0:GetChildren() do
            if v34:IsA("RemoteEvent") or v34:IsA("UnreliableRemoteEvent") then
                v25[v34.Name] = v22:GetSignal(v34.Name, v23, v24);
            end;
        end;
    end;
    if l_RP_0 then
        for _, v36 in l_RP_0:GetChildren() do
            if v36:IsA("RemoteEvent") then
                v25[v36.Name] = v22:GetProperty(v36.Name, v23, v24);
            end;
        end;
    end;
    return v25;
end;
v3.Destroy = function(_) --[[ Line: 230 ]] --[[ Name: Destroy ]]

end;
return v3;