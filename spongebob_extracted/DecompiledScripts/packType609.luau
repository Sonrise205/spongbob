local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Colour.Oklab);
return function(v3, v4) --[[ Line: 16 ]] --[[ Name: packType ]]
    -- upvalues: v2 (copy)
    if v4 == "number" then
        return v3[1];
    elseif v4 == "CFrame" then
        return CFrame.new(v3[1], v3[2], v3[3]) * CFrame.fromAxisAngle(Vector3.new(v3[4], v3[5], v3[6]).Unit, v3[7]);
    elseif v4 == "Color3" then
        return v2.from(Vector3.new(v3[1], v3[2], v3[3]), false);
    elseif v4 == "ColorSequenceKeypoint" then
        return ColorSequenceKeypoint.new(v3[4], v2.from(Vector3.new(v3[1], v3[2], v3[3]), false));
    elseif v4 == "DateTime" then
        return DateTime.fromUnixTimestampMillis(v3[1]);
    elseif v4 == "NumberRange" then
        return NumberRange.new(v3[1], v3[2]);
    elseif v4 == "NumberSequenceKeypoint" then
        return NumberSequenceKeypoint.new(v3[2], v3[1], v3[3]);
    elseif v4 == "PhysicalProperties" then
        return PhysicalProperties.new(v3[1], v3[2], v3[3], v3[4], v3[5]);
    elseif v4 == "Ray" then
        return Ray.new(Vector3.new(v3[1], v3[2], v3[3]), (Vector3.new(v3[4], v3[5], v3[6])));
    elseif v4 == "Rect" then
        return Rect.new(v3[1], v3[2], v3[3], v3[4]);
    elseif v4 == "Region3" then
        local v5 = Vector3.new(v3[1], v3[2], v3[3]);
        local v6 = Vector3.new(v3[4] / 2, v3[5] / 2, v3[6] / 2);
        return Region3.new(v5 - v6, v5 + v6);
    elseif v4 == "Region3int16" then
        return Region3int16.new(Vector3int16.new(v3[1], v3[2], v3[3]), Vector3int16.new(v3[4], v3[5], v3[6]));
    elseif v4 == "UDim" then
        return UDim.new(v3[1], v3[2]);
    elseif v4 == "UDim2" then
        return UDim2.new(v3[1], v3[2], v3[3], v3[4]);
    elseif v4 == "Vector2" then
        return Vector2.new(v3[1], v3[2]);
    elseif v4 == "Vector2int16" then
        return Vector2int16.new(v3[1], v3[2]);
    elseif v4 == "Vector3" then
        return (Vector3.new(v3[1], v3[2], v3[3]));
    elseif v4 == "Vector3int16" then
        return Vector3int16.new(v3[1], v3[2], v3[3]);
    else
        return nil;
    end;
end;