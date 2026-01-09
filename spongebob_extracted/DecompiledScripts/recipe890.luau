local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent.Parent.Shared.Util);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v3 = {};
for _, v5 in v2:GetRecipesCategories() do
    if typeof(v5) == "table" then
        for v6, v7 in v5 do
            if typeof(v7) == "table" then
                table.insert(v3, v6);
            end;
        end;
    end;
end;
local v13 = {
    Transform = function(v8) --[[ Line: 22 ]] --[[ Name: Transform ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.MakeFuzzyFinder(v3)(v8);
    end, 
    Validate = function(v9) --[[ Line: 28 ]] --[[ Name: Validate ]]
        return #v9 > 0, "No currency with that name could be found.";
    end, 
    Autocomplete = function(v10) --[[ Line: 32 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v1 (copy)
        return v1.GetNames(v10);
    end, 
    Parse = function(v11) --[[ Line: 36 ]] --[[ Name: Parse ]]
        return v11[1];
    end, 
    Default = function(v12) --[[ Line: 40 ]] --[[ Name: Default ]]
        return v12;
    end
};
return function(v14) --[[ Line: 45 ]]
    -- upvalues: v13 (copy)
    v14:RegisterType(script.Name, v13);
end;