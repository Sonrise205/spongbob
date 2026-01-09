local v0 = require(script.Parent.Parent.Shared.Util);
local l_EnumItems_0 = Enum.UserInputType:GetEnumItems();
for _, v3 in pairs(Enum.KeyCode:GetEnumItems()) do
    l_EnumItems_0[#l_EnumItems_0 + 1] = v3;
end;
local v8 = {
    Transform = function(v4) --[[ Line: 10 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), l_EnumItems_0 (copy)
        return v0.MakeFuzzyFinder(l_EnumItems_0)(v4);
    end, 
    Validate = function(v5) --[[ Line: 16 ]] --[[ Name: Validate ]]
        return #v5 > 0;
    end, 
    Autocomplete = function(v6) --[[ Line: 20 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v6);
    end, 
    Parse = function(v7) --[[ Line: 24 ]] --[[ Name: Parse ]]
        return v7[1];
    end
};
return function(v9) --[[ Line: 29 ]]
    -- upvalues: v8 (copy), v0 (copy)
    v9:RegisterType("userInput", v8);
    v9:RegisterType("userInputs", v0.MakeListableType(v8));
end;