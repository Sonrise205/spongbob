return function() --[[ Line: 1 ]]
    local v0 = tonumber(os.date("%w"));
    local v1 = 0;
    if v0 ~= 7 then
        v1 = v0;
    end;
    local v2 = tonumber(os.date("%m"));
    local v3 = tonumber(os.date("%d"));
    if v2 > 3 and v2 < 11 or v2 == 3 and v3 >= 8 and (v1 == 0 or v3 >= 14) or v2 == 11 and v3 < 7 and v1 > 0 then
        return true;
    else
        return false;
    end;
end;