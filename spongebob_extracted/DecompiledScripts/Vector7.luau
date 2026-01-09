local v0 = require(script.Parent.Parent.Shared.Util);
local function v3(v1, v2) --[[ Line: 3 ]] --[[ Name: validateVector ]]
    if v1 == nil then
        return false, ("Invalid or missing number at position %d in Vector type."):format(v2);
    else
        return true;
    end;
end;
local v4 = v0.MakeSequenceType({
    ValidateEach = v3, 
    TransformEach = tonumber, 
    Constructor = Vector3.new, 
    Length = 3
});
local v5 = v0.MakeSequenceType({
    ValidateEach = v3, 
    TransformEach = tonumber, 
    Constructor = Vector2.new, 
    Length = 2
});
return function(v6) --[[ Line: 25 ]]
    -- upvalues: v4 (copy), v0 (copy), v5 (copy)
    v6:RegisterType("vector3", v4);
    v6:RegisterType("vector3s", v0.MakeListableType(v4));
    v6:RegisterType("vector2", v5);
    v6:RegisterType("vector2s", v0.MakeListableType(v5));
end;