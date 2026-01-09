local v0 = require(script.Parent.Parent.Shared.Util);
local v3 = v0.MakeSequenceType({
    Prefixes = "# hexColor3 ! brickColor3", 
    ValidateEach = function(v1, v2) --[[ Line: 5 ]] --[[ Name: ValidateEach ]]
        if v1 == nil then
            return false, ("Invalid or missing number at position %d in Color3 type."):format(v2);
        elseif v1 < 0 or v1 > 255 then
            return false, ("Number out of acceptable range 0-255 at position %d in Color3 type."):format(v2);
        elseif v1 % 1 ~= 0 then
            return false, ("Number is not an integer at position %d in Color3 type."):format(v2);
        else
            return true;
        end;
    end, 
    TransformEach = tonumber, 
    Constructor = Color3.fromRGB, 
    Length = 3
});
local function v5(v4) --[[ Line: 21 ]] --[[ Name: parseHexDigit ]]
    if #v4 == 1 then
        v4 = v4 .. v4;
    end;
    return (tonumber(v4, 16));
end;
local v14 = {
    Transform = function(v6) --[[ Line: 30 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), v5 (copy)
        local v7, v8, v9 = v6:match("^#?(%x%x?)(%x%x?)(%x%x?)$");
        return v0.Each(v5, v7, v8, v9);
    end, 
    Validate = function(v10, v11, v12) --[[ Line: 35 ]] --[[ Name: Validate ]]
        local v13 = false;
        if v10 ~= nil then
            v13 = false;
            if v11 ~= nil then
                v13 = v12 ~= nil;
            end;
        end;
        return v13, "Invalid hex color";
    end, 
    Parse = function(...) --[[ Line: 39 ]] --[[ Name: Parse ]]
        return Color3.fromRGB(...);
    end
};
return function(v15) --[[ Line: 44 ]]
    -- upvalues: v3 (copy), v0 (copy), v14 (copy)
    v15:RegisterType("color3", v3);
    v15:RegisterType("color3s", v0.MakeListableType(v3, {
        Prefixes = "# hexColor3s ! brickColor3s"
    }));
    v15:RegisterType("hexColor3", v14);
    v15:RegisterType("hexColor3s", v0.MakeListableType(v14));
end;