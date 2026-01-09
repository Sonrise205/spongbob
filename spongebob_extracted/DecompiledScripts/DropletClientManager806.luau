local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(script.Parent.Parent.DropletUtil);
local v4 = require(script.Parent.Droplet);
local v5 = require(l_Parent_0.RailUtil);
local v6 = require(l_Parent_0.OctoTree);
local v7 = require(l_Parent_0.NetWire);
local v8 = require(l_Parent_0.BaseObject);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "Droplets";
l_Folder_0.Parent = workspace;
local function v19(v12, v13, v14) --[[ Line: 37 ]] --[[ Name: CalculateEjectionVelocity ]]
    -- upvalues: v3 (copy), v5 (copy)
    local v15 = v3.parse(v12, v14) or v14:NextInteger(2, 25);
    local v16 = v3.parse(v13, v14) or v14:NextInteger(25, 50);
    local v17 = v14:NextNumber(-3.141592653589793, 3.141592653589793);
    local v18 = v5.Vector.rotateVector2(Vector2.new(1, 0), v17) * v15;
    return (Vector3.new(v18.X, v16, v18.Y));
end;
local function v21(v20) --[[ Line: 51 ]] --[[ Name: ParseLocation ]]
    if typeof(v20) == "Vector3" then
        return CFrame.new(v20);
    elseif typeof(v20) == "CFrame" then
        return v20;
    elseif typeof(v20) == "table" then
        if v20.Obj then
            return v20.Obj:GetPivot();
        else
            return v20.CF;
        end;
    else
        error("Invalid location type: " .. tostring(v20));
        return;
    end;
end;
local v22 = nil;
local v23 = setmetatable({}, v8);
v23.ClassName = "DropletClientManager";
v23.__index = v23;
local function _(v24) --[[ Line: 75 ]] --[[ Name: AssertIsSingleton ]]
    -- upvalues: v22 (ref)
    assert(v24 == v22, "Called method on class instead of singleton");
end;
v23.new = function() --[[ Line: 86 ]] --[[ Name: new ]]
    -- upvalues: v22 (ref), v8 (copy), v23 (copy), l_RunService_0 (copy), v7 (copy), v6 (copy)
    if v22 then
        return v22;
    else
        local v26 = setmetatable(v8.new(), v23);
        v22 = v26;
        v26._DropletStorage = {};
        v26._ResourceTypeDataMap = {};
        if l_RunService_0:IsRunning() then
            v26._Replicator = v7.Client("DropletService");
            v26._Replicator.DropletCreated:Connect(function(...) --[[ Line: 97 ]]
                -- upvalues: v26 (copy)
                v26:_OnCreateDroplet(...);
            end);
            v26._Replicator.DropletClaimed:Connect(function(...) --[[ Line: 101 ]]
                -- upvalues: v26 (copy)
                v26:_OnClaimDroplet(...);
            end);
        else
            warn("Loaded DropletClientManager in edit mode");
        end;
        v26._RenderOctoTree = v6.new();
        v26._MagnetOctoTree = v6.new();
        v26._CollectionTracker = setmetatable({}, {
            __mode = "k"
        });
        v26._RenderRadius = 100;
        v26:AddTask(l_RunService_0.PreSimulation:Connect(function(v27) --[[ Line: 114 ]]
            -- upvalues: v26 (copy)
            v26:_Update(v27);
        end));
        return v26;
    end;
end;
v23.RegisterResourceType = function(v28, v29, v30) --[[ Line: 131 ]] --[[ Name: RegisterResourceType ]]
    -- upvalues: v22 (ref)
    assert(v28 == v22, "Called method on class instead of singleton");
    assert(not v28._ResourceTypeDataMap[v29], "Resource type already registered");
    v28._ResourceTypeDataMap[v29] = v30;
end;
v23.GetResourceTypeData = function(v31, v32) --[[ Line: 140 ]] --[[ Name: GetResourceTypeData ]]
    -- upvalues: v22 (ref)
    assert(v31 == v22, "Called method on class instead of singleton");
    return v31._ResourceTypeDataMap[v32];
