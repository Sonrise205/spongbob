local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(l_ReplicatedStorage_0.Levels);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v6 = {};
local v7 = require(script.TemplateAchievement);
for _, v9 in script:GetChildren() do
    if v9:IsA("ModuleScript") and v9.Name ~= "TemplateAchievement" then
        v6[v9.Name] = require(v9);
    end;
end;
for _, v11 in {
    "Davy Jones"
} do
    local v12 = v6[v11] or v1.Copy(v7, true);
    for v13, v14 in v12 do
        if typeof(v13) == "number" then
            local v15 = v14.WorldMode or "Story";
            local l_WorldName_0 = v14.WorldName;
            local l_l_WorldName_0_0 = l_WorldName_0;
            if l_WorldName_0 then
                local l_v3_WorldData_0 = v3:GetWorldData(v15, l_WorldName_0);
                if l_v3_WorldData_0 then
                    l_l_WorldName_0_0 = l_v3_WorldData_0.DisplayName or l_l_WorldName_0_0;
                end;
                for v19, v20 in v14 do
                    if typeof(v20) == "string" then
                        local l_v20_0 = v20;
                        if string.find(v20, "{worldName}") then
                            l_v20_0 = string.gsub(l_v20_0, "{worldName}", l_l_WorldName_0_0);
                        end;
                        if string.find(v20, "{worldDisplayName}") then
                            l_v20_0 = string.gsub(l_v20_0, "{worldDisplayName}", l_l_WorldName_0_0);
                        end;
                        if string.find(v20, "{difficultyName}") then
                            l_v20_0 = string.gsub(l_v20_0, "{difficultyName}", v11);
                        end;
                        v14[v19] = l_v20_0;
                    end;
                end;
            end;
        end;
    end;
    v6[v11] = v12;
end;
return v6;