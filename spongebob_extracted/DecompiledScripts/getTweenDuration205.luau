local _ = game:GetService("TweenService");
return function(v1) --[[ Line: 13 ]] --[[ Name: getTweenDuration ]]
    if v1.RepeatCount <= -1 then
        return 1e999;
    else
        local v2 = v1.DelayTime + v1.Time;
        if v1.Reverses then
            v2 = v2 + v1.Time;
        end;
        return v2 * (v1.RepeatCount + 1);
    end;
end;