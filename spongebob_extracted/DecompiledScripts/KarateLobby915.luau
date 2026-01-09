local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit).GetController("PlaceTeleportController");
return {
    Speaker = "MasterUdon", 
    Props = {
        Dialog = "Would you like to travel to Karate Island?", 
        Options = {
            {
                Text = "Yes", 
                Callback = function() --[[ Line: 14 ]] --[[ Name: Callback ]]
                    -- upvalues: v1 (copy)
                    v1:Teleport("KarateLobby");
                end
            }, 
            {
                Text = "No"
            }
        }
    }
};