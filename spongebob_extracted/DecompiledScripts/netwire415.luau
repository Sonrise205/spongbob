local l_RunService_0 = game:GetService("RunService");
local _ = nil;
if l_RunService_0:IsServer() then
    return (require(script.ServerWire));
else
    return (require(script.ClientWire));
end;