local v0 = require(script.Parent.Util);
local v1 = {};
setmetatable(v1, {
    __mode = "k"
});
local v12 = {
    __index = function(v2, v3) --[[ Line: 21 ]] --[[ Name: __index ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v4 = v1[v2];
        local v5 = v4.Changes[v3];
        if v5 ~= nil then
            if v5 == v0.None then
                return nil;
            else
                return v5;
            end;
        else
            return v4.Tbl[v3];
        end;
    end, 
    __newindex = function(v6, v7, v8) --[[ Line: 34 ]] --[[ Name: __newindex ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v9 = v1[v6];
        if v9.Tbl[v7] == v8 then
            return;
        elseif v8 == nil then
            v9.Changes[v7] = v0.None;
            return;
        else
            v9.Changes[v7] = v8;
            return;
        end;
    end, 
    __call = function(v10) --[[ Line: 46 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v11 = v1[v10];
        if next(v11.Changes) == nil then
            return v11.Tbl;
        else
            return v0.Extend(v11.Tbl, v11.Changes);
        end;
    end
};
return function(v13) --[[ Line: 54 ]] --[[ Name: TableWatcher ]]
    -- upvalues: v12 (copy), v1 (copy)
    local v14 = setmetatable({}, v12);
    v1[v14] = {
        Changes = {}, 
        Tbl = v13
    };
    return v14;
end;