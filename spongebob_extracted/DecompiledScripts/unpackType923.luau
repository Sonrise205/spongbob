local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Colour.Oklab);
return function(v2, v3) --[[ Line: 14 ]] --[[ Name: unpackType ]]
    -- upvalues: v1 (copy)
    if v3 == "number" then
        return {
            v2
        };
    elseif v3 == "CFrame" then
        local v4, v5 = v2:ToAxisAngle();
        return {
            v2.X, 
            v2.Y, 
            v2.Z, 
            v4.X, 
            v4.Y, 
            v4.Z, 
            v5
        };
    elseif v3 == "Color3" then
        local v6 = v1.fromSRGB(v2);
        return {
            v6.X, 
            v6.Y, 
            v6.Z
        };
    elseif v3 == "ColorSequenceKeypoint" then
        local v7 = v1.fromSRGB(v2.Value);
        return {
            v7.X, 
            v7.Y, 
            v7.Z, 
            v2.Time
        };
    elseif v3 == "DateTime" then
        return {
            v2.UnixTimestampMillis
        };
    elseif v3 == "NumberRange" then
        return {
            v2.Min, 
            v2.Max
        };
    elseif v3 == "NumberSequenceKeypoint" then
        return {
            v2.Value, 
            v2.Time, 
            v2.Envelope
        };
    elseif v3 == "PhysicalProperties" then
        return {
            v2.Density, 
            v2.Friction, 
            v2.Elasticity, 
            v2.FrictionWeight, 
            v2.ElasticityWeight
        };
    elseif v3 == "Ray" then
        return {
            v2.Origin.X, 
            v2.Origin.Y, 
            v2.Origin.Z, 
            v2.Direction.X, 
            v2.Direction.Y, 
            v2.Direction.Z
        };
    elseif v3 == "Rect" then
        return {
            v2.Min.X, 
            v2.Min.Y, 
            v2.Max.X, 
            v2.Max.Y
        };
    elseif v3 == "Region3" then
        return {
            v2.CFrame.X, 
            v2.CFrame.Y, 
            v2.CFrame.Z, 
            v2.Size.X, 
            v2.Size.Y, 
            v2.Size.Z
        };
    elseif v3 == "Region3int16" then
        return {
            v2.Min.X, 
            v2.Min.Y, 
            v2.Min.Z, 
            v2.Max.X, 
            v2.Max.Y, 
            v2.Max.Z
        };
    elseif v3 == "UDim" then
        return {
            v2.Scale, 
            v2.Offset
        };
    elseif v3 == "UDim2" then
        return {
            v2.X.Scale, 
            v2.X.Offset, 
            v2.Y.Scale, 
            v2.Y.Offset
        };
    elseif v3 == "Vector2" then
        return {
            v2.X, 
            v2.Y
        };
    elseif v3 == "Vector2int16" then
        return {
            v2.X, 
            v2.Y
        };
    elseif v3 == "Vector3" then
        return {
            v2.X, 
            v2.Y, 
            v2.Z
        };
    elseif v3 == "Vector3int16" then
        return {
            v2.X, 
            v2.Y, 
            v2.Z
        };
    else
        return {};
    end;
end;