local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Memory.poisonScope);
local v3 = require(l_Parent_0.ExternalDebug);
local v4 = {};
local v5 = 0;
return {
    giveIfEmpty = function(v6) --[[ Line: 18 ]] --[[ Name: giveIfEmpty ]]
        -- upvalues: v3 (copy), v2 (copy)
        if next(v6) == nil then
            v3.untrackScope(v6);
            v2(v6, "previously passed to the internal scope pool, which indicates a Fusion bug.");
            return nil;
        else
            return v6;
        end;
    end, 
    clearAndGive = function(v7) --[[ Line: 34 ]] --[[ Name: clearAndGive ]]
        -- upvalues: v3 (copy), v2 (copy)
        v3.untrackScope(v7);
        table.clear(v7);
        v2(v7, "previously passed to the internal scope pool, which indicates a Fusion bug.");
    end, 
    reuseAny = function() --[[ Line: 46 ]] --[[ Name: reuseAny ]]
        -- upvalues: v5 (ref), v4 (copy)
        if v5 == 0 then
            return nil;
        else
            local v8 = v4[v5];
            v5 = v5 - 1;
            return v8;
        end;
    end
};