local l_RunService_0 = game:GetService("RunService");
if not l_RunService_0:IsClient() then
    warn("[RailUtil.Camera] CameraUtil is a client-only module!");
end;
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Parent.Fusion_v0_3_0);
local _ = require(l_Parent_0.FusionUtil);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v5 = false;
pcall(function() --[[ Line: 36 ]]
    -- upvalues: v5 (ref)
    v5 = game:GetService("RunService"):IsEdit();
end);
local v6 = v2:scoped();
local v7 = {
    Instance = l_CurrentCamera_0, 
    CameraCFrame = v6:Value(l_CurrentCamera_0.CFrame), 
    ViewportSize = v6:Value(l_CurrentCamera_0.ViewportSize), 
    ViewportSizeX = v6:Value(l_CurrentCamera_0.ViewportSize.X), 
    ViewportSizeY = v6:Value(l_CurrentCamera_0.ViewportSize.Y)
};
if l_RunService_0:IsClient() or v5 then
    l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 87 ]]
        -- upvalues: v7 (copy), l_CurrentCamera_0 (copy)
        v7.ViewportSize:set(l_CurrentCamera_0.ViewportSize);
        v7.ViewportSizeX:set(l_CurrentCamera_0.ViewportSize.X);
        v7.ViewportSizeY:set(l_CurrentCamera_0.ViewportSize.Y);
    end);
    l_CurrentCamera_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 93 ]]
        -- upvalues: v7 (copy), l_CurrentCamera_0 (copy)
        v7.CameraCFrame:set(l_CurrentCamera_0.CFrame);
    end);
end;
v7.isOnScreen = function(v8, v9) --[[ Line: 112 ]] --[[ Name: isOnScreen ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    debug.profilebegin(":IsOnScreen()");
    v9 = v9 or 50;
    local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
    local v11 = l_ViewportSize_0.X + v9;
    local v12 = l_ViewportSize_0.Y + v9;
    local v13 = l_CurrentCamera_0:WorldToViewportPoint(v8);
    local v14 = false;
    if v13.X >= -v9 then
        v14 = false;
        if v13.X <= v11 then
            v14 = false;
            if v13.Y >= -v9 then
                v14 = v13.Y <= v12;
            end;
        end;
    end;
    debug.profileend();
    return v14, v13.Z;
end;
return table.freeze(v7);