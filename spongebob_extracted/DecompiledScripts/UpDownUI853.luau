local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local v7 = {};
local v8 = 0;
local v9 = Random.new(game.GameId);
local v12 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        v2.Player.PlayerGui
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v10) --[[ Line: 33 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v5 (copy)
                local v11 = v10.Instance:IsA("GuiObject");
                if not v11 then
                    v5:Warn("UpDownUI component can only be applied to GuiObjects:", v10.Instance:GetFullName());
                end;
                return v11;
            end
        }
    }
});
v12.Construct = function(v13) --[[ Line: 44 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v13.dumpster = v3.new();
end;
v12.Start = function(v14) --[[ Line: 48 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy), v7 (copy), v9 (copy), v8 (ref)
    local v15 = v14.Instance:GetAttribute("Direction") or 1;
    local v16 = v14.Instance:GetAttribute("Amplitude") or 0.1;
    local v17 = v14.Instance:GetAttribute("Speed") or 1;
    local v18 = v14.Instance:GetAttribute("SyncOffset") or 10;
    v14.dumpster:Add(v6(v14.Instance, "Direction", function(v19) --[[ Line: 54 ]]
        -- upvalues: v15 (ref), v7 (ref), v14 (copy)
        v15 = v19 or 1;
        local v20 = v7[v14.Instance];
        if v20 then
            v20.direction = v15;
        end;
    end));
    v14.dumpster:Add(v6(v14.Instance, "Amplitude", function(v21) --[[ Line: 63 ]]
        -- upvalues: v16 (ref), v7 (ref), v14 (copy)
        v16 = v21 or 0.1;
        local v22 = v7[v14.Instance];
        if v22 then
            v22.amplitude = v16;
        end;
    end));
    v14.dumpster:Add(v6(v14.Instance, "Speed", function(v23) --[[ Line: 72 ]]
        -- upvalues: v17 (ref), v7 (ref), v14 (copy)
        v17 = v23 or 1;
        local v24 = v7[v14.Instance];
        if v24 then
            v24.speed = v17;
        end;
    end));
    if v18 > 0 then
        v18 = v9:NextInteger(0, v18);
    end;
    v8 = v8 + 1;
    v7[v14.Instance] = {
        original = v14.Instance.Position, 
        direction = v15, 
        amplitude = v16, 
        speed = v17, 
        syncOffset = v18
    };
end;
v12.Stop = function(v25) --[[ Line: 96 ]] --[[ Name: Stop ]]
    -- upvalues: v7 (copy), v8 (ref)
    v25.dumpster:Destroy();
    if v7[v25.Instance] then
        v7[v25.Instance] = nil;
        v8 = v8 - 1;
    end;
end;
v2.OnStart():andThen(function() --[[ Line: 105 ]]
    -- upvalues: l_RunService_0 (copy), v7 (copy)
    local v26 = 0;
    l_RunService_0.RenderStepped:Connect(function(v27) --[[ Line: 108 ]]
        -- upvalues: v26 (ref), v7 (ref)
        v26 = v26 + v27;
        for v28, v29 in v7 do
            local v30 = v29.amplitude * math.sin((v26 + v29.syncOffset) % 360 * v29.speed) * v29.direction;
            local l_Position_0 = v28.Position;
            local v32 = v29.original.Y.Scale + v30;
            v28.Position = UDim2.new(l_Position_0.X.Scale, l_Position_0.X.Offset, v32, l_Position_0.Y.Offset);
        end;
    end);
end);
return v12;