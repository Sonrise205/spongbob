local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local l_Upgrades_0 = l_ReplicatedStorage_0.VFX.Towers.Upgrades;
local v8 = {};
local v10 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v9) --[[ Line: 23 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v2 (copy)
                return v9.Instance:GetAttribute("OwnerId") == v2.Player.UserId;
            end
        }
    }
});
v10.Construct = function(v11) --[[ Line: 29 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v11.dumpster = v3.new();
end;
v10.Start = function(v12) --[[ Line: 33 ]] --[[ Name: Start ]]
    -- upvalues: l_Upgrades_0 (copy), v8 (copy), v5 (copy)
    local l_Instance_0 = v12.Instance;
    if not v12.Instance or not v12.Instance.Parent then
        return;
    elseif l_Instance_0:GetAttribute("BossBattle") then
        return;
    else
        local l_l_Instance_0_Attribute_0 = l_Instance_0:GetAttribute("Origin");
        local l_l_Instance_0_Attribute_1 = l_Instance_0:GetAttribute("UpgradeOffset");
        local function v22() --[[ Line: 46 ]] --[[ Name: showUpgrade ]]
            -- upvalues: l_Instance_0 (copy), l_Upgrades_0 (ref), v8 (ref), v5 (ref), l_l_Instance_0_Attribute_0 (copy), l_l_Instance_0_Attribute_1 (copy)
            local l_l_Instance_0_Attribute_2 = l_Instance_0:GetAttribute("Upgrade");
            if not l_l_Instance_0_Attribute_2 then
                return;
            else
                if l_l_Instance_0_Attribute_2 == l_Instance_0:GetAttribute("MaxUpgrades") then
                    l_l_Instance_0_Attribute_2 = 5;
                end;
                local l_l_Upgrades_0_FirstChild_0 = l_Upgrades_0:FindFirstChild(l_l_Instance_0_Attribute_2);
                if not l_l_Upgrades_0_FirstChild_0 then
                    return;
                else
                    local v18 = v8[l_Instance_0];
                    if v18 then
                        v18:Destroy();
                    end;
                    l_l_Upgrades_0_FirstChild_0 = l_l_Upgrades_0_FirstChild_0:Clone();
                    l_l_Upgrades_0_FirstChild_0.Name = "UpgradeVFX";
                    l_l_Upgrades_0_FirstChild_0.CollisionGroup = "Friendlies";
                    local l_VisualModel_0 = l_Instance_0.VisualModel;
                    local l_l_VisualModel_0_Attribute_0 = l_VisualModel_0:GetAttribute("UpgradeCircleScale");
                    if l_VisualModel_0 and l_l_VisualModel_0_Attribute_0 then
                        l_l_Upgrades_0_FirstChild_0.Size = l_l_Upgrades_0_FirstChild_0.Size * l_l_VisualModel_0_Attribute_0;
                    end;
                    l_l_Upgrades_0_FirstChild_0:FindFirstChildOfClass("SurfaceGui").ZOffset = 3;
                    l_l_VisualModel_0_Attribute_0 = l_l_Upgrades_0_FirstChild_0.Size;
                    if l_Instance_0:GetAttribute("Mega") then
                        l_l_Upgrades_0_FirstChild_0.Size = Vector3.new(l_l_VisualModel_0_Attribute_0.X * v5.TOWERS.MEGA_SCALE, l_l_VisualModel_0_Attribute_0.Y, l_l_VisualModel_0_Attribute_0.Z * v5.TOWERS.MEGA_SCALE);
                    end;
                    local v21 = l_l_Instance_0_Attribute_0 - Vector3.new(0, l_l_VisualModel_0_Attribute_0.Y / 2, 0);
                    if l_l_Instance_0_Attribute_1 then
                        v21 = v21 + l_l_Instance_0_Attribute_1;
                    end;
                    l_l_Upgrades_0_FirstChild_0.CFrame = v21;
                    l_l_Upgrades_0_FirstChild_0.Parent = l_Instance_0;
                    v8[l_Instance_0] = l_l_Upgrades_0_FirstChild_0;
                    return;
                end;
            end;
        end;
        v22();
        v12.dumpster:Add(l_Instance_0:GetAttributeChangedSignal("Upgrade"):Connect(v22));
        return;
    end;
end;
v10.Stop = function(v23) --[[ Line: 107 ]] --[[ Name: Stop ]]
    -- upvalues: v8 (copy)
    v23.dumpster:Destroy();
    local v24 = v8[v23.Instance];
    if v24 then
        v24:Destroy();
        v8[v23.Instance] = nil;
    end;
end;
v2.OnStart():andThen(function() --[[ Line: 117 ]]
    -- upvalues: l_RunService_0 (copy), v8 (copy)
    l_RunService_0.RenderStepped:Connect(function(v25) --[[ Line: 118 ]]
        -- upvalues: v8 (ref)
        for _, v27 in v8 do
            v27.CFrame = v27.CFrame * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), 1.3962634015954636 * v25);
        end;
    end);
end);
return v10;