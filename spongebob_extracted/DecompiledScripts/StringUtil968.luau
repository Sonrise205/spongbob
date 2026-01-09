local l_TextService_0 = game:GetService("TextService");
local v1 = require(script.Parent.Parent.T);
local function _(v2) --[[ Line: 29 ]] --[[ Name: colorToString ]]
    assert(typeof(v2) == "Color3", "Color must be a Color3");
    local v3 = math.round(v2.R * 255);
    local v4 = math.round(v2.G * 255);
    local v5 = math.round(v2.B * 255);
    return string.format("rgb(%s,%s,%s)", v3, v4, v5);
end;
local v21 = {
    color = function(v7) --[[ Line: 54 ]] --[[ Name: color ]]
        local v8 = "<font color=\"%*\">%%s</font>";
        assert(typeof(v7) == "Color3", "Color must be a Color3");
        local v9 = math.round(v7.R * 255);
        local v10 = math.round(v7.G * 255);
        local v11 = math.round(v7.B * 255);
        local v12 = v8:format((string.format("rgb(%s,%s,%s)", v9, v10, v11)));
        return function(v13) --[[ Line: 56 ]]
            -- upvalues: v12 (copy)
            return string.format(v12, (tostring(v13)));
        end;
    end, 
    stroke = function(v14) --[[ Line: 76 ]] --[[ Name: stroke ]]
        assert(typeof(v14) == "table", "Stroke data must be a table");
        local v15 = v14.Color or Color3.fromRGB(0, 0, 0);
        assert(typeof(v15) == "Color3", "Color must be a Color3");
        local v16 = math.round(v15.R * 255);
        local v17 = math.round(v15.G * 255);
        local v18 = math.round(v15.B * 255);
        local v19 = string.format("rgb(%s,%s,%s)", v16, v17, v18);
        v15 = v14.Joins;
        if typeof(v15) == "EnumItem" and v15.EnumType == Enum.LineJoinMode then
            v15 = string.lower(v15.Name);
        end;
        v18 = ("<stroke color=\"%*\" joins=\"%*\" thickness=\"%*\" transparency=\"%*\">%%</stroke>"):format(v19, v15, v14.Thickness or 1, v14.Transparency or 0);
        return function(v20) --[[ Line: 84 ]]
            -- upvalues: v18 (copy)
            return string.format(v18, (tostring(v20)));
        end;
    end
};
v21.rich = function(v22) --[[ Line: 110 ]] --[[ Name: rich ]]
    -- upvalues: v21 (copy)
    local v23 = "%s";
    if v22.Color then
        v23 = v21.color(v22.Color)(v23);
    end;
    if v22.Stroke then
        v23 = v21.stroke(v22.Stroke)(v23);
    end;
    if v22.Bold then
        v23 = string.format("<b>%s</b>", v23);
    end;
    if v22.Italic then
        v23 = string.format("<i>%s</i>", v23);
    end;
    if v22.Underline then
        v23 = string.format("<u>%s</u>", v23);
    end;
    return function(v24) --[[ Line: 137 ]]
        -- upvalues: v23 (ref)
        return string.format(v23, (tostring(v24)));
    end;
end;
v21.formatAssetId = function(v25) --[[ Line: 152 ]] --[[ Name: formatAssetId ]]
    return "rbxassetid://" .. string.match(tostring(v25), "%d+") or "";
end;
v21.formatNumberWithCommas = function(v26) --[[ Line: 166 ]] --[[ Name: formatNumberWithCommas ]]
    local v27 = tostring(v26);
    local _ = 0;
    repeat
        local v29, v30 = v27:gsub("^(-?%d+)(%d%d%d)", "%1,%2");
        v27 = v29;
    until v30 == 0;
    return v27;
end;
v21.truncateNumberWithSuffix = function(v31, v32) --[[ Line: 200 ]] --[[ Name: truncateNumberWithSuffix ]]
    if not v32 then
        v32 = {};
    end;
    assert(typeof(v32) == "table", "Config must be a table");
    local v33 = v32.MaxDecimals or 1;
    local v34 = v32.ShowZeroes or false;
    local v35 = v32.AddSpace or false;
    local v36 = {
        "K", 
        "M", 
        "B", 
        "T", 
        "Q", 
        "Qt", 
        "S", 
        "St", 
        "O", 
        "N", 
        "D", 
        "U", 
        "Du", 
        "T", 
        "Qa"
    };
    if type(v31) == "string" then
        v31 = tonumber((v31:gsub(",", "")));
    end;
    assert(type(v31) == "number", "Invalid number input:" .. tostring(v31));
    local v37 = math.abs(v31);
    local v38 = "";
    local l_v31_0 = v31;
    for v40 = #v36, 1, -1 do
        local v41 = 10 ^ (3 * v40);
        if v41 <= v37 then
            l_v31_0 = v31 / v41;
            v38 = v36[v40];
            break;
        end;
    end;
    local v42 = 10 ^ v33;
    l_v31_0 = math.floor(l_v31_0 * v42) / v42;
    local v43 = string.format("%." .. v33 .. "f", l_v31_0);
    if not v34 then
        v43 = string.gsub(v43, "%.?0+$", "");
    end;
    if v35 then
        return v43 .. " " .. v38;
    else
        return v43 .. v38;
    end;
