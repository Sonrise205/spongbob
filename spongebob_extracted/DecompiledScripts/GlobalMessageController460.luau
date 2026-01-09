local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TextChatService_0 = game:GetService("TextChatService");
local _ = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = v4.CreateController({
    Name = script.Name
});
v11.KnitInit = function(_) --[[ Line: 34 ]] --[[ Name: KnitInit ]]
    -- upvalues: v8 (ref), v4 (copy), v9 (ref)
    v8 = v4.GetController("DataController");
    v9 = v4.GetService("GlobalMessageService");
end;
v11.KnitStart = function(_) --[[ Line: 40 ]] --[[ Name: KnitStart ]]
    -- upvalues: v7 (copy), v10 (ref), l_TextChatService_0 (copy), v9 (ref)
    if v7:IsAFK() or v7:IsGame() then
        return;
    else
        v10 = l_TextChatService_0:WaitForChild("TextChannels"):WaitForChild("RBXSystem");
        v9.GlobalMessageRecieved:Connect(function(v14) --[[ Line: 47 ]]
            -- upvalues: v10 (ref)
            local l_message_0 = v14.message;
            if not l_message_0 then
                return;
            else
                v10:DisplaySystemMessage(l_message_0);
                return;
            end;
        end);
        return;
    end;
end;
return v11;