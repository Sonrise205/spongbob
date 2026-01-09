local l_TeleportService_0 = game:GetService("TeleportService");
return function(v1, v2, v3, v4) --[[ Line: 3 ]]
    -- upvalues: l_TeleportService_0 (copy)
    v2 = v2 or {
        v1.Executor
    };
    if v3 <= 0 then
        return "Invalid place ID";
    elseif v4 == "-" then
        return "Invalid job ID";
    else
        v1:Reply("Commencing teleport...");
        if v4 then
            for _, v6 in ipairs(v2) do
                l_TeleportService_0:TeleportToPlaceInstance(v3, v4, v6);
            end;
        else
            l_TeleportService_0:TeleportAsync(v3, v2);
        end;
        return "Teleported.";
    end;
end;