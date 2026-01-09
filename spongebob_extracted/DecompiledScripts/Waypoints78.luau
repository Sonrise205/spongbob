local v12 = {
    fromVector3 = function(...) --[[ Line: 18 ]] --[[ Name: fromVector3 ]]
        local v0 = {
            ...
        };
        local v1 = {};
        for v2 = 1, #v0 do
            assert(typeof(v0[v2]) == "Vector3", tostring(v0[v2]) .. "is not a Vector3 value.");
            table.insert(v1, v0[v2]);
        end;
        return v1;
    end, 
    fromCFrame = function(...) --[[ Line: 28 ]] --[[ Name: fromCFrame ]]
        local v3 = {
            ...
        };
        local v4 = {};
        for v5 = 1, #v3 do
            assert(typeof(v3[v5]) == "CFrame", v3[v5] .. "is not a CFrame value.");
            table.insert(v4, v3[v5].Position);
        end;
        return v4;
    end, 
    fromInstance = function(...) --[[ Line: 38 ]] --[[ Name: fromInstance ]]
        local v6 = {
            ...
        };
        local v7 = {};
        for v8 = 1, #v6 do
            assert(typeof(v6[v8]) == "Instance", v6[v8].Name .. "is not an Instance.");
            assert(v6[v8]:IsA("BasePart"), v6[v8].Name .. "is not a BasePart.");
            table.insert(v7, v6[v8].Position);
        end;
        return v7;
    end, 
    fromUDim2 = function(...) --[[ Line: 49 ]] --[[ Name: fromUDim2 ]]
        local v9 = {
            ...
        };
        local v10 = {};
        for v11 = 1, #v9 do
            assert(typeof(v9[v11]) == "UDim2", tostring(v9[v11]) .. "is not a UDim2 value.");
            table.insert(v10, v9[v11]);
        end;
        return v10;
    end
};
local v13 = {
    Vector3 = v12.fromVector3, 
    CFrame = v12.fromCFrame, 
    Instance = v12.fromInstance, 
    UDim2 = v12.fromUDim2
};
v12.new = function(...) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    assert(v13[typeof(...)], "Parameters are not correct value types, try using value specific functions.");
    return v13[typeof(...)](...);
end;
return v12;