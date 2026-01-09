local v0 = {
    None = newproxy()
};
v0.DeepFreeze = function(v1) --[[ Line: 14 ]] --[[ Name: DeepFreeze ]]
    -- upvalues: v0 (copy)
    table.freeze(v1);
    for _, v3 in v1 do
        if type(v3) == "table" then
            v0.DeepFreeze(v3);
        end;
    end;
    return v1;
end;
v0.DeepCopy = function(v4) --[[ Line: 25 ]] --[[ Name: DeepCopy ]]
    -- upvalues: v0 (copy)
    local v5 = table.clone(v4);
    for v6, v7 in v5 do
        if type(v7) == "table" then
            v5[v6] = v0.DeepCopy(v7);
        end;
    end;
    return v5;
end;
v0.Extend = function(v8, v9) --[[ Line: 37 ]] --[[ Name: Extend ]]
    -- upvalues: v0 (copy)
    local v10 = v0.DeepCopy(v8);
    for v11, v12 in v9 do
        if type(v12) == "table" then
            if type(v8[v11]) == "table" then
                v10[v11] = v0.Extend(v8[v11], v12);
            else
                v10[v11] = v0.DeepCopy(v12);
            end;
        elseif v12 == v0.None then
            v10[v11] = nil;
        else
            v10[v11] = v12;
        end;
    end;
    return v10;
end;
return v0;