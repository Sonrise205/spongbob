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
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v10) --[[ Line: 34 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v5 (copy)
                local v11 = v10.Instance:IsA("BasePart") or v10.Instance:IsA("Model");
                if not v11 then
                    v5:Warn("UpDown component can only be applied to BaseParts or Models:", v10.Instance:GetFullName());
                end;
                return v11;
            end
        }
    }
});
v12.Construct = function(v13) --[[ Line: 45 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v13.dumpster = v3.new();
end;
v12.Start = function(v14) --[[ Line: 49 ]] --[[ Name: Start ]]
    -- upvalues: v7 (copy), v6 (copy), v9 (copy), v8 (ref)
    local v15 = v14.Instance:GetAttribute("RespectLookVector") or false;
    local v16 = v14.Instance:GetAttribute("Direction") or 1;
    local v17 = v14.Instance:GetAttribute("Amplitude") or 5;
    local v18 = v14.Instance:GetAttribute("Speed") or 1;
    local v19 = v14.Instance:GetAttribute("SyncOffset") or 10;
    local l_Pivot_0 = v14.Instance:GetPivot();
    local v21 = v14.Instance:IsA("Model");
    local function _() --[[ Line: 58 ]] --[[ Name: updateMover ]]
        -- upvalues: v7 (ref), v14 (copy), l_Pivot_0 (copy), v21 (copy), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v15 (copy)
        v7[v14.Instance] = {
            originalPivot = l_Pivot_0, 
            isModel = v21, 
            direction = v16, 
            amplitude = v17, 
            speed = v18, 
            syncOffset = v19, 
            respectLookVector = v15
        };
    end;
    v14.dumpster:Add(v6(v14.Instance, "Direction", function(v23) --[[ Line: 70 ]]
        -- upvalues: v7 (ref), v14 (copy), v16 (ref), l_Pivot_0 (copy), v21 (copy), v17 (ref), v18 (ref), v19 (ref), v15 (copy)
        if not v7[v14.Instance] then
            return;
        else
            v16 = v23 or 1;
            v7[v14.Instance] = {
                originalPivot = l_Pivot_0, 
                isModel = v21, 
                direction = v16, 
                amplitude = v17, 
                speed = v18, 
                syncOffset = v19, 
                respectLookVector = v15
            };
            return;
        end;
    end));
    v14.dumpster:Add(v6(v14.Instance, "Amplitude", function(v24) --[[ Line: 79 ]]
        -- upvalues: v7 (ref), v14 (copy), v17 (ref), l_Pivot_0 (copy), v21 (copy), v16 (ref), v18 (ref), v19 (ref), v15 (copy)
        if not v7[v14.Instance] then
            return;
        else
            v17 = v24 or 5;
            v7[v14.Instance] = {
                originalPivot = l_Pivot_0, 
                isModel = v21, 
                direction = v16, 
                amplitude = v17, 
                speed = v18, 
                syncOffset = v19, 
                respectLookVector = v15
            };
            return;
        end;
    end));
    v14.dumpster:Add(v6(v14.Instance, "Speed", function(v25) --[[ Line: 88 ]]
        -- upvalues: v7 (ref), v14 (copy), v18 (ref), l_Pivot_0 (copy), v21 (copy), v16 (ref), v17 (ref), v19 (ref), v15 (copy)
        if not v7[v14.Instance] then
            return;
        else
            v18 = v25 or 1;
            v7[v14.Instance] = {
                originalPivot = l_Pivot_0, 
                isModel = v21, 
                direction = v16, 
                amplitude = v17, 
                speed = v18, 
                syncOffset = v19, 
                respectLookVector = v15
            };
            return;
        end;
    end));
    if v19 > 0 then
        v19 = v9:NextInteger(0, v19);
    end;
    v8 = v8 + 1;
    v7[v14.Instance] = {
        originalPivot = l_Pivot_0, 
        isModel = v21, 
        direction = v16, 
        amplitude = v17, 
        speed = v18, 
        syncOffset = v19, 
        respectLookVector = v15
    };
end;
v12.Stop = function(v26) --[[ Line: 105 ]] --[[ Name: Stop ]]
    -- upvalues: v7 (copy), v8 (ref)
    v26.dumpster:Destroy();
    if v7[v26.Instance] then
        v7[v26.Instance] = nil;
        v8 = v8 - 1;
    end;
end;
v2.OnStart():andThen(function() --[[ Line: 114 ]]
    -- upvalues: l_RunService_0 (copy), v8 (ref), v7 (copy)
    l_RunService_0.Stepped:Connect(function(v27) --[[ Line: 115 ]]
        -- upvalues: v8 (ref), v7 (ref)
        local v28 = table.create(v8);
        local v29 = table.create(v8);
        local v30 = 0;
        for v31, v32 in v7 do
            local v33 = v32.amplitude * math.sin((v27 + v32.syncOffset) % 360 * v32.speed) * v32.direction;
            local v34 = if v32.respectLookVector then v32.originalPivot * CFrame.new(0, v33, 0) else v32.originalPivot + Vector3.new(0, 1, 0, 0) * v33;
            if v32.isModel then
                v31:PivotTo(v34);
            else
                v30 = v30 + 1;
                v28[v30] = v31;
                v29[v30] = v34;
            end;
        end;
        workspace:BulkMoveTo(v28, v29, Enum.BulkMoveMode.FireCFrameChanged);
    end);
end);
return v12;