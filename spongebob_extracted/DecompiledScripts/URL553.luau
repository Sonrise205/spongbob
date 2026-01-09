local v0 = require(script.Parent.Parent.Shared.Util);
local v3 = {
    Validate = function(v1) --[[ Line: 4 ]] --[[ Name: Validate ]]
        if v1:match("^https?://.+$") then
            return true;
        else
            return false, "URLs must begin with http:// or https://";
        end;
    end, 
    Parse = function(v2) --[[ Line: 12 ]] --[[ Name: Parse ]]
        return v2;
    end
};
return function(v4) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), v0 (copy)
    v4:RegisterType("url", v3);
    v4:RegisterType("urls", v0.MakeListableType(v3));
end;