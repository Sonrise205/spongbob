local v0 = require(script.Parent.Parent.Shared.Util);
local l_Players_0 = game:GetService("Players");
local v2 = {};
local function _(v3) --[[ Line: 5 ]] --[[ Name: getUserId ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    if v2[v3] then
        return v2[v3];
    elseif l_Players_0:FindFirstChild(v3) then
        v2[v3] = l_Players_0[v3].UserId;
        return l_Players_0[v3].UserId;
    else
        local l_status_0, l_result_0 = pcall(l_Players_0.GetUserIdFromNameAsync, l_Players_0, v3);
        if not l_status_0 then
            return nil;
        else
            v2[v3] = l_result_0;
            return l_result_0;
        end;
    end;
end;
local v18 = {
    DisplayName = "Full Player Name", 
    Prefixes = "# positiveInteger", 
    Transform = function(v7) --[[ Line: 27 ]] --[[ Name: Transform ]]
        -- upvalues: v0 (copy), l_Players_0 (copy)
        return v7, v0.MakeFuzzyFinder(l_Players_0:GetPlayers())(v7);
    end, 
    ValidateOnce = function(v8) --[[ Line: 33 ]] --[[ Name: ValidateOnce ]]
        -- upvalues: v2 (copy), l_Players_0 (copy)
        local v9;
        if v2[v8] then
            v9 = v2[v8];
        elseif l_Players_0:FindFirstChild(v8) then
            v2[v8] = l_Players_0[v8].UserId;
            v9 = l_Players_0[v8].UserId;
        else
            local l_status_1, l_result_1 = pcall(l_Players_0.GetUserIdFromNameAsync, l_Players_0, v8);
            if not l_status_1 then
                v9 = nil;
            else
                v2[v8] = l_result_1;
                v9 = l_result_1;
            end;
        end;
        return v9 ~= nil, "No player with that name could be found.";
    end, 
    Autocomplete = function(_, v13) --[[ Line: 37 ]] --[[ Name: Autocomplete ]]
        -- upvalues: v0 (copy)
        return v0.GetNames(v13);
    end, 
    Parse = function(v14) --[[ Line: 41 ]] --[[ Name: Parse ]]
        -- upvalues: v2 (copy), l_Players_0 (copy)
        if v2[v14] then
            return v2[v14];
        elseif l_Players_0:FindFirstChild(v14) then
            v2[v14] = l_Players_0[v14].UserId;
            return l_Players_0[v14].UserId;
        else
            local l_status_2, l_result_2 = pcall(l_Players_0.GetUserIdFromNameAsync, l_Players_0, v14);
            if not l_status_2 then
                return nil;
            else
                v2[v14] = l_result_2;
                return l_result_2;
            end;
        end;
    end, 
    Default = function(v17) --[[ Line: 45 ]] --[[ Name: Default ]]
        return v17.Name;
    end, 
    ArgumentOperatorAliases = {
        me = ".", 
        all = "*", 
        others = "**", 
        random = "?"
    }
};
return function(v19) --[[ Line: 57 ]]
    -- upvalues: v18 (copy), v0 (copy)
    v19:RegisterType("playerId", v18);
    v19:RegisterType("playerIds", v0.MakeListableType(v18, {
        Prefixes = "# positiveIntegers"
    }));
end;