local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local l_MAX_SLOTS_0 = require(l_ReplicatedStorage_0.Shared.Data.Variables).PETS.MAX_SLOTS;
local v7 = {
    [1] = 0, 
    [2] = 3.5, 
    [3] = -3.5
};
local function v14(v8, v9) --[[ Line: 30 ]] --[[ Name: RenamePetModel ]]
    -- upvalues: l_Players_0 (copy)
    local v10 = v9:GetAttribute("PetType") or "Unknown";
    local l_v9_Attribute_0 = v9:GetAttribute("OwnerId");
    local v12 = if l_v9_Attribute_0 then l_Players_0:GetPlayerByUserId(l_v9_Attribute_0) else nil;
    local v13 = v9:GetAttribute("EquippedSlot") or 1;
    v8.Name = ("%*_[%*]_%*"):format(if v12 then v12.Name else "", v13, v10);
end;
local v15 = {
    ClassName = "PetHandler"
};
v15.__index = v15;
v15.new = function() --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    local v16 = setmetatable({}, v15);
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "PetsFolder";
    l_Folder_0.Parent = workspace;
    v16._petsFolder = l_Folder_0;
    v16:_init();
    return v16;
end;
v15.SetupPlayerPet = function(v18, v19, v20) --[[ Line: 61 ]] --[[ Name: SetupPlayerPet ]]
    -- upvalues: v14 (copy)
    local v21 = v18._playersPetsData[v19];
    if v21.Pets[v20] then
        warn("Pet already exists for player:", v19.Name, "| Configuration:", v20);
        return;
    else
        local v22 = v20:GetAttribute("EquippedSlot") or 1;
        local l_v20_Attribute_0 = v20:GetAttribute("PetType");
        local l_v20_Attribute_1 = v20:GetAttribute("PetRarity");
        local l_Model_0 = Instance.new("Model");
        l_Model_0:SetAttribute("EquippedSlot", v22);
        l_Model_0:SetAttribute("OwnerId", v19.UserId);
        l_Model_0:SetAttribute("PetType", l_v20_Attribute_0);
        l_Model_0:SetAttribute("PetRarity", l_v20_Attribute_1);
        l_Model_0:SetAttribute("UID", v20:GetAttribute("UID"));
        l_Model_0:SetAttribute("AttackFrequency", v20:GetAttribute("AttackFrequency"));
        l_Model_0:SetAttribute("AttackRange", v20:GetAttribute("AttackRange"));
        l_Model_0:SetAttribute("AttackDamage", v20:GetAttribute("AttackDamage"));
        l_Model_0:SetAttribute("DamageRate", v20:GetAttribute("DamageRate"));
        v14(l_Model_0, v20);
        v20:GetAttributeChangedSignal("EquippedSlot"):Connect(function() --[[ Line: 86 ]]
            -- upvalues: l_Model_0 (copy), v20 (copy), v14 (ref)
            l_Model_0:SetAttribute("EquippedSlot", v20:GetAttribute("EquippedSlot"));
            v14(l_Model_0, v20);
        end);
        v20:GetAttributeChangedSignal("PetType"):Connect(function() --[[ Line: 90 ]]
            -- upvalues: l_Model_0 (copy), v20 (copy), v14 (ref)
            l_Model_0:SetAttribute("PetType", v20:GetAttribute("PetType"));
            v14(l_Model_0, v20);
        end);
        local l_Dumpster_0 = v21.Dumpster;
        v18._playersPetsData[v19].Pets[v20] = {
            PetModel = l_Model_0
        };
        if l_v20_Attribute_1 == "Prismatic" then
            l_Model_0:AddTag((("AttackingPet_%*"):format(l_v20_Attribute_0)));
        end;
        l_Model_0:AddTag("PetFollower");
        l_Model_0.Parent = v18._petsFolder;
        l_Dumpster_0:Add(l_Model_0);
        return;
    end;
end;
v15.DestroyPlayerPet = function(v27, v28, v29) --[[ Line: 110 ]] --[[ Name: DestroyPlayerPet ]]
    local v30 = v27._playersPetsData[v28];
    if not v30 or not v30.Pets[v29] then
        warn("Pet does not exist for player:", v28.Name, "| Configuration:", v29);
        return;
    else
        v30.Pets[v29].PetModel:Destroy();
        v30.Pets[v29] = nil;
        return;
    end;
