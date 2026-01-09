local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedFirst_0.PlaceIds);
local v4 = v2.GetController("UIController");
local v5 = v2.GetController("FastTravelController");
local v6 = v2.GetService("PlaceTeleportService");
return {
    Init = function(v7, v8) --[[ Line: 14 ]] --[[ Name: Init ]]
        v7.frame = v8;
    end, 
    Start = function(v9) --[[ Line: 18 ]] --[[ Name: Start ]]
        -- upvalues: v4 (copy), v3 (copy), v6 (copy), v5 (copy)
        local v10 = v4:GetModuleAsync("MessagePrompt"):expect();
        v4:HandleButton(v9.frame.Teleport.Confirm, function() --[[ Line: 21 ]]
            -- upvalues: v3 (ref), v10 (copy), v6 (ref), v4 (ref), v5 (ref)
            if v3:IsTrading() then
                v10:Prompt({
                    message = "Are you sure you want to teleport to the Lobby?", 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 28 ]] --[[ Name: callback ]]
                                -- upvalues: v6 (ref), v4 (ref)
                                v6:Teleport("Lobby");
                                v4:Toggle(script.Name, false);
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
                v4:Toggle("KampKoralEvent", false);
                return;
            else
                v5:Travel("Play");
                v4:Toggle("KampKoralEvent", false);
                return;
            end;
        end);
    end
};