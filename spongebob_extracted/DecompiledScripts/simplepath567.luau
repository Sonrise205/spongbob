local v0 = {
    TIME_VARIANCE = 0.07, 
    COMPARISON_CHECKS = 1, 
    JUMP_WHEN_STUCK = true
};
local l_PathfindingService_0 = game:GetService("PathfindingService");
local l_Players_0 = game:GetService("Players");
local function _(v3, v4) --[[ Line: 24 ]] --[[ Name: output ]]
    v3((v3 == error and "SimplePath Error: " or "SimplePath: ") .. v4);
end;
local v6 = {
    StatusType = {
        Idle = "Idle", 
        Active = "Active"
    }, 
    ErrorType = {
        LimitReached = "LimitReached", 
        TargetUnreachable = "TargetUnreachable", 
        ComputationError = "ComputationError", 
        AgentStuck = "AgentStuck"
    }
};
v6.__index = function(v7, v8) --[[ Line: 39 ]]
    -- upvalues: v6 (copy)
    if v8 == "Stopped" and not v7._humanoid then
        local l_error_0 = error;
        l_error_0((l_error_0 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to use Path.Stopped on a non-humanoid.");
    end;
    return v7._events[v8] and v7._events[v8].Event or v8 == "LastError" and v7._lastError or v8 == "Status" and v7._status or v6[v8];
end;
local l_Part_0 = Instance.new("Part");
l_Part_0.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.Material = Enum.Material.Neon;
l_Part_0.Shape = Enum.PartType.Ball;
local function _(v11, v12) --[[ Line: 58 ]] --[[ Name: declareError ]]
    v11._lastError = v12;
    v11._events.Error:Fire(v12);
end;
local function v19(v14) --[[ Line: 64 ]] --[[ Name: createVisualWaypoints ]]
    -- upvalues: l_Part_0 (copy)
    local v15 = {};
    for _, v17 in ipairs(v14) do
        local v18 = l_Part_0:Clone();
        v18.Position = v17.Position;
        v18.Parent = workspace;
        v18.Color = v17 == v14[#v14] and Color3.fromRGB(0, 255, 0) or v17.Action == Enum.PathWaypointAction.Jump and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 139, 0);
        table.insert(v15, v18);
    end;
    return v15;
end;
local _ = function(v20) --[[ Line: 80 ]] --[[ Name: destroyVisualWaypoints ]]
    if v20 then
        for _, v22 in ipairs(v20) do
            v22:Destroy();
        end;
    end;
end;
local function v26(v24) --[[ Line: 90 ]] --[[ Name: getNonHumanoidWaypoint ]]
    for v25 = 2, #v24._waypoints do
        if (v24._waypoints[v25].Position - v24._waypoints[v25 - 1].Position).Magnitude > 0.1 then
            return v25;
        end;
    end;
    return 2;
end;
local function _(v27) --[[ Line: 101 ]] --[[ Name: setJumpState ]]
    pcall(function() --[[ Line: 102 ]]
        -- upvalues: v27 (copy)
        if v27._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v27._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
            v27._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        end;
    end);
end;
local function _(v29) --[[ Line: 110 ]] --[[ Name: move ]]
    if v29._waypoints[v29._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
        pcall(function() --[[ Line: 102 ]]
            -- upvalues: v29 (copy)
            if v29._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v29._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                v29._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
            end;
        end);
    end;
    v29._humanoid:MoveTo(v29._waypoints[v29._currentWaypoint].Position);
end;
local function _(v31) --[[ Line: 118 ]] --[[ Name: disconnectMoveConnection ]]
    v31._moveConnection:Disconnect();
    v31._moveConnection = nil;
end;
local function _(v33) --[[ Line: 124 ]] --[[ Name: invokeWaypointReached ]]
    local v34 = v33._waypoints[v33._currentWaypoint - 1];
    local v35 = v33._waypoints[v33._currentWaypoint];
    v33._events.WaypointReached:Fire(v33._agent, v34, v35);
end;
local function v57(v37, v38) --[[ Line: 130 ]] --[[ Name: moveToFinished ]]
    -- upvalues: v6 (copy)
    if not getmetatable(v37) then
        return;
    elseif not v37._humanoid then
        if v38 and v37._currentWaypoint + 1 <= #v37._waypoints then
            local v39 = v37._waypoints[v37._currentWaypoint - 1];
            local v40 = v37._waypoints[v37._currentWaypoint];
            v37._events.WaypointReached:Fire(v37._agent, v39, v40);
            v37._currentWaypoint = v37._currentWaypoint + 1;
            return;
        elseif v38 then
            local l__visualWaypoints_0 = v37._visualWaypoints;
            if l__visualWaypoints_0 then
                for _, v43 in ipairs(l__visualWaypoints_0) do
                    v43:Destroy();
                end;
            end;
            v37._visualWaypoints = nil;
            v37._target = nil;
            v37._events.Reached:Fire(v37._agent, v37._waypoints[v37._currentWaypoint]);
            return;
        else
            local l__visualWaypoints_1 = v37._visualWaypoints;
            if l__visualWaypoints_1 then
                for _, v46 in ipairs(l__visualWaypoints_1) do
                    v46:Destroy();
                end;
            end;
            v37._visualWaypoints = nil;
            v37._target = nil;
            local l_TargetUnreachable_0 = v37.ErrorType.TargetUnreachable;
            v37._lastError = l_TargetUnreachable_0;
            v37._events.Error:Fire(l_TargetUnreachable_0);
            return;
        end;
    elseif v38 and v37._currentWaypoint + 1 <= #v37._waypoints then
        if v37._currentWaypoint + 1 < #v37._waypoints then
            local v48 = v37._waypoints[v37._currentWaypoint - 1];
            local v49 = v37._waypoints[v37._currentWaypoint];
            v37._events.WaypointReached:Fire(v37._agent, v48, v49);
        end;
        v37._currentWaypoint = v37._currentWaypoint + 1;
        if v37._waypoints[v37._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
            pcall(function() --[[ Line: 102 ]]
                -- upvalues: v37 (copy)
                if v37._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v37._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                    v37._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                end;
            end);
        end;
        v37._humanoid:MoveTo(v37._waypoints[v37._currentWaypoint].Position);
        return;
    elseif v38 then
        v37._moveConnection:Disconnect();
        v37._moveConnection = nil;
        v37._status = v6.StatusType.Idle;
        local l__visualWaypoints_2 = v37._visualWaypoints;
        if l__visualWaypoints_2 then
            for _, v52 in ipairs(l__visualWaypoints_2) do
                v52:Destroy();
            end;
        end;
        v37._visualWaypoints = nil;
        v37._events.Reached:Fire(v37._agent, v37._waypoints[v37._currentWaypoint]);
        return;
    else
        v37._moveConnection:Disconnect();
        v37._moveConnection = nil;
        v37._status = v6.StatusType.Idle;
        local l__visualWaypoints_3 = v37._visualWaypoints;
        if l__visualWaypoints_3 then
            for _, v55 in ipairs(l__visualWaypoints_3) do
                v55:Destroy();
            end;
        end;
        v37._visualWaypoints = nil;
        local l_TargetUnreachable_1 = v37.ErrorType.TargetUnreachable;
        v37._lastError = l_TargetUnreachable_1;
        v37._events.Error:Fire(l_TargetUnreachable_1);
        return;
    end;
end;
local function v60(v58) --[[ Line: 172 ]] --[[ Name: comparePosition ]]
    if v58._currentWaypoint == #v58._waypoints then
        return;
    else
        v58._position._count = (v58._agent.PrimaryPart.Position - v58._position._last).Magnitude <= 0.07 and v58._position._count + 1 or 0;
        v58._position._last = v58._agent.PrimaryPart.Position;
        if v58._position._count >= v58._settings.COMPARISON_CHECKS then
            if v58._settings.JUMP_WHEN_STUCK then
                pcall(function() --[[ Line: 102 ]]
                    -- upvalues: v58 (copy)
                    if v58._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v58._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                        v58._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                    end;
                end);
            end;
            local l_AgentStuck_0 = v58.ErrorType.AgentStuck;
            v58._lastError = l_AgentStuck_0;
            v58._events.Error:Fire(l_AgentStuck_0);
        end;
        return;
    end;
end;
v6.GetNearestCharacter = function(v61) --[[ Line: 185 ]] --[[ Name: GetNearestCharacter ]]
    -- upvalues: l_Players_0 (copy)
    local v62 = nil;
    local v63 = 1e999;
    for _, v65 in ipairs(l_Players_0:GetPlayers()) do
        if v65.Character and (v65.Character.PrimaryPart.Position - v61).Magnitude < v63 then
            v62 = v65.Character;
            v63 = (v65.Character.PrimaryPart.Position - v61).Magnitude;
        end;
    end;
    return v62;
end;
v6.new = function(v66, v67, v68) --[[ Line: 196 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_PathfindingService_0 (copy), v6 (copy)
    if not v66 or not v66:IsA("Model") or not v66.PrimaryPart then
        local l_error_1 = error;
        l_error_1((l_error_1 == error and "SimplePath Error: " or "SimplePath: ") .. "Pathfinding agent must be a valid Model Instance with a set PrimaryPart.");
    end;
    local v70 = setmetatable({
        _settings = v68 or v0, 
        _events = {
            Reached = Instance.new("BindableEvent"), 
            WaypointReached = Instance.new("BindableEvent"), 
            Blocked = Instance.new("BindableEvent"), 
            Error = Instance.new("BindableEvent"), 
            Stopped = Instance.new("BindableEvent")
        }, 
        _agent = v66, 
        _humanoid = v66:FindFirstChildOfClass("Humanoid"), 
        _path = l_PathfindingService_0:CreatePath(v67), 
        _status = "Idle", 
        _t = 0, 
        _position = {
            _last = Vector3.new(), 
            _count = 0
        }
    }, v6);
    for v71, v72 in pairs(v0) do
        v70._settings[v71] = v70._settings[v71] == nil and v72 or v70._settings[v71];
    end;
    v70._path.Blocked:Connect(function(...) --[[ Line: 227 ]]
        -- upvalues: v70 (copy)
        if v70._currentWaypoint <= ... and ... <= v70._currentWaypoint + 1 and v70._humanoid then
            local l_v70_0 = v70;
            pcall(function() --[[ Line: 102 ]]
                -- upvalues: l_v70_0 (copy)
                if l_v70_0._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and l_v70_0._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                    l_v70_0._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                end;
            end);
            v70._events.Blocked:Fire(v70._agent, v70._waypoints[...]);
        end;
    end);
    return v70;
end;
v6.Destroy = function(v74) --[[ Line: 239 ]] --[[ Name: Destroy ]]
    for _, v76 in ipairs(v74._events) do
        v76:Destroy();
    end;
    v74._events = nil;
    if rawget(v74, "_visualWaypoints") then
        local l__visualWaypoints_4 = v74._visualWaypoints;
        if l__visualWaypoints_4 then
            for _, v79 in ipairs(l__visualWaypoints_4) do
                v79:Destroy();
            end;
        end;
        v74._visualWaypoints = nil;
    end;
    v74._path:Destroy();
    setmetatable(v74, nil);
    for v80, _ in pairs(v74) do
        v74[v80] = nil;
    end;
end;
v6.Stop = function(v82) --[[ Line: 254 ]] --[[ Name: Stop ]]
    -- upvalues: v6 (copy)
    if not v82._humanoid then
        local l_error_2 = error;
        l_error_2((l_error_2 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to call Path:Stop() on a non-humanoid.");
        return;
    elseif v82._status == v6.StatusType.Idle then
        local function v85(v84) --[[ Line: 260 ]]
            warn(debug.traceback(v84));
        end;
        v85((v85 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to run Path:Stop() in idle state");
        return;
    else
        v82._moveConnection:Disconnect();
        v82._moveConnection = nil;
        v82._status = v6.StatusType.Idle;
        local l__visualWaypoints_5 = v82._visualWaypoints;
        if l__visualWaypoints_5 then
            for _, v88 in ipairs(l__visualWaypoints_5) do
                v88:Destroy();
            end;
        end;
        v82._visualWaypoints = nil;
        v82._events.Stopped:Fire(v82._model);
        return;
    end;
end;
v6.Run = function(v89, v90) --[[ Line: 271 ]] --[[ Name: Run ]]
    -- upvalues: v57 (copy), v6 (copy), v60 (copy), v19 (copy), v26 (copy)
    if not v90 and not v89._humanoid and v89._target then
        v57(v89, true);
        return;
    else
        if not v90 or typeof(v90) ~= "Vector3" and not v90:IsA("BasePart") then
            local l_error_3 = error;
            l_error_3((l_error_3 == error and "SimplePath Error: " or "SimplePath: ") .. "Pathfinding target must be a valid Vector3 or BasePart.");
        end;
        if os.clock() - v89._t <= v89._settings.TIME_VARIANCE and v89._humanoid then
            task.wait(os.clock() - v89._t);
            local l_LimitReached_0 = v89.ErrorType.LimitReached;
            v89._lastError = l_LimitReached_0;
            v89._events.Error:Fire(l_LimitReached_0);
            return false;
        else
            if v89._humanoid then
                v89._t = os.clock();
            end;
            local l_status_0, _ = pcall(function() --[[ Line: 294 ]]
                -- upvalues: v89 (copy), v90 (copy)
                v89._path:ComputeAsync(v89._agent.PrimaryPart.Position, typeof(v90) == "Vector3" and v90 or v90.Position);
            end);
            if not l_status_0 or v89._path.Status == Enum.PathStatus.NoPath or #v89._path:GetWaypoints() < 2 or v89._humanoid and v89._humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                local l__visualWaypoints_6 = v89._visualWaypoints;
                if l__visualWaypoints_6 then
                    for _, v97 in ipairs(l__visualWaypoints_6) do
                        v97:Destroy();
                    end;
                end;
                v89._visualWaypoints = nil;
                task.wait();
                local l_ComputationError_0 = v89.ErrorType.ComputationError;
                v89._lastError = l_ComputationError_0;
                v89._events.Error:Fire(l_ComputationError_0);
                return false;
            else
                v89._status = v89._humanoid and v6.StatusType.Active or v6.StatusType.Idle;
                v89._target = v90;
                pcall(function() --[[ Line: 314 ]]
                    -- upvalues: v89 (copy)
                    v89._agent.PrimaryPart:SetNetworkOwner(nil);
                end);
                v89._waypoints = v89._path:GetWaypoints();
                v89._currentWaypoint = 2;
                if v89._humanoid then
                    v60(v89);
                end;
                local l__visualWaypoints_7 = v89._visualWaypoints;
                if l__visualWaypoints_7 then
                    for _, v101 in ipairs(l__visualWaypoints_7) do
                        v101:Destroy();
                    end;
                end;
                v89._visualWaypoints = v89.Visualize and v19(v89._waypoints);
                v89._moveConnection = v89._humanoid and (v89._moveConnection or v89._humanoid.MoveToFinished:Connect(function(...) --[[ Line: 332 ]]
                    -- upvalues: v57 (ref), v89 (copy)
                    v57(v89, ...);
                end));
                if v89._humanoid then
                    v89._humanoid:MoveTo(v89._waypoints[v89._currentWaypoint].Position);
                elseif #v89._waypoints == 2 then
                    v89._target = nil;
                    local l__visualWaypoints_8 = v89._visualWaypoints;
                    if l__visualWaypoints_8 then
                        for _, v104 in ipairs(l__visualWaypoints_8) do
                            v104:Destroy();
                        end;
                    end;
                    v89._visualWaypoints = nil;
                    v89._events.Reached:Fire(v89._agent, v89._waypoints[2]);
                else
                    v89._currentWaypoint = v26(v89);
                    v57(v89, true);
                end;
                return true;
            end;
        end;
    end;
end;
return v6;