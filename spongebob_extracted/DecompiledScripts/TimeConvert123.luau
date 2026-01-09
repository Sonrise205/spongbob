return {
    Format = function(_, v1) --[[ Line: 7 ]] --[[ Name: Format ]]
        return string.format("%02i", v1);
    end, 
    Convert = function(v2, v3) --[[ Line: 11 ]] --[[ Name: Convert ]]
        local v4 = false;
        if v3 >= 3600 then
            v4 = true;
        end;
        local v5 = (v3 - v3 % 60) / 60;
        v3 = v3 - v5 * 60;
        local v6 = (v5 - v5 % 60) / 60;
        v5 = v5 - v6 * 60;
        if v4 then
            return v2:Format(v6) .. ":" .. v2:Format(v5) .. ":" .. v2:Format(v3);
        else
            return v2:Format(v5) .. ":" .. v2:Format(v3);
        end;
    end
};