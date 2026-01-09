local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Modules.UIGradientPlus);
local v2 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v3 = {
    {
        0, 
        0
    }, 
    {
        1, 
        0
    }
};
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    return function(v5) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v4 (copy), v1 (ref), v3 (ref)
        local v6 = {};
        local v7 = v2.Gradient[v4];
        if not v7 then
            error("Color sequence for " .. v4 .. " not found in ColorPalette.Gradient");
        end;
        for _, v9 in v7.Keypoints do
            table.insert(v6, {
                v9.Time, 
                v9.Value
            });
        end;
        local v10 = v1.new({
            colorKeypoints = v6, 
            transparencyKeypoints = v3, 
            looped = true, 
            Name = script.Name
        }, v5);
        v10:ApplyAnimation({
            animationType = "Rotate", 
            duration = -1, 
            speed = 0.15
        });
        return v10;
    end;
end;