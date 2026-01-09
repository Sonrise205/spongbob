local function _(v0) --[[ Line: 2 ]] --[[ Name: format ]]
    return string.format("%02i", v0);
end;
return {
    FormatMMSS = function(_, v3) --[[ Line: 9 ]] --[[ Name: FormatMMSS ]]
        local v4 = (v3 - v3 % 60) / 60;
        v3 = v3 - v4 * 60;
        local v5 = v4 - (v4 - v4 % 60) / 60 * 60;
        return string.format("%02i", v5) .. ":" .. string.format("%02i", v3);
    end, 
    FormatHHMMSS = function(_, v7) --[[ Line: 20 ]] --[[ Name: FormatHHMMSS ]]
        local v8 = (v7 - v7 % 60) / 60;
        v7 = v7 - v8 * 60;
        local v9 = (v8 - v8 % 60) / 60;
        v8 = v8 - v9 * 60;
        return string.format("%02i", v9) .. ":" .. string.format("%02i", v8) .. ":" .. string.format("%02i", v7);
    end
};