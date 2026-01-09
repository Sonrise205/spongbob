local _ = game:GetService("RunService");
local v1 = require(script.Parent.Parent);
return function(v2, _, _) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return {
        Effects = {
            (v1.Gradient.new(v2, v1.Templates.Legendary.Color, 0))
        }, 
        Connections = {}
    };
end;