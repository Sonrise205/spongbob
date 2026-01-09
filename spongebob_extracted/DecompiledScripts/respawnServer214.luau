return function(_, v1) --[[ Line: 1 ]]
    for _, v3 in pairs(v1) do
        if v3.Character then
            v3:LoadCharacter();
        end;
    end;
    return ("Respawned %d players."):format(#v1);
end;