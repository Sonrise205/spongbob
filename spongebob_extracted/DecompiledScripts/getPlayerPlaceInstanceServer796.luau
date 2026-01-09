local l_TeleportService_0 = game:GetService("TeleportService");
return function(_, v2, v3) --[[ Line: 3 ]]
    -- upvalues: l_TeleportService_0 (copy)
    v3 = v3 or "PlaceIdJobId";
    local v4, _, v6, v7, v8 = pcall(function() --[[ Line: 6 ]]
        -- upvalues: l_TeleportService_0 (ref), v2 (copy)
        return l_TeleportService_0:GetPlayerPlaceInstanceAsync(v2);
    end);
    if not v4 or v6 and #v6 > 0 then
        if v3 == "PlaceIdJobId" then
            return "0 -";
        elseif v3 == "PlaceId" then
            return "0";
        elseif v3 == "JobId" then
            return "-";
        end;
    end;
    if v3 == "PlaceIdJobId" then
        return v7 .. " " .. v8;
    elseif v3 == "PlaceId" then
        return (tostring(v7));
    elseif v3 == "JobId" then
        return (tostring(v8));
    else
        return;
    end;
end;