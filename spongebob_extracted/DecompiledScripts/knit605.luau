local l_RunService_0 = game:GetService("RunService");
if l_RunService_0:IsServer() then
    return require(script.KnitServer);
else
    local l_KnitServer_0 = script:FindFirstChild("KnitServer");
    if l_KnitServer_0 and l_RunService_0:IsRunning() then
        l_KnitServer_0:Destroy();
    end;
    return require(script.KnitClient);
end;