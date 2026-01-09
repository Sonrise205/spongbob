local v0 = {};
local v1 = require(script.Parent.Main);
local v2 = {};
local v3 = {};
local v4 = {};
v2.Format = function(v5, v6) --[[ Line: 15 ]] --[[ Name: Format ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v7 = nil;
    local v8 = nil;
    assert(type(v5) == "number", "Value provided must be a number");
    if v6 == nil then
        v6 = "";
    end;
    assert(type(v6) == "string", "Skeleton provided must be a string");
    v8 = v3[v6];
    if not v8 then
        local v9, v10 = v1.NumberFormatter.forSkeleton(v6);
        v7 = v9;
        v8 = v10;
        assert(v7, v8);
        v3[v6] = v8;
    end;
    return v8:Format(v5);
end;
v2.FormatCompact = function(v11, v12) --[[ Line: 43 ]] --[[ Name: FormatCompact ]]
    -- upvalues: v4 (copy), v1 (copy), v0 (copy)
    local v13 = nil;
    local v14 = nil;
    assert(type(v11) == "number", "Value provided must be a number");
    if v12 == nil then
        v12 = "";
    end;
    assert(type(v12) == "string", "Skeleton provided must be either a string");
    v14 = v4[v12];
    if not v14 then
        local v15, v16 = v1.NumberFormatter.forSkeleton(v12);
        v13 = v15;
        v14 = v16;
        assert(v13, v14);
        v14 = v14:Notation(v1.Notation.compactWithSuffixThousands(v0));
        v4[v12] = v14;
    end;
    assert(v0[1], "Please provide the suffix abbreviations for FormatCompact at the top of the Simple ModuleScript");
    return v14:Format(v11);
end;
return table.freeze(v2);