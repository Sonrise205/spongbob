return function(_, v1) --[[ Line: 1 ]]
    for _, v3 in pairs(v1) do
        v3:Kick("Kicked by admin.");
    end;
    return ("Kicked %d players."):format(#v1);
end;