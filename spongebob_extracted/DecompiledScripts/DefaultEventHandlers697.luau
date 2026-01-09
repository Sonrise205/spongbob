local l_StarterGui_0 = game:GetService("StarterGui");
local l_TextChatService_0 = game:GetService("TextChatService");
local v2 = require(script.Parent.CmdrInterface.Window);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: l_TextChatService_0 (copy), l_StarterGui_0 (copy), v2 (copy)
    v3:HandleEvent("Message", function(v4) --[[ Line: 6 ]]
        -- upvalues: l_TextChatService_0 (ref), l_StarterGui_0 (ref)
        if l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService then
            l_StarterGui_0:SetCore("ChatMakeSystemMessage", {
                Text = ("[Announcement] %s"):format(v4), 
                Color = Color3.fromRGB(249, 217, 56)
            });
            return;
        else
            l_TextChatService_0.TextChannels.RBXSystem:DisplaySystemMessage((("<font color=\"rgb(249, 217, 56)\">[Announcement] %*</font>"):format(v4)));
            return;
        end;
    end);
    v3:HandleEvent("AddLine", function(...) --[[ Line: 19 ]]
        -- upvalues: v2 (ref)
        v2:AddLine(...);
    end);
end;