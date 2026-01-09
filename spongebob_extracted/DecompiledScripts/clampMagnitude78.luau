return function(v0, v1) --[[ Line: 5 ]] --[[ Name: clampMagnitude ]]
    if v1 < v0.Magnitude then
        return v0.Unit * v1;
    else
        return v0;
    end;
end;