local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v5 = nil;
local v6 = v1.CreateController({
    Name = "UnitController", 
    Client = {}
});
v6.KnitInit = function(_) --[[ Line: 35 ]] --[[ Name: KnitInit ]]
    -- upvalues: v5 (ref), v1 (copy)
    v5 = v1.GetController("DataController");
end;
v6.KnitStart = function(_) --[[ Line: 40 ]] --[[ Name: KnitStart ]]

end;
v6.GetLoadout = function(_, v10) --[[ Line: 46 ]] --[[ Name: GetLoadout ]]
    -- upvalues: v5 (ref), v1 (copy)
    return v5:Get(v1.Player, "Loadout"):andThen(function(v11) --[[ Line: 47 ]]
        -- upvalues: v10 (copy)
        if v10 then
            return v11[v10];
        else
            return v11;
        end;
    end);
end;
v6.GetUnit = function(_, v13, v14) --[[ Line: 52 ]] --[[ Name: GetUnit ]]
    -- upvalues: v5 (ref), v1 (copy)
    return v5:Get(v1.Player, "Units"):andThen(function(v15) --[[ Line: 53 ]]
        -- upvalues: v13 (copy), v14 (copy)
        local v16 = v15[v13];
        if not v16 then
            return;
        else
            return v16[v14];
        end;
    end);
end;
v6.GetLoadoutUnit = function(v17, v18, v19) --[[ Line: 63 ]] --[[ Name: GetLoadoutUnit ]]
    -- upvalues: v4 (copy)
    return v17:GetLoadout(v18, v19):andThen(function(v20) --[[ Line: 64 ]]
        -- upvalues: v4 (ref), v17 (copy), v18 (copy)
        local v21, v22 = v4:ParseLoadout(v20);
        return v17:GetUnit(v18, v21, v22);
    end);
end;
return v6;