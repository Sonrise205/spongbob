local v0 = require(script.Parent.Util);
local function v4(v1) --[[ Line: 3 ]] --[[ Name: unescapeOperators ]]
    for _, v3 in ipairs({
        "%.", 
        "%?", 
        "%*", 
        "%*%*"
    }) do
        v1 = v1:gsub("\\" .. v3, v3:gsub("%%", ""));
    end;
    return v1;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7, v8) --[[ Line: 113 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v5 (copy)
    local v9 = {
        Command = v6, 
        Type = nil, 
        Name = v7.Name, 
        Object = v7
    };
    local v10 = false;
    if v7.Default == nil then
        v10 = v7.Optional ~= true;
    end;
    v9.Required = v10;
    v9.Executor = v6.Executor;
    v9.RawValue = v8;
    v9.RawSegments = {};
    v9.TransformedValues = {};
    v9.Prefix = "";
    v9.TextSegmentInProgress = "";
    v9.RawSegmentsAreAutocomplete = false;
    if type(v7.Type) == "table" then
        v9.Type = v7.Type;
    else
        local v11, v12;
        v10, v11, v12 = v0.ParsePrefixedUnionType(v6.Cmdr.Registry:GetTypeName(v7.Type), v8);
        v9.Type = v6.Dispatcher.Registry:GetType(v10);
        v9.RawValue = v11;
        v9.Prefix = v12;
        if v9.Type == nil then
            error(("[Cmdr] %* has an unregistered type %%q"):format(v9.Name or "none"):format(v10 or "<none>"));
        end;
    end;
    setmetatable(v9, v5);
    v9:Transform();
    return v9;
end;
v5.GetDefaultAutocomplete = function(v13) --[[ Line: 156 ]] --[[ Name: GetDefaultAutocomplete ]]
    if v13.Type.Autocomplete then
        local v14, v15 = v13.Type.Autocomplete(v13:TransformSegment(""));
        return v14, v15 or {};
    else
        return {};
    end;
end;
v5.Transform = function(v16) --[[ Line: 173 ]] --[[ Name: Transform ]]
    -- upvalues: v4 (copy), v0 (copy)
    if #v16.TransformedValues ~= 0 then
        return;
    else
        local l_RawValue_0 = v16.RawValue;
        if v16.Type.ArgumentOperatorAliases then
            l_RawValue_0 = v16.Type.ArgumentOperatorAliases[l_RawValue_0] or l_RawValue_0;
        end;
        if l_RawValue_0 == "." and v16.Type.Default then
            l_RawValue_0 = v16.Type.Default(v16.Executor) or "";
            v16.RawSegmentsAreAutocomplete = true;
        end;
        if l_RawValue_0 == "?" and v16.Type.Autocomplete then
            local l_v16_DefaultAutocomplete_0, v19 = v16:GetDefaultAutocomplete();
            if not v19.IsPartial and #l_v16_DefaultAutocomplete_0 > 0 then
                l_RawValue_0 = l_v16_DefaultAutocomplete_0[math.random(1, #l_v16_DefaultAutocomplete_0)];
                v16.RawSegmentsAreAutocomplete = true;
            end;
        end;
        if v16.Type.Listable and #v16.RawValue > 0 then
            local v20 = l_RawValue_0:match("^%?(%d+)$");
            if v20 then
                local v21 = tonumber(v20);
                if v21 and v21 > 0 then
                    local v22 = {};
                    local l_v16_DefaultAutocomplete_1, v24 = v16:GetDefaultAutocomplete();
                    if not v24.IsPartial and #l_v16_DefaultAutocomplete_1 > 0 then
                        for _ = 1, math.min(v21, #l_v16_DefaultAutocomplete_1) do
                            table.insert(v22, table.remove(l_v16_DefaultAutocomplete_1, math.random(1, #l_v16_DefaultAutocomplete_1)));
                        end;
                        l_RawValue_0 = table.concat(v22, ",");
                        v16.RawSegmentsAreAutocomplete = true;
                    end;
                end;
            elseif l_RawValue_0 == "*" or l_RawValue_0 == "**" then
                local l_v16_DefaultAutocomplete_2, v27 = v16:GetDefaultAutocomplete();
                if not v27.IsPartial and #l_v16_DefaultAutocomplete_2 > 0 then
                    if l_RawValue_0 == "**" and v16.Type.Default then
                        local v28 = v16.Type.Default(v16.Executor) or "";
                        for v29, v30 in ipairs(l_v16_DefaultAutocomplete_2) do
                            if v30 == v28 then
                                table.remove(l_v16_DefaultAutocomplete_2, v29);
                            end;
                        end;
                    end;
                    l_RawValue_0 = table.concat(l_v16_DefaultAutocomplete_2, ",");
                    v16.RawSegmentsAreAutocomplete = true;
                end;
            end;
            l_RawValue_0 = v4(l_RawValue_0);
            local v31 = v0.SplitStringSimple(l_RawValue_0, ",");
            if #v31 == 0 then
                v31 = {
                    ""
                };
            end;
            if l_RawValue_0:sub(#l_RawValue_0, #l_RawValue_0) == "," then
                v31[#v31 + 1] = "";
            end;
            for v32, v33 in ipairs(v31) do
                v16.RawSegments[v32] = v33;
                v16.TransformedValues[v32] = {
                    v16:TransformSegment(v33)
                };
            end;
            v16.TextSegmentInProgress = v31[#v31];
            return;
        else
            l_RawValue_0 = v4(l_RawValue_0);
            v16.RawSegments[1] = v4(l_RawValue_0);
            v16.TransformedValues[1] = {
                v16:TransformSegment(l_RawValue_0)
            };
            v16.TextSegmentInProgress = v16.RawValue;
            return;
        end;
    end;
end;
v5.TransformSegment = function(v34, v35) --[[ Line: 266 ]] --[[ Name: TransformSegment ]]
    if v34.Type.Transform then
        return v34.Type.Transform(v35, v34.Executor);
    else
        return v35;
    end;
end;
v5.GetTransformedValue = function(v36, v37) --[[ Line: 278 ]] --[[ Name: GetTransformedValue ]]
    return unpack(v36.TransformedValues[v37]);
end;
v5.Validate = function(v38, v39) --[[ Line: 289 ]] --[[ Name: Validate ]]
    if v38.RawValue == nil or #v38.RawValue == 0 and v38.Required == false then
        return true;
    elseif v38.Required and (v38.RawSegments[1] == nil or #v38.RawSegments[1] == 0) then
        return false, "This argument is required.";
    elseif v38.Type.Validate or v38.Type.ValidateOnce then
        for v40 = 1, #v38.TransformedValues do
            if v38.Type.Validate then
                local v41, v42 = v38.Type.Validate(v38:GetTransformedValue(v40));
                if not v41 then
                    return v41, v42 or "Invalid value";
                end;
            end;
            if v39 and v38.Type.ValidateOnce then
                local v43, v44 = v38.Type.ValidateOnce(v38:GetTransformedValue(v40));
                if not v43 then
                    return v43, v44;
                end;
            end;
        end;
        return true;
    else
        return true;
    end;
end;
v5.GetAutocomplete = function(v45) --[[ Line: 330 ]] --[[ Name: GetAutocomplete ]]
    if v45.Type.Autocomplete then
        return v45.Type.Autocomplete(v45:GetTransformedValue(#v45.TransformedValues));
    else
        return {};
    end;
end;
v5.ParseValue = function(v46, v47) --[[ Line: 343 ]] --[[ Name: ParseValue ]]
    if v46.Type.Parse then
        return v46.Type.Parse(v46:GetTransformedValue(v47));
    else
        return v46:GetTransformedValue(v47);
    end;
end;
v5.GetValue = function(v48) --[[ Line: 356 ]] --[[ Name: GetValue ]]
    if #v48.RawValue == 0 and not v48.Required and v48.Object.Default ~= nil then
        return v48.Object.Default;
    elseif not v48.Type.Listable then
        return v48:ParseValue(1);
    else
        local v49 = {};
        for v50 = 1, #v48.TransformedValues do
            local v51 = v48:ParseValue(v50);
            if type(v51) ~= "table" then
                error((("[Cmdr] Listable types must return a table from Parse %*"):format(v48.Type.Name)));
            end;
            for _, v53 in pairs(v51) do
                v49[v53] = true;
            end;
        end;
        local v54 = {};
        for v55 in pairs(v49) do
            v54[#v54 + 1] = v55;
        end;
        return v54;
    end;
end;
return v5;