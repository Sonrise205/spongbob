local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit).GetController("PlaceTeleportController");
return {
    Speaker = "Patrick", 
    Props = {
        Dialog = "Want to go to AFK Mode? Earn an Epic+ Chest every 5 minutes! There's a chance for the (Limited) Gorilla Man Unit to drop too!", 
        Options = {
            {
                Text = "Yes", 
                Callback = function() --[[ Line: 14 ]] --[[ Name: Callback ]]
                    -- upvalues: v1 (copy)
                    v1:Teleport("AFK");
                end
            }, 
            {
                Text = "No"
            }
        }
    }
};