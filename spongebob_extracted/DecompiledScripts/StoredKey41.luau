local v0 = require(script.Parent.Parent.Shared.Util);
local v1 = {
    "^%a[%w_]*$", 
    "^%$%a[%w_]*$", 
    "^%.%a[%w_]*$", 
    "^%$%.%a[%w_]*$"
};
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v8 = {
        Autocomplete = function(v3) --[[ Line: 12 ]] --[[ Name: Autocomplete ]]
            -- upvalues: v2 (copy)
            return v2.Cmdr.Util.MakeFuzzyFinder(v2.Cmdr.Util.DictionaryKeys(v2:GetStore("vars_used") or {}))(v3);
        end, 
        Validate = function(v4) --[[ Line: 20 ]] --[[ Name: Validate ]]
            -- upvalues: v1 (ref)
            for _, v6 in ipairs(v1) do
                if v4:match(v6) then
                    return true;
                end;
            end;
            return false, "Key names must start with an optional modifier: . $ or $. and must begin with a letter.";
        end, 
        Parse = function(v7) --[[ Line: 30 ]] --[[ Name: Parse ]]
            return v7;
        end
    };
    v2:RegisterType("storedKey", v8);
    v2:RegisterType("storedKeys", v0.MakeListableType(v8));
end;