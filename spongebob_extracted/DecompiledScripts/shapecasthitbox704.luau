--!native
local _ = require(script.Types);
local v1 = {};
return {
    new = function(...) --[[ Line: 29 ]] --[[ Name: NewHitbox ]]
        -- upvalues: v1 (copy)
        local v2 = require(script.Hitbox)(...);
        local v3 = select(1, ...);
        if not v1[v3] then
            v1[v3] = {};
        end;
        table.insert(v1[v3], v2);
        v2:OnDestroying(function() --[[ Line: 39 ]]
            -- upvalues: v1 (ref), v3 (copy), v2 (copy)
            if not v1[v3] then
                return;
            else
                local v4 = #v1[v3];
                for v5 = v4, 1, -1 do
                    if v1[v3][v5] == v2 then
                        table.remove(v1[v3], v5);
                        if v4 == 1 then
                            v1[v3] = nil;
                        end;
                    end;
                end;
                return;
            end;
        end);
        return v2;
    end, 
    Settings = require(script.Settings), 
    CastTypes = {
        Raycast = "Raycast", 
        Blockcast = "Blockcast", 
        Spherecast = "Spherecast"
    }, 
    GetHitboxesFromInstance = function(_, v7) --[[ Line: 70 ]] --[[ Name: GetHitboxesFromInstance ]]
        -- upvalues: v1 (copy)
        return v1[v7] or {};
    end, 
    GetActiveInstances = function(_) --[[ Line: 74 ]] --[[ Name: GetActiveInstances ]]
        -- upvalues: v1 (copy)
        return v1;
    end
};