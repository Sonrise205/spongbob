local v0 = require(script.Parent);
local _ = require(script.Parent.Parent.Types);
local v2 = require(script.Parent.Parent.Util);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(v2.IsServer, "ServerComm must be constructed from the server");
    assert(typeof(v4) == "Instance", "Parent must be of type Instance");
    local l_DefaultCommFolderName_0 = v2.DefaultCommFolderName;
    if v5 then
        l_DefaultCommFolderName_0 = v5;
    end;
    assert(not v4:FindFirstChild(l_DefaultCommFolderName_0), "Parent already has another ServerComm bound to namespace " .. l_DefaultCommFolderName_0);
    local v7 = setmetatable({}, v3);
    v7._instancesFolder = Instance.new("Folder");
    v7._instancesFolder.Name = l_DefaultCommFolderName_0;
    v7._instancesFolder.Parent = v4;
    return v7;
end;
v3.BindFunction = function(v8, v9, v10, v11, v12) --[[ Line: 76 ]] --[[ Name: BindFunction ]]
    -- upvalues: v0 (copy)
    return v0.BindFunction(v8._instancesFolder, v9, v10, v11, v12);
end;
v3.WrapMethod = function(v13, v14, v15, v16, v17) --[[ Line: 108 ]] --[[ Name: WrapMethod ]]
    -- upvalues: v0 (copy)
    return v0.WrapMethod(v13._instancesFolder, v14, v15, v16, v17);
end;
v3.CreateSignal = function(v18, v19, v20, v21, v22) --[[ Line: 146 ]] --[[ Name: CreateSignal ]]
    -- upvalues: v0 (copy)
    return v0.CreateSignal(v18._instancesFolder, v19, v20, v21, v22);
end;
v3.CreateProperty = function(v23, v24, v25, v26, v27) --[[ Line: 195 ]] --[[ Name: CreateProperty ]]
    -- upvalues: v0 (copy)
    return v0.CreateProperty(v23._instancesFolder, v24, v25, v26, v27);
end;
v3.Destroy = function(v28) --[[ Line: 207 ]] --[[ Name: Destroy ]]
    v28._instancesFolder:Destroy();
end;
return v3;