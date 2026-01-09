return function(v0) --[[ Line: 11 ]] --[[ Name: Safe ]]
    local _, v2 = xpcall(v0.try, v0.fallback);
    return v2;
end;