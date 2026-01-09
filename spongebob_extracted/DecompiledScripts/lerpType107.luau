local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Colour.Oklab);
return function(v3, v4, v5) --[[ Line: 16 ]] --[[ Name: lerpType ]]
    -- upvalues: v2 (copy)
    local v6 = typeof(v3);
    if typeof(v4) == v6 then
        if v6 == "number" then
            local l_v4_0 = v4;
            local l_v3_0 = v3;
            return (l_v4_0 - l_v3_0) * v5 + l_v3_0;
        elseif v6 == "CFrame" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Color3" then
            local l_v4_1 = v4;
            local v10 = v2.to(v3);
            local v11 = v2.to(l_v4_1);
            return v2.from(v10:Lerp(v11, v5), false);
        elseif v6 == "ColorSequenceKeypoint" then
            local l_v4_2 = v4;
            local l_v3_1 = v3;
            local v14 = v2.to(l_v3_1.Value);
            local v15 = v2.to(l_v4_2.Value);
            return ColorSequenceKeypoint.new((l_v4_2.Time - l_v3_1.Time) * v5 + l_v3_1.Time, v2.from(v14:Lerp(v15, v5), false));
        elseif v6 == "DateTime" then
            local l_v4_3 = v4;
            local l_v3_2 = v3;
            return DateTime.fromUnixTimestampMillis((l_v4_3.UnixTimestampMillis - l_v3_2.UnixTimestampMillis) * v5 + l_v3_2.UnixTimestampMillis);
        elseif v6 == "NumberRange" then
            local l_v4_4 = v4;
            local l_v3_3 = v3;
            return NumberRange.new((l_v4_4.Min - l_v3_3.Min) * v5 + l_v3_3.Min, (l_v4_4.Max - l_v3_3.Max) * v5 + l_v3_3.Max);
        elseif v6 == "NumberSequenceKeypoint" then
            local l_v4_5 = v4;
            local l_v3_4 = v3;
            return NumberSequenceKeypoint.new((l_v4_5.Time - l_v3_4.Time) * v5 + l_v3_4.Time, (l_v4_5.Value - l_v3_4.Value) * v5 + l_v3_4.Value, (l_v4_5.Envelope - l_v3_4.Envelope) * v5 + l_v3_4.Envelope);
        elseif v6 == "PhysicalProperties" then
            local l_v4_6 = v4;
            local l_v3_5 = v3;
            return PhysicalProperties.new((l_v4_6.Density - l_v3_5.Density) * v5 + l_v3_5.Density, (l_v4_6.Friction - l_v3_5.Friction) * v5 + l_v3_5.Friction, (l_v4_6.Elasticity - l_v3_5.Elasticity) * v5 + l_v3_5.Elasticity, (l_v4_6.FrictionWeight - l_v3_5.FrictionWeight) * v5 + l_v3_5.FrictionWeight, (l_v4_6.ElasticityWeight - l_v3_5.ElasticityWeight) * v5 + l_v3_5.ElasticityWeight);
        elseif v6 == "Ray" then
            local l_v4_7 = v4;
            local l_v3_6 = v3;
            return Ray.new(l_v3_6.Origin:Lerp(l_v4_7.Origin, v5), l_v3_6.Direction:Lerp(l_v4_7.Direction, v5));
        elseif v6 == "Rect" then
            local l_v4_8 = v4;
            local l_v3_7 = v3;
            return Rect.new(l_v3_7.Min:Lerp(l_v4_8.Min, v5), l_v3_7.Max:Lerp(l_v4_8.Max, v5));
        elseif v6 == "Region3" then
            local l_v4_9 = v4;
            local l_v3_8 = v3;
            local v30 = l_v3_8.CFrame.Position:Lerp(l_v4_9.CFrame.Position, v5);
            local v31 = l_v3_8.Size:Lerp(l_v4_9.Size, v5) / 2;
            return Region3.new(v30 - v31, v30 + v31);
        elseif v6 == "Region3int16" then
            local l_v4_10 = v4;
            local l_v3_9 = v3;
            return Region3int16.new(Vector3int16.new((l_v4_10.Min.X - l_v3_9.Min.X) * v5 + l_v3_9.Min.X, (l_v4_10.Min.Y - l_v3_9.Min.Y) * v5 + l_v3_9.Min.Y, (l_v4_10.Min.Z - l_v3_9.Min.Z) * v5 + l_v3_9.Min.Z), Vector3int16.new((l_v4_10.Max.X - l_v3_9.Max.X) * v5 + l_v3_9.Max.X, (l_v4_10.Max.Y - l_v3_9.Max.Y) * v5 + l_v3_9.Max.Y, (l_v4_10.Max.Z - l_v3_9.Max.Z) * v5 + l_v3_9.Max.Z));
        elseif v6 == "UDim" then
            local l_v4_11 = v4;
            local l_v3_10 = v3;
            return UDim.new((l_v4_11.Scale - l_v3_10.Scale) * v5 + l_v3_10.Scale, (l_v4_11.Offset - l_v3_10.Offset) * v5 + l_v3_10.Offset);
        elseif v6 == "UDim2" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Vector2" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Vector2int16" then
            local l_v4_12 = v4;
            local l_v3_11 = v3;
            return Vector2int16.new((l_v4_12.X - l_v3_11.X) * v5 + l_v3_11.X, (l_v4_12.Y - l_v3_11.Y) * v5 + l_v3_11.Y);
        elseif v6 == "Vector3" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Vector3int16" then
            local l_v4_13 = v4;
            local l_v3_12 = v3;
            return Vector3int16.new((l_v4_13.X - l_v3_12.X) * v5 + l_v3_12.X, (l_v4_13.Y - l_v3_12.Y) * v5 + l_v3_12.Y, (l_v4_13.Z - l_v3_12.Z) * v5 + l_v3_12.Z);
        end;
    end;
    if v5 < 0.5 then
        return v3;
    else
        return v4;
    end;
end;