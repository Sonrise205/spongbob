local v0 = require(script.Parent.Parent.Shared.Util);
local v1 = {
    Years = 31556926, 
    Months = 2629744, 
    Weeks = 604800, 
    Days = 86400, 
    Hours = 3600, 
    Minutes = 60, 
    Seconds = 1
};
local v2 = {};
for v3, _ in pairs(v1) do
    table.insert(v2, v3);
end;
local v5 = v0.MakeFuzzyFinder(v2);
local function v15(v6) --[[ Line: 19 ]] --[[ Name: stringToSecondDuration ]]
    -- upvalues: v5 (copy), v1 (copy)
    if v6 == nil or v6 == "" then
        return nil;
    else
        local v7 = tonumber(v6);
        if v7 and v7 == 0 then
            return 0, 0, true;
        else
            local v8 = v6:gsub("-?%d+%a+", ""):match("-?%d+");
            if v8 then
                return nil, tonumber(v8), true;
            else
                local v9 = nil;
                local v10 = nil;
                local v11 = nil;
                for v12 in v6:gmatch("-?%d+%a+") do
                    local v13, v14 = v12:match("(-?%d+)(%a+)");
                    v10 = v13;
                    v11 = v14;
                    v13 = v5(v11, false, true);
                    if #v13 == 0 then
                        return nil, (tonumber(v10));
                    else
                        if v9 == nil then
                            v9 = 0;
                        end;
                        v9 = v9 + (v11:lower() == "m" and 60 or v1[v13[1]]) * tonumber(v10);
                    end;
                end;
                if v9 == nil then
                    return nil;
                else
                    return v9, (tonumber(v10));
                end;
            end;
        end;
    end;
end;
local function v23(v16, v17, v18, v19) --[[ Line: 60 ]] --[[ Name: mapUnits ]]
    v19 = v19 or 1;
    local v20 = {};
    for v21, v22 in pairs(v16) do
        if v18 == 1 then
            v20[v21] = v17 .. v22:sub(v19, #v22 - 1);
        else
            v20[v21] = v17 .. v22:sub(v19);
        end;
    end;
    return v20;
end;
local v39 = {
    Transform = function(v24) --[[ Line: 74 ]] --[[ Name: Transform ]]
        -- upvalues: v15 (copy)
        return v24, v15(v24);
    end, 
    Validate = function(_, v26) --[[ Line: 78 ]] --[[ Name: Validate ]]
        return v26 ~= nil;
    end, 
    Autocomplete = function(v27, v28, v29, v30, v31) --[[ Line: 82 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v5 (copy), v23 (copy)
        local v32 = {};
        if v30 or v31 then
            local v33 = v30 == true and v5("", false, true) or v31;
            if v30 == true then
                return (v23(v33, v27, v29));
            else
                local v34 = v27:match("^.*(%a+)$"):len();
                return (v23(v33, v27, v34 + 1));
            end;
        else
            if v28 ~= nil then
                local v35 = v27:match("^.*-?%d+(%a+)%s?$");
                local v36 = v5(v35, false, true);
                v32 = v23(v36, v27, v29, #v35 + 1);
                table.sort(v32);
            end;
            return v32;
        end;
    end, 
    Parse = function(_, v38) --[[ Line: 106 ]] --[[ Name: Parse ]]
        return v38;
    end
};
return function(v40) --[[ Line: 111 ]]
    -- upvalues: v39 (copy), v0 (copy)
    v40:RegisterType("duration", v39);
    v40:RegisterType("durations", v0.MakeListableType(v39));
end;