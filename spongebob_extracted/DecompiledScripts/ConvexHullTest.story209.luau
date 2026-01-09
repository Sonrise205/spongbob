local v0 = require(script.Parent.Parent);
local v1 = math.random(12, 20);
return function(_) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_Position_0 = (l_CurrentCamera_0.CFrame + l_CurrentCamera_0.CFrame.LookVector * 20).Position;
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "HullStory";
    l_Folder_0.Archivable = false;
    l_Folder_0:AddTag("Destroy");
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "PLATE";
    l_Part_0.Size = Vector3.new(60, 0.10000000149011612, 60, 0);
    l_Part_0.BrickColor = BrickColor.DarkGray();
    l_Part_0.Transparency = 0.5;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Position = l_Position_0 - Vector3.new(0, 1, 0, 0);
    l_Part_0.Locked = true;
    l_Part_0.Parent = l_Folder_0;
    for _ = 1, v1 do
        local l_Part_1 = Instance.new("Part");
        l_Part_1.Name = "PolygonPoint";
        l_Part_1.Size = Vector3.new(2, 2, 2, 0);
        l_Part_1.CanCollide = false;
        l_Part_1.Anchored = true;
        l_Part_1.Transparency = 0;
        l_Part_1.Position = l_Position_0 + Vector3.new(math.random(-15, 15), 0, math.random(-15, 15));
        l_Part_1.Parent = l_Folder_0;
    end;
    l_Folder_0.Parent = workspace;
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "HullEdges";
    l_Model_0.Parent = l_Folder_0;
    local function v20() --[[ Line: 45 ]] --[[ Name: generateHull ]]
        -- upvalues: l_Model_0 (copy), l_Folder_0 (copy), v0 (ref)
        l_Model_0:ClearAllChildren();
        local v10 = {};
        local v11 = 0;
        for _, v13 in ipairs(l_Folder_0:GetChildren()) do
            if v13.Name == "PolygonPoint" then
                v11 = v11 + v13.Position.Y;
                table.insert(v10, Vector2.new(v13.Position.X, v13.Position.Z));
            end;
        end;
        v11 = v11 / #v10;
        local v14 = v0.Vector.calculateConvexHullGrahamScan(v10);
        for v15 = 1, #v14 do
            local v16 = v15 + 1;
            if #v14 < v16 then
                v16 = 1;
            end;
            local v17 = Vector3.new(v14[v16].X, v11, v14[v16].Y);
            local v18 = Vector3.new(v14[v15].X, v11, v14[v15].Y);
            local v19 = v0.Draw.line(tostring(v15), v17, v18);
            v19.Locked = true;
            v19.CanCollide = false;
            v19.CanQuery = false;
            v19.Parent = l_Model_0;
        end;
    end;
    local v21 = true;
    for _, v23 in ipairs(l_Folder_0:GetChildren()) do
        if v23.Name == "PolygonPoint" then
            v23:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 82 ]]
                -- upvalues: v21 (ref)
                v21 = true;
            end);
        end;
    end;
    local v24 = task.defer(function() --[[ Line: 87 ]]
        -- upvalues: v21 (ref), v20 (copy)
        while true do
            if v21 then
                v21 = false;
                v20();
            end;
            task.wait(0.05);
        end;
    end);
    return function() --[[ Line: 97 ]]
        -- upvalues: v24 (copy), l_Folder_0 (copy)
        task.cancel(v24);
        l_Folder_0:Destroy();
    end;
end;