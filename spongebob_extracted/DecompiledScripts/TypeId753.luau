local v0 = {
    "nil", 
    "string", 
    "number", 
    "boolean", 
    "Vector2", 
    "Vector3", 
    "Vector2int16", 
    "Vector3int16", 
    "CFrame", 
    "array", 
    "dictionary", 
    "arrayRemovals", 
    "arrayAdditions", 
    "arrayChanges", 
    "arrayChangesRemovals", 
    "arrayChangesAdditions", 
    "dictionaryChanges", 
    "dictionaryRemovals", 
    "dictionaryRemovalsChanges"
};
local v1 = {};
for v2, v3 in v0 do
    v1[v3] = v2;
end;
return {
    isArrayDiff = function(v4) --[[ Line: 32 ]] --[[ Name: isArrayDiff ]]
        -- upvalues: v1 (copy)
        local v5 = true;
        if v4 ~= v1.arrayRemovals then
            v5 = true;
            if v4 ~= v1.arrayAdditions then
                v5 = true;
                if v4 ~= v1.arrayChanges then
                    v5 = true;
                    if v4 ~= v1.arrayChangesRemovals then
                        v5 = v4 == v1.arrayChangesAdditions;
                    end;
                end;
            end;
        end;
        return v5;
    end, 
    isDictionaryDiff = function(v6) --[[ Line: 40 ]] --[[ Name: isDictionaryDiff ]]
        -- upvalues: v1 (copy)
        local v7 = true;
        if v6 ~= v1.dictionaryChanges then
            v7 = true;
            if v6 ~= v1.dictionaryRemovals then
                v7 = v6 == v1.dictionaryRemovalsChanges;
            end;
        end;
        return v7;
    end, 
    toType = function(v8) --[[ Line: 46 ]] --[[ Name: toType ]]
        -- upvalues: v0 (copy)
        return v0[v8];
    end, 
    fromType = function(v9) --[[ Line: 50 ]] --[[ Name: fromType ]]
        -- upvalues: v1 (copy)
        return v1[v9];
    end
};