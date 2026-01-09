local v0 = {
    type = "Unit", 
    name = "SquidasaurusRex", 
    extraData = {
        Shiny = true, 
        Wumbo = true, 
        Stars = 5, 
        Trait = {
            Name = "Strike", 
            Tier = 1
        }, 
        Trait2 = {
            Name = "Reach", 
            Tier = 1
        }
    }, 
    amount = 1
};
local v1 = {
    [1] = 1, 
    [2] = 3.5, 
    [3] = 5, 
    [4] = 10, 
    [5] = 15
};
local v2 = {};
local function _(v3, v4) --[[ Line: 28 ]] --[[ Name: createReward ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v5 = table.clone(v0);
    v5.weight = v4;
    v2[v3] = {
        v5
    };
end;
for v7, v8 in v1 do
    local v9 = table.clone(v0);
    v9.weight = v8;
    v2[v7] = {
        v9
    };
end;
return v2;