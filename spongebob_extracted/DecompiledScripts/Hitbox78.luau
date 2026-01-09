--!native
local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Settings);
local _ = require(script.Parent.Types);
local v3 = require(script.Parent.Solvers);
local v4 = require(script.Parent.Visualizers);
CreateHitbox = function(v5, v6) --[[ Line: 12 ]] --[[ Name: CreateHitbox ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), l_RunService_0 (copy)
    local v7 = {
        Instance = v5, 
        RaycastParams = v6 or RaycastParams.new(), 
        CastData = {
            CastType = "Raycast", 
            Size = Vector3.new(0, 0, 0, 0), 
            CFrame = CFrame.identity, 
            Radius = 0
        }, 
        Active = false, 
        Resolution = 60, 
        Callbacks = {}, 
        Attributes = {}, 
        FilterPartsHit = false
    };
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local v14 = 0;
    local v15 = 0;
    local v16 = nil;
    local v17 = {};
    local function _(v18, v19) --[[ Line: 37 ]] --[[ Name: ReturnHitboxAfterCallbackInsertion ]]
        -- upvalues: v7 (copy)
        table.insert(v18, v19);
        return v7;
    end;
    v7.GetAllSegments = function(_) --[[ Line: 51 ]] --[[ Name: GetAllSegments ]]
        -- upvalues: v17 (copy)
        return v17;
    end;
    v7.GetSegment = function(_, v23) --[[ Line: 55 ]] --[[ Name: GetSegment ]]
        -- upvalues: v17 (copy)
        return v17[v23];
    end;
    v7.SetResolution = function(_, v25) --[[ Line: 59 ]] --[[ Name: SetResolution ]]
        -- upvalues: v7 (copy)
        v7.Resolution = v25;
        return v7;
    end;
    v7.SetCastData = function(_, v27) --[[ Line: 64 ]] --[[ Name: SetCastData ]]
        -- upvalues: v7 (copy)
        v7.CastData = {
            CastType = v27.CastType or "Raycast", 
            Size = v27.Size or Vector3.new(0, 0, 0, 0), 
            CFrame = v27.CFrame or CFrame.identity, 
            Radius = v27.Radius or 0
        };
        for _, v29 in v7:GetAllSegments() do
            v29.CastData = {
                CastType = v29.Instance:GetAttribute("CastType") or v7.CastData.CastType, 
                Size = v29.Instance:GetAttribute("CastSize") or v7.CastData.Size, 
                CFrame = v29.Instance:GetAttribute("CastCFrame") or v7.CastData.CFrame, 
                Radius = v29.Instance:GetAttribute("CastRadius") or v7.CastData.Radius
            };
        end;
        return v7;
    end;
    v7.OnDestroying = function(_, v31) --[[ Line: 84 ]] --[[ Name: OnDestroying ]]
        -- upvalues: v13 (copy), v7 (copy)
        table.insert(v13, v31);
        return v7;
    end;
    v7.BeforeStart = function(_, v33) --[[ Line: 88 ]] --[[ Name: BeforeStart ]]
        -- upvalues: v9 (copy), v7 (copy)
        table.insert(v9, v33);
        return v7;
    end;
    v7.OnUpdate = function(_, v35) --[[ Line: 92 ]] --[[ Name: OnUpdate ]]
        -- upvalues: v10 (copy), v7 (copy)
        table.insert(v10, v35);
        return v7;
    end;
    v7.OnHit = function(_, v37) --[[ Line: 96 ]] --[[ Name: OnHit ]]
        -- upvalues: v11 (copy), v7 (copy)
        table.insert(v11, v37);
        return v7;
    end;
    v7.OnStopped = function(_, v39) --[[ Line: 100 ]] --[[ Name: OnStopped ]]
        -- upvalues: v12 (copy), v7 (copy)
        table.insert(v12, v39);
        return v7;
    end;
    v7.RemoveSegment = function(_, v41) --[[ Line: 104 ]] --[[ Name: RemoveSegment ]]
        -- upvalues: v17 (copy), v7 (copy)
        if v17[v41] then
            v17[v41] = nil;
        end;
        return v7;
    end;
    v7.AddSegment = function(_, v43) --[[ Line: 112 ]] --[[ Name: AddSegment ]]
        -- upvalues: v1 (ref), v3 (ref), v7 (copy), v17 (copy), v8 (copy), v11 (copy), v4 (ref)
        local v44 = {};
        if v43:HasTag(v1.Tag) or v43.Name == v1.Tag then
            local v45 = v3[v43.ClassName];
            if not v45 then
                error((("%*'s class type %* is not supported by ShapecastHitbox"):format(v43:GetFullName(), v43.ClassName)));
            end;
            v44.Distance = 0;
            v44.Instance = v43;
            v44.Position = v45:ToPosition(v44);
            v44.LastDirection = Vector3.new(-1, -1, -1, -0);
            v44.CastData = {
                CastType = v44.Instance:GetAttribute("CastType") or v7.CastData.CastType, 
                Size = v44.Instance:GetAttribute("CastSize") or v7.CastData.Size, 
                CFrame = v44.Instance:GetAttribute("CastCFrame") or v7.CastData.CFrame, 
                Radius = v44.Instance:GetAttribute("CastRadius") or v7.CastData.Radius
            };
            v44._update = function(_) --[[ Line: 135 ]] --[[ Name: _update ]]
                -- upvalues: v44 (copy), v17 (ref), v43 (copy), v3 (ref), v7 (ref), v8 (ref), v11 (ref), v1 (ref), v4 (ref), v45 (copy)
                if v44.Instance.Parent == nil then
                    v17[v43] = nil;
                    return;
                else
                    local l_CastType_0 = v44.CastData.CastType;
                    local v48, v49 = v3[l_CastType_0]:Cast(v44, v7.RaycastParams);
                    local l_Magnitude_0 = v49.Magnitude;
                    if v48 then
                        v7.RaycastResult = v48;
                        if v7.FilterPartsHit then
                            local l_FilterDescendantsInstances_0 = v7.RaycastParams.FilterDescendantsInstances;
                            table.insert(l_FilterDescendantsInstances_0, v48.Instance);
                            v8[v48.Instance] = true;
                            v7.RaycastParams.FilterDescendantsInstances = l_FilterDescendantsInstances_0;
                        end;
                        for _, v53 in v11 do
                            task.defer(v53, v48, v44);
                        end;
                    end;
                    if v1.Debug_Visible then
                        local l_Adornment_0 = v4[l_CastType_0]:GetAdornment();
                        if l_Adornment_0 then
                            v4[l_CastType_0]:ToRender(l_Adornment_0, v44, v45:ToVisual(v44), l_Magnitude_0, v48);
                            task.delay(v1[("Debug_Instance_%*_Destroy_Time"):format(l_CastType_0)], v4[l_CastType_0].ReturnAdornment, v4[l_CastType_0], l_Adornment_0);
                        end;
                    end;
                    if l_Magnitude_0 > 0 then
                        v44.LastDirection = v49;
                        local l_v44_0 = v44;
                        l_v44_0.Distance = l_v44_0.Distance + l_Magnitude_0;
                    end;
                    v44.Position = v44.Instance.WorldPosition;
                    return;
                end;
            end;
            v17[v43] = v44;
        end;
        return v44;
    end;
    v7.Reconcile = function(_) --[[ Line: 189 ]] --[[ Name: Reconcile ]]
        -- upvalues: v7 (copy), v17 (copy)
        assert(v7.Instance ~= nil, "No instance tied to this hitbox! Please set with Hitbox.Instance!");
        table.clear(v17);
        for _, v58 in v7.Instance:GetDescendants() do
            v7:AddSegment(v58);
        end;
        return v7;
    end;
    v7.HitStart = function(_, v60, v61) --[[ Line: 200 ]] --[[ Name: HitStart ]]
        -- upvalues: v7 (copy), v3 (ref), v9 (copy), v15 (ref), v14 (ref)
        for _, v63 in v7:GetAllSegments() do
            v63.Position = nil;
            v63.Position = v3[v63.Instance.ClassName]:ToPosition(v63);
            v63.Distance = 0;
        end;
        for _, v65 in v9 do
            v65();
        end;
        v7.RaycastResult = nil;
        v7.RaycastParams = v61 or v7.RaycastParams;
        v7.Active = true;
        v15 = os.clock();
        v14 = v60 or 1e999;
        return v7;
    end;
    v7.HitStop = function(_) --[[ Line: 221 ]] --[[ Name: HitStop ]]
        -- upvalues: v7 (copy), v14 (ref), v12 (copy), v9 (copy), v10 (copy), v11 (copy), v8 (copy)
        if v7.Active then
            v14 = 0;
            v7.Active = false;
            for _, v68 in v12 do
                v68(function() --[[ Line: 227 ]]
                    -- upvalues: v9 (ref), v10 (ref), v11 (ref), v12 (ref)
                    table.clear(v9);
                    table.clear(v10);
                    table.clear(v11);
                    table.clear(v12);
                end);
            end;
            if v7.FilterPartsHit then
                local l_FilterDescendantsInstances_1 = v7.RaycastParams.FilterDescendantsInstances;
                for v70 in v8 do
                    local v71 = table.find(l_FilterDescendantsInstances_1, v70);
                    if v71 then
                        table.remove(l_FilterDescendantsInstances_1, v71);
                    end;
                end;
                table.clear(v8);
                v7.RaycastParams.FilterDescendantsInstances = l_FilterDescendantsInstances_1;
            end;
        end;
        return v7;
    end;
    v7.Destroy = function(_) --[[ Line: 254 ]] --[[ Name: Destroy ]]
        -- upvalues: v16 (ref), v7 (copy), v13 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
        v16:Disconnect();
        v7:HitStop();
        for _, v74 in v13 do
            task.spawn(v74);
        end;
        table.clear(v7);
        table.clear(v9);
        table.clear(v10);
        table.clear(v11);
        table.clear(v12);
        table.clear(v13);
    end;
    local _ = function() --[[ Line: 270 ]] --[[ Name: Init ]]
        -- upvalues: v16 (ref), l_RunService_0 (ref), v14 (ref), v15 (ref), v7 (copy), v10 (copy)
        v16 = l_RunService_0.PostSimulation:Connect(function() --[[ Line: 271 ]]
            -- upvalues: v14 (ref), v15 (ref), v7 (ref), v10 (ref)
            if v14 > 0 then
                local v75 = os.clock();
                local v76 = v75 - v15;
                if 1 / v7.Resolution <= v76 then
                    v15 = v75;
                    for _, v78 in v10 do
                        v78(v76);
                    end;
                    for _, v80 in v7:GetAllSegments() do
                        task.defer(v80._update, v80);
                    end;
                end;
                v14 = v14 - v76;
            end;
            if v14 <= 0 then
                v7:HitStop();
            end;
        end);
        v7:Reconcile();
    end;
    v16 = l_RunService_0.PostSimulation:Connect(function() --[[ Line: 271 ]]
        -- upvalues: v14 (ref), v15 (ref), v7 (copy), v10 (copy)
        if v14 > 0 then
            local v82 = os.clock();
            local v83 = v82 - v15;
            if 1 / v7.Resolution <= v83 then
                v15 = v82;
                for _, v85 in v10 do
                    v85(v83);
                end;
                for _, v87 in v7:GetAllSegments() do
                    task.defer(v87._update, v87);
                end;
            end;
            v14 = v14 - v83;
        end;
        if v14 <= 0 then
            v7:HitStop();
        end;
    end);
    v7:Reconcile();
    return v7;
end;
return CreateHitbox;