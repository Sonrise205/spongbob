local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v7 = v1.GetController("UIController");
local _ = v1.GetController("DataController");
local v9 = v1.GetController("PlaceTeleportController");
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = nil;
local v12 = {};
for _, v14 in script:GetChildren() do
    v12[v14.Name] = require(v14);
end;
local v18 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v15) --[[ Line: 28 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v5 (copy), v12 (copy)
                local l_Attribute_0 = v15.Instance:GetAttribute("Dialogue");
                if not l_Attribute_0 then
                    v5:Warn("DialogueZone:", v15.Instance:GetFullName(), "is missing a Dialogue attribute");
                    return false;
                else
                    local v17 = v12[l_Attribute_0];
                    if l_Attribute_0 ~= "Trading" and not v17 then
                        v5:Warn("DialogueZone:", v15.Instance:GetFullName(), "is missing a Dialogue script");
                        return false;
                    else
                        return true;
                    end;
                end;
            end
        }
    }
});
v18.Construct = function(v19) --[[ Line: 56 ]] --[[ Name: Construct ]]
    -- upvalues: v2 (copy)
    v19.dumpster = v2.new();
end;
v18.Start = function(v20) --[[ Line: 60 ]] --[[ Name: Start ]]
    -- upvalues: v11 (ref), v7 (copy), v12 (copy), v4 (copy), v9 (copy)
    if not v11 then
        v11 = v7:GetModuleAsync("Dialog"):expect();
    end;
    local l_Attribute_1 = v20.Instance:GetAttribute("Dialogue");
    local v22 = v12[l_Attribute_1];
    local v23 = v4.new(v20.Instance);
    v20.dumpster:Add(v23);
    v23.localPlayerEntered:Connect(function() --[[ Line: 71 ]]
        -- upvalues: l_Attribute_1 (copy), v11 (ref), v9 (ref), v20 (copy), v22 (copy)
        if l_Attribute_1 == "Trading" then
            v11:Prompt("FlyingDutchman", {
                Dialog = "Would you like to board my ship to trade with other players?", 
                Animation = "Walk", 
                Options = {
                    {
                        Text = "Yes", 
                        Callback = function() --[[ Line: 92 ]] --[[ Name: Callback ]]
                            -- upvalues: v9 (ref)
                            v9:Teleport("Trading");
                        end
                    }, 
                    {
                        Text = "No"
                    }
                }
            });
            return;
        else
            local v24 = v20.Instance:GetAttribute("NPCName") or v22.Speaker;
            v11:Prompt(v24, v22.Props);
            return;
        end;
    end);
    v23.localPlayerExited:Connect(function() --[[ Line: 107 ]]
        -- upvalues: v7 (ref)
        v7:Toggle("Dialog", false);
    end);
end;
v18.Stop = function(v25) --[[ Line: 112 ]] --[[ Name: Stop ]]
    v25.dumpster:Destroy();
end;
return v18;