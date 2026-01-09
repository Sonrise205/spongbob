local l_TextService_0 = game:GetService("TextService");
local l_Players_0 = game:GetService("Players");
local l_Chat_0 = game:GetService("Chat");
return function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: l_TextService_0 (copy), l_Players_0 (copy), l_Chat_0 (copy)
    local v5 = l_TextService_0:FilterStringAsync(v4, v3.Executor.UserId, Enum.TextFilterContext.PublicChat);
    for _, v7 in ipairs(l_Players_0:GetPlayers()) do
        if l_Chat_0:CanUsersChatAsync(v3.Executor.UserId, v7.UserId) then
            v3:SendEvent(v7, "Message", v5:GetChatForUserAsync(v7.UserId), v3.Executor);
        end;
    end;
    return "Created announcement.";
end;