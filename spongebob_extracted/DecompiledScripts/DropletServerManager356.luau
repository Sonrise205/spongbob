local l_PhysicsService_0 = game:GetService("PhysicsService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(script.Parent.Parent.DropletUtil);
local _ = require(l_Parent_0.ProbabilityDistributor);
local v6 = require(l_Parent_0.BaseObject);
local v7 = require(l_Parent_0.NetWire);
local l_Enums_0 = v4.Enums;
local l_MultiCollector_0 = l_Enums_0.CollectorMode.MultiCollector;
local v10 = NumberRange.new(8, 12);
local function v12(v11, ...) --[[ Line: 42 ]] --[[ Name: TryCall ]]
    if not v11 then
        return;
    else
        return v11(...);
    end;
end;
local function _(v13) --[[ Line: 47 ]] --[[ Name: IsWeightedArray ]]
    if not (typeof(v13) == "table") then
        return false;
    elseif not (v13[1] ~= nil) then
        return false;
    else
        local v14 = v13[1].Weight ~= nil;
        local v15 = v13[1].Value ~= nil;
        return v14 and v15;
    end;
end;
local function _(v17) --[[ Line: 60 ]] --[[ Name: AssertValidNRWT ]]
    if not v17 then
        return;
    else
        local v18 = typeof(v17);
        local v19 = true;
        if v18 ~= "number" then
            v19 = true;
            if v18 ~= "NumberRange" then
                if not (typeof(v17) == "table") then
                    v19 = false;
                elseif not (v17[1] ~= nil) then
                    v19 = false;
                else
                    local v20 = v17[1].Weight ~= nil;
                    local v21 = v17[1].Value ~= nil;
                    v19 = v20 and v21;
                end;
            end;
        end;
        assert(v19, "Invalid type given for NumOrRangeOrWeightedArray. Got: " .. v18);
        return v17;
    end;
end;
local function v29(v23, v24, ...) --[[ Line: 67 ]] --[[ Name: AssertTypes ]]
    local v25 = {
        ...
    };
    local v26 = false;
    if typeof(v25) == "string" then
        v26 = typeof(v24) == v25;
    elseif typeof(v25) == "table" then
        for _, v28 in ipairs(v25) do
            if typeof(v24) == v28 then
                v26 = true;
                break;
            end;
        end;
    end;
    assert(v26, "Invalid type for " .. v23 .. ". Expected [" .. tostring(v25) .. "], got " .. typeof(v24));
end;
local function v34(v30) --[[ Line: 83 ]] --[[ Name: ValidatePlayerTargets ]]
    -- upvalues: l_Players_0 (copy)
    local v31 = v30 or l_Players_0:GetPlayers();
    if typeof(v31) == "Instance" then
        v31 = {
            v31
        };
    end;
    for _, v33 in ipairs(v31) do
        assert(v33:IsA("Player"), "Invalid player target");
    end;
    return v31;
end;
local l_parse_0 = v4.parse;
local v36 = nil;
local v37 = setmetatable({}, v6);
v37.ClassName = "DropletServerManager";
v37.__index = v37;
local function _(v38) --[[ Line: 106 ]] --[[ Name: AssertIsSingleton ]]
    -- upvalues: v36 (ref)
    assert(v38 == v36, "Called method on class instead of singleton");
end;
v37.new = function() --[[ Line: 117 ]] --[[ Name: new ]]
    -- upvalues: v36 (ref), v6 (copy), v37 (copy), l_RunService_0 (copy), v7 (copy), l_PhysicsService_0 (copy), v4 (copy)
    if v36 then
        return v36;
    else
        local v40 = setmetatable(v6.new(), v37);
        v36 = v40;
        v40._ActiveDroplets = {};
        v40._ResourceTypeDataMap = {};
        v40._DropletStorage = {};
        if l_RunService_0:IsRunning() then
            v40._Replicator = v7.Server("DropletService");
            v40._Replicator.DropletCreated = v7.createEvent();
            v40._Replicator.DropletClaimed = v7.createEvent();
            v40._Replicator.DropletCollected = v7.createEvent();
            v40._Replicator.CollectionRadius = v7.createProperty(15);
            v40._Replicator.DropletClaimed:Connect(function(...) --[[ Line: 135 ]]
                -- upvalues: v40 (copy)
                v40:Claim(...);
            end);
            v40._Replicator.DropletCollected:Connect(function(...) --[[ Line: 139 ]]
                -- upvalues: v40 (copy)
                v40:Collect(...);
            end);
        else
            warn("Loaded DropletServerManager in edit mode");
        end;
        l_PhysicsService_0:RegisterCollisionGroup(v4.DROPLET_COLLISION_GROUP);
        l_PhysicsService_0:CollisionGroupSetCollidable(v4.DROPLET_COLLISION_GROUP, v4.DROPLET_COLLISION_GROUP, false);
        return v40;
    end;
end;
v37.Destroy = function(_) --[[ Line: 158 ]] --[[ Name: Destroy ]]
    error("Cannot destroy singleton");
end;
v37._GenerateSeed = function(v42) --[[ Line: 166 ]] --[[ Name: _GenerateSeed ]]
    local v43 = nil;
    repeat
        v43 = math.random(1, 65536);
    until not v42._DropletStorage[v43];
    return v43;
end;
v37.RegisterResourceType = function(v44, v45, v46) --[[ Line: 181 ]] --[[ Name: RegisterResourceType ]]
    -- upvalues: v36 (ref)
    assert(v44 == v36, "Called method on class instead of singleton");
    assert(not v44._ResourceTypeDataMap[v45], (("ResourceType already registered for: '%*'"):format((tostring(v45)))));
    v44._ResourceTypeDataMap[v45] = v46;
end;
v37.GetResourceTypeData = function(v47, v48) --[[ Line: 190 ]] --[[ Name: GetResourceTypeData ]]
    -- upvalues: v36 (ref)
    assert(v47 == v36, "Called method on class instead of singleton");
    return v47._ResourceTypeDataMap[v48];
end;
v37.GetDropletServerData = function(v49, v50) --[[ Line: 199 ]] --[[ Name: GetDropletServerData ]]
    return v49._DropletStorage[v50] or warn("Droplet request with seed '" .. tostring(v50) .. "' does not exist");
end;
v37.Spawn = function(v51, v52) --[[ Line: 235 ]] --[[ Name: Spawn ]]
    -- upvalues: v36 (ref), l_parse_0 (copy), v10 (copy), v29 (copy), l_MultiCollector_0 (copy), v4 (copy), v34 (copy)
    assert(v51 == v36, "Called method on class instead of singleton");
    local l_v51_ResourceTypeData_0 = v51:GetResourceTypeData(v52.ResourceType);
    assert(l_v51_ResourceTypeData_0, (("Resource type '%*' not registered"):format((tostring(v52.ResourceType)))));
    local l_Defaults_0 = l_v51_ResourceTypeData_0.Defaults;
    local v55 = v51:_GenerateSeed();
    local v56 = Random.new(v55);
    local v57 = v52.Value or l_Defaults_0.Value;
    local v58 = math.round((l_parse_0(v52.Count or l_Defaults_0.Count or 1, v56)));
    local v59 = false;
    if typeof(v58) == "number" then
        v59 = v58 >= 0;
    end;
    assert(v59, "Count must resolve to a non-negative number");
    local v60 = l_parse_0(v52.EjectionDuration or l_Defaults_0.EjectionDuration or 0.1, v56);
    local v61 = false;
    if typeof(v60) == "number" then
        v61 = v60 >= 0;
    end;
    assert(v61, "EjectionDuration must resolve to a non-negative number");
    v59 = v52.LifeTime or l_Defaults_0.LifeTime or v10;
    v29("LifeTime", v59, "number", "NumberRange");
    if typeof(v59) == "NumberRange" then
        local v62 = false;
        if v59.Min >= 0 then
            v62 = v59.Max >= 0;
        end;
        assert(v62, "LifeTime must resolve to a positive number");
    elseif typeof(v59) == "number" then
        assert(v59 >= 0, "LifeTime must resolve to a positive number");
    end;
    v61 = nil;
    local l_SpawnLocation_0 = v52.SpawnLocation;
    if typeof(l_SpawnLocation_0) == "Instance" then
        assert(l_SpawnLocation_0:IsA("PVInstance"), "Invalid SpawnLocation given, must be a PVInstance");
        l_SpawnLocation_0 = {
            Obj = l_SpawnLocation_0, 
            CF = l_SpawnLocation_0:GetPivot()
        };
    else
        v29("SpawnLocation", l_SpawnLocation_0, "Vector3", "CFrame", "Instance");
    end;
    local v64 = {
        Seed = v55, 
        Count = v58, 
        SpawnTime = workspace:GetServerTimeNow(), 
        CollectorMode = v52.CollectorMode or l_Defaults_0.CollectorMode or l_MultiCollector_0, 
        EjectionDuration = v60
    };
    local l_EjectionVerticalVelocity_0 = v52.EjectionVerticalVelocity;
    local v66;
    if not l_EjectionVerticalVelocity_0 then
        v66 = nil;
    else
        local v67 = typeof(l_EjectionVerticalVelocity_0);
        local v68 = true;
        if v67 ~= "number" then
            v68 = true;
            if v67 ~= "NumberRange" then
                if not (typeof(l_EjectionVerticalVelocity_0) == "table") then
                    v68 = false;
                elseif not (l_EjectionVerticalVelocity_0[1] ~= nil) then
                    v68 = false;
                else
                    local v69 = l_EjectionVerticalVelocity_0[1].Weight ~= nil;
                    local v70 = l_EjectionVerticalVelocity_0[1].Value ~= nil;
                    v68 = v69 and v70;
                end;
            end;
        end;
        assert(v68, "Invalid type given for NumOrRangeOrWeightedArray. Got: " .. v67);
        v66 = l_EjectionVerticalVelocity_0;
    end;
    v64.EjectionVerticalVelocity = v66;
    l_EjectionVerticalVelocity_0 = v52.EjectionHorizontalVelocity;
    if not l_EjectionVerticalVelocity_0 then
        v66 = nil;
    else
        local v71 = typeof(l_EjectionVerticalVelocity_0);
        local v72 = true;
        if v71 ~= "number" then
            v72 = true;
            if v71 ~= "NumberRange" then
                if not (typeof(l_EjectionVerticalVelocity_0) == "table") then
                    v72 = false;
                elseif not (l_EjectionVerticalVelocity_0[1] ~= nil) then
                    v72 = false;
                else
                    local v73 = l_EjectionVerticalVelocity_0[1].Weight ~= nil;
                    local v74 = l_EjectionVerticalVelocity_0[1].Value ~= nil;
                    v72 = v73 and v74;
                end;
            end;
        end;
        assert(v72, "Invalid type given for NumOrRangeOrWeightedArray. Got: " .. v71);
        v66 = l_EjectionVerticalVelocity_0;
    end;
    v64.EjectionHorizontalVelocity = v66;
    v64.ResourceType = v52.ResourceType;
    v64.Value = v57;
    v64.Metadata = v52.Metadata;
    v64.SpawnLocation = l_SpawnLocation_0;
    v64.LifeTime = v59;
    v61 = v64;
    l_SpawnLocation_0 = {};
    for v75, v76 in pairs(v4.calculateDropletValues(v57, v58, v55, v59)) do
        l_SpawnLocation_0[v75] = {
            ActualValue = v76.RawValue
        };
    end;
    v51._DropletStorage[v55] = {
        NetworkPacket = v61, 
        DropletData = l_SpawnLocation_0, 
        PlayerTargets = v34(v52.PlayerTargets)
    };
    v51._Replicator.DropletCreated:FireFor(v51._DropletStorage[v55].PlayerTargets, v61);
    v64 = if typeof(v59) == "NumberRange" then v59.Max else v59;
    v51:AddTask(task.delay(v64 + 30, function() --[[ Line: 306 ]]
        -- upvalues: v51 (copy), v55 (copy)
        v51._DropletStorage[v55] = nil;
    end), nil, v55);
    return v55;
end;
v37.Claim = function(v77, v78, v79, v80) --[[ Line: 320 ]] --[[ Name: Claim ]]
    -- upvalues: v36 (ref), l_Enums_0 (copy)
    assert(v77 == v36, "Called method on class instead of singleton");
    assert(v78 and v78:IsA("Player"), "Invalid collector passed when attempting to claim droplet");
    assert(typeof(v79) == "number", (("Invalid Seed passed when attempting to collect droplet: %*, must be a number"):format((tostring(v79)))));
    local l_v77_DropletServerData_0 = v77:GetDropletServerData(v79);
    if not l_v77_DropletServerData_0 then
        return false;
    elseif typeof(v80) ~= "number" and not v80 then
        local v82 = true;
        for v83 in pairs(l_v77_DropletServerData_0.DropletData) do
            local v84 = v77:Claim(v78, v79, v83);
            v82 = v82 and v84;
        end;
        return v82;
    else
        local l_NetworkPacket_0 = l_v77_DropletServerData_0.NetworkPacket;
        local v86 = l_v77_DropletServerData_0.DropletData[v80];
        local l_CollectorMode_0 = l_NetworkPacket_0.CollectorMode;
        assert(table.find(l_v77_DropletServerData_0.PlayerTargets, v78), (("Player '%*' is not a target of droplet request with seed '%*'. PlayerTargets: %*"):format(v78.Name, v79, l_v77_DropletServerData_0.PlayerTargets)));
        if not v86 then
            warn((("DropletData with seed '%*' and droplet number '%*' does not exist. Likely already collected."):format(v79, v80)));
            return false;
        else
            v86.ClaimedBy = v86.ClaimedBy or {};
            if if l_CollectorMode_0 == l_Enums_0.CollectorMode.SingleCollector then #v86.ClaimedBy > 0 else table.find(v86.ClaimedBy, v78) ~= nil then
                if v77._DEBUG then
                    warn((("Player '%*' has already claimed Droplet [%*][%*]"):format(v78.Name, v79, v80)));
                end;
                return false;
            else
                table.insert(v86.ClaimedBy, v78);
                if l_CollectorMode_0 == l_Enums_0.CollectorMode.SingleCollector then
                    v77._Replicator.DropletClaimed:FireFor(l_v77_DropletServerData_0.PlayerTargets, v78, v79, v80);
                elseif l_CollectorMode_0 == l_Enums_0.CollectorMode.MultiCollector then
                    v77._Replicator.DropletClaimed:Fire(v78, v78, v79, v80);
                else
                    error("Invalid CollectorMode: " .. tostring(l_CollectorMode_0));
                end;
                return true;
            end;
        end;
    end;
end;
v37.Collect = function(v88, v89, v90, v91) --[[ Line: 387 ]] --[[ Name: Collect ]]
    -- upvalues: v36 (ref), l_Enums_0 (copy), v12 (copy)
    assert(v88 == v36, "Called method on class instead of singleton");
    assert(v89 and v89:IsA("Player"), "Invalid collector passed when attempting to claim droplet");
    assert(typeof(v90) == "number", (("Invalid Seed passed when attempting to collect droplet: %*, must be a number"):format((tostring(v90)))));
    local l_v88_DropletServerData_0 = v88:GetDropletServerData(v90);
    if not l_v88_DropletServerData_0 then
        return false;
    elseif typeof(v91) ~= "number" and not v91 then
        local v93 = true;
        for v94 in pairs(l_v88_DropletServerData_0.DropletData) do
            local v95 = v88:Collect(v89, v90, v94);
            v93 = v93 and v95;
        end;
        return v93;
    else
        local l_NetworkPacket_1 = l_v88_DropletServerData_0.NetworkPacket;
        local v97 = l_v88_DropletServerData_0.DropletData[v91];
        local l_CollectorMode_1 = l_NetworkPacket_1.CollectorMode;
        assert(table.find(l_v88_DropletServerData_0.PlayerTargets, v89), (("Player '%*' is not a target of droplet request with seed '%*'. PlayerTargets: %*"):format(v89.Name, v90, l_v88_DropletServerData_0.PlayerTargets)));
        if not v97 then
            warn((("DropletData [%*][%*] does not exist. Likely already collected."):format(v90, v91)));
            return false;
        else
            v97.CollectedBy = v97.CollectedBy or {};
            if if l_CollectorMode_1 == l_Enums_0.CollectorMode.SingleCollector then #v97.CollectedBy > 0 else table.find(v97.CollectedBy, v89) ~= nil then
                if v88._DEBUG then
                    warn((("Player '%*' has already collected droplet with seed '%*' and droplet number '%*'"):format(v89.Name, v90, v91)));
                end;
                return false;
            else
                local l_v88_ResourceTypeData_0 = v88:GetResourceTypeData(l_NetworkPacket_1.ResourceType);
                v12(l_v88_ResourceTypeData_0.OnServerCollect, v89, v97.ActualValue, l_NetworkPacket_1.Metadata);
                if l_CollectorMode_1 == l_Enums_0.CollectorMode.SingleCollector then
                    l_v88_DropletServerData_0.DropletData[v91] = nil;
                elseif l_CollectorMode_1 == l_Enums_0.CollectorMode.MultiCollector then
                    table.insert(v97.CollectedBy, v89);
                    if #v97.CollectedBy == #l_v88_DropletServerData_0.PlayerTargets then
                        l_v88_DropletServerData_0.DropletData[v91] = nil;
                    end;
                else
                    error("Invalid CollectorMode: " .. tostring(l_CollectorMode_1));
                end;
                local v100 = true;
                for _, v102 in pairs(l_v88_DropletServerData_0.DropletData) do
                    if v102 then
                        v100 = false;
                        break;
                    end;
                end;
                if v100 then
                    v88._DropletStorage[v90] = nil;
                end;
                return true;
            end;
        end;
    end;
end;
v37.GetCollectionRadius = function(v103, v104) --[[ Line: 470 ]] --[[ Name: GetCollectionRadius ]]
    return v103._Replicator.CollectionRadius:GetFor(v104);
end;
v37.SetCollectionRadius = function(v105, v106, v107) --[[ Line: 477 ]] --[[ Name: SetCollectionRadius ]]
    local v108 = false;
    if typeof(v107) == "number" then
        v108 = v107 >= 0;
    end;
    assert(v108, "Invalid radius given, must be a non-negative number");
    v105._Replicator.CollectionRadius:SetFor(v106, v107);
end;
return v37;