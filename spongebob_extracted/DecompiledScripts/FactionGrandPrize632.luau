local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = v1.GetController("DataController");
local v8 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v8.Construct = function(v9) --[[ Line: 33 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy), v5 (copy)
    v9.dump = v3.new();
    v9.prizeUI = v9.Instance.ParadePresent_Top.Description.DescriptionBillboard;
    v9.neededLabel = v9.prizeUI.Requirements.FactionPointRequirement.Amount;
    v9.maxPointsNeeded = v5.FACTIONS.PLAYER.RequiredPoints;
    v9.dump:Add(function() --[[ Line: 42 ]]
        -- upvalues: v9 (copy)
        v9.dump = nil;
    end);
end;
v8.Start = function(v10) --[[ Line: 47 ]] --[[ Name: Start ]]
    -- upvalues: v7 (copy), v1 (copy), v6 (copy)
    v10.dump:Add(v7:OnChanged(v1.Player, "Faction", function(v11) --[[ Line: 48 ]]
        -- upvalues: v10 (copy), v6 (ref)
        local v12 = math.clamp(v11.TotalPoints or 0, 0, v10.maxPointsNeeded);
        v10.neededLabel.Text = ("%*/%*"):format(v6:CommaNumber(v12), (v6:CommaNumber(v10.maxPointsNeeded)));
    end, true));
end;
v8.Stop = function(v13) --[[ Line: 54 ]] --[[ Name: Stop ]]
    if v13.dump then
        v13.dump:Destroy();
    end;
end;
return v8;