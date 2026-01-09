local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Colour.Oklab);
return function(v3, v4) --[[ Line: 19 ]] --[[ Name: unpackType ]]
    -- upvalues: v2 (copy)
    if v4 == "number" then
        return {
            v3
        };
    elseif v4 == "CFrame" then
        local v5, v6 = v3:ToAxisAngle();
        return {
            v3.X, 
            v3.Y, 
            v3.Z, 
            v5.X, 
            v5.Y, 
            v5.Z, 
            v6
        };
    elseif v4 == "Color3" then
        local v7 = v2.to(v3);
        return {
            v7.X, 
            v7.Y, 
            v7.Z
        };
    elseif v4 == "ColorSequenceKeypoint" then
        local v8 = v2.to(v3.Value);
        return {
            v8.X, 
            v8.Y, 
            v8.Z, 
            v3.Time
        };
    elseif v4 == "DateTime" then
        return {
            v3.UnixTimestampMillis
        };
    elseif v4 == "NumberRange" then
        return {
            v3.Min, 
            v3.Max
        };
    elseif v4 == "NumberSequenceKeypoint" then
        return {
            v3.Value, 
            v3.Time, 
            v3.Envelope
        };
    elseif v4 == "PhysicalProperties" then
        return {
            v3.Density, 
            v3.Friction, 
            v3.Elasticity, 
            v3.FrictionWeight, 
            v3.ElasticityWeight
        };
    elseif v4 == "Ray" then
        return {
            v3.Origin.X, 
            v3.Origin.Y, 
            v3.Origin.Z, 
            v3.Direction.X, 
            v3.Direction.Y, 
            v3.Direction.Z
        };
    elseif v4 == "Rect" then
        return {
            v3.Min.X, 
            v3.Min.Y, 
            v3.Max.X, 
            v3.Max.Y
        };
    elseif v4 == "Region3" then
        return {
            v3.CFrame.X, 
            v3.CFrame.Y, 
            v3.CFrame.Z, 
            v3.Size.X, 
            v3.Size.Y, 
            v3.Size.Z
        };
    elseif v4 == "Region3int16" then
        return {
            v3.Min.X, 
            v3.Min.Y, 
            v3.Min.Z, 
            v3.Max.X, 
            v3.Max.Y, 
            v3.Max.Z
        };
    elseif v4 == "UDim" then
        return {
            v3.Scale, 
            v3.Offset
        };
    elseif v4 == "UDim2" then
        return {
            v3.X.Scale, 
            v3.X.Offset, 
            v3.Y.Scale, 
            v3.Y.Offset
        };
    elseif v4 == "Vector2" then
        return {
            v3.X, 
            v3.Y
        };
    elseif v4 == "Vector2int16" then
        return {
            v3.X, 
            v3.Y
        };
    elseif v4 == "Vector3" then
        return {
            v3.X, 
            v3.Y, 
            v3.Z
        };
    elseif v4 == "Vector3int16" then
        return {
            v3.X, 
            v3.Y, 
            v3.Z
        };
    else
        return {};
    end;
end;