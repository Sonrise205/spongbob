local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Colour.Oklab);
return function(v2, v3, v4) --[[ Line: 15 ]] --[[ Name: lerpType ]]
    -- upvalues: v1 (copy)
    local v5 = typeof(v2);
    if typeof(v3) == v5 then
        if v5 == "number" then
            local l_v3_0 = v3;
            local l_v2_0 = v2;
            return (l_v3_0 - l_v2_0) * v4 + l_v2_0;
        elseif v5 == "CFrame" then
            return v2:Lerp(v3, v4);
        elseif v5 == "Color3" then
            local l_v3_1 = v3;
            local v9 = v1.fromSRGB(v2);
            local v10 = v1.fromSRGB(l_v3_1);
            return v1.toSRGB(v9:Lerp(v10, v4), false);
        elseif v5 == "ColorSequenceKeypoint" then
            local l_v3_2 = v3;
            local l_v2_1 = v2;
            local v13 = v1.fromSRGB(l_v2_1.Value);
            local v14 = v1.fromSRGB(l_v3_2.Value);
            return ColorSequenceKeypoint.new((l_v3_2.Time - l_v2_1.Time) * v4 + l_v2_1.Time, v1.toSRGB(v13:Lerp(v14, v4), false));
        elseif v5 == "DateTime" then
            local l_v3_3 = v3;
            local l_v2_2 = v2;
            return DateTime.fromUnixTimestampMillis((l_v3_3.UnixTimestampMillis - l_v2_2.UnixTimestampMillis) * v4 + l_v2_2.UnixTimestampMillis);
        elseif v5 == "NumberRange" then
            local l_v3_4 = v3;
            local l_v2_3 = v2;
            return NumberRange.new((l_v3_4.Min - l_v2_3.Min) * v4 + l_v2_3.Min, (l_v3_4.Max - l_v2_3.Max) * v4 + l_v2_3.Max);
        elseif v5 == "NumberSequenceKeypoint" then
            local l_v3_5 = v3;
            local l_v2_4 = v2;
            return NumberSequenceKeypoint.new((l_v3_5.Time - l_v2_4.Time) * v4 + l_v2_4.Time, (l_v3_5.Value - l_v2_4.Value) * v4 + l_v2_4.Value, (l_v3_5.Envelope - l_v2_4.Envelope) * v4 + l_v2_4.Envelope);
        elseif v5 == "PhysicalProperties" then
            local l_v3_6 = v3;
            local l_v2_5 = v2;
            return PhysicalProperties.new((l_v3_6.Density - l_v2_5.Density) * v4 + l_v2_5.Density, (l_v3_6.Friction - l_v2_5.Friction) * v4 + l_v2_5.Friction, (l_v3_6.Elasticity - l_v2_5.Elasticity) * v4 + l_v2_5.Elasticity, (l_v3_6.FrictionWeight - l_v2_5.FrictionWeight) * v4 + l_v2_5.FrictionWeight, (l_v3_6.ElasticityWeight - l_v2_5.ElasticityWeight) * v4 + l_v2_5.ElasticityWeight);
        elseif v5 == "Ray" then
            local l_v3_7 = v3;
            local l_v2_6 = v2;
            return Ray.new(l_v2_6.Origin:Lerp(l_v3_7.Origin, v4), l_v2_6.Direction:Lerp(l_v3_7.Direction, v4));
        elseif v5 == "Rect" then
            local l_v3_8 = v3;
            local l_v2_7 = v2;
            return Rect.new(l_v2_7.Min:Lerp(l_v3_8.Min, v4), l_v2_7.Max:Lerp(l_v3_8.Max, v4));
        elseif v5 == "Region3" then
            local l_v3_9 = v3;
            local l_v2_8 = v2;
            local v29 = l_v2_8.CFrame.Position:Lerp(l_v3_9.CFrame.Position, v4);
            local v30 = l_v2_8.Size:Lerp(l_v3_9.Size, v4) / 2;
            return Region3.new(v29 - v30, v29 + v30);
        elseif v5 == "Region3int16" then
            local l_v3_10 = v3;
            local l_v2_9 = v2;
            return Region3int16.new(Vector3int16.new((l_v3_10.Min.X - l_v2_9.Min.X) * v4 + l_v2_9.Min.X, (l_v3_10.Min.Y - l_v2_9.Min.Y) * v4 + l_v2_9.Min.Y, (l_v3_10.Min.Z - l_v2_9.Min.Z) * v4 + l_v2_9.Min.Z), Vector3int16.new((l_v3_10.Max.X - l_v2_9.Max.X) * v4 + l_v2_9.Max.X, (l_v3_10.Max.Y - l_v2_9.Max.Y) * v4 + l_v2_9.Max.Y, (l_v3_10.Max.Z - l_v2_9.Max.Z) * v4 + l_v2_9.Max.Z));
        elseif v5 == "UDim" then
            local l_v3_11 = v3;
            local l_v2_10 = v2;
            return UDim.new((l_v3_11.Scale - l_v2_10.Scale) * v4 + l_v2_10.Scale, (l_v3_11.Offset - l_v2_10.Offset) * v4 + l_v2_10.Offset);
        elseif v5 == "UDim2" then
            return v2:Lerp(v3, v4);
        elseif v5 == "Vector2" then
            return v2:Lerp(v3, v4);
        elseif v5 == "Vector2int16" then
            local l_v3_12 = v3;
            local l_v2_11 = v2;
            return Vector2int16.new((l_v3_12.X - l_v2_11.X) * v4 + l_v2_11.X, (l_v3_12.Y - l_v2_11.Y) * v4 + l_v2_11.Y);
        elseif v5 == "Vector3" then
            return v2:Lerp(v3, v4);
        elseif v5 == "Vector3int16" then
            local l_v3_13 = v3;
            local l_v2_12 = v2;
            return Vector3int16.new((l_v3_13.X - l_v2_12.X) * v4 + l_v2_12.X, (l_v3_13.Y - l_v2_12.Y) * v4 + l_v2_12.Y, (l_v3_13.Z - l_v2_12.Z) * v4 + l_v2_12.Z);
        end;
    end;
    if v4 < 0.5 then
        return v2;
    else
        return v3;
    end;
end;