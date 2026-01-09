return function(v0, v1) --[[ Line: 7 ]] --[[ Name: isSimilar ]]
    if typeof(v0) == "table" then
        return false;
    else
        return v0 == v1;
    end;
end;