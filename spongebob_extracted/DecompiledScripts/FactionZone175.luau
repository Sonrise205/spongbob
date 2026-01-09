local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v8 = v1.GetController("UIController");
local v9 = v1.GetController("DataController");
local _ = v1.GetController("PlaceTeleportController");
local _ = v1.GetService("FactionService");
local v12 = v1.GetController("FactionWorldController");
local v13 = nil;
local v14 = {};
for _, v16 in script:GetChildren() do
    v14[v16.Name] = require(v16);
end;
local v18 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v17) --[[ Line: 31 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v5 (copy)
                if not v17.Instance:GetAttribute("FactionId") then
                    v5:Warn("FactionZone:", v17.Instance:GetFullName(), "is missing a FactionId attribute");
                    return false;
                else
                    return true;
                end;
            end
        }
    }
});
v18.Construct = function(v19) --[[ Line: 48 ]] --[[ Name: Construct ]]
    -- upvalues: v2 (copy)
    v19.dumpster = v2.new();
end;
v18.Start = function(v20) --[[ Line: 52 ]] --[[ Name: Start ]]
    -- upvalues: v13 (ref), v8 (copy), v4 (copy), v9 (copy), v1 (copy), v12 (copy)
    v13 = v8:GetModuleAsync("MessagePrompt"):expect();
    v20.thisFactionId = v20.Instance:GetAttribute("FactionId");
    local v21 = v4.new(v20.Instance);
    v20.dumpster:Add(v21);
    v20.Instance.Transparency = 1;
    v20.factionData = v9:Get(v1.Player, "Faction"):expect();
    v9:OnChanged(v1.Player, "Faction", function(v22) --[[ Line: 69 ]]
        -- upvalues: v20 (copy)
        v20.factionData = v22;
        if not v20.factionData or v20.factionData and v20.factionData.Id ~= v20.thisFactionId then
            v20.Instance:PivotTo(v20.Instance:GetAttribute("Hidden"));
            return;
        else
            v20.Instance:PivotTo(v20.Instance:GetAttribute("Shown"));
            return;
        end;
    end, true);
    v21.localPlayerEntered:Connect(function() --[[ Line: 79 ]]
        -- upvalues: v20 (copy), v12 (ref)
        if not v20.factionData or v20.factionData and v20.factionData.Id ~= v20.thisFactionId then
            return;
        else
            v12:EnterClubhouse();
            return;
        end;
    end);
end;
v18.Stop = function(v23) --[[ Line: 108 ]] --[[ Name: Stop ]]
    v23.dumpster:Destroy();
end;
return v18;