end;
v15._init = function(v31) --[[ Line: 122 ]] --[[ Name: _init ]]
    -- upvalues: l_Players_0 (copy)
    v31._playersPetsData = {};
    l_Players_0.PlayerAdded:Connect(function(v32) --[[ Line: 130 ]]
        -- upvalues: v31 (copy)
        v31:_handlePlayerAdded(v32);
    end);
    for _, v34 in l_Players_0:GetPlayers() do
        v31:_handlePlayerAdded(v34);
    end;
end;
v15._setupPetSlotsAttachments = function(_, v36) --[[ Line: 139 ]] --[[ Name: _setupPetSlotsAttachments ]]
    -- upvalues: l_MAX_SLOTS_0 (copy), v7 (copy)
    local v37 = v36:WaitForChild("HumanoidRootPart", 5);
    local v38 = v36:GetExtentsSize().Y * 0.5 - 1;
    for v39 = 1, l_MAX_SLOTS_0 do
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Name = "PET_SLOT_" .. v39;
        l_Attachment_0.Visible = false;
        l_Attachment_0.Position = Vector3.new(v7[v39] or 0, -v38, 3.5);
        l_Attachment_0.Parent = v37;
    end;
end;
v15._handlePlayerAdded = function(v41, v42) --[[ Line: 160 ]] --[[ Name: _handlePlayerAdded ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v43 = v3.new();
    v41._playersPetsData[v42] = {
        Dumpster = v43, 
        Pets = {}
    };
    v43:Add(function() --[[ Line: 168 ]]
        -- upvalues: v41 (copy), v42 (copy)
        v41._playersPetsData[v42] = nil;
    end);
    local function v50(v44) --[[ Line: 172 ]] --[[ Name: petFolderAdded ]]
        -- upvalues: v41 (copy), v42 (copy)
        v44.ChildAdded:Connect(function(v45) --[[ Line: 173 ]]
            -- upvalues: v41 (ref), v42 (ref)
            v41:SetupPlayerPet(v42, v45);
        end);
        v44.ChildRemoved:Connect(function(v46) --[[ Line: 177 ]]
            -- upvalues: v41 (ref), v42 (ref)
            v41:DestroyPlayerPet(v42, v46);
        end);
        for _, v48 in v44:GetChildren() do
            if v48:IsA("Configuration") then
                v41:SetupPlayerPet(v42, v48);
            end;
        end;
        v42.CharacterAdded:Connect(function(v49) --[[ Line: 187 ]]
            -- upvalues: v41 (ref)
            v41:_setupPetSlotsAttachments(v49);
        end);
        if v42.Character then
            v41:_setupPetSlotsAttachments(v42.Character);
        end;
    end;
    local l_Pets_0 = v42:FindFirstChild("Pets");
    if l_Pets_0 then
        v50(l_Pets_0);
    else
        v43:AddPromise(v4.fromEvent(v42.ChildAdded, function(v52) --[[ Line: 200 ]]
            return v52:IsA("Folder") and v52.Name == "Pets";
        end):andThen(function(v53) --[[ Line: 202 ]]
            -- upvalues: v50 (copy)
            v50(v53);
        end):catch(warn));
    end;
    v43:AttachTo(v42);
end;
v15._debugFn = function(_) --[[ Line: 210 ]] --[[ Name: _debugFn ]]
    -- upvalues: l_Players_0 (copy), l_MAX_SLOTS_0 (copy)
    local v55 = {
        "LarryLuciano", 
        "BunnyWunny", 
        "Butcher", 
        "Rex", 
        "Fluffy", 
        "PottyTheParrot", 
        "Rocky"
    };
    task.delay(5, function() --[[ Line: 212 ]]
        -- upvalues: l_Players_0 (ref), l_MAX_SLOTS_0 (ref), v55 (copy)
        warn("[PetHandler] \226\128\162 Starting pets rendering test.");
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "Pets";
        l_Folder_1.Parent = l_LocalPlayer_0;
        local v58 = Random.new();
        for v59 = 1, v58:NextInteger(1, l_MAX_SLOTS_0) do
            task.delay(v59 * 0.5, function() --[[ Line: 221 ]]
                -- upvalues: v55 (ref), v58 (copy), l_LocalPlayer_0 (copy), v59 (copy), l_Folder_1 (copy)
                local l_Configuration_0 = Instance.new("Configuration");
                l_Configuration_0:SetAttribute("PetType", v55[v58:NextInteger(1, #v55)]);
                l_Configuration_0:SetAttribute("OwnerId", l_LocalPlayer_0.UserId);
                l_Configuration_0:SetAttribute("EquippedSlot", v59);
                l_Configuration_0.Parent = l_Folder_1;
            end);
        end;
    end);
end;
return (v15.new());