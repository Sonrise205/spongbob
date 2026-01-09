return function(v0) --[[ Line: 6 ]] --[[ Name: loadModules ]]
    local v1 = {};
    for _, v3 in v0:GetChildren() do
        if v3:IsA("ModuleScript") then
            v1[v3.Name] = require(v3);
        end;
    end;
    return v1;
end;