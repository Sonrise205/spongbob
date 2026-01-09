local l_HttpService_0 = game:GetService("HttpService");
local function _(v1, v2) --[[ Line: 32 ]] --[[ Name: clearItemFromFolder ]]
    local l_workspace_FirstChild_0 = workspace:FindFirstChild(v1);
    if l_workspace_FirstChild_0 == nil then
        return;
    else
        local l_l_workspace_FirstChild_0_FirstChild_0 = l_workspace_FirstChild_0:FindFirstChild(v2);
        if l_l_workspace_FirstChild_0_FirstChild_0 then
            l_l_workspace_FirstChild_0_FirstChild_0:Destroy();
        end;
        return;
    end;
end;
local v6 = {};
v6.vectorFromCFrame = function(v7, v8, v9, v10) --[[ Line: 54 ]] --[[ Name: vectorFromCFrame ]]
    -- upvalues: v6 (copy)
    return v6.vector(v7, v8.Position, v8.Position + v8.LookVector, v9, v10);
end;
v6.vector = function(v11, v12, v13, v14, v15) --[[ Line: 69 ]] --[[ Name: vector ]]
    -- upvalues: l_HttpService_0 (copy), v6 (copy)
    if not v11 then
        v11 = l_HttpService_0:GenerateGUID(false);
    end;
    if typeof(v12) == "Instance" then
        if v12:IsA("PVInstance") then
            v12 = v12:GetPivot();
        elseif v12:IsA("Attachment") then
            v12 = v12.WorldCFrame;
        end;
        assert(typeof(v12) == "CFrame", "Instance must be a PVInstance or Attachment");
        if v13 ~= nil then
            v12 = v12.Position;
        end;
    end;
    if typeof(v13) == "Instance" then
        if v13:IsA("BasePart") then
            v13 = v13.Position;
        elseif v13:IsA("Attachment") then
            v13 = v13.WorldPosition;
        end;
        assert(typeof(v13) == "CFrame", "Instance must be a BasePart or Attachment");
    end;
    if typeof(v12) == "CFrame" and v13 == nil then
        local l_LookVector_0 = v12.LookVector;
        v13 = v12.Position;
        v12 = v13 + l_LookVector_0 * -10;
    end;
    assert(typeof(v12) == "Vector3", "Passed parameters are of invalid types");
    if v13 == nil then
        v13 = v12;
        v12 = v13 + Vector3.new(0, 10, 0, 0);
    end;
    assert(typeof(v13) == "Vector3", "Passed parameters are of invalid types");
    local v17 = v15 or 1;
    local v18 = workspace:FindFirstChild("Arrows") or Instance.new("Folder");
    v18.Name = "Arrows";
    v18.Parent = workspace;
    local l_v18_FirstChild_0 = v18:FindFirstChild(v11);
    if not l_v18_FirstChild_0 then
        l_v18_FirstChild_0 = Instance.new("Model");
        l_v18_FirstChild_0.Name = v11;
    end;
    local l_l_v18_FirstChild_0_FirstChild_0 = l_v18_FirstChild_0:FindFirstChild(v11 .. "_shaft");
    if not l_l_v18_FirstChild_0_FirstChild_0 then
        l_l_v18_FirstChild_0_FirstChild_0 = Instance.new("CylinderHandleAdornment");
        v14 = v14 or BrickColor.random().Color;
    else
        v14 = v14 or l_l_v18_FirstChild_0_FirstChild_0.Color3;
    end;
    if l_l_v18_FirstChild_0_FirstChild_0.Parent == nil then
        l_l_v18_FirstChild_0_FirstChild_0.Name = v11 .. "_shaft";
        l_l_v18_FirstChild_0_FirstChild_0.Color3 = v14;
        l_l_v18_FirstChild_0_FirstChild_0.Radius = 0.15;
        l_l_v18_FirstChild_0_FirstChild_0.Adornee = workspace.Terrain;
        l_l_v18_FirstChild_0_FirstChild_0.Transparency = 0;
        l_l_v18_FirstChild_0_FirstChild_0.Radius = 0.15 * v17;
        l_l_v18_FirstChild_0_FirstChild_0.Transparency = 0;
        l_l_v18_FirstChild_0_FirstChild_0.AlwaysOnTop = true;
        l_l_v18_FirstChild_0_FirstChild_0.ZIndex = 5 - math.ceil(v17);
    end;
    l_l_v18_FirstChild_0_FirstChild_0.Height = (v12 - v13).Magnitude - 2;
    l_l_v18_FirstChild_0_FirstChild_0.CFrame = CFrame.lookAt((v12 + v13) / 2 - (v13 - v12).Unit * 1, v13);
    l_l_v18_FirstChild_0_FirstChild_0.Parent = l_v18_FirstChild_0;
    local v21 = l_v18_FirstChild_0:FindFirstChild(v11 .. "_head") or Instance.new("ConeHandleAdornment");
    v17 = v17 == 1 and 1 or 1.4;
    if v21.Parent == nil then
        v21.Name = v11 .. "_head";
        v21.Color3 = v14;
        v21.Radius = 0.5 * v17;
        v21.Transparency = 0;
        v21.Adornee = workspace.Terrain;
        v21.Height = 2 * v17;
        v21.AlwaysOnTop = true;
        v21.ZIndex = 5 - math.ceil(v17);
    end;
    v21.CFrame = CFrame.lookAt((CFrame.lookAt(v13, v12) * CFrame.new(0, 0, -2 - (v17 - 1) / 2)).Position, v13);
    v21.Parent = l_v18_FirstChild_0;
    l_v18_FirstChild_0.Parent = v18;
    if v17 == 1 then
        v6.vector(v11 .. "_backdrop", v12, v13, Color3.new(0, 0, 0), 2);
    end;
