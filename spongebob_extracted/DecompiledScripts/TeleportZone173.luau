local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v7 = require(l_ReplicatedFirst_0.PlaceIds);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = v2.GetController("PlaceTeleportController");
local v10 = v2.GetController("UIController");
local v11 = require(v2.Player.PlayerScripts.Knit.Controllers.UIController.GuiModules.MessagePrompt);
local v13 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v12) --[[ Line: 22 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v6 (copy)
                if not (v12.Instance:GetAttribute("Destination") ~= nil) then
                    v6:Warn("TeleportZone:", v12.Instance:GetFullName(), "is missing a Destination attribute");
                    return false;
                else
                    return true;
                end;
            end
        }
    }
});
v13.Construct = function(v14) --[[ Line: 39 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v14.dumpster = v3.new();
end;
v13.Start = function(v15) --[[ Line: 43 ]] --[[ Name: Start ]]
    -- upvalues: v7 (copy), v5 (copy), v2 (copy), v8 (copy), v11 (copy), v9 (copy), v10 (copy)
    local l_Attribute_0 = v15.Instance:GetAttribute("Destination");
    local v17 = v7:GetDestinationPrompt(l_Attribute_0) or ("Would you like to teleport to %*?"):format(l_Attribute_0);
    local v18 = v5.new(v15.Instance);
    v15.dumpster:Add(v18);
    v18.localPlayerEntered:Connect(function() --[[ Line: 50 ]]
        -- upvalues: v2 (ref), v8 (ref), v11 (ref), v17 (copy), v9 (ref), l_Attribute_0 (copy)
        if v2.Player:GetAttribute(v8.TRADING.ATTRIBUTE) then
            return;
        else
            v11:Prompt({
                message = v17, 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 60 ]] --[[ Name: callback ]]
                            -- upvalues: v9 (ref), l_Attribute_0 (ref)
                            v9:Teleport(l_Attribute_0);
                        end
                    }, 
                    {
                        text = "No"
                    }
                }
            });
            return;
        end;
    end);
    v18.localPlayerExited:Connect(function() --[[ Line: 69 ]]
        -- upvalues: v10 (ref)
        v10:Toggle("MessagePrompt", false);
    end);
end;
v13.Stop = function(v19) --[[ Line: 74 ]] --[[ Name: Stop ]]
    v19.dumpster:Destroy();
end;
return v13;