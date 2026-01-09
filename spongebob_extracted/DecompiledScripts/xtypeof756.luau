return function(v0) --[[ Line: 9 ]] --[[ Name: xtypeof ]]
    local v1 = typeof(v0);
    if v1 == "table" and typeof(v0.type) == "string" then
        return v0.type;
    else
        return v1;
    end;
end;