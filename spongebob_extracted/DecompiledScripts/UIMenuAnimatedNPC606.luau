local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(v2.Player.PlayerScripts.Knit.Modules.ClientAnimator);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v6 = v3.new();
    local function _(v7) --[[ Line: 12 ]] --[[ Name: npcAdded ]]
        -- upvalues: v4 (ref), v6 (copy)
        local l_Name_0 = v7.Name;
        local v9 = v4.new(l_Name_0, v7, "Friendlies");
        if v9 then
            v9:Play(v7:GetAttribute("Animation") or "Idle");
            v6:Add(v9);
        end;
    end;
    for _, v12 in v5:GetDescendants() do
        if v12:IsA("ViewportFrame") then
            local l_WorldModel_0 = v12:FindFirstChildOfClass("WorldModel");
            if l_WorldModel_0 and not l_WorldModel_0:GetAttribute("UnitViewport") then
                for _, v15 in l_WorldModel_0:GetChildren() do
                    if v15:IsA("Model") then
                        local l_Name_1 = v15.Name;
                        local v17 = v4.new(l_Name_1, v15, "Friendlies");
                        if v17 then
                            v17:Play(v15:GetAttribute("Animation") or "Idle");
                            v6:Add(v17);
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v6;
end;