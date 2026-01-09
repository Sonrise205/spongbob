local v0 = require(script.Parent.Parent.Shared.Util);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v3 = {};
local v4 = {
    "giftType"
};
for v5, v6 in v2:GetByCategory("Gifts") do
    local v7 = false;
    for _, v9 in v4 do
        if v6[v9] then
            v7 = true;
            break;
        end;
    end;
    if v7 then
        table.insert(v3, (string.gsub(v5, "GIFT_", "")));
    end;
end;
local v15 = {
    Transform = function(v10) --[[ Line: 33 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v3 (copy)
        return v0.MakeFuzzyFinder(v3)(v10);
    end, 
    Validate = function(v11) --[[ Line: 39 ]] --[[ Name: Validate ]]
        return #v11 > 0, "No state with that name could be found.";
    end, 
    Autocomplete = function(v12) --[[ Line: 43 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v12);
    end, 
    Parse = function(v13) --[[ Line: 47 ]] --[[ Name: Parse ]]
        return v13[1];
    end, 
    Default = function(v14) --[[ Line: 51 ]] --[[ Name: Default ]]
        return v14;
    end
};
return function(v16) --[[ Line: 56 ]]
    -- upvalues: v15 (copy)
    v16:RegisterType(script.Name, v15);
end;