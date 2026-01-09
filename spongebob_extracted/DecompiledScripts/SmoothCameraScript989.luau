local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local v4 = require(l_ReplicatedStorage_0.Platformer.Constants);
local v5 = require(l_ReplicatedStorage_0.Platformer.Utility.clampMagnitude);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v8 = nil;
local v9 = Vector3.new(0, 0, 0, 0);
local v10 = Vector3.new(0, 0, 0, 0);
local function v12(v11) --[[ Line: 25 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v8 (ref)
    v8 = v11:WaitForChild("HumanoidRootPart");
end;
local function v16(v13) --[[ Line: 29 ]] --[[ Name: onRenderStep ]]
    -- upvalues: v8 (ref), v9 (ref), v10 (ref), v5 (copy), v4 (copy), l_CurrentCamera_0 (copy)
    if not v8 then
        return;
    else
        v9 = v9 - Vector3.new(v8.AssemblyLinearVelocity.X, 0, v8.AssemblyLinearVelocity.Z) * v13;
        v10 = v10 - Vector3.new(0, v8.AssemblyLinearVelocity.Y, 0) * v13;
        v9 = v5(v9, v4.CAMERA_MAX_DISTANCE);
        v10 = v5(v10, v4.CAMERA_MAX_DISTANCE);
        v9 = v9:Lerp(Vector3.new(0, 0, 0, 0), (math.min(v13 * v4.CAMERA_SMOOTH_HORIZONTAL_SPEED, 1)));
        v10 = v10:Lerp(Vector3.new(0, 0, 0, 0), (math.min(v13 * v4.CAMERA_SMOOTH_VERTICAL_SPEED, 1)));
        local v14 = v9 + v10;
        local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
        l_l_CurrentCamera_0_0.CFrame = l_l_CurrentCamera_0_0.CFrame + v14;
        return;
    end;
end;
local function _() --[[ Line: 51 ]] --[[ Name: initialize ]]
    -- upvalues: l_LocalPlayer_0 (copy), v12 (copy), l_RunService_0 (copy), v16 (copy), v8 (ref)
    l_LocalPlayer_0.CharacterAdded:Connect(v12);
    l_RunService_0:BindToRenderStep("CameraSmoothing", Enum.RenderPriority.Camera.Value + 1, v16);
    if l_LocalPlayer_0.Character then
        v8 = l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart");
    end;
end;
l_LocalPlayer_0.CharacterAdded:Connect(v12);
l_RunService_0:BindToRenderStep("CameraSmoothing", Enum.RenderPriority.Camera.Value + 1, v16);
if l_LocalPlayer_0.Character then
    v8 = l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart");
end;