return function(v0, v1) --[[ Line: 13 ]] --[[ Name: isSimilar ]]
    local v2 = typeof(v0);
    local v3 = v2 == "table";
    local v4 = v2 == "userdata";
    local v5;
    if not v3 and not v4 then
        v5 = true;
        if v0 ~= v1 then
            v5 = false;
            if v0 ~= v0 then
                return v1 ~= v1;
            end;
        end;
    elseif v2 == typeof(v1) and (v4 or table.isfrozen(v0) or getmetatable(v0) ~= nil) then
        return v0 == v1;
    else
        v5 = false;
    end;
    return v5;
end;