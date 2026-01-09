local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), l_RunService_0 (copy)
    local v5 = v1.Gradient.new(v2, v1.Templates.Bubblegum.Color, 0);
    v5:SetRotation(-90, 1);
    v5:SetOffsetSpeed(v3, 1);
    local v6 = v1.Stroke.new(v2, v4);
    local v7 = v1.Gradient.new(v6.Instance, v1.Templates.Bubblegum.Color, 0);
    v7:SetRotation(-45, 1);
    v7:SetOffsetSpeed(v3 * 0.9, 1);
    local v8 = v4 * 3;
    local v9 = nil;
    v9 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 17 ]]
        -- upvalues: v6 (copy), v9 (ref), v3 (copy), v8 (copy), v4 (copy)
        if not v6.Instance or v6.Instance.Parent == nil then
            v9:Disconnect();
            return;
        else
            local v10 = tick() * v3;
            local v11 = v8 * math.sin(v10) + 1;
            v6:SetSize(v4 * v11, 0.055);
            return;
        end;
    end);
    return {
        Effects = {
            v5, 
            v7, 
            v6
        }, 
        Connections = {
            v9
        }
    };
end;