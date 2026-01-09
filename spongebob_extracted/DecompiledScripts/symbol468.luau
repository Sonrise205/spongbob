return function(v0) --[[ Line: 45 ]] --[[ Name: Symbol ]]
    local v1 = newproxy(true);
    if not v0 then
        v0 = "";
    end;
    getmetatable(v1).__tostring = function() --[[ Line: 50 ]]
        -- upvalues: v0 (ref)
        return "Symbol(" .. v0 .. ")";
    end;
    return v1;
end;