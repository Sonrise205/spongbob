local v0 = {
    pretty = false, 
    robloxFullName = false, 
    robloxProperFullName = true, 
    robloxClassName = true, 
    tabs = false, 
    semicolons = false, 
    spaces = 3, 
    sortKeys = true
};
local v1 = {
    ["and"] = true, 
    ["break"] = true, 
    ["do"] = true, 
    ["else"] = true, 
    ["elseif"] = true, 
    ["end"] = true, 
    ["false"] = true, 
    ["for"] = true, 
    ["function"] = true, 
    ["if"] = true, 
    ["in"] = true, 
    ["local"] = true, 
    ["nil"] = true, 
    ["not"] = true, 
    ["or"] = true, 
    ["repeat"] = true, 
    ["return"] = true, 
    ["then"] = true, 
    ["true"] = true, 
    ["until"] = true, 
    ["while"] = true
};
local function _(v2) --[[ Line: 35 ]] --[[ Name: isLuaIdentifier ]]
    -- upvalues: v1 (copy)
    if type(v2) ~= "string" then
        return false;
    elseif v2:len() == 0 then
        return false;
    elseif v2:find("[^%d%a_]") then
        return false;
    elseif tonumber(v2:sub(1, 1)) then
        return false;
    elseif v1[v2] then
        return false;
    else
        return true;
    end;
end;
local function v4(v5, _) --[[ Line: 49 ]] --[[ Name: properFullName ]]
    -- upvalues: v1 (copy), v4 (copy)
    if v5 == nil or v5 == game then
        return "";
    else
        local l_Name_0 = v5.Name;
        local v8 = true;
        local l_l_Name_0_0 = l_Name_0;
        if not (type(l_l_Name_0_0) == "string" and not (l_l_Name_0_0:len() == 0) and not l_l_Name_0_0:find("[^%d%a_]") and not tonumber(l_l_Name_0_0:sub(1, 1)) and (not v1[l_l_Name_0_0] or false)) then
            l_Name_0 = ("[%q]"):format(l_Name_0);
            v8 = false;
        end;
        if not v5.Parent or v5.Parent == game then
            return l_Name_0;
        else
            return v4(v5.Parent) .. (v8 and "." or "") .. l_Name_0;
        end;
    end;
