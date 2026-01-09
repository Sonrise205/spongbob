local v0 = {};
local v1 = table.freeze({
    ["0"] = "\000", 
    ["1"] = "\001", 
    ["2"] = "\002", 
    ["3"] = "\003", 
    ["4"] = "\004", 
    ["5"] = "\005", 
    ["6"] = "\006", 
    ["7"] = "\a", 
    ["8"] = "\b", 
    ["9"] = "\t"
});
v0.from_double = function(v2) --[[ Line: 8 ]] --[[ Name: from_double ]]
    -- upvalues: v1 (copy)
    local v3 = nil;
    local _ = nil;
    local _ = nil;
    local v6, v7, v8 = string.match(tostring(v2), "^(%d+)%.?(%d*)e?([+-]?%d*)$");
    local v9, v10 = string.match(v6 .. v7, "^0*(%d-)(0*)$");
    v3 = {
        string.byte(string.gsub(v9, ".", v1), 1, -1)
    };
    return v3, #v3, (tonumber(v8) or 0) - #v7 + #v10;
end;
return table.freeze(v0);