local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.evaluate);
return function(v4) --[[ Line: 23 ]] --[[ Name: change ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v4.validity == "busy" then
        return v2.logError("infiniteLoop");
    elseif not v3(v4, true) then
        return;
    else
        local v5 = {};
        local v6 = {};
        local v7 = {};
        v5[1] = v4;
        local v8 = os.clock() + 1 * v2.safetyTimerMultiplier;
        while true do
            if v8 < os.clock() then
                return v2.logError("infiniteLoop");
            else
                local v9 = true;
                for _, v11 in v5 do
                    for v12 in v11.dependentSet do
                        if v12.validity == "valid" then
                            v9 = false;
                            table.insert(v7, v12);
                            table.insert(v6, v12);
                        end;
                    end;
                end;
                local l_v6_0 = v6;
                v6 = v5;
                v5 = l_v6_0;
                table.clear(v6);
                if v9 then
                    v9 = {};
                    for _, v15 in v7 do
                        v15.validity = "invalid";
                        if v15.timeliness == "eager" then
                            table.insert(v9, v15);
                        end;
                    end;
                    table.sort(v9, function(v16, v17) --[[ Line: 72 ]]
                        return v16.createdAt < v17.createdAt;
                    end);
                    for _, v19 in v9 do
                        v3(v19, false);
                    end;
                    return;
                end;
            end;
        end;
    end;
end;