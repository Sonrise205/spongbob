local v0 = require(script.Parent.Parent.Shared.Util);
local v3 = {
    Validate = function(v1) --[[ Line: 4 ]] --[[ Name: Validate ]]
        return v1 ~= nil;
    end, 
    Parse = function(v2) --[[ Line: 8 ]] --[[ Name: Parse ]]
        return (tostring(v2));
    end
};
local v7 = {
    Transform = function(v4) --[[ Line: 14 ]] --[[ Name: Transform ]]
        return (tonumber(v4));
    end, 
    Validate = function(v5) --[[ Line: 18 ]] --[[ Name: Validate ]]
        return v5 ~= nil;
    end, 
    Parse = function(v6) --[[ Line: 22 ]] --[[ Name: Parse ]]
        return v6;
    end
};
local v12 = {
    Transform = function(v8) --[[ Line: 28 ]] --[[ Name: Transform ]]
        return (tonumber(v8));
    end, 
    Validate = function(v9) --[[ Line: 32 ]] --[[ Name: Validate ]]
        local v10 = false;
        if v9 ~= nil then
            v10 = v9 == math.floor(v9);
        end;
        return v10, "Only whole numbers are valid.";
    end, 
    Parse = function(v11) --[[ Line: 36 ]] --[[ Name: Parse ]]
        return v11;
    end
};
local v17 = {
    Transform = function(v13) --[[ Line: 42 ]] --[[ Name: Transform ]]
        return (tonumber(v13));
    end, 
    Validate = function(v14) --[[ Line: 46 ]] --[[ Name: Validate ]]
        local v15 = false;
        if v14 ~= nil then
            v15 = false;
            if v14 == math.floor(v14) then
                v15 = v14 > 0;
            end;
        end;
        return v15, "Only positive whole numbers are valid.";
    end, 
    Parse = function(v16) --[[ Line: 50 ]] --[[ Name: Parse ]]
        return v16;
    end
};
local v22 = {
    Transform = function(v18) --[[ Line: 56 ]] --[[ Name: Transform ]]
        return (tonumber(v18));
    end, 
    Validate = function(v19) --[[ Line: 60 ]] --[[ Name: Validate ]]
        local v20 = false;
        if v19 ~= nil then
            v20 = false;
            if v19 == math.floor(v19) then
                v20 = v19 >= 0;
            end;
        end;
        return v20, "Only non-negative whole numbers are valid.";
    end, 
    Parse = function(v21) --[[ Line: 64 ]] --[[ Name: Parse ]]
        return v21;
    end
};
local v27 = {
    Transform = function(v23) --[[ Line: 70 ]] --[[ Name: Transform ]]
        return (tonumber(v23));
    end, 
    Validate = function(v24) --[[ Line: 74 ]] --[[ Name: Validate ]]
        local v25 = false;
        if v24 ~= nil then
            v25 = false;
            if v24 == math.floor(v24) then
                v25 = false;
                if v24 >= 0 then
                    v25 = v24 <= 255;
                end;
            end;
        end;
        return v25, "Only bytes are valid.";
    end, 
    Parse = function(v26) --[[ Line: 78 ]] --[[ Name: Parse ]]
        return v26;
    end
};
local v32 = {
    Transform = function(v28) --[[ Line: 84 ]] --[[ Name: Transform ]]
        return (tonumber(v28));
    end, 
    Validate = function(v29) --[[ Line: 88 ]] --[[ Name: Validate ]]
        local v30 = false;
        if v29 ~= nil then
            v30 = false;
            if v29 == math.floor(v29) then
                v30 = false;
                if v29 >= 0 then
                    v30 = v29 <= 9;
                end;
            end;
        end;
        return v30, "Only digits are valid.";
    end, 
    Parse = function(v31) --[[ Line: 92 ]] --[[ Name: Parse ]]
        return v31;
    end
};
local v33 = nil;
local v34 = v0.MakeDictionary({
    "true", 
    "t", 
    "yes", 
    "y", 
    "on", 
    "enable", 
    "enabled", 
    "1", 
    "+"
});
local v35 = v0.MakeDictionary({
    "false", 
    "f", 
    "no", 
    "n", 
    "off", 
    "disable", 
    "disabled", 
    "0", 
    "-"
});
v33 = {
    Transform = function(v36) --[[ Line: 103 ]] --[[ Name: Transform ]]
        return v36:lower();
    end, 
    Validate = function(v37) --[[ Line: 107 ]] --[[ Name: Validate ]]
        -- upvalues: v34 (copy), v35 (copy)
        local v38 = true;
        if v34[v37] == nil then
            v38 = v35[v37] ~= nil;
        end;
        return v38, "Please use true/yes/on or false/no/off.";
    end, 
    Parse = function(v39) --[[ Line: 111 ]] --[[ Name: Parse ]]
        -- upvalues: v34 (copy), v35 (copy)
        if v34[v39] then
            return true;
        elseif v35[v39] then
            return false;
        else
            return nil;
        end;
    end
};
return function(v40) --[[ Line: 123 ]]
    -- upvalues: v3 (copy), v7 (copy), v12 (copy), v17 (copy), v22 (copy), v27 (copy), v32 (copy), v33 (ref), v0 (copy)
    v40:RegisterType("string", v3);
    v40:RegisterType("number", v7);
    v40:RegisterType("integer", v12);
    v40:RegisterType("positiveInteger", v17);
    v40:RegisterType("nonNegativeInteger", v22);
    v40:RegisterType("byte", v27);
    v40:RegisterType("digit", v32);
    v40:RegisterType("boolean", v33);
    v40:RegisterType("strings", v0.MakeListableType(v3));
    v40:RegisterType("numbers", v0.MakeListableType(v7));
    v40:RegisterType("integers", v0.MakeListableType(v12));
    v40:RegisterType("positiveIntegers", v0.MakeListableType(v17));
    v40:RegisterType("nonNegativeIntegers", v0.MakeListableType(v22));
    v40:RegisterType("bytes", v0.MakeListableType(v27));
    v40:RegisterType("digits", v0.MakeListableType(v32));
    v40:RegisterType("booleans", v0.MakeListableType(v33));
end;