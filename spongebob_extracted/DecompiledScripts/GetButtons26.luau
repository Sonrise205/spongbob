return function(v0, v1, v2, v3) --[[ Line: 1 ]]
    assert(typeof(v0) == "Instance", "Object must be an Instance");
    local v4 = {};
    for _, v6 in v0:GetChildren() do
        if v6:IsA("GuiButton") and (v1 == nil or v1(v6)) then
            if v2 and typeof(v2) == "function" then
                v2(v6);
            end;
            if v3 then
                v4[v6.Name] = v6;
            else
                table.insert(v4, v6);
            end;
        end;
    end;
    return v4;
end;