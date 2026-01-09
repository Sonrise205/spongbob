local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v7 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v8 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.GlovesData);
local v9 = require(l_ReplicatedFirst_0.PlaceIds);
local v10 = nil;
local v11 = nil;
local _ = nil;
local _ = nil;
local v14 = {};
if l_RunService_0:IsServer() and (v9:IsGame() or v9:GetDestination() == "KarateLobby") then
    for _, v16 in l_ServerStorage_0.Assets.TowerOfKarate.Gloves:GetChildren() do
        v14[v16.Name] = v16;
    end;
end;
local v17 = {};
local v19 = {
    GetGlovesModel = function(v18) --[[ Line: 39 ]] --[[ Name: GetGlovesModel ]]
        -- upvalues: l_RunService_0 (copy), v14 (copy)
        if not l_RunService_0:IsServer() then
            return;
        else
            assert(typeof(v18) == "string", "ReferenceName must be a string");
            return v14[v18];
        end;
    end
};
v19.ApplyGloves = function(v20, v21, v22) --[[ Line: 48 ]] --[[ Name: ApplyGloves ]]
    -- upvalues: l_RunService_0 (copy), v10 (ref), v19 (copy)
    if not l_RunService_0:IsServer() then
        return;
    else
        if not v22 then
            if v10:IsProfileActive(v20) then
                v22 = v10:Get(v20, "EquippedGlove");
            end;
            v22 = v22 or "Default";
        end;
        if l_RunService_0:IsStudio() then
            v22 = "Master";
        end;
        local v23 = v19.GetGlovesModel(v22);
        if not v23 then
            warn("Failed to get gloves model/folder for:", v22);
            return;
        else
            local l_LeftHand_0 = v21:WaitForChild("LeftHand");
            local l_RightHand_0 = v21:WaitForChild("RightHand");
            local l_LeftGripAttachment_0 = l_LeftHand_0:FindFirstChild("LeftGripAttachment");
            local l_RightGripAttachment_0 = l_RightHand_0:FindFirstChild("RightGripAttachment");
            v23 = v23:Clone();
            v23.Name = "KarateGloves";
            v23:SetAttribute("ReferenceName", v22);
            v23:AddTag("KarateGloves");
            v23.Parent = v21;
            if v22 == "AnchorArms" then
                l_LeftGripAttachment_0 = v21:FindFirstChild("LeftShoulderAttachment", true);
                l_RightGripAttachment_0 = v21:FindFirstChild("RightShoulderAttachment", true);
            end;
            v19._applyGlove(v23.Left, l_LeftGripAttachment_0, l_LeftHand_0, v22);
            v19._applyGlove(v23.Right, l_RightGripAttachment_0, l_RightHand_0, v22);
            return v23;
        end;
    end;
end;
v19._applyGlove = function(v28, v29, v30, v31) --[[ Line: 96 ]] --[[ Name: _applyGlove ]]
    v28.Anchored = false;
    v28.CanCollide = false;
    local l_Attachment0_0 = v28:FindFirstChild("Attachment0");
    if v31 == "AnchorArms" then
        for _, v34 in v28:GetChildren() do
            if string.find(v34.Name, "ShoulderAttachment") then
                l_Attachment0_0 = v34;
                break;
            end;
        end;
    end;
    local l_RigidConstraint_0 = Instance.new("RigidConstraint");
    l_RigidConstraint_0.Attachment0 = l_Attachment0_0;
    l_RigidConstraint_0.Attachment1 = v29;
    l_RigidConstraint_0.Parent = v28;
    if v30 and v30:IsA("BasePart") then
        v30.Transparency = 1;
    end;
end;
v19.GetHitDamage = function(v36) --[[ Line: 121 ]] --[[ Name: GetHitDamage ]]
    -- upvalues: l_RunService_0 (copy), v17 (copy), v10 (ref), v11 (ref), v8 (copy), v6 (copy), v7 (copy)
    if l_RunService_0:IsServer() and v17[v36] then
        return v17[v36];
    else
        local v37 = nil;
        v37 = (if l_RunService_0:IsServer() then v10:Get(v36, "EquippedGlove") else v11:Get(v36, "EquippedGlove"):expect()) or "Default";
        if l_RunService_0:IsStudio() then
            v37 = "Master";
        end;
        local v38 = v8.getGloveData(v37);
        local v39 = 0;
        local v40 = nil;
        local v41 = nil;
        if l_RunService_0:IsServer() then
            v40 = v10:Get(v36, "Loadout") or {};
            v41 = v10:Get(v36, "Units") or {};
        else
            v40 = v11:Get(v36, "Loadout"):expect() or {};
            v41 = v11:Get(v36, "Units"):expect() or {};
        end;
        for _, v43 in v40 do
            if v43 ~= "" then
                local v44, v45 = v6:ParseLoadout(v43);
                local v46 = v41[v44] and v41[v44][v45];
                if v46 then
                    v39 = v39 + (v6:GetTotalDamage(v46, 0, false, nil) or 0);
                end;
            end;
        end;
        v39 = math.floor(math.max(v7.MinDamage, v39) * v38.DamageMult);
        v17[v36] = v39;
        return v39;
    end;
end;
v5.OnStart():andThen(function() --[[ Line: 177 ]]
    -- upvalues: l_RunService_0 (copy), v10 (ref), v5 (copy), v11 (ref)
    if l_RunService_0:IsServer() then
        v10 = v5.GetService("DataService");
        return;
    else
        v11 = v5.GetController("DataController");
        return;
    end;
end);
if l_RunService_0:IsServer() then
    task.spawn(function() --[[ Line: 187 ]]
        -- upvalues: v17 (copy), l_Players_0 (copy)
        while task.wait(60) do
            for v47, _ in v17 do
                if not v47:IsDescendantOf(l_Players_0) then
                    v17[v47] = nil;
                end;
            end;
        end;
    end);
end;
return v19;