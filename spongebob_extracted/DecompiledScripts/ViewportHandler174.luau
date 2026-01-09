local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6) --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v7 = setmetatable({
        dumpster = v2.new(), 
        properties = v6, 
        container = v4
    }, v3);
    v7.viewport = Instance.new("ViewportFrame");
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v7.viewport;
    v7.worldModel = l_WorldModel_0;
    local v9 = v5:Clone();
    v9.Parent = l_WorldModel_0;
    v7.object = v9;
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Parent = v7.viewport;
    v7.camera = l_Camera_0;
    v7.viewport.CurrentCamera = l_Camera_0;
    if v6 then
        for v11, v12 in pairs(v6) do
            v7.viewport[v11] = v12;
        end;
    end;
    v7.dumpster:Add(v7.viewport);
    v7.dumpster:Add(l_WorldModel_0);
    v7.dumpster:Add(v9);
    v7.dumpster:Add(l_Camera_0);
    v7.dumpster:Add(function() --[[ Line: 108 ]]
        -- upvalues: v7 (copy), l_WorldModel_0 (ref), v9 (ref), l_Camera_0 (ref)
        v7.dumpster = nil;
        v7.viewport = nil;
        l_WorldModel_0 = nil;
        v9 = nil;
        l_Camera_0 = nil;
        v7:Destroy();
    end);
    v7.viewport.Parent = v4;
    return v7;
end;
v3.Render = function(v13, v14) --[[ Line: 124 ]] --[[ Name: Render ]]
    -- upvalues: l_RunService_0 (copy)
    if v13.subDump then
        v13.subDump:Clean();
    end;
    v13.subDump = v13.dumpster:Extend();
    v13:RenderOnce(v14, 0);
    v13.subDump:Add(l_RunService_0.RenderStepped:Connect(function(v15) --[[ Line: 133 ]]
        -- upvalues: v14 (copy), v13 (copy)
        if not v14 then
            return;
        else
            v13:_update(v14, v15);
            return;
        end;
    end));
end;
v3.RenderOnce = function(v16, v17) --[[ Line: 144 ]] --[[ Name: RenderOnce ]]
    v16:_update(v17, 0);
end;
v3.GetObjectSize = function(v18) --[[ Line: 150 ]] --[[ Name: GetObjectSize ]]
    local v19 = nil;
    if v18.object:IsA("BasePart") then
        v19 = v18.object.Size;
    elseif v18.object:IsA("Model") then
        v19 = v18.object:GetExtentsSize();
    end;
    if not v19 then
        return;
    else
        return v19, (math.max(v19.X, v19.Y, v19.Z));
    end;
end;
v3.Destroy = function(v20) --[[ Line: 167 ]] --[[ Name: Destroy ]]
    if v20.dumpster then
        v20.dumpster:Destroy();
    end;
    table.clear(v20);
    setmetatable(v20, nil);
end;
v3._update = function(v21, v22, v23) --[[ Line: 177 ]] --[[ Name: _update ]]
    v22(v21.object, v21.camera, v23);
end;
return v3;