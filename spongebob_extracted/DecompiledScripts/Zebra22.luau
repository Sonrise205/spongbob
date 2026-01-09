local v0 = require(script.Parent.Parent);
return function(v1, v2, v3) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v4 = v0.Gradient.new(v1, v0.Templates.Zebra.Color, 0);
    v4:SetOffsetSpeed(v2, 1);
    v4:SetRotation(90, 1);
    local v5 = v0.Stroke.new(v1, v3);
    local v6 = v0.Gradient.new(v5.Instance, v0.Templates.Zebra.Color, 0);
    v6:SetOffset(0.5, 1);
    v6:SetRotation(90, 1);
    task.delay(0.1, function() --[[ Line: 14 ]]
        -- upvalues: v6 (copy), v2 (copy)
        v6:SetOffsetSpeed(v2, 1);
    end);
    return {
        Effects = {
            v4, 
            v6, 
            v5
        }
    };
end;