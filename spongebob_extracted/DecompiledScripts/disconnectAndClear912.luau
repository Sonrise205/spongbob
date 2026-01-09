return function(v0) --[[ Line: 5 ]] --[[ Name: disconnectAndClear ]]
    for _, v2 in v0 do
        v2:Disconnect();
    end;
    table.clear(v0);
end;