end;
v21.formatTime = function(v44, v45, v46, v47) --[[ Line: 289 ]] --[[ Name: formatTime ]]
    local v48 = table.freeze({
        w = 604800, 
        d = 86400, 
        h = 3600, 
        m = 60, 
        s = 1, 
        ds = 0.1, 
        cs = 0.01, 
        ms = 0.001, 
        ["\206\188s"] = 1.0E-6, 
        ns = 1.0E-9
    });
    v47 = v47 or {};
    assert(typeof(v47) == "table", "Config must be a table");
    v44 = v44 or 0;
    local v49 = v45 or "s";
    local v50 = v46 or "2h:2m:2s";
    local v51 = v47.Delimeter or ":";
    local v52 = v44 * v48[v49];
    local v53 = {};
    for v54 in v50:gmatch("[^:]+") do
        local v55, v56 = v54:match("(%d*)(%a+)");
        v53[#v53 + 1] = {
            width = tonumber(v55) or 1, 
            type = v56
        };
    end;
    local v57 = {};
    for _, v59 in ipairs(v53) do
        local l_type_0 = v59.type;
        local v61 = math.floor(v52 / v48[l_type_0]);
        v52 = v52 % v48[l_type_0];
        v57[l_type_0] = v61;
    end;
    local v62 = {};
    local v63 = false;
    for v64, v65 in ipairs(v53) do
        local v66 = v57[v65.type];
        local v67 = string.format("%0" .. v65.width .. "d", v66);
        if not v47.HideParentZeroValues or v66 ~= 0 or v63 or v64 >= #v53 then
            v62[#v62 + 1] = v67;
            v63 = true;
        end;
    end;
    return table.concat(v62, v51);
end;
v21.getMaxConsistentTextSize = function(v68, v69, v70, v71) --[[ Line: 382 ]] --[[ Name: getMaxConsistentTextSize ]]
    -- upvalues: v1 (copy), l_TextService_0 (copy)
    assert(v1.tuple(v1.values(v1.string), v1.Vector2, v1.Font, v1.optional(v1.interface({
        MinFontSize = v1.optional(v1.number), 
        MaxFontSize = v1.optional(v1.number), 
        Padding = v1.optional(v1.Vector2), 
        TextWrapped = v1.optional(v1.boolean)
    }))));
    v71 = v71 or {};
    assert(typeof(v71) == "table", "Config must be a table");
    local v72 = v71.MaxFontSize or 64;
    local v73 = v71.MinFontSize or 8;
    local v74 = v71.Padding or Vector2.new(2, 2);
    if v71.TextWrapped then
        local v75 = {};
        for _, v77 in pairs(v68) do
            local v78 = string.split(v77, " ");
            for _, v80 in pairs(v78) do
                table.insert(v75, v80);
            end;
        end;
        v68 = v75;
    end;
    local v81 = math.floor(v69.X);
    local function v85(v82) --[[ Line: 425 ]] --[[ Name: canFit ]]
        -- upvalues: v68 (ref), l_TextService_0 (ref), v70 (copy), v74 (copy), v81 (copy)
        for _, v84 in pairs(v68) do
            if l_TextService_0:GetTextSize(v84, v82, v70, Vector2.new(1e999, 1e999)).X + v74.X > v81 then
                return false;
            end;
        end;
        return true;
    end;
    local l_v73_0 = v73;
    local l_v72_0 = v72;
    local l_v73_1 = v73;
    while l_v73_0 <= l_v72_0 do
        local v89 = math.floor((l_v73_0 + l_v72_0) / 2);
        if v85(v89) then
            l_v73_1 = v89;
            l_v73_0 = v89 + 1;
        else
            l_v72_0 = v89 - 1;
        end;
    end;
    return l_v73_1;
end;
local v90 = nil;
local function _(v91, v92, v93) --[[ Line: 455 ]]
    assert(v91 == v92, (v93 or "") .. "| Expected: " .. tostring(v92) .. ", got: " .. tostring(v91));
end;
v90 = "Failed to truncate number";
local v95 = v21.truncateNumberWithSuffix(1.234);
assert(v95 == "1.2", (v90 or "") .. "| Expected: " .. tostring("1.2") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(123);
assert(v95 == "123", (v90 or "") .. "| Expected: " .. tostring("123") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(1234);
assert(v95 == "1.2K", (v90 or "") .. "| Expected: " .. tostring("1.2K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(123456);
assert(v95 == "123.4K", (v90 or "") .. "| Expected: " .. tostring("123.4K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(123456, {
    MaxDecimals = 1
});
assert(v95 == "123.4K", (v90 or "") .. "| Expected: " .. tostring("123.4K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix("123456", {
    MaxDecimals = 2
});
assert(v95 == "123.45K", (v90 or "") .. "| Expected: " .. tostring("123.45K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(123456, {
    MaxDecimals = 3
});
assert(v95 == "123.456K", (v90 or "") .. "| Expected: " .. tostring("123.456K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(123456789);
assert(v95 == "123.4M", (v90 or "") .. "| Expected: " .. tostring("123.4M") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(1234567890);
assert(v95 == "1.2B", (v90 or "") .. "| Expected: " .. tostring("1.2B") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(1234567890, {
    AddSpace = true
});
assert(v95 == "1.2 B", (v90 or "") .. "| Expected: " .. tostring("1.2 B") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(123456, {
    MaxDecimals = 3, 
    ShowZeroes = true
});
assert(v95 == "123.456K", (v90 or "") .. "| Expected: " .. tostring("123.456K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(123400, {
    MaxDecimals = 2, 
    ShowZeroes = true
});
assert(v95 == "123.40K", (v90 or "") .. "| Expected: " .. tostring("123.40K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(500000);
assert(v95 == "500K", (v90 or "") .. "| Expected: " .. tostring("500K") .. ", got: " .. tostring(v95));
v95 = v21.truncateNumberWithSuffix(500000, {
    ShowZeroes = true
});
assert(v95 == "500.0K", (v90 or "") .. "| Expected: " .. tostring("500.0K") .. ", got: " .. tostring(v95));
v90 = "Failed to format number with commas";
v95 = v21.formatNumberWithCommas("12");
assert(v95 == "12", (v90 or "") .. "| Expected: " .. tostring("12") .. ", got: " .. tostring(v95));
v95 = v21.formatNumberWithCommas(1234);
assert(v95 == "1,234", (v90 or "") .. "| Expected: " .. tostring("1,234") .. ", got: " .. tostring(v95));
v95 = v21.formatNumberWithCommas(123456);
assert(v95 == "123,456", (v90 or "") .. "| Expected: " .. tostring("123,456") .. ", got: " .. tostring(v95));
v95 = v21.formatNumberWithCommas("1234567");
assert(v95 == "1,234,567", (v90 or "") .. "| Expected: " .. tostring("1,234,567") .. ", got: " .. tostring(v95));
v95 = v21.formatNumberWithCommas(12345.6789);
assert(v95 == "12,345.6789", (v90 or "") .. "| Expected: " .. tostring("12,345.6789") .. ", got: " .. tostring(v95));
v90 = "Failed to format time";
v95 = v21.formatTime(3600, "s", "2h:2m:2s");
assert(v95 == "01:00:00", (v90 or "") .. "| Expected: " .. tostring("01:00:00") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(125, "s", "2h:2m:2s");
assert(v95 == "00:02:05", (v90 or "") .. "| Expected: " .. tostring("00:02:05") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(125, "s", "1h:1m:1s");
assert(v95 == "0:2:5", (v90 or "") .. "| Expected: " .. tostring("0:2:5") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(125, "s", "h:m:s", {});
assert(v95 == "0:2:5", (v90 or "") .. "| Expected: " .. tostring("0:2:5") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(125, "s", "2h:2m:2s", {
    HideParentZeroValues = true
});
assert(v95 == "02:05", (v90 or "") .. "| Expected: " .. tostring("02:05") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(125, "s", "h:m:s:ds");
assert(v95 == "0:2:5:0", (v90 or "") .. "| Expected: " .. tostring("0:2:5:0") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(125, "s", "h:m:s:ds", {
    HideParentZeroValues = true
});
assert(v95 == "2:5:0", (v90 or "") .. "| Expected: " .. tostring("2:5:0") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(3725, "s", "h:s");
assert(v95 == "1:125", (v90 or "") .. "| Expected: " .. tostring("1:125") .. ", got: " .. tostring(v95));
v95 = v21.formatTime(1000, "ms", "s");
assert(v95 == "1", (v90 or "") .. "| Expected: " .. tostring("1") .. ", got: " .. tostring(v95));
return table.freeze(v21);