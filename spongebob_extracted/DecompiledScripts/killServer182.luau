return function(_, v1) --[[ Line: 1 ]]
    for _, v3 in pairs(v1) do
        if v3.Character then
            v3.Character:BreakJoints();
        end;
    end;
    return ("Killed %d players."):format(#v1);
end;