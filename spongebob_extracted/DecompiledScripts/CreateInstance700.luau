return function(v0, v1) --[[ Line: 1 ]]
    local v2 = Instance.new(v0);
    local l_Parent_0 = v1.Parent;
    if v1.Parent then
        v1.Parent = nil;
    end;
    for v4, v5 in v1 do
        v2[v4] = v5;
    end;
    if l_Parent_0 then
        v2.Parent = l_Parent_0;
    end;
    return v2;
end;