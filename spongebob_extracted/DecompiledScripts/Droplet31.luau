local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
if not l_RunService_0:IsClient() then
    return {};
else
    local l_Parent_0 = script.Parent.Parent.Parent;
    local v3 = require(script.Parent.Parent.DropletUtil);
    local v4 = require(l_Parent_0.RailUtil);
    local v5 = require(l_Parent_0.BaseObject);
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Name = "DropletWorldAlignAttachment";
    l_Attachment_0.Parent = workspace.Terrain;
    local v7 = {};
    local v8 = RaycastParams.new();
    v8.FilterType = Enum.RaycastFilterType.Exclude;
    v8.CollisionGroup = v3.DROPLET_COLLISION_GROUP;
    v8.FilterDescendantsInstances = {};
    v4.Player.forEachCharacter(function(v9, v10) --[[ Line: 40 ]]
        -- upvalues: v7 (copy), v8 (copy), v4 (copy)
        table.insert(v7, v9);
        v8.FilterDescendantsInstances = v7;
        v10:Add(function() --[[ Line: 44 ]]
            -- upvalues: v4 (ref), v7 (ref), v9 (copy), v8 (ref)
            v4.Table.SwapRemoveFirstValue(v7, v9);
            v8.FilterDescendantsInstances = v7;
        end);
    end);
    local v11 = {
        Size = 0, 
        Parts = {}, 
        CFrames = {}
    };
    local l_truncate_0 = v4.Vector.truncate;
    local function v14(v13, ...) --[[ Line: 63 ]] --[[ Name: TryCall ]]
        if not v13 then
            return;
        else
            return v13(...);
        end;
    end;
    local function _(v15, v16, v17) --[[ Line: 69 ]] --[[ Name: CalculateGravitationalAttraction ]]
        return v15 * v16 / v17 ^ 2 * 1;
    end;
    local function v26() --[[ Line: 73 ]] --[[ Name: GenerateNewActor ]]
        -- upvalues: v3 (copy), l_Attachment_0 (copy)
        local l_Actor_0 = Instance.new("Actor");
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Name = "Core";
        l_Part_0.Size = Vector3.new(2, 2, 2, 0);
        l_Part_0.Anchored = false;
        l_Part_0.CanCollide = true;
        l_Part_0.CanTouch = false;
        l_Part_0.CanQuery = false;
        l_Part_0.CastShadow = false;
        l_Part_0.Transparency = 1;
        l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
        l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
        l_Part_0.Shape = Enum.PartType.Ball;
        l_Part_0.CollisionGroup = v3.DROPLET_COLLISION_GROUP;
        l_Part_0.Parent = l_Actor_0;
        local l_Attachment_1 = Instance.new("Attachment");
        l_Attachment_1.Name = "DropletAttachment";
        l_Attachment_1.Parent = l_Part_0;
        local l_AlignOrientation_0 = Instance.new("AlignOrientation");
        l_AlignOrientation_0.Attachment0 = l_Attachment_1;
        l_AlignOrientation_0.Attachment1 = l_Attachment_0;
        l_AlignOrientation_0.Parent = l_Part_0;
        local l_VectorForce_0 = Instance.new("VectorForce");
        l_VectorForce_0.Attachment0 = l_Attachment_1;
        l_VectorForce_0.Force = Vector3.new(0, 100, 0, 0);
        l_VectorForce_0.ApplyAtCenterOfMass = true;
        l_VectorForce_0.Parent = l_Part_0;
        local l_Part_1 = Instance.new("Part");
        l_Part_1.Name = "AttachmentPart";
        l_Part_1.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        l_Part_1.Anchored = false;
        l_Part_1.CanCollide = false;
        l_Part_1.CanTouch = false;
        l_Part_1.CanQuery = false;
        l_Part_1.CastShadow = false;
        l_Part_1.Massless = true;
        l_Part_1.Transparency = 1;
        l_Part_1.Parent = l_Actor_0;
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = l_Part_0;
        l_Weld_0.Part1 = l_Part_1;
        l_Weld_0.C0 = CFrame.new(0, 0, 0);
        l_Weld_0.Parent = l_Actor_0;
        l_Actor_0.Name = "Droplet";
        l_Actor_0.PrimaryPart = l_Part_0;
        return l_Actor_0;
    end;
    local v27 = setmetatable({}, v5);
    v27.ClassName = "Droplet";
    v27.__index = v27;
    v27.processRendering = function() --[[ Line: 143 ]] --[[ Name: processRendering ]]
        -- upvalues: v11 (copy)
        workspace:BulkMoveTo(v11.Parts, v11.CFrames, Enum.BulkMoveMode.FireCFrameChanged);
        v11.Size = 0;
        table.clear(v11.Parts);
        table.clear(v11.CFrames);
    end;
    v27.new = function(v28) --[[ Line: 156 ]] --[[ Name: new ]]
        -- upvalues: v5 (copy), v27 (copy), v26 (copy), v14 (copy), l_RunService_0 (copy)
        local v29 = setmetatable(v5.new(), v27);
        v29:RegisterSignal("PositionChanged");
        v29:RegisterSignal("Timedout");
        v29:RegisterSignal("Collected");
        v29._RenderClock = 0;
        v29._FrequencyBoost = 1 + Random.new():NextNumber(-0.1, 0.1);
        v29._DropletId = v28.Id;
        v29._Value = v28.Value;
        v29._NetworkPacket = v28.NetworkPacket;
        v29._ResourceTypeData = v28.ResourceTypeData;
        local v30 = v29._ResourceTypeData.Defaults or {};
        v29._CollectionRadius = v30.CollectionRadius or 1.5;
        v29._MaxVelocity = v30.MaxVelocity or 150;
        v29._MaxForce = v30.MaxForce or 1e999;
        v29._Mass = v30.Mass or 1;
        v29._Model = v26();
        v29._Weld = v29._Model.Weld;
        v29:BindToInstance(v29._Model);
        local l_v29_ResourceTypeData_0 = v29:GetResourceTypeData();
        if l_v29_ResourceTypeData_0.SetupDroplet then
            v29._CustomSetupData = l_v29_ResourceTypeData_0.SetupDroplet(v29) or {};
        else
            warn("No Setup function for resource type " .. v29._NetworkPacket.ResourceType);
        end;
        v29:AddTask(task.delay(v28.LifeTime, function() --[[ Line: 197 ]]
            -- upvalues: v29 (copy), v14 (ref), l_v29_ResourceTypeData_0 (copy)
            v29._TimingOut = true;
            v29:FireSignal("Timedout");
            v14(l_v29_ResourceTypeData_0.OnDropletTimeout, v29);
            v29:Destroy();
        end), nil, "LifeTimeThread");
        local l_DropletClientManager_0 = v28.DropletClientManager;
        local l_PrimaryPart_0 = v29:GetModel().PrimaryPart;
        v29:AddTask(l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 213 ]]
            -- upvalues: l_PrimaryPart_0 (copy), l_DropletClientManager_0 (copy), v29 (copy)
            if l_PrimaryPart_0.AssemblyLinearVelocity.Y < 0 then
                l_DropletClientManager_0:_MarkForCollection(v29);
                l_DropletClientManager_0:_MarkForRender(v29);
                v29:RemoveTask("CollectionCheck");
            end;
        end), nil, "CollectionCheck");
        local v35 = 0;
        v29:AddTask(l_RunService_0.Heartbeat:Connect(function(v36) --[[ Line: 223 ]]
            -- upvalues: v29 (copy), l_PrimaryPart_0 (copy), v35 (ref)
            v29:FireSignal("PositionChanged", v29:GetPosition());
            if l_PrimaryPart_0.AssemblyLinearVelocity.Magnitude * v36 <= 0.1 then
                v35 = v35 + v36;
                if v35 >= 0.5 then
                    l_PrimaryPart_0.Anchored = true;
                    l_PrimaryPart_0.CanCollide = false;
                    v29:RemoveTask("SettleCheck");
                end;
            end;
        end), nil, "SettleCheck");
        return v29;
    end;
    v27.GetValue = function(v37) --[[ Line: 246 ]] --[[ Name: GetValue ]]
        return v37._Value;
    end;
    v27.GetMetadata = function(v38) --[[ Line: 253 ]] --[[ Name: GetMetadata ]]
        return v38._NetworkPacket.Metadata;
    end;
    v27.GetResourceTypeData = function(v39) --[[ Line: 260 ]] --[[ Name: GetResourceTypeData ]]
        return v39._ResourceTypeData;
    end;
    v27.GetPosition = function(v40) --[[ Line: 267 ]] --[[ Name: GetPosition ]]
        return v40:GetPivot().Position;
    end;
    v27.GetPivot = function(v41) --[[ Line: 274 ]] --[[ Name: GetPivot ]]
        return v41._Model:GetPivot();
    end;
    v27.GetModel = function(v42) --[[ Line: 281 ]] --[[ Name: GetModel ]]
        return v42._Model;
    end;
    v27.GetSetupData = function(v43) --[[ Line: 289 ]] --[[ Name: GetSetupData ]]
        return v43._CustomSetupData;
    end;
    v27.Identify = function(v44) --[[ Line: 298 ]] --[[ Name: Identify ]]
        return v44._NetworkPacket.Seed, v44._DropletId;
    end;
    v27.IsTimingOut = function(v45) --[[ Line: 305 ]] --[[ Name: IsTimingOut ]]
        return v45._TimingOut == true;
    end;
    v27.AttachModel = function(v46, v47) --[[ Line: 317 ]] --[[ Name: AttachModel ]]
        local v48 = nil;
        if v47:IsA("BasePart") then
            v48 = v47;
        else
            v48 = v47.PrimaryPart;
            assert(v48, "Model must have a PrimaryPart");
        end;
        v47.Parent = v46:GetModel();
        local l_Weld_1 = Instance.new("Weld");
        l_Weld_1.Part0 = v46:GetModel():FindFirstChild("AttachmentPart");
        l_Weld_1.Part1 = v48;
        l_Weld_1.C0 = CFrame.new(0, 0, 0);
        l_Weld_1.Parent = v48;
        return l_Weld_1;
    end;
    v27.Collect = function(v50, v51) --[[ Line: 340 ]] --[[ Name: Collect ]]
        -- upvalues: v14 (copy)
        v50:RemoveTask("MagnetizationThread");
        local l_v50_ResourceTypeData_0 = v50:GetResourceTypeData();
        v14(l_v50_ResourceTypeData_0.OnClientCollect, v51, v50);
        v50:FireSignal("Collected", v51);
        task.defer(function() --[[ Line: 348 ]]
            -- upvalues: v50 (copy)
            v50:Destroy();
        end);
    end;
    v27.Claim = function(v53, v54) --[[ Line: 356 ]] --[[ Name: Claim ]]
        -- upvalues: v14 (copy)
        if v53:IsTimingOut() then
            return warn("Tried to claim but is already Timing Out!");
        else
            v53:RemoveTask("LifeTimeThread");
            v53:Magnetize(v54);
            local l_v53_ResourceTypeData_0 = v53:GetResourceTypeData();
            v14(l_v53_ResourceTypeData_0.OnClientClaim, v54, v53);
            return;
        end;
    end;
    v27.Magnetize = function(v56, v57) --[[ Line: 369 ]] --[[ Name: Magnetize ]]
        -- upvalues: l_Players_0 (copy), l_truncate_0 (copy), v8 (copy), v11 (copy), v4 (copy), l_RunService_0 (copy)
        v56:RemoveTask("LifeTimeThread");
        local v58 = v57 and v57.Parent == l_Players_0 and v57.Character;
        local function v75() --[[ Line: 377 ]] --[[ Name: BeginMagnetization ]]
            -- upvalues: v56 (copy), v57 (copy), l_Players_0 (ref), l_truncate_0 (ref), v8 (ref), v11 (ref), v4 (ref), l_RunService_0 (ref)
            local l_PrimaryPart_1 = v56:GetModel().PrimaryPart;
            assert(l_PrimaryPart_1, "Model must have a PrimaryPart");
            l_PrimaryPart_1.BrickColor = BrickColor.new("Bright red");
            l_PrimaryPart_1.Anchored = true;
            l_PrimaryPart_1.CanCollide = false;
            local v60 = os.clock();
            local v61 = l_PrimaryPart_1.AssemblyLinearVelocity * Vector3.new(1, 0.5, 1, 0);
            local function v74(v62) --[[ Line: 389 ]] --[[ Name: Update ]]
                -- upvalues: v57 (ref), l_Players_0 (ref), v56 (ref), l_PrimaryPart_1 (copy), v61 (ref), l_truncate_0 (ref), v60 (copy), v8 (ref), v11 (ref), v4 (ref)
                if v57.Parent ~= l_Players_0 or not v57.Character then
                    v56:Collect(v57);
                    return;
                else
                    local l_Position_0 = l_PrimaryPart_1.Position;
                    local v64 = v57.Character.PrimaryPart.Position - Vector3.new(0, 1, 0, 0);
                    local v65 = v64 - l_Position_0;
                    local l_Magnitude_0 = v65.Magnitude;
                    local v67 = v65.Unit * v56._MaxVelocity;
                    local v68 = v67 - v61 + v67 * (v56._Mass * 150 / l_Magnitude_0 ^ 2 * 1);
                    v68 = l_truncate_0(v68, v56._MaxForce) / v56._Mass;
                    v61 = l_truncate_0(v61 + v68 * v62, v56._MaxVelocity);
                    local v69 = Vector3.new(0, -1, 0, 0) * v62;
                    if l_Position_0.Y < v64.Y then
                        v69 = v69 / math.max(1, v64.Y - l_Position_0.Y);
                    end;
                    v61 = v61 + v69;
                    local v70 = l_Position_0 + v61 * v62;
                    if os.clock() - v60 < 5 then
                        local v71 = workspace:Raycast(v70 + Vector3.new(0, 2, 0, 0), Vector3.new(0, -2.5, 0, 0), v8);
                        if v71 and v71.Position.Y + 0.5 > v70.Y then
                            v70 = Vector3.new(v70.X, v71.Position.Y + 0.5, v70.Z);
                        end;
                    end;
                    local l_v11_0 = v11;
                    l_v11_0.Size = l_v11_0.Size + 1;
                    v11.Parts[v11.Size] = l_PrimaryPart_1;
                    v11.CFrames[v11.Size] = CFrame.new(v70);
                    v56:FireSignal("PositionChanged", v70);
                    l_v11_0 = l_Magnitude_0 <= v56._CollectionRadius;
                    local v73 = v4.Vector.lineSegmentIntersectsSphere(l_Position_0, v70, v64, v56._CollectionRadius);
                    if l_v11_0 or v73 then
                        v56:Collect(v57);
                        return;
                    else
                        return;
                    end;
                end;
            end;
            v56:AddTask(l_RunService_0.PreAnimation:Connect(v74), nil, "MagnetizationThread");
        end;
        if v58 and (v58:GetPivot().Position - v56:GetPosition()).Magnitude < 80 then
            v75();
            return;
        else
            v56:Collect(v57);
            return;
        end;
    end;
    v27._Render = function(v76, v77) --[[ Line: 476 ]] --[[ Name: _Render ]]
        -- upvalues: v14 (copy)
        local l_v76_ResourceTypeData_0 = v76:GetResourceTypeData();
        local v79 = v14(l_v76_ResourceTypeData_0.OnRenderUpdate, v76, v76._RenderClock);
        if v79 then
            v76._Weld.C0 = v79;
        end;
        v76._RenderClock = v76._RenderClock + v77 * v76._FrequencyBoost;
    end;
    return v27;
end;