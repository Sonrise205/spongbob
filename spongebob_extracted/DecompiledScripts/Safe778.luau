local _ = script.Parent.Parent;
return function(v1) --[[ Line: 13 ]] --[[ Name: Safe ]]
    local _, v3 = xpcall(v1.try, v1.fallback);
    return v3;
end;