end;
v23.GetCollectionRadius = function(v33) --[[ Line: 148 ]] --[[ Name: GetCollectionRadius ]]
    -- upvalues: v22 (ref)
    assert(v33 == v22, "Called method on class instead of singleton");
    return v33._Replicator.CollectionRadius:Get() or 15;
end;
v23._Update = function(v34, v35) --[[ Line: 164 ]] --[[ Name: _Update ]]
    -- upvalues: l_LocalPlayer_0 (copy), v4 (copy), v5 (copy), l_CurrentCamera_0 (copy)
    v35 = v35 or 0;
    local l__CollectionTracker_0 = v34._CollectionTracker;
    debug.profilebegin("Droplet Collection Check");
    if l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.PrimaryPart then
        local l_Position_0 = l_LocalPlayer_0.Character:GetPivot().Position;
        for v38 in v34._MagnetOctoTree:ForEachInRadius(l_Position_0, v34:GetCollectionRadius()) do
            local l_Object_0 = v38.Object;
            if not l__CollectionTracker_0[l_Object_0] then
                l__CollectionTracker_0[l_Object_0] = true;
                v34:_RequestClaimDroplet(l_Object_0);
            end;
        end;
    end;
    debug.profileend();
    debug.profilebegin("Droplet Position Update");
    v4.processRendering();
    debug.profileend();
    debug.profilebegin("Droplet Visualization Update");
    local l_isOnScreen_0 = v5.Camera.isOnScreen;
    local l_Position_1 = (l_CurrentCamera_0.CFrame + l_CurrentCamera_0.CFrame.LookVector * (v34._RenderRadius / 2)).Position;
    for v42 in v34._RenderOctoTree:ForEachInRadius(l_Position_1, v34._RenderRadius) do
        if l_isOnScreen_0(v42.Position) then
            v42.Object:_Render(v35);
        end;
    end;
    debug.profileend();
end;
v23._MarkForCollection = function(v43, v44) --[[ Line: 202 ]] --[[ Name: _MarkForCollection ]]
    local l__MagnetOctoTree_0 = v43._MagnetOctoTree;
    local l_l__MagnetOctoTree_0_Node_0 = l__MagnetOctoTree_0:CreateNode(v44:GetPosition(), v44);
    v44:GetSignal("PositionChanged"):Connect(function(v47) --[[ Line: 206 ]]
        -- upvalues: l__MagnetOctoTree_0 (copy), l_l__MagnetOctoTree_0_Node_0 (copy)
        l__MagnetOctoTree_0:ChangeNodePosition(l_l__MagnetOctoTree_0_Node_0, v47);
    end);
    local function v48() --[[ Line: 210 ]] --[[ Name: Remove ]]
        -- upvalues: l__MagnetOctoTree_0 (copy), l_l__MagnetOctoTree_0_Node_0 (copy)
        l__MagnetOctoTree_0:RemoveNode(l_l__MagnetOctoTree_0_Node_0);
    end;
    v44:GetSignal("Timedout"):Once(v48);
    v44:GetDestroyedSignal():Once(v48);
end;
v23._MarkForRender = function(v49, v50) --[[ Line: 219 ]] --[[ Name: _MarkForRender ]]
    local l__RenderOctoTree_0 = v49._RenderOctoTree;
    local l_l__RenderOctoTree_0_Node_0 = l__RenderOctoTree_0:CreateNode(v50:GetPosition(), v50);
    v50:GetSignal("PositionChanged"):Connect(function(v53) --[[ Line: 223 ]]
        -- upvalues: l__RenderOctoTree_0 (copy), l_l__RenderOctoTree_0_Node_0 (copy)
        l__RenderOctoTree_0:ChangeNodePosition(l_l__RenderOctoTree_0_Node_0, v53);
    end);
    local function v54() --[[ Line: 227 ]] --[[ Name: Remove ]]
        -- upvalues: l__RenderOctoTree_0 (copy), l_l__RenderOctoTree_0_Node_0 (copy)
        l__RenderOctoTree_0:RemoveNode(l_l__RenderOctoTree_0_Node_0);
    end;
    v50:GetSignal("Timedout"):Once(v54);
    v50:GetDestroyedSignal():Once(v54);
