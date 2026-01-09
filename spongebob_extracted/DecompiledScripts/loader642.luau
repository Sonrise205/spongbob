return {
    LoadChildren = function(v0, v1) --[[ Line: 44 ]] --[[ Name: LoadChildren ]]
        local v2 = {};
        for _, v4 in v0:GetChildren() do
            if v4:IsA("ModuleScript") and (not v1 or v1(v4)) then
                local v5 = require(v4);
                v2[v4.Name] = v5;
            end;
        end;
        return v2;
    end, 
    LoadDescendants = function(v6, v7) --[[ Line: 74 ]] --[[ Name: LoadDescendants ]]
        local v8 = {};
        for _, v10 in v6:GetDescendants() do
            if v10:IsA("ModuleScript") and (not v7 or v7(v10)) then
                local v11 = require(v10);
                v8[v10.Name] = v11;
            end;
        end;
        return v8;
    end, 
    MatchesName = function(v12) --[[ Line: 97 ]] --[[ Name: MatchesName ]]
        return function(v13) --[[ Line: 98 ]]
            -- upvalues: v12 (copy)
            return v13.Name:match(v12) ~= nil;
        end;
    end, 
    SpawnAll = function(v14, v15) --[[ Line: 125 ]] --[[ Name: SpawnAll ]]
        for v16, v17 in v14 do
            local v18 = v17[v15];
            if type(v18) == "function" then
                task.spawn(function() --[[ Line: 129 ]]
                    -- upvalues: v16 (copy), v18 (copy), v17 (copy)
                    debug.setmemorycategory(v16);
                    v18(v17);
                end);
            end;
        end;
    end
};