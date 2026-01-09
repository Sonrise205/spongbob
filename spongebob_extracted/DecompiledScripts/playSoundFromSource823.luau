local l_SoundService_0 = game:GetService("SoundService");
local v1 = nil;
return function(v2, v3, v4) --[[ Line: 10 ]] --[[ Name: playSoundFromSource ]]
    -- upvalues: v1 (ref), l_SoundService_0 (copy)
    if not v1 then
        v1 = l_SoundService_0:FindFirstChild("Master"):FindFirstChild("SFX");
    end;
    if not v1 then
        return;
    else
        local v5 = v2:Clone();
        if v4 then
            v5.PlaybackSpeed = v5.PlaybackSpeed * v4;
        end;
        v5.SoundGroup = v1;
        v5.Parent = v3;
        v5:Play();
        v5.Ended:Once(function() --[[ Line: 29 ]]
            -- upvalues: v5 (copy)
            v5:Destroy();
        end);
        return;
    end;
end;