end;
v23._OnCreateDroplet = function(v55, v56) --[[ Line: 236 ]] --[[ Name: _OnCreateDroplet ]]
    -- upvalues: v3 (copy), v4 (copy), l_LocalPlayer_0 (copy), v21 (copy), l_Folder_0 (copy), v19 (copy)
    local l_v55_ResourceTypeData_0 = v55:GetResourceTypeData(v56.ResourceType);
    assert(l_v55_ResourceTypeData_0, (("Resource type '%*' not registered"):format((tostring(v56.ResourceType)))));
    local l_Defaults_0 = l_v55_ResourceTypeData_0.Defaults;
    local l_Seed_0 = v56.Seed;
    local l_Value_0 = v56.Value;
    local l_Count_0 = v56.Count;
    local l_LifeTime_0 = v56.LifeTime;
    v56.Metadata = v56.Metadata or l_Defaults_0.Metadata;
    local v63 = {};
    v55._DropletStorage[l_Seed_0] = {
        NetworkPacket = v56, 
        Droplets = v63
    };
    local v64 = Random.new(l_Seed_0);
    local v65 = v3.parse(v56.EjectionDuration, v64);
    for v66, v67 in pairs(v3.calculateDropletValues(l_Value_0, l_Count_0, l_Seed_0, l_LifeTime_0)) do
        local v68 = v4.new({
            Id = v66, 
            NetworkPacket = v56, 
            ResourceTypeData = v55:GetResourceTypeData(v56.ResourceType), 
            Value = v67.RawValue, 
            LifeTime = v67.RawLifeTime, 
            DropletClientManager = v55
        });
        v68:GetDestroyedSignal():Once(function() --[[ Line: 268 ]]
            -- upvalues: v63 (copy), v66 (copy)
            v63[v66] = nil;
        end);
        v68:GetSignal("Collected"):Connect(function(v69) --[[ Line: 273 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v55 (copy), v68 (copy)
            if v69 == l_LocalPlayer_0 then
                v55:_RequestCollectDroplet(v68);
            end;
        end);
        local l_v68_Model_0 = v68:GetModel();
        l_v68_Model_0:PivotTo(v21(v56.SpawnLocation));
        l_v68_Model_0.Parent = l_Folder_0;
        local l_PrimaryPart_0 = l_v68_Model_0.PrimaryPart;
        assert(l_PrimaryPart_0, "Droplet model has no primary part");
        l_PrimaryPart_0.AssemblyLinearVelocity = v19(v56.EjectionHorizontalVelocity or l_Defaults_0.EjectionHorizontalVelocity, v56.EjectionVerticalVelocity or l_Defaults_0.EjectionVerticalVelocity, v64);
        table.insert(v63, v68);
        task.wait(v65 / l_Count_0);
    end;
end;
v23._OnClaimDroplet = function(v72, v73, v74, v75) --[[ Line: 302 ]] --[[ Name: _OnClaimDroplet ]]
    local v76 = v72._DropletStorage[v74];
    assert(v76, (("No Droplet-Request found with seed '%*'"):format(v74)));
    local v77 = v76.Droplets[v75];
    if not v77 then
        warn(v76.Droplets);
        error((("No Droplet found for [%*][%*]"):format(v74, v75)));
    end;
    v77:Claim(v73);
end;
v23._RequestClaimDroplet = function(v78, v79) --[[ Line: 320 ]] --[[ Name: _RequestClaimDroplet ]]
    local v80, v81 = v79:Identify();
    v78._Replicator.DropletClaimed:Fire(v80, v81);
end;
v23._RequestCollectDroplet = function(v82, v83) --[[ Line: 330 ]] --[[ Name: _RequestCollectDroplet ]]
    local v84, v85 = v83:Identify();
    v82._Replicator.DropletCollected:Fire(v84, v85);
end;
return v23;