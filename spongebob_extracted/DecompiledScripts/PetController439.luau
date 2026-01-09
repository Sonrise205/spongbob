local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v7 = nil;
local v8 = nil;
local v9 = v1.CreateController({
    Name = script.Name, 
    PetsLoaded = v3.new(), 
    PetsAdded = v3.new(), 
    PetsRemoved = v3.new(), 
    PetDataUpdated = v3.new(), 
    PetLoadoutUpdated = v3.new(), 
    petsData = nil, 
    petsLoadout = nil
});
v9.KnitInit = function(_) --[[ Line: 44 ]] --[[ Name: KnitInit ]]
    -- upvalues: v7 (ref), v1 (copy), v8 (ref)
    v7 = v1.GetController("DataController");
    v8 = v1.GetService("PetService");
end;
v9.KnitStart = function(v11) --[[ Line: 50 ]] --[[ Name: KnitStart ]]
    -- upvalues: v7 (ref), v1 (copy), v4 (copy), v8 (ref), v6 (copy)
    v11.petsData = v7:Get(v1.Player, "Pets"):expect();
    v11.petsLoadout = v7:Get(v1.Player, "PetsLoadout"):expect();
    v11.petHandler = require(v1.Player.PlayerScripts.Knit.Modules.PetHandler);
    v11.PetsLoaded:Fire(v11.petsData and v4.Copy(v11.petsData, true));
    v11.PetLoadoutUpdated:Fire(v11.petsLoadout);
    v7:OnChanged(v1.Player, "PetsLoadout", function(v12) --[[ Line: 61 ]]
        -- upvalues: v11 (copy)
        v11.petsLoadout = v12;
        v11.PetLoadoutUpdated:Fire(v12);
    end);
    v8.PetsAdded:Connect(function(v13) --[[ Line: 67 ]]
        -- upvalues: v6 (ref), v11 (copy)
        for v14, v15 in v13 do
            local v16, v17 = v6:ParseLoadout(v14);
            if not v11.petsData[v16] then
                v11.petsData[v16] = {};
            end;
            v11.petsData[v16][v17] = v15;
        end;
        v11.PetsAdded:Fire(v13, v11.petsData);
    end);
    v8.PetsRemoved:Connect(function(v18) --[[ Line: 81 ]]
        -- upvalues: v6 (ref), v11 (copy)
        for _, v20 in v18 do
            local v21, v22 = v6:ParseLoadout(v20);
            if v11.petsData[v21] then
                v11.petsData[v21][v22] = nil;
            end;
        end;
        v11.PetsRemoved:Fire(v18, v11.petsData);
    end);
    v8.PetDataUpdated:Connect(function(v23, v24) --[[ Line: 95 ]]
        -- upvalues: v6 (ref), v11 (copy)
        local v25, v26 = v6:ParseLoadout(v23);
        if not v11.petsData[v25] then
            v11.petsData[v25] = {};
        end;
        v11.petsData[v25][v26] = v24;
        v11.PetDataUpdated:Fire(v25, v26, v24, v11.petsData);
    end);
end;
v9.GetPets = function(v27) --[[ Line: 109 ]] --[[ Name: GetPets ]]
    -- upvalues: v4 (copy)
    return v27.petsData and v4.Copy(v27.petsData, true);
end;
v9.GetEquippedPets = function(v28) --[[ Line: 115 ]] --[[ Name: GetEquippedPets ]]
    -- upvalues: v6 (copy)
    local v29 = {};
    local v30 = v28.petsLoadout or {};
    for _, v32 in v30 do
        if v32 ~= "" then
            local v33, v34 = v6:ParseLoadout(v32);
            v29[v33] = table.clone(v28.petsData[v33][v34]);
        end;
    end;
    return v29;
end;
v9.GetPet = function(_, v36, v37) --[[ Line: 130 ]] --[[ Name: GetPet ]]
    -- upvalues: v7 (ref), v1 (copy)
    return v7:Get(v1.Player, "Pets"):andThen(function(v38) --[[ Line: 131 ]]
        -- upvalues: v36 (copy), v37 (copy)
        local v39 = v38[v36];
        if not v39 then
            return;
        else
            return v39[v37];
        end;
    end);
end;
return v9;