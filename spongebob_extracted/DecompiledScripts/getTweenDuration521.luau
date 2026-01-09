return function(v0) --[[ Line: 11 ]] --[[ Name: getTweenDuration ]]
    if v0.RepeatCount <= -1 then
        return 1e999;
    else
        local v1 = v0.DelayTime + v0.Time;
        if v0.Reverses then
            v1 = v1 + v0.Time;
        end;
        return v1 * (v0.RepeatCount + 1);
    end;
end;