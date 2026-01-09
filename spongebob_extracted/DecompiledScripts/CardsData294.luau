local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = {
    Categories = {
        All = {}, 
        Buff = {}
    }
};
local l_Categories_0 = v3.Categories;
v3.GetCard = function(_, v6) --[[ Line: 15 ]] --[[ Name: GetCard ]]
    -- upvalues: l_Categories_0 (copy)
    return l_Categories_0.All[v6];
end;
v3.GetBuffCard = function(_, v8) --[[ Line: 19 ]] --[[ Name: GetBuffCard ]]
    -- upvalues: l_Categories_0 (copy)
    return l_Categories_0.Buff[v8];
end;
v3.GetCurseCard = function(_, v10) --[[ Line: 23 ]] --[[ Name: GetCurseCard ]]
    -- upvalues: l_Categories_0 (copy)
    return l_Categories_0.Curse[v10];
end;
v3.GetBuffCards = function(_, v12) --[[ Line: 27 ]] --[[ Name: GetBuffCards ]]
    -- upvalues: v1 (copy), l_Categories_0 (copy)
    if v12 then
        return v1.Keys(l_Categories_0.Buff);
    else
        return v1.Copy(l_Categories_0.Buff, true);
    end;
end;
v3.GetCurseCards = function(_, v14) --[[ Line: 35 ]] --[[ Name: GetCurseCards ]]
    -- upvalues: v1 (copy), l_Categories_0 (copy)
    if v14 then
        return v1.Keys(l_Categories_0.Curse);
    else
        return v1.Copy(l_Categories_0.Curse, true);
    end;
end;
for _, v16 in script:GetChildren() do
    if v16:IsA("ModuleScript") then
        local v17 = require(v16);
        l_Categories_0[v16.Name] = v1.Filter(v17, function(v18) --[[ Line: 46 ]]
            return not v18.disabled;
        end);
    end;
end;
for v19, v20 in l_Categories_0 do
    if typeof(v20) == "table" and v19 ~= "All" then
        for v21, v22 in v20 do
            v22.category = v19;
            v22.name = v21;
            l_Categories_0.All[v21] = v22;
            if v19 ~= "Curse" then
                l_Categories_0.Buff[v21] = v22;
            end;
        end;
    end;
end;
return v3;