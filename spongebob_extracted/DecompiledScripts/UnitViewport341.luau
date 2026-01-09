local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Shared.Modules.ViewportHandler);
local v4 = CFrame.Angles(0, 0, 0);
local l_Models_0 = l_ReplicatedStorage_0.Models;
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8, v9) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v6 (copy)
    if not v7 or not v8 then
        return;
    else
        v9 = v9 or {};
        local v10 = setmetatable({
            dumpster = v2.new(), 
            unitName = v8, 
            parentObj = v7, 
            isPet = v9.isPet or v9.IsPet or false, 
            props = v9
        }, v6);
        v10:Render();
        return v10;
    end;
end;
v6.Render = function(v11) --[[ Line: 43 ]] --[[ Name: Render ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Models_0 (copy), v3 (copy), v4 (copy), l_RunService_0 (copy)
    local v12 = v11.props.container or l_ReplicatedStorage_0.Models.Friendlies;
    if v11.props.isEnemy then
        v12 = l_ReplicatedStorage_0.Models.Enemies;
    elseif v11.isPet then
        v12 = l_Models_0.Pets;
    end;
    if not v12 then
        v12 = l_ReplicatedStorage_0.Models.Friendlies;
    end;
    local l_v12_FirstChild_0 = v12:FindFirstChild(v11.unitName);
    if not l_v12_FirstChild_0 then
        warn("Didnt find unit model for:", v11.unitName);
        v11:Destroy();
        return;
    else
        local v14 = v3.new(v11.parentObj, l_v12_FirstChild_0, {
            AnchorPoint = v11.props.AnchorPoint or Vector2.new(0.5, 1), 
            Position = v11.props.Position or UDim2.fromScale(0.5, 1.02), 
            Size = v11.props.Size or UDim2.fromScale(1.04, 1.3), 
            BackgroundTransparency = 1, 
            LightDirection = Vector3.new(4, -3, -2, 0), 
            Ambient = Color3.fromRGB(233, 207, 255), 
            LightColor = Color3.fromRGB(255, 255, 255), 
            ImageColor3 = v11.props.ImageColor3 or Color3.fromRGB(255, 255, 255), 
            ZIndex = v11.props.ZIndex or 1
        });
        v11.viewHandler = v14;
        if v11.viewHandler and v11.viewHandler.worldModel then
            v11.viewHandler.worldModel:SetAttribute("UnitViewport", true);
        end;
        v11.dumpster:Add(v14);
        local l_v14_ObjectSize_0, v16 = v14:GetObjectSize();
        local v17 = false;
        local v18 = nil;
        local v19 = v11.props.positionAttribute or "ViewportOffset";
        local v20 = v11.props.angleAttribute or "ViewportAngle";
        local function v28() --[[ Line: 96 ]] --[[ Name: renderViewport ]]
            -- upvalues: v14 (copy), v17 (ref), v18 (ref), l_v12_FirstChild_0 (copy), v20 (copy), v4 (ref), v19 (copy), l_v14_ObjectSize_0 (copy), v16 (copy)
            v14:RenderOnce(function(v21, v22, _) --[[ Line: 98 ]]
                -- upvalues: v17 (ref), v18 (ref), l_v12_FirstChild_0 (ref), v20 (ref), v4 (ref), v19 (ref), l_v14_ObjectSize_0 (ref), v16 (ref)
                if not v17 then
                    v17 = true;
                    v21:PivotTo(v21:GetPivot() * CFrame.Angles(0, 3.141592653589793, 0));
                    v18 = v21:GetPivot();
                end;
                local v24 = l_v12_FirstChild_0:GetAttribute(v20) or l_v12_FirstChild_0:GetAttribute("ViewportAngle") or v4;
                if v24 and typeof(v24) == "Vector3" then
                    v24 = CFrame.Angles(math.rad(v24.X), math.rad(v24.Y), (math.rad(v24.Z)));
                end;
                v21:PivotTo(v18 * v24);
                local v25 = l_v12_FirstChild_0:GetAttribute(v19) or l_v12_FirstChild_0:GetAttribute("ViewportOffset") or Vector3.new(0, 0, 0, 0);
                local v26 = v21:GetPivot() + Vector3.new(v25.X, l_v14_ObjectSize_0.Y / 0.8 + v25.Y, v25.Z);
                local v27 = v26 + Vector3.new(0, 0, v16);
                if not l_v12_FirstChild_0:GetAttribute(v19) then
                    l_v12_FirstChild_0:SetAttribute(v19, v25);
                end;
                v22.FieldOfView = v21:GetAttribute("FOV") or 65;
                v22.CFrame = CFrame.lookAt(v27.Position, v26.Position);
            end);
        end;
        v14:RenderOnce(function(v29, v30, _) --[[ Line: 98 ]]
            -- upvalues: v17 (ref), v18 (ref), l_v12_FirstChild_0 (copy), v20 (copy), v4 (ref), v19 (copy), l_v14_ObjectSize_0 (copy), v16 (copy)
            if not v17 then
                v17 = true;
                v29:PivotTo(v29:GetPivot() * CFrame.Angles(0, 3.141592653589793, 0));
                v18 = v29:GetPivot();
            end;
            local v32 = l_v12_FirstChild_0:GetAttribute(v20) or l_v12_FirstChild_0:GetAttribute("ViewportAngle") or v4;
            if v32 and typeof(v32) == "Vector3" then
                v32 = CFrame.Angles(math.rad(v32.X), math.rad(v32.Y), (math.rad(v32.Z)));
            end;
            v29:PivotTo(v18 * v32);
            local v33 = l_v12_FirstChild_0:GetAttribute(v19) or l_v12_FirstChild_0:GetAttribute("ViewportOffset") or Vector3.new(0, 0, 0, 0);
            local v34 = v29:GetPivot() + Vector3.new(v33.X, l_v14_ObjectSize_0.Y / 0.8 + v33.Y, v33.Z);
            local v35 = v34 + Vector3.new(0, 0, v16);
            if not l_v12_FirstChild_0:GetAttribute(v19) then
                l_v12_FirstChild_0:SetAttribute(v19, v33);
            end;
            v30.FieldOfView = v29:GetAttribute("FOV") or 65;
            v30.CFrame = CFrame.lookAt(v35.Position, v34.Position);
        end);
        v14.viewport.Visible = false;
        local l_UICorner_0 = Instance.new("UICorner");
        l_UICorner_0.CornerRadius = UDim.new(0, v11.props.cornerRadius or 14);
        l_UICorner_0.Parent = v14.viewport;
        v14.dumpster:Add(l_v12_FirstChild_0:GetAttributeChangedSignal(v20):Connect(v28));
        v14.dumpster:Add(l_v12_FirstChild_0:GetAttributeChangedSignal(v19):Connect(v28));
        v14.dumpster:Add(l_v12_FirstChild_0:GetAttributeChangedSignal("ViewportAngle"):Connect(v28));
        if l_v12_FirstChild_0:GetAttribute("LightDirection") then
            v14.viewport.LightDirection = l_v12_FirstChild_0:GetAttribute("LightDirection");
        end;
        v14.dumpster:Add(l_v12_FirstChild_0:GetAttributeChangedSignal("LightDirection"):Connect(function() --[[ Line: 141 ]]
            -- upvalues: v14 (copy), l_v12_FirstChild_0 (copy)
            v14.viewport.LightDirection = l_v12_FirstChild_0:GetAttribute("LightDirection");
        end));
        local v37 = v14.object:FindFirstChildOfClass("AnimationController") or v14.object:FindFirstChildOfClass("Humanoid");
        local v38 = v37 and v37:FindFirstChildOfClass("Animator");
        if not v37 then
            v37 = Instance.new("AnimationController");
            v37.Parent = v14.object;
        end;
        if not v38 then
            v38 = Instance.new("Animator");
            v38.Parent = v37;
        end;
        local l_Friendlies_0 = l_ReplicatedStorage_0.Animations.Friendlies;
        if v11.props.isEnemy then
            l_Friendlies_0 = l_ReplicatedStorage_0.Animations.Enemies;
        elseif v11.isPet then
            l_Friendlies_0 = l_ReplicatedStorage_0.Animations.Pets;
        end;
        local l_l_Friendlies_0_FirstChild_0 = l_Friendlies_0:FindFirstChild(v11.unitName);
        if not l_l_Friendlies_0_FirstChild_0 then
            warn("[HUD] No animations found for unit:", v11.unitName);
            v14.viewport.Visible = true;
            return;
        else
            local v41 = v11.props.Animation or v11.props.Dialog and l_v12_FirstChild_0:GetAttribute("DialogAnimation") or l_v12_FirstChild_0:GetAttribute("Animation") or "Idle";
            local v42 = l_l_Friendlies_0_FirstChild_0:FindFirstChild(v41) or l_l_Friendlies_0_FirstChild_0:FindFirstChild("Walk");
            if not v42 then
                warn("Could not find animaiton:", v41);
                v14.viewport.Visible = true;
                return;
            else
                local v43 = v38:LoadAnimation(v42);
                v43.Looped = true;
                v43:Play(0);
                v11.dumpster:Add(l_RunService_0.PreAnimation:Once(function() --[[ Line: 195 ]]
                    -- upvalues: v14 (copy)
                    v14.viewport.Visible = true;
                end));
                return;
            end;
        end;
    end;
end;
v6.SwitchParent = function(v44, v45) --[[ Line: 200 ]] --[[ Name: SwitchParent ]]
    if not v44.viewHandler then
        return;
    else
        v44.viewHandler.viewport.Parent = v45;
        return;
    end;
end;
v6.SetVisible = function(v46, v47) --[[ Line: 208 ]] --[[ Name: SetVisible ]]
    if not v46.viewHandler then
        return;
    else
        v46.viewHandler.viewport.Visible = v47;
        return;
    end;
end;
v6.Destroy = function(v48) --[[ Line: 217 ]] --[[ Name: Destroy ]]
    if v48.dumpster then
        v48.dumpster:Destroy();
        v48.dumpster = nil;
    end;
    table.clear(v48);
    setmetatable(v48, nil);
end;
return v6;