end;
local v10 = 0;
local v11 = nil;
local v12 = nil;
local function v13(v14, v15) --[[ Line: 71 ]] --[[ Name: repr ]]
    -- upvalues: v0 (copy), v12 (ref), v10 (ref), v11 (ref), v13 (copy), v1 (copy), v4 (copy)
    v15 = v15 or v0;
    v12 = (" "):rep(v15.spaces or v0.spaces);
    if v15.tabs then
        v12 = "\t";
    end;
    local v16 = v12:rep(v10);
    if v10 == 0 then
        v11 = {};
    end;
    if type(v14) == "string" then
        return ("%q"):format(v14);
    elseif type(v14) == "number" then
        if v14 == 1e999 then
            return "math.huge";
        elseif v14 == -1e999 then
            return "-math.huge";
        else
            return (tonumber(v14));
        end;
    elseif type(v14) == "boolean" then
        return (tostring(v14));
    elseif type(v14) == "nil" then
        return "nil";
    elseif type(v14) == "table" and type(v14.__tostring) == "function" then
        return (tostring(v14:__tostring()));
    elseif type(v14) == "table" and getmetatable(v14) and type(getmetatable(v14).__tostring) == "function" then
        return (tostring(getmetatable(v14).__tostring(v14)));
    elseif type(v14) == "table" then
        if v11[v14] then
            return "{CYCLIC}";
        else
            v11[v14] = true;
            local v17 = "{" .. (v15.pretty and "\n" .. v12 .. v16 or "");
            local v18 = true;
            for v19, _ in pairs(v14) do
                if type(v19) ~= "number" then
                    v18 = false;
                    break;
                end;
            end;
            if v18 then
                for v21 = 1, #v14 do
                    if v21 ~= 1 then
                        v17 = v17 .. (v15.semicolons and ";" or ",") .. (v15.pretty and "\n" .. v12 .. v16 or " ");
                    end;
                    v10 = v10 + 1;
                    v17 = v17 .. v13(v14[v21], v15);
                    v10 = v10 - 1;
                end;
            else
                local v22 = {};
                local v23 = {};
                for v24, v25 in pairs(v14) do
                    v10 = v10 + 1;
                    local v26 = type(v24) == "string" and not (v24:len() == 0) and not v24:find("[^%d%a_]") and not tonumber(v24:sub(1, 1)) and (not v1[v24] or false) and v24 or "[" .. v13(v24, v15) .. "]";
                    local v27 = v13(v25, v15);
                    table.insert(v22, v26);
                    v23[v26] = v27;
                    v10 = v10 - 1;
                end;
                if v15.sortKeys then
                    table.sort(v22);
                end;
                local v28 = true;
                for _, v30 in pairs(v22) do
                    if not v28 then
                        v17 = v17 .. (v15.semicolons and ";" or ",") .. (v15.pretty and "\n" .. v12 .. v16 or " ");
                    end;
                    v17 = v17 .. ("%s = %s"):format(v30, v23[v30]);
                    v28 = false;
                end;
            end;
            v11[v14] = false;
            if v15.pretty then
                v17 = v17 .. "\n" .. v16;
            end;
            return v17 .. "}";
        end;
    elseif typeof then
        if typeof(v14) == "Instance" then
            return (v15.robloxFullName and (v15.robloxProperFullName and v4(v14) or v14:GetFullName()) or v14.Name) .. (v15.robloxClassName and (" (%s)"):format(v14.ClassName) or "");
        elseif typeof(v14) == "Axes" then
            local v31 = {};
            if v14.X then
                table.insert(v31, v13(Enum.Axis.X, v15));
            end;
            if v14.Y then
                table.insert(v31, v13(Enum.Axis.Y, v15));
            end;
            if v14.Z then
                table.insert(v31, v13(Enum.Axis.Z, v15));
            end;
            return ("Axes.new(%s)"):format(table.concat(v31, ", "));
        elseif typeof(v14) == "BrickColor" then
            return ("BrickColor.new(%q)"):format(v14.Name);
        elseif typeof(v14) == "CFrame" then
            return ("CFrame.new(%s)"):format(table.concat({
                v14:GetComponents()
            }, ", "));
        elseif typeof(v14) == "Color3" then
            return ("Color3.new(%d, %d, %d)"):format(v14.r, v14.g, v14.b);
        elseif typeof(v14) == "ColorSequence" then
            if #v14.Keypoints > 2 then
                return ("ColorSequence.new(%s)"):format(v13(v14.Keypoints, v15));
            elseif v14.Keypoints[1].Value == v14.Keypoints[2].Value then
                return ("ColorSequence.new(%s)"):format(v13(v14.Keypoints[1].Value, v15));
            else
                return ("ColorSequence.new(%s, %s)"):format(v13(v14.Keypoints[1].Value, v15), v13(v14.Keypoints[2].Value, v15));
            end;
        elseif typeof(v14) == "ColorSequenceKeypoint" then
            return ("ColorSequenceKeypoint.new(%d, %s)"):format(v14.Time, v13(v14.Value, v15));
        elseif typeof(v14) == "DockWidgetPluginGuiInfo" then
            return ("DockWidgetPluginGuiInfo.new(%s, %s, %s, %s, %s, %s, %s)"):format(v13(v14.InitialDockState, v15), v13(v14.InitialEnabled, v15), v13(v14.InitialEnabledShouldOverrideRestore, v15), v13(v14.FloatingXSize, v15), v13(v14.FloatingYSize, v15), v13(v14.MinWidth, v15), v13(v14.MinHeight, v15));
        elseif typeof(v14) == "Enums" then
            return "Enums";
        elseif typeof(v14) == "Enum" then
            return ("Enum.%s"):format((tostring(v14)));
        elseif typeof(v14) == "EnumItem" then
            return ("Enum.%s.%s"):format(tostring(v14.EnumType), v14.Name);
        elseif typeof(v14) == "Faces" then
            local v32 = {};
            for _, v34 in pairs(Enum.NormalId:GetEnumItems()) do
                if v14[v34.Name] then
                    table.insert(v32, v13(v34, v15));
                end;
            end;
            return ("Faces.new(%s)"):format(table.concat(v32, ", "));
        elseif typeof(v14) == "NumberRange" then
            if v14.Min == v14.Max then
                return ("NumberRange.new(%d)"):format(v14.Min);
            else
                return ("NumberRange.new(%d, %d)"):format(v14.Min, v14.Max);
            end;
        elseif typeof(v14) == "NumberSequence" then
            if #v14.Keypoints > 2 then
                return ("NumberSequence.new(%s)"):format(v13(v14.Keypoints, v15));
            elseif v14.Keypoints[1].Value == v14.Keypoints[2].Value then
                return ("NumberSequence.new(%d)"):format(v14.Keypoints[1].Value);
            else
                return ("NumberSequence.new(%d, %d)"):format(v14.Keypoints[1].Value, v14.Keypoints[2].Value);
            end;
        elseif typeof(v14) == "NumberSequenceKeypoint" then
            if v14.Envelope ~= 0 then
                return ("NumberSequenceKeypoint.new(%d, %d, %d)"):format(v14.Time, v14.Value, v14.Envelope);
            else
                return ("NumberSequenceKeypoint.new(%d, %d)"):format(v14.Time, v14.Value);
            end;
        elseif typeof(v14) == "PathWaypoint" then
            return ("PathWaypoint.new(%s, %s)"):format(v13(v14.Position, v15), v13(v14.Action, v15));
        elseif typeof(v14) == "PhysicalProperties" then
            return ("PhysicalProperties.new(%d, %d, %d, %d, %d)"):format(v14.Density, v14.Friction, v14.Elasticity, v14.FrictionWeight, v14.ElasticityWeight);
        elseif typeof(v14) == "Random" then
            return "<Random>";
        elseif typeof(v14) == "Ray" then
            return ("Ray.new(%s, %s)"):format(v13(v14.Origin, v15), v13(v14.Direction, v15));
        elseif typeof(v14) == "RBXScriptConnection" then
            return "<RBXScriptConnection>";
        elseif typeof(v14) == "RBXScriptSignal" then
            return "<RBXScriptSignal>";
        elseif typeof(v14) == "Rect" then
            return ("Rect.new(%d, %d, %d, %d)"):format(v14.Min.X, v14.Min.Y, v14.Max.X, v14.Max.Y);
        elseif typeof(v14) == "Region3" then
            local v35 = v14.CFrame.p + v14.Size * -0.5;
            local v36 = v14.CFrame.p + v14.Size * 0.5;
            return ("Region3.new(%s, %s)"):format(v13(v35, v15), v13(v36, v15));
        elseif typeof(v14) == "Region3int16" then
            return ("Region3int16.new(%s, %s)"):format(v13(v14.Min, v15), v13(v14.Max, v15));
        elseif typeof(v14) == "TweenInfo" then
            return ("TweenInfo.new(%d, %s, %s, %d, %s, %d)"):format(v14.Time, v13(v14.EasingStyle, v15), v13(v14.EasingDirection, v15), v14.RepeatCount, v13(v14.Reverses, v15), v14.DelayTime);
        elseif typeof(v14) == "UDim" then
            return ("UDim.new(%d, %d)"):format(v14.Scale, v14.Offset);
        elseif typeof(v14) == "UDim2" then
            return ("UDim2.new(%d, %d, %d, %d)"):format(v14.X.Scale, v14.X.Offset, v14.Y.Scale, v14.Y.Offset);
        elseif typeof(v14) == "Vector2" then
            return ("Vector2.new(%d, %d)"):format(v14.X, v14.Y);
        elseif typeof(v14) == "Vector2int16" then
            return ("Vector2int16.new(%d, %d)"):format(v14.X, v14.Y);
        elseif typeof(v14) == "Vector3" then
            return ("Vector3.new(%d, %d, %d)"):format(v14.X, v14.Y, v14.Z);
        elseif typeof(v14) == "Vector3int16" then
            return ("Vector3int16.new(%d, %d, %d)"):format(v14.X, v14.Y, v14.Z);
        elseif typeof(v14) == "DateTime" then
            return ("DateTime.fromIsoDate(%q)"):format(v14:ToIsoDate());
        else
            return "<Roblox:" .. typeof(v14) .. ">";
        end;
    else
        return "<" .. type(v14) .. ">";
    end;
end;
return v13;