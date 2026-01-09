local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.FactionsUtil);
local v6 = v1.GetService("FactionService");
local v9 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v7) --[[ Line: 29 ]] --[[ Name: ShouldConstruct ]]
                local l_Attribute_0 = v7.Instance:GetAttribute("FactionId");
                if not l_Attribute_0 or l_Attribute_0 == 0 then
                    return false;
                else
                    return true;
                end;
            end
        }
    }
});
v9.Construct = function(v10) --[[ Line: 44 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v10.dump = v3.new();
    v10.factionId = v10.Instance:GetAttribute("FactionId");
    v10.ui = v10.Instance:WaitForChild("SurfaceGui", 10);
    v10.tierLabel = v10.ui:WaitForChild("PrestigeVisual", 10);
    v10.tierLabel = v10.tierLabel and v10.tierLabel:WaitForChild("Tier", 10);
    v10.dump:Add(function() --[[ Line: 54 ]]
        -- upvalues: v10 (copy)
        v10.dump = nil;
    end);
end;
v9.Start = function(v11) --[[ Line: 59 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy)
    v11.dump:Add(v6.FactionsProgress:Observe(function(v12) --[[ Line: 61 ]]
        -- upvalues: v11 (copy)
        v11.globalFactionsData = v12;
        v11:_update();
    end));
end;
v9.Stop = function(v13) --[[ Line: 67 ]] --[[ Name: Stop ]]
    if v13.dump then
        v13.dump:Destroy();
    end;
end;
v9._update = function(v14) --[[ Line: 75 ]] --[[ Name: _update ]]
    -- upvalues: v5 (copy)
    local l_v5_ShopTier_0 = v5:GetShopTier(v14.globalFactionsData[v14.factionId]);
    v14.tierLabel.Text = l_v5_ShopTier_0;
end;
return v9;