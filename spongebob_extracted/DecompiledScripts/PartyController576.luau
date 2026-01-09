local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedFirst_0.PlaceIds);
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = v2.CreateController({
    Name = script.Name, 
    Client = {}
});
v7.KnitInit = function(_) --[[ Line: 28 ]] --[[ Name: KnitInit ]]
    -- upvalues: v4 (ref), v2 (copy), v5 (ref)
    v4 = v2.GetService("PartyService");
    v5 = v2.GetController("UIController");
end;
v7.KnitStart = function(_) --[[ Line: 34 ]] --[[ Name: KnitStart ]]
    -- upvalues: v3 (copy), v6 (ref), v5 (ref), v4 (ref), v2 (copy)
    if v3:IsAFK() then
        return;
    else
        v6 = v5:GetModuleAsync("PartyInbound"):expect();
        v4.PartyInviteRecieved:Connect(function(v10, v11) --[[ Line: 41 ]]
            -- upvalues: v5 (ref), v6 (ref), v4 (ref)
            if v5:GetToggleState("Summon") == true then
                return;
            else
                v6:Prompt({
                    message = ("Party Invite from @%*"):format(v11.Name), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 51 ]] --[[ Name: callback ]]
                                -- upvalues: v4 (ref), v10 (copy)
                                v4:AcceptPartyInvite(v10);
                            end
                        }, 
                        {
                            text = "No", 
                            callback = function() --[[ Line: 57 ]] --[[ Name: callback ]]
                                -- upvalues: v4 (ref), v10 (copy)
                                v4:DeclinePartyInvite(v10);
                            end
                        }
                    }
                });
                task.delay(10, function() --[[ Line: 64 ]]
                    -- upvalues: v5 (ref)
                    v5:Toggle("PartyInbound", false);
                end);
                return;
            end;
        end);
        v4.PartyLeaderEnteredQueue:Connect(function(v12) --[[ Line: 70 ]]
            -- upvalues: v6 (ref), v2 (ref), v5 (ref)
            v6:Prompt({
                message = "Party leader has entered the queue. Would you like to join?", 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 76 ]] --[[ Name: callback ]]
                            -- upvalues: v2 (ref), v12 (copy)
                            if not v2.Player.Character then
                                return;
                            else
                                v2.Player.Character:PivotTo(v12);
                                return;
                            end;
                        end
                    }, 
                    {
                        text = "No"
                    }
                }
            });
            task.delay(10, function() --[[ Line: 90 ]]
                -- upvalues: v5 (ref)
                v5:Toggle("PartyInbound", false);
            end);
        end);
        v4.PartyLeaderTeleporting:Connect(function(v13, v14) --[[ Line: 95 ]]
            -- upvalues: v6 (ref), v4 (ref), v5 (ref)
            v6:Prompt({
                message = ("Party leader is going to %*. Would you like to go with the party?"):format(v13), 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 101 ]] --[[ Name: callback ]]
                            -- upvalues: v4 (ref)
                            v4:AcceptTeleport();
                        end
                    }, 
                    {
                        text = "No"
                    }
                }, 
                messageTime = v14
            });
            task.delay(10, function() --[[ Line: 112 ]]
                -- upvalues: v5 (ref)
                v5:Toggle("PartyInbound", false);
            end);
        end);
        v4.PartyPromptSimple:Connect(function(v15, v16) --[[ Line: 117 ]]
            -- upvalues: v6 (ref)
            v6:Prompt({
                message = v15, 
                options = {
                    {
                        text = "Okay"
                    }
                }, 
                messageTime = v16
            });
        end);
        v2.Player:GetAttributeChangedSignal("PARTY_ID"):Connect(function() --[[ Line: 129 ]]
            -- upvalues: v5 (ref)
            v5:Toggle("PartyInbound", false);
        end);
        return;
    end;
end;
return v7;