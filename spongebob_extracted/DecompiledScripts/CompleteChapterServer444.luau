local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 7 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    v2 = v1.GetService("GameService");
    v3 = v1.GetService("DataService");
end);
return function(_, v5, v6, v7, v8) --[[ Line: 12 ]]
    -- upvalues: v3 (ref)
    local v9 = v7 and tostring(v7);
    local v10 = tostring(v8 or 1);
    if v7 and v7 < 1 then
        v9 = nil;
    end;
    local v11 = v3:Get(v5, "Completion");
    local v12 = v11.Worlds[v6];
    if not v12 then
        v12 = {};
        v11.Worlds[v6] = v12;
    end;
    local function _() --[[ Line: 29 ]] --[[ Name: unlockNextWorld ]]

    end;
    if not v9 then
        for v14 = 1, 10 do
            v9 = tostring(v14);
            local v15 = v12[v9];
            if not v15 then
                v15 = {};
                v12[v9] = v15;
            end;
            v15[v10] = true;
        end;
        v3:Set(v5, "Completion", v11);
        return (("Completed all chapters for world \"%*\" for difficulty %*"):format(v6, v8));
    else
        local v16 = v12[v9];
        if not v16 then
            v16 = {};
            v12[v9] = v16;
        end;
        v16[v10] = true;
        return (("Completed chapter %* for world \"%*\" for difficulty %*"):format(v7, v6, v8));
    end;
end;