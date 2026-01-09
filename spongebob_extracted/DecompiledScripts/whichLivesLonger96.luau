local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local function v15(v3, v4) --[[ Line: 15 ]] --[[ Name: whichScopeLivesLonger ]]
    local v5 = {
        v3, 
        v4
    };
    local v6 = {};
    local v7 = 2;
    local v8 = 0;
    local v9 = {};
    while true do
        if v7 > 0 then
            for _, v11 in v5 do
                v9[v11] = true;
                for _, v13 in ipairs(v11) do
                    if v13 == v3 then
                        return "definitely-b";
                    elseif v13 == v4 then
                        return "definitely-a";
                    elseif typeof(v13) == "table" and v13[1] ~= nil and v9[v11] == nil then
                        v8 = v8 + 1;
                        v6[v8] = v13;
                    end;
                end;
            end;
            table.clear(v5);
            local l_v6_0 = v6;
            v6 = v5;
            v5 = l_v6_0;
            v7 = v8;
            v8 = 0;
        else
            return "unsure";
        end;
    end;
end;
return function(v16, v17, v18, v19) --[[ Line: 51 ]] --[[ Name: whichLivesLonger ]]
    -- upvalues: v2 (copy), v15 (copy)
    if v2.isTimeCritical() then
        return "unsure";
    elseif v16 == v18 then
        for v20 = #v16, 1, -1 do
            local v21 = v16[v20];
            if v21 == v17 then
                return "definitely-b";
            elseif v21 == v19 then
                return "definitely-a";
            end;
        end;
        return "unsure";
    else
        return (v15(v16, v18));
    end;
end;