local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = v3.new({
    Tag = "LevelWall", 
    Ancestors = {
        workspace
    }
});
local function v13(v8, v9, v10) --[[ Line: 21 ]] --[[ Name: SetWallProps ]]
    for _, v12 in v8:GetDescendants() do
        if v12:IsA("BasePart") then
            v12.Transparency = 1;
            v12.CanCollide = v9;
        end;
        if v12.Name == "LevelRequirement" then
            if v10 then
                v12.Text = string.upper("REACH LEVEL " .. tostring(v10));
            else
                v12:Destroy();
            end;
        end;
    end;
end;
v7.Construct = function(v14) --[[ Line: 38 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v14.Dumpster = v4.new();
    v14._CollisionSetup = false;
end;
v7.Start = function(v15) --[[ Line: 43 ]] --[[ Name: Start ]]
    -- upvalues: v2 (copy), v13 (copy), v5 (copy), l_LocalPlayer_0 (copy)
    local l_Attribute_0 = v15.Instance:GetAttribute("LvReqReference");
    if not l_Attribute_0 then
        warn("[LevelWall]: 'LvReqReference' attribute not set on instance:", v15.Instance, "| Defaulting to '_DEFAULT'.");
        l_Attribute_0 = "_DEFAULT";
    end;
    local v17 = v2.LevelRequirements[l_Attribute_0] or v2.LevelRequirements._DEFAULT;
    v13(v15.Instance, false, v17);
    v5.GetController("DataController"):OnChanged(l_LocalPlayer_0, {
        "PlayerStats"
    }, function(v18) --[[ Line: 54 ]]
        -- upvalues: v17 (copy), v15 (copy), v13 (ref)
        if v18.Prestige > 0 or v18.Level >= v17 then
            v15.Instance:Destroy();
            return;
        else
            if not v15._CollisionSetup then
                v15._CollisionSetup = true;
                v13(v15.Instance, true, v17);
            end;
            return;
        end;
    end, true);
end;
v7.Stop = function(v19) --[[ Line: 64 ]] --[[ Name: Stop ]]
    v19.Dumpster:Destroy();
end;
return v7;