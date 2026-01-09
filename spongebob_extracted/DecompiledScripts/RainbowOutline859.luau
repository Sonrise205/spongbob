local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), l_RunService_0 (copy)
    local v5 = v1.Stroke.new(v2, v4);
    local v6 = v1.Gradient.new(v5.Instance, v1.Templates.Rainbow.Color, 0);
    local v7 = 5;
    local v8 = nil;
    v8 = l_RunService_0.Heartbeat:Connect(function(v9) --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v8 (ref), v7 (ref), v3 (copy), v6 (copy)
        if not v5.Instance or v5.Instance.Parent == nil then
            v8:Disconnect();
        end;
        v7 = v7 + v3 * v9;
        v6:SetRotation(v7, 1);
    end);
    return {
        Effects = {
            v6, 
            v5
        }, 
        Connections = {
            v8
        }
    };
end;