end;
v6.clearVector = function(v22) --[[ Line: 178 ]] --[[ Name: clearVector ]]
    local l_Arrows_0 = workspace:FindFirstChild("Arrows");
    if l_Arrows_0 ~= nil then
        local l_l_Arrows_0_FirstChild_0 = l_Arrows_0:FindFirstChild(v22);
        if l_l_Arrows_0_FirstChild_0 then
            l_l_Arrows_0_FirstChild_0:Destroy();
        end;
    end;
    l_Arrows_0 = v22 .. "_backdrop";
    local l_Arrows_1 = workspace:FindFirstChild("Arrows");
    if l_Arrows_1 == nil then
        return;
    else
        local l_l_Arrows_1_FirstChild_0 = l_Arrows_1:FindFirstChild(l_Arrows_0);
        if l_l_Arrows_1_FirstChild_0 then
            l_l_Arrows_1_FirstChild_0:Destroy();
        end;
        return;
    end;
end;
v6.point = function(v27, v28, v29, v30) --[[ Line: 191 ]] --[[ Name: point ]]
    local v31 = workspace:FindFirstChild("Points") or Instance.new("Folder");
    v31.Name = "Points";
    v31.Parent = workspace;
    v29 = v29 or 0.25;
    v30 = v30 or Color3.new(1, 1, 1);
    local v32 = v31:FindFirstChild(v27) or Instance.new("Part");
    if v32.Parent == nil then
        v32.Name = v27;
        v32.CanQuery = false;
        v32.Anchored = true;
        v32.CanCollide = false;
        v32.CastShadow = false;
        v32.Shape = Enum.PartType.Ball;
    end;
    if typeof(v28) == "CFrame" then
        v28 = v28.Position;
    end;
    v32.Position = v28;
    v32.Size = Vector3.new(1, 1, 1, 0) * v29;
    v32.Color = v30;
    v32.Parent = v31;
    return v32;
end;
v6.clearPoint = function(v33) --[[ Line: 227 ]] --[[ Name: clearPoint ]]
    local l_Points_0 = workspace:FindFirstChild("Points");
    if l_Points_0 == nil then
        return;
    else
        local l_l_Points_0_FirstChild_0 = l_Points_0:FindFirstChild(v33);
        if l_l_Points_0_FirstChild_0 then
            l_l_Points_0_FirstChild_0:Destroy();
        end;
        return;
    end;
end;
v6.line = function(v36, v37, v38, v39, v40) --[[ Line: 234 ]] --[[ Name: line ]]
    local v41 = workspace:FindFirstChild("Lines") or Instance.new("Folder");
    v41.Name = "Lines";
    v41.Parent = workspace;
    v39 = v39 or 0.25;
    local v42 = v41:FindFirstChild(v36) or Instance.new("Part");
    if v42.Parent == nil then
        v42.Name = v36;
        v42.CanQuery = false;
        v42.Anchored = true;
        v42.CanCollide = false;
        v42.CastShadow = false;
        v42.Shape = Enum.PartType.Cylinder;
    end;
    v42.CFrame = CFrame.lookAt(v37, v38) * CFrame.new(0, 0, -((v37 - v38).Magnitude / 2)) * CFrame.Angles(0, 1.5707963267948966, 0);
    v42.Size = Vector3.new((v37 - v38).Magnitude, v39, v39);
    v42.Color = v40 or Color3.new(1, 1, 1);
    v42.Parent = v41;
    return v42;
end;
v6.clearLine = function(v43) --[[ Line: 265 ]] --[[ Name: clearLine ]]
    local l_Lines_0 = workspace:FindFirstChild("Lines");
    if l_Lines_0 == nil then
        return;
    else
        local l_l_Lines_0_FirstChild_0 = l_Lines_0:FindFirstChild(v43);
        if l_l_Lines_0_FirstChild_0 then
            l_l_Lines_0_FirstChild_0:Destroy();
        end;
        return;
    end;
end;
return v6;