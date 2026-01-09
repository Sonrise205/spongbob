local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent.Option);
local v2 = {
    IsServer = l_RunService_0:IsServer(), 
    WaitForChildTimeout = 60, 
    DefaultCommFolderName = "__comm__", 
    None = newproxy()
};
v2.GetCommSubFolder = function(v3, v4) --[[ Line: 12 ]] --[[ Name: GetCommSubFolder ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = nil;
    if v2.IsServer then
        v5 = v3:FindFirstChild(v4);
        if not v5 then
            v5 = Instance.new("Folder");
            v5.Name = v4;
            v5.Parent = v3;
        end;
    else
        v5 = v3:WaitForChild(v4, v2.WaitForChildTimeout);
    end;
    return v1.Wrap(v5);
end;
return v2;