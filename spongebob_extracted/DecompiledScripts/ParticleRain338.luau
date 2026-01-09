local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        v2.PlayerGui
    }
});
v6.Construct = function(v7) --[[ Line: 32 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v7.dump = v4.new();
    v7.template = v7.Instance.Template;
    v7.template.Parent = nil;
    v7.ui = v7.Instance;
    if not v7.ui:IsA("ScreenGui") then
        v7.ui = v7.Instance:FindFirstAncestorOfClass("ScreenGui");
    end;
    v7.dump:Add(function() --[[ Line: 44 ]]
        -- upvalues: v7 (copy)
        v7.dump = nil;
    end);
end;
v6.Start = function(v8) --[[ Line: 49 ]] --[[ Name: Start ]]
    -- upvalues: l_RunService_0 (copy)
    local v9 = {};
    v8.drops = v9;
    v8.dump:Add(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 53 ]]
        -- upvalues: v9 (copy), v8 (copy)
        if #v9 >= 10 then
            v8.dump:Remove("DropSpawner");
            return;
        else
            if math.random() < 0.1 then
                local v10 = v8.template:Clone();
                v10.Position = UDim2.fromScale(math.random(), math.random(-1, -0.5));
                v10.Rotation = math.random(0, 360);
                v10.ImageTransparency = 0;
                v10.Parent = v8.Instance;
                table.insert(v9, v10);
                v8.dump:Add(v10);
            end;
            return;
        end;
    end), "DropSpawner");
    if v8.ui.Enabled then
        v8:Rain();
    end;
    v8.dump:Add(v8.ui:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 75 ]]
        -- upvalues: v8 (copy)
        if v8.ui.Enabled then
            v8:Rain();
            return;
        else
            v8:DisableRain();
            return;
        end;
    end));
end;
v6.Rain = function(v11) --[[ Line: 85 ]] --[[ Name: Rain ]]
    -- upvalues: l_RunService_0 (copy)
    v11.dump:Add(l_RunService_0.RenderStepped:Connect(function(v12) --[[ Line: 86 ]]
        -- upvalues: v11 (copy)
        for _, v14 in pairs(v11.drops) do
            if v14.Position.Y.Scale >= 1.1 then
                v14.Position = UDim2.fromScale(math.random(), math.random(-1, -0.5));
                v14.Rotation = math.random(0, 360);
                v14.ImageTransparency = 0;
            end;
            if v14.Position.Y.Scale >= 0.65 then
                v14.ImageTransparency = v14.ImageTransparency + v12 * 2;
            end;
            v14.Rotation = (v14.Rotation + v12 * math.random(20, 40)) % 360;
            v14.Position = v14.Position + UDim2.fromScale(0, v12 / 2);
        end;
    end), "Raining");
end;
v6.DisableRain = function(v15) --[[ Line: 104 ]] --[[ Name: DisableRain ]]
    if v15.dump:Get("Raining") then
        v15.dump:Remove("Raining");
    end;
end;
v6.Stop = function(v16) --[[ Line: 110 ]] --[[ Name: Stop ]]
    v16.template.Parent = v16.Instance;
    if v16.dump then
        v16.dump:Destroy();
    end;
    table.clear(v16.drops);
    v16.drops = nil;
end;
return v6;