local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Levels);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v5 = {};
for _, v7 in script:GetChildren() do
    if v7:IsA("ModuleScript") then
        v5[v7.Name] = require(v7);
    end;
end;
return v5;