local v0 = require(script.Parent.Parent.Signal);
local v1 = require(script.Parent.Parent.Trove);
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v1 (copy), v0 (copy), l_UserInputService_0 (copy)
    local v4 = setmetatable({}, v3);
    v4._trove = v1.new();
    v4.LeftDown = v4._trove:Construct(v0);
    v4.LeftUp = v4._trove:Construct(v0);
    v4.RightDown = v4._trove:Construct(v0);
    v4.RightUp = v4._trove:Construct(v0);
    v4.MiddleDown = v4._trove:Construct(v0);
    v4.MiddleUp = v4._trove:Construct(v0);
    v4.Scrolled = v4._trove:Construct(v0);
    v4.Moved = v4._trove:Construct(v0);
    v4._trove:Connect(l_UserInputService_0.InputBegan, function(v5, v6) --[[ Line: 95 ]]
        -- upvalues: v4 (copy)
        if v6 then
            return;
        elseif v5.UserInputType == Enum.UserInputType.MouseButton1 then
            v4.LeftDown:Fire();
            return;
        elseif v5.UserInputType == Enum.UserInputType.MouseButton2 then
            v4.RightDown:Fire();
            return;
        else
            if v5.UserInputType == Enum.UserInputType.MouseButton3 then
                v4.MiddleDown:Fire();
            end;
            return;
        end;
    end);
    v4._trove:Connect(l_UserInputService_0.InputEnded, function(v7, v8) --[[ Line: 108 ]]
        -- upvalues: v4 (copy)
        if v8 then
            return;
        elseif v7.UserInputType == Enum.UserInputType.MouseButton1 then
            v4.LeftUp:Fire();
            return;
        elseif v7.UserInputType == Enum.UserInputType.MouseButton2 then
            v4.RightUp:Fire();
            return;
        else
            if v7.UserInputType == Enum.UserInputType.MouseButton3 then
                v4.MiddleUp:Fire();
            end;
            return;
        end;
    end);
    v4._trove:Connect(l_UserInputService_0.InputChanged, function(v9, v10) --[[ Line: 121 ]]
        -- upvalues: v4 (copy)
        if v10 then
            return;
        elseif v9.UserInputType == Enum.UserInputType.MouseMovement then
            local l_Position_0 = v9.Position;
            v4.Moved:Fire(Vector2.new(l_Position_0.X, l_Position_0.Y));
            return;
        else
            if v9.UserInputType == Enum.UserInputType.MouseWheel then
                v4.Scrolled:Fire(v9.Position.Z);
            end;
            return;
        end;
    end);
    return v4;
end;
v3.IsLeftDown = function(_) --[[ Line: 139 ]] --[[ Name: IsLeftDown ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
end;
v3.IsRightDown = function(_) --[[ Line: 146 ]] --[[ Name: IsRightDown ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
end;
v3.IsMiddleDown = function(_) --[[ Line: 153 ]] --[[ Name: IsMiddleDown ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton3);
end;
v3.GetPosition = function(_) --[[ Line: 160 ]] --[[ Name: GetPosition ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:GetMouseLocation();
end;
v3.GetDelta = function(_) --[[ Line: 174 ]] --[[ Name: GetDelta ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0:GetMouseDelta();
end;
v3.GetRay = function(_, v18) --[[ Line: 182 ]] --[[ Name: GetRay ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v19 = v18 or l_UserInputService_0:GetMouseLocation();
    return (workspace.CurrentCamera:ViewportPointToRay(v19.X, v19.Y));
end;
v3.Raycast = function(v20, v21, v22, v23) --[[ Line: 209 ]] --[[ Name: Raycast ]]
    local l_v20_Ray_0 = v20:GetRay(v23);
    return (workspace:Raycast(l_v20_Ray_0.Origin, l_v20_Ray_0.Direction * (v22 or 1000), v21));
end;
v3.Project = function(v25, v26, v27) --[[ Line: 241 ]] --[[ Name: Project ]]
    local l_v25_Ray_0 = v25:GetRay(v27);
    return l_v25_Ray_0.Origin + l_v25_Ray_0.Direction.Unit * (v26 or 1000);
end;
v3.Lock = function(_) --[[ Line: 255 ]] --[[ Name: Lock ]]
    -- upvalues: l_UserInputService_0 (copy)
    l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition;
end;
v3.LockCenter = function(_) --[[ Line: 266 ]] --[[ Name: LockCenter ]]
    -- upvalues: l_UserInputService_0 (copy)
    l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCenter;
end;
v3.Unlock = function(_) --[[ Line: 273 ]] --[[ Name: Unlock ]]
    -- upvalues: l_UserInputService_0 (copy)
    l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
end;
v3.Destroy = function(v32) --[[ Line: 280 ]] --[[ Name: Destroy ]]
    v32._trove:Destroy();
end;
return v3;