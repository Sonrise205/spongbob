local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = v3.new({
    Tag = "NPEPlayerSpawner", 
    Ancestors = {
        workspace
    }
});
v7.TeleportToSpawn = function(v8, v9, v10) --[[ Line: 21 ]] --[[ Name: TeleportToSpawn ]]
    local v11 = v9:WaitForChild("HumanoidRootPart", 5);
    if v11 then
        local l_SpawnPoint_0 = v8.Instance.SpawnPoint;
        v11:PivotTo(l_SpawnPoint_0:GetPivot());
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v14 = v10 or v8.Instance.PlayCamTarget;
        local v15 = v14.Position - l_SpawnPoint_0.Position - Vector3.new(0, 6, 0, 0);
        local l_Position_0 = ((l_SpawnPoint_0.CFrame + Vector3.new(0, 6, 0, 0)) * CFrame.new(0, 0, -10)).Position;
        l_CurrentCamera_0.CFrame = CFrame.new(l_Position_0, l_Position_0 + v15);
        v11:PivotTo(CFrame.lookAt(l_SpawnPoint_0.Position, v14.Position));
    end;
end;
v7.Construct = function(v17) --[[ Line: 38 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v17.Dumpster = v4.new();
    v17._ConnectionSetup = false;
end;
v7.Start = function(v18) --[[ Line: 43 ]] --[[ Name: Start ]]
    -- upvalues: v5 (copy), v2 (copy), l_LocalPlayer_0 (copy)
    for _, v20 in (v18.Instance:GetDescendants()) do
        if v20:IsA("BasePart") then
            v20.Transparency = 1;
        end;
    end;
    local v21 = v5.GetController("DataController");
    local v22 = v5.GetController("NPEController");
    local v23 = v18.Instance:WaitForChild("SummonCamTarget", 2);
    v21:OnChanged(v5.Player, "NPEStage", function(v24) --[[ Line: 56 ]]
        -- upvalues: v22 (copy), v2 (ref), v18 (copy), l_LocalPlayer_0 (ref), v21 (copy), v5 (ref), v23 (copy)
        if v22:IsInNPE() and v24 < v2.NPE.FINISHED_STAGE and not v18._ConnectionSetup then
            v18._ConnectionSetup = true;
            v18.Dumpster:Add(l_LocalPlayer_0.CharacterAdded:Connect(function(v25) --[[ Line: 59 ]]
                -- upvalues: v21 (ref), v5 (ref), v18 (ref), v23 (ref)
                local v26 = v21:Get(v5.Player, "NPEStage");
                v18:TeleportToSpawn(v25, if v26 == 7 then v23 else nil);
            end));
            if l_LocalPlayer_0.Character then
                v18:TeleportToSpawn(l_LocalPlayer_0.Character, if v24 == 7 then v23 else nil);
            end;
        end;
    end, true);
end;
v7.Stop = function(v27) --[[ Line: 70 ]] --[[ Name: Stop ]]
    v27.Dumpster:Destroy();
end;
return v7;