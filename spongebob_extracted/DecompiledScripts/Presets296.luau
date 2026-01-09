local l_script_Descendants_0 = script:GetDescendants();
local v1 = {};
for _, v3 in l_script_Descendants_0 do
    if v3:IsA("ModuleScript") then
        v1[v3.Name] = require(v3);
    end;
end;
return v1;