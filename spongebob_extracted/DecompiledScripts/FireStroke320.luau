local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), l_RunService_0 (copy)
    local v5 = v1.Gradient.new(v2, v1.Templates.Fire.Color, 0);
    v5:SetRotation(-75, 1);
    v5:SetOffsetSpeed(v3, 1);
    local v6 = 0;
    local v7 = nil;
    v7 = l_RunService_0.Heartbeat:Connect(function(v8) --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v7 (ref), v6 (ref), v3 (copy)
        if not v5.Instance or v5.Instance.Parent == nil then
            v7:Disconnect();
        end;
        v6 = v6 + v3 * v8;
        v5:SetRotation(v6, 1);
    end);
    local v9 = v1.Stroke.new(v2, v4);
    local v10 = v1.Gradient.new(v9.Instance, v1.Templates.Fire.Color, 0);
    v10:SetRotation(75, 1);
    v10:SetOffsetSpeed(-v3, 1);
    return {
        Effects = {
            v5, 
            v10, 
            v9
        }, 
        Connections = {
            v7
        }
    };
end;