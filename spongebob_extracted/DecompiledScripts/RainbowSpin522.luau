local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), l_RunService_0 (copy)
    local v4 = v1.Gradient.new(v2, v1.Templates.Rainbow.Color, 0);
    local v5 = 5;
    local v6 = nil;
    v6 = l_RunService_0.Heartbeat:Connect(function(v7) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v6 (ref), v5 (ref), v3 (copy)
        if not v4.Instance or v4.Instance.Parent == nil then
            v6:Disconnect();
        end;
        v5 = v5 + v3 * v7;
        v4:SetRotation(v5, 1);
    end);
    return {
        Effects = {
            v4
        }, 
        Connections = {
            v6
        }